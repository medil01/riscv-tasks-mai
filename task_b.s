.data
    prompt: .string "Введите число x: "
    space:  .string " "

.text
.globl main
main:
    # 1. Задаем фиксированные константы группы и номера
    li t0, 121          # t0 = y (номер группы)
    li t1, 8            # t1 = h (шаг вывода)

    # 2. Считываем пользовательское число x
    li a7, 4            # print_string
    la a0, prompt
    ecall
    li a7, 5            # read_int
    ecall               # Считанный x теперь находится в a0

    # 3. Алгоритм вычисления min(x, 121) и max(x, 121)
    mv t2, a0           # t2 = min_val (изначально берем x)
    mv t3, t0           # t3 = max_val (изначально берем y = 121)
    
    ble a0, t0, range_set # Если x <= 121, то наши предположения верны
    mv t2, t0           # Если x > 121, то min_val = 121
    mv t3, a0           # а max_val = x

range_set:
    # t2 — текущий счетчик цикла (начинается с min)
    # t3 — верхний предел (max)

loop:
    bgt t2, t3, exit    # Если текущее значение превысило max_val, выходим

    # Печать текущего числа из диапазона
    mv a0, t2
    li a7, 1            # print_int
    ecall

    # Печать пробела-разделителя
    la a0, space
    li a7, 4            # print_string
    ecall

    # Переход к следующему числу с шагом 8
    add t2, t2, t1      # t2 = t2 + 8
    j loop

exit:
    li a7, 10           # Завершение работы
    ecall
