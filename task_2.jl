#= Задача 2
Дано: Робот - в произвольной клетке ограниченного прямоугольного поля
Результат: Робот - в исходном положении, и по краям прямоугольника стоят маркеры =#

include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function mark_frame_perimetr!(r::Robot)
    
    num_vert = moves!(r, Sud)
    
    num_hor = moves!(r, West)
    putmarker!(r)
    
    for side in (HorizonSide(i) for i=0:3) 
        putmarkers!(r, side) 
    end 

    moves!(r, Nord, num_vert)

    moves!(r, Ost, num_hor)
    end
    
    function moves!(r::Robot,side::HorizonSide) 
        num_steps=0
        while isborder(r,side)==false
            move!(r,side)
            num_steps+=1
        end
        return num_steps
    end
    
    function moves!(r::Robot,side::HorizonSide,num_steps::Int) 
        for _ in 1:num_steps
            move!(r,side)
        end
    end
    
    function putmarkers!(r::Robot, side::HorizonSide) 
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
        end
    end