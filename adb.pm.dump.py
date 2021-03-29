DUMP_OF_SERVICE_package="DUMP OF SERVICE package:"
Activity_Resolver_Table="Activity Resolver Table:"
Schemes="  Schemes:"


if __name__=="__main__":
    import sys
    argv=sys.argv
    argc=len(argv)

    input_dump=argv[1] 
    lines = open(input_dump, "r").readlines()
    dump_result = dict()
    current_table=None
    levels = []
    levels_n = 0
    for line_i in lines:
        if not line_i and current_table != None:
            current_table = None
            levels.pop()
            pass

        if line_i == DUMP_OF_SERVICE_package:
            levels.append(DUMP_OF_SERVICE_package)

        if line_i == Activity_Resolver_Table:
            levels.append(Activity_Resolver_Table)
            if Activity_Resolver_Table not in dump_result:
                dump_result[Activity_Resolver_Table] = []
                pass
            current_table=dump_result[Activity_Resolver_Table]
        if line_i == Schemes \
                and current_table != None:
            if Schemes not in current_table:
                current_table[Schemes]=[]
            else:
                current_table=current_table[Schemes]
            pass

        levels_n = len(levels)



        pass
         
    pass
