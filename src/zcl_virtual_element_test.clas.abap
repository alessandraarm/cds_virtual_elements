CLASS zcl_virtual_element_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_virtual_element_test IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA lt_original_data TYPE TABLE OF zc_po_tbl_98. "Projection View

    lt_original_data = CORRESPONDING #( it_original_data ).

    TRY.
        DATA(factory_cal) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( iv_factorycalendar_id = 'SAP_BR' ).

        LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<original_data>).
          CONVERT TIME STAMP CONV timestamp( <original_data>-CreatedDateTime )
              TIME ZONE 'UTC'
              INTO DATE data(lv_data).

          <original_data>-DeliveryDate = factory_cal->add_workingdays_to_date( iv_start = lv_data
                                                                  iv_number_of_workingdays  = 5  ).
        ENDLOOP.

        ct_calculated_data = CORRESPONDING #(  lt_original_data ).

      CATCH cx_fhc_runtime INTO DATA(error_factory_cal).

    ENDTRY.
  ENDMETHOD.
ENDCLASS.




