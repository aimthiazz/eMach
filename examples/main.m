clc
clear

DRAW_MAGNET = 1;
DRAW_TIKZ   = 0;

%% Define cross sections

arc1 = CrossSectArc( ...
        'name', 'arc1', ...
        'dim_d_a', DimMillimeter(1), ...
        'dim_r_o', DimMillimeter(10), ...
        'dim_depth', DimMillimeter(10), ...
        'dim_alpha', DimDegree(45).toRadians(), ...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([0,0]), ...
            'rotate_xy', DimDegree(0).toRadians() ...
        ) ...
        );
    
trap1 = CrossSectTrapezoid( ...
        'name', 'trapezoid1', ...
        'dim_h', DimMillimeter(1), ...
        'dim_w', DimMillimeter(4), ...
        'dim_theta', DimDegree(60).toRadians(), ...
        'dim_depth', DimMillimeter(1), ...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([0,0]), ...
            'rotate_xy', DimDegree(0).toRadians() ...
        ) ...
        );
    
% stator1 = CrossSectInnerRotorPMStator( ...
%         'name', 'stator1', ...
%         'dim_alpha_st', DimDegree(40), ...
%         'dim_alpha_so', DimDegree(20), ...
%         'dim_r_si', DimMillimeter(40), ...
%         'dim_d_so', DimMillimeter(5), ...
%         'dim_d_sp', DimMillimeter(10), ...
%         'dim_d_st', DimMillimeter(15), ...
%         'dim_d_sy', DimMillimeter(15), ...
%         'dim_w_st', DimMillimeter(13), ...
%         'dim_r_st', DimMillimeter(0), ...
%         'dim_r_sf', DimMillimeter(0), ...
%         'dim_r_sb', DimMillimeter(0), ...
%         'stator_slots', 3, ...
%         'location', Location2D( ...
%             'anchor_xy', DimMillimeter([-170,-90]), ...
%             'rotate_xy', DimDegree(0).toRadians() ...
%         ) ...
%         );
stator2 = CrossSectInnerRotorPMStator( ...
        'name', 'stator1', ...
        'dim_alpha_st', DimDegree(40), ...
        'dim_alpha_so', DimDegree(0), ...
        'dim_r_si', DimMillimeter(40), ...
        'dim_d_so', DimMillimeter(5), ...
        'dim_d_sp', DimMillimeter(10), ...
        'dim_d_st', DimMillimeter(15), ...
        'dim_d_sy', DimMillimeter(15), ...
        'dim_w_st', DimMillimeter(13), ...
        'dim_r_st', DimMillimeter(3), ...
        'dim_r_sf', DimMillimeter(10), ...
        'dim_r_sb', DimMillimeter(0), ...
        'stator_slots', 4, ...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([0,0]), ...
            'rotate_xy', DimDegree(0).toRadians() ...
        ) ...
        );
% stator3 = CrossSectInnerRotorPMStator( ...
%         'name', 'stator1', ...
%         'dim_alpha_st', DimDegree(40), ...
%         'dim_alpha_so', DimDegree(20), ...
%         'dim_r_si', DimMillimeter(40), ...
%         'dim_d_so', DimMillimeter(5), ...
%         'dim_d_sp', DimMillimeter(10), ...
%         'dim_d_st', DimMillimeter(15), ...
%         'dim_d_sy', DimMillimeter(15), ...
%         'dim_w_st', DimMillimeter(13), ...
%         'dim_r_st', DimMillimeter(0), ...
%         'dim_r_sf', DimMillimeter(0), ...
%         'dim_r_sb', DimMillimeter(0), ...
%         'stator_slots', 5, ...
%         'location', Location2D( ...
%             'anchor_xy', DimMillimeter([170,-90]), ...
%             'rotate_xy', DimDegree(0).toRadians() ...
%         ) ...
%         );
% stator4 = CrossSectInnerRotorPMStator( ...
%         'name', 'stator1', ...
%         'dim_alpha_st', DimDegree(40), ...
%         'dim_alpha_so', DimDegree(20), ...
%         'dim_r_si', DimMillimeter(40), ...
%         'dim_d_so', DimMillimeter(5), ...
%         'dim_d_sp', DimMillimeter(10), ...
%         'dim_d_st', DimMillimeter(15), ...
%         'dim_d_sy', DimMillimeter(15), ...
%         'dim_w_st', DimMillimeter(13), ...
%         'dim_r_st', DimMillimeter(0), ...
%         'dim_r_sf', DimMillimeter(0), ...
%         'dim_r_sb', DimMillimeter(0), ...
%         'stator_slots', 6, ...
%         'location', Location2D( ...
%             'anchor_xy', DimMillimeter([-170,90]), ...
%             'rotate_xy', DimDegree(0).toRadians() ...
%         ) ...
%         );
% stator5 = CrossSectInnerRotorPMStator( ...
%         'name', 'stator1', ...
%         'dim_alpha_st', DimDegree(40), ...
%         'dim_alpha_so', DimDegree(20), ...
%         'dim_r_si', DimMillimeter(40), ...
%         'dim_d_so', DimMillimeter(5), ...
%         'dim_d_sp', DimMillimeter(10), ...
%         'dim_d_st', DimMillimeter(15), ...
%         'dim_d_sy', DimMillimeter(15), ...
%         'dim_w_st', DimMillimeter(13), ...
%         'dim_r_st', DimMillimeter(0), ...
%         'dim_r_sf', DimMillimeter(0), ...
%         'dim_r_sb', DimMillimeter(0), ...
%         'stator_slots', 7, ...
%         'location', Location2D( ...
%             'anchor_xy', DimMillimeter([0,90]), ...
%             'rotate_xy', DimDegree(0).toRadians() ...
%         ) ...
%         );    
% stator6 = CrossSectInnerRotorPMStator( ...
%         'name', 'stator1', ...
%         'dim_alpha_st', DimDegree(40), ...
%         'dim_alpha_so', DimDegree(20), ...
%         'dim_r_si', DimMillimeter(40), ...
%         'dim_d_so', DimMillimeter(5), ...
%         'dim_d_sp', DimMillimeter(10), ...
%         'dim_d_st', DimMillimeter(15), ...
%         'dim_d_sy', DimMillimeter(15), ...
%         'dim_w_st', DimMillimeter(13), ...
%         'dim_r_st', DimMillimeter(0), ...
%         'dim_r_sf', DimMillimeter(0), ...
%         'dim_r_sb', DimMillimeter(0), ...
%         'stator_slots', 8, ...
%         'location', Location2D( ...
%             'anchor_xy', DimMillimeter([170,90]), ...
%             'rotate_xy', DimDegree(0).toRadians() ...
%         ) ...
%         );
    
%% Define components

% cs = [stator1, stator2, stator3, stator4, stator5, stator6];
cs = [stator2];

comp1 = Component( ...
        'name', 'comp1', ...
        'cross_sections', cs, ...
        'material', MaterialGeneric('name', 'pm'), ...
        'make_solid', MakeSolidBase(), ...
        'location', Location3D( ...
            'anchor_xyz', DimMillimeter([0,0,0]), ...
            'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
        ) ...
        );

%% Draw via MagNet

if (DRAW_MAGNET)
    toolMn = MagNet();
    toolMn.open(0,0,true);
    toolMn.setDefaultLengthUnit('millimeters', false);

    comp1.make(toolMn);

    toolMn.viewAll();
end

%% Draw via TikZ

if (DRAW_TIKZ)
    toolTikz = TikZ();
    toolTikz.open('output.txt');

    comp1.make(toolTikz);

    toolTikz.close();
end
