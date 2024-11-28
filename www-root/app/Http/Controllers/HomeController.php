<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Inertia\Response as ReactComponent;

class HomeController extends Controller
{
    public function index(): ReactComponent
    {
        return Inertia::render('Index', []);
    }
}
