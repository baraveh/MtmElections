#TESTFL=exampleMain
#TESTFL=test_fb1_main
#TESTFL=mtmElections_test
#TESTFL=TestsFinal


CC=gcc
OBJS=uniqueOrderedList/uniqueOrderedList.o preference.o citizen.o city.o mtmElections.o candidate.o exampleMain.o mtm_print.o
EXEC=ex1
DEBUG=-g  #-g for debug
CFLAGS=-std=c99 -Wall -Werror -pedantic-errors

$(EXEC)  : $(OBJS)
	$(CC) $(DEBUG_FLAG) $(OBJS) -o $@

uniqueOrderedList.o: uniqueOrderedList/uniqueOrderedList.c  uniqueOrderedList/uniqueOrderedList.h
preference.o: preference.c preference.h
citizen.o: citizen.c citizen.h  preference.h uniqueOrderedList/uniqueOrderedList.h
candidate.o : candidate.c candidate.h
city.o: city.c city.h citizen.h uniqueOrderedList/uniqueOrderedList.h candidate.h
mtm_print.o: mtm_print.c mtm_print.h
mtmElections.o : mtmElections.c mtm_elections.h city.h citizen.h uniqueOrderedList/uniqueOrderedList.h candidate.h mtm_print.h
exampleMain.o: mtm_elections.h exampleMain.c


clean:
	rm -f $(OBJS)
