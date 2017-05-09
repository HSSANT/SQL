DECLARE 
    CURSOR C_RM_77286 IS
    SELECT * FROM PF0064.LOC_ITEM_LOCACAO;
    V_RM_77286 C_RM_77286%ROWTYPE;
    
BEGIN   
        OPEN C_RM_77286;
        LOOP
            FETCH  C_RM_77286 INTO V_RM_77286; 
                EXIT WHEN C_RM_77286%NOTFOUND;
                    INSERT INTO  LOC_ITEM_LOCACAO_STG( 
                    DT_RETIRADA,  
                    NR_ITEM ,        
                    DT_ENTREGA,      
                    QT_DIAS,         
                    VL_LOCACAO,          
                    NR_PLACA,            
                    VL_TOTAL,             
                    NR_PEDIDO,            
                    DT_CARGA)	
                    
                    VALUES (                   
                    V_RM_77286.DT_RETIRADA,  
                    V_RM_77286.NR_ITEM,        
                    V_RM_77286.DT_ENTREGA,      
                    V_RM_77286.QT_DIAS,         
                    V_RM_77286.VL_LOCACAO,          
                    V_RM_77286.NR_PLACA,            
                    V_RM_77286.VL_TOTAL,             
                    V_RM_77286.NR_PEDIDO,            
                    SYSDATE
                    );
        END LOOP;
        CLOSE C_RM_77286;
COMMIT;
END;
