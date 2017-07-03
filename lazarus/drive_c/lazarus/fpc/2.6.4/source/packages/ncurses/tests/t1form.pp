program form_basic;
{
  Example 25. Forms Basics
  from ncurses howto
}
{$MODE OBJFPC}

uses
  ncurses, form;

var
  field: array[0..2] of PFIELD;
  my_form: PFORM;
  ch: Longint;
begin

try
  (* Initialize curses *)
   initscr();
   cbreak();
   noecho();
   keypad(stdscr, TRUE);

  (* Initialize the fields *)
   field[0] := new_field(1, 10, 4, 18, 0, 0);
   field[1] := new_field(1, 10, 6, 18, 0, 0);
   field[2] := nil;

  (* Set field options *)
    set_field_back(field[0], A_UNDERLINE);  { Print a line for the option }
    field_opts_off(field[0], O_AUTOSKIP);   { Don't go to next field when this }
                                            { Field is filled up           }
    set_field_back(field[1], A_UNDERLINE);
    field_opts_off(field[1], O_AUTOSKIP);

  (* Create the form and post it *)
    my_form := new_form(field);
    post_form(my_form);
    refresh();

    mvprintw(4, 10, 'Value 1:');
    mvprintw(6, 10, 'Value 2:');
    refresh();

  (* Loop through to get user requests *)
    ch := getch();
    while ch <> KEY_F(1) do
    begin
      case ch of
        KEY_DOWN:
    (* Go to next field *)
        begin
          form_driver(my_form, REQ_NEXT_FIELD);
            { Go to the end of the present buffer
              Leaves nicely at the last character }
          form_driver(my_form, REQ_END_LINE);
        end;
        KEY_UP:
    (* Go to previous field *)
        begin
          form_driver(my_form, REQ_PREV_FIELD);
          form_driver(my_form, REQ_END_LINE);
        end;
      else
          { If this is a normal character, it gets
            Printed }
        form_driver(my_form, ch);
      end;
      ch := getch();
    end
  finally
  (* Un post form and free the memory *)
    unpost_form(my_form);
    free_form(my_form);
    free_field(field[0]);
    free_field(field[1]);

    endwin();
  end;
end.