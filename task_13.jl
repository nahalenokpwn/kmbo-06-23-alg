#= Задача 13
Дано: Робот - в произвольной клетке ограниченного прямоугольной рамкой поля без внутренних перегородок и маркеров.
Результат: Робот - в исходном положении в центре косого креста (в форме X) из маркеров.
=#

include("roblib.jl") 

invers(side::HorizonSide) 
movements!(r::Robot,side::HorizonSide,num_steps::Int)
get_num_steps_movements!(r::Robot, side::HorizonSide)
movements!(r::Robot,side::HorizonSide) 
moves!(r::Robot,side::HorizonSide) 
find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)

function mark_kross_x(r::Robot)
    for side in ((Nord,Ost),(Sud,Ost),(Sud,West),(Nord,West))
        while (isborder(r,side[1])==false && isborder(r,side[2])==false)
            move!(r,side[1])
            move!(r,side[2])
            putmarker!(r)
        end
        while (ismarker(r)==true)
            move!(r, invers(side[1]))
            move!(r, invers(side[2]))
        end
    end
    putmarker!(r)
end