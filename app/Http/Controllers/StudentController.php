<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\LoginModel;
use Auth;
use DB;
use App\Models\Student;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $idClass = $request->get("idClass");
        $student = DB::table('student')
        ->join('classroom', 'student.idClass', '=', 'classroom.idClass')
        ->where('student.idClass','=', $idClass)
        ->where('student.available','=', 1)
        ->select('student.*', 'classroom.nameClass')
        ->get();
        $class = DB::table('classroom')
        ->join('faculty', 'classroom.idFaculty', '=', 'faculty.idFaculty')
        ->where('classroom.available','=', 1)
        ->select('classroom.*', 'faculty.nameFaculty')
        ->get();
        return view("student.index",['students' => $student,'classs' => $class, 'idClass' => $idClass]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $query = DB::table('classroom')
        ->join('faculty', 'classroom.idFaculty', '=', 'faculty.idFaculty')
        ->select('classroom.*', 'faculty.nameFaculty')
        ->get();
        return view("student.create",['class' => $query]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if($request->isMethod("post")){
            $firstName = $request->input("firstName");
            $middleName = $request->input("middleName");
            $lastName = $request->input("lastName");
            $gender = $request->input("gender");
            $idClass = $request->input("idClass");
            $email = $request->input("email");
            $phone = $request->input("phone");
            $birthday = $request->input("birthday");
            $address = $request->input("address");

            $student = new student();
            $student->firstName = $firstName;
            $student->middleName = $middleName;
            $student->lastName = $lastName;
            $student->gender = $gender;
            $student->idClass = $idClass;
            $student->email = $email;
            $student->phone = $phone;
            $student->birthday = $birthday;
            $student->address = $address;

            $student->save();
            return redirect('student');
        }
            return view("student.create");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // $data = DB::table('student')
        // ->join('classroom', 'student.idClass', '=', 'classroom.idClass')
        // ->select('student.*', 'classroom.nameClass')
        // ->get();
        // return view("student.update",['class' => $data]);

        $student = DB::table("student")->where("idStudent","$id")->select("*")->get();

        $class = DB::table('classroom')
        ->join('faculty', 'classroom.idFaculty', '=', 'faculty.idFaculty')
        ->select('classroom.*', 'faculty.nameFaculty')
        ->get();
        // return $data;
        return view("student.update",['student' => $student, 'class' => $class ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $firstName = $request->input("firstName");
        $middleName = $request->input("middleName");
        $lastName = $request->input("lastName");
        $gender = $request->input("gender");
        $idClass = $request->input("idClass");
        $email = $request->input("email");
        $phone = $request->input("phone");
        $birthday = $request->input("birthday");
        $address = $request->input("address");

        // return $request->input('firstName');
        $data = Student::find($id);
        
        $data->firstName = $firstName;
        $data->middleName = $middleName;
        $data->lastName = $lastName;
        $data->gender = $gender;
        $data->idClass = $idClass;
        $data->email = $email;
        $data->phone = $phone;
        $data->birthday = $birthday;
        $data->address = $address;

        $data->save();
        return redirect('student');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
    }

    public function hide($id)
    {
        // $detailAttendance = detailAttendance::find($id);       
        // $data->available = 0;
        // $data->save();

        $data = Student::find($id);       
        $data->available = 0;
        $data->save();
        return redirect('student');
    }
}
