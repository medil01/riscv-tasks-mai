.data
    prompt: .string "Введите число x: "

.text
.globl main
main:
    # Печать подсказки для ввода
    li a7, 4            # Системный вызов: print_string
    la a0, prompt
    ecall

    # Чтение целого числа x
    li a7, 5            # Системный вызов: read_int
    ecall               # Введенное число сохраняется в регистр a0

    # Проверка на совпадение с номером студента (8)
    li t0, 8            
    
    beq a0, t0, equal   # Если x == 8, переходим к метке equal
    li a0, 0            # Иначе записываем в результат 0
    j print_res

equal:
    li a0, 1            # Записываем в результат 1

print_res:
    li a7, 1            # Системный вызов: print_int
    ecall

exit:
    li a7, 10           # Завершение программы (exit)
    ecall
