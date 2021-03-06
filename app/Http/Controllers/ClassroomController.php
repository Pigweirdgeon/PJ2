<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\LoginModel;
use Auth;
use DB;
use App\Models\Classroom;

class ClassroomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $idMajor = $request->get("idMajor");
        $idFaculty = $request->get("idFaculty");
        $major = DB::table("major")
            ->where('available', '=', 1)    
            ->get();
        $faculty = DB::table("faculty")
            ->where('available', '=', 1)
            ->get();
        $query = DB::table('classroom')
        ->join('faculty', 'classroom.idFaculty', '=', 'faculty.idFaculty')
        ->join('major', 'classroom.idMajor', '=', 'major.idMajor')
        ->where('classroom.available', '=', 1)
        ->where('classroom.idMajor', '=', $idMajor)
        ->orwhere('classroom.idFaculty', '=', $idFaculty)
        ->select('classroom.*', 'faculty.nameFaculty', 'major.nameMajor')
        ->get();
        return view("class.index",[
            'data' => $query,
            'major' => $major,
            'faculty' => $faculty,
            'idMajor' => $idMajor,
            'idFaculty' => $idFaculty
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $query = DB::table("faculty");
        $query = $query->orderBy("idFaculty","Desc");
        $query = $query->select("*");
        $faculty = $query->paginate(10);

        $query = DB::table("major");
        $query = $query->orderBy("idMajor","Desc");
        $query = $query->select("*");
        $major = $query->paginate(10);

        return view("class.create",['faculty' => $faculty, 'major' => $major ]);
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
            $nameClass = $request->input("nameClass");
            $idFaculty = $request->input("nameFaculty");
            $idMajor = $request->input("nameMajor");

            $class = new Classroom();
            $class->nameClass = $nameClass;
            $class->idFaculty = $idFaculty;
            $class->idMajor = $idMajor;

            $class->save();
            return redirect('class');

        }
            return view("class.create");
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
        $query = DB::table("classroom");
        $query = $query->where("idClass","$id");
        $query = $query->select("*");
        $class = $query->paginate(10);

        $query = DB::table("faculty");
        $query = $query->orderBy("idFaculty","Asc");
        $query = $query->select("*");
        $faculty = $query->paginate(10);

        $query = DB::table("major");
        $query = $query->orderBy("idMajor","Asc");
        $query = $query->select("*");
        $major = $query->paginate(10);
        // return $class;
        // return $faculty;
        // return $major;
        return view("class.update",[
            'class' => $class, 
            'faculty' => $faculty, 
            'major' => $major 
        ]);
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
        $nameClass = $request->input("nameClass");
        $idFaculty = $request->input("idFaculty");
        $idMajor = $request->input("idMajor");

        // return $request->input('firstName');
        $data = Classroom::find($id);
        
        $data->nameClass = $nameClass;
        $data->idFaculty = $idFaculty;
        $data->idMajor = $idMajor;

        $data->save();
        return redirect('class');
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
        $assign = DB::table("assign")
                ->where("idClass", "=", $id)
                ->update(["available" => 0]);
        $student = DB::table("student")
                ->where("idClass", "=", $id)
                ->update(["available" => 0]);

        $data = Classroom::find($id);       
        $data->available = 0;
        $data->save();
        return redirect('class');
        
    }
}
