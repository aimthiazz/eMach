clc
clear

DRAW_MAGNET = 0;
DRAW_TIKZ   = 0;
DRAW_XFEMM = 1;

%% Define geometric parameters

% Stator parameters
w_s = 65.7; % stator length
w_st = 14.8; % tooth thickness
w_so = 3.66; % slot opening length
r_so = 71.8; % stator outer radius
r_si = 35.9; % stator inner radius
d_so = 3.98; % slot opening height
d_sp = 7.46; % height of tooth end
d_sy = 9.53; % stator yoke thickness
% radii of fillets
r_st = 3;
r_sf = 3;
r_sb = 3;

% Mover parameters
g = 1.35; % air gap length
d_rm = 9.82; % magnet thickness
d_re = 6.82; % length between end iron surface and magnet surface
r_ri = 17.6; % mover inner radius
w_ra = 8.24; % length of axially magnetized magnet
w_rr = 12.9; % length of radially magnetized magnet
w_r = w_s; % mover length

% Notched rectangle parameters based on the mover parameters
w = w_r; % length of rectangle
w_n = (w - w_ra - 2*w_rr)/2; % length of notch
d = r_si - g - d_rm - r_ri; % height of notched part of rectangle
d_n = d_rm - d_re; % height of notch

%% Define cross sections

% Create a cross-section of a stator iron
statorIron = CrossSectLinearMotorStator( ...
        'name', 'stator_iron', ...
        'dim_w_s', DimMillimeter(w_s), ...
        'dim_w_st', DimMillimeter(w_st), ...
        'dim_w_so', DimMillimeter(w_so), ...
        'dim_r_so', DimMillimeter(r_so), ...
        'dim_r_si', DimMillimeter(r_si), ...
        'dim_d_so', DimMillimeter(d_so), ...
        'dim_d_sp', DimMillimeter(d_sp), ...
        'dim_d_sy', DimMillimeter(d_sy), ...
        'dim_r_st', DimMillimeter(r_st), ...
        'dim_r_sf', DimMillimeter(r_sf), ...
        'dim_r_sb', DimMillimeter(r_sb), ...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([0,0]), ...
            'theta', DimDegree([0]).toRadians() ...
        ) ...
        );
 
% Create a cross-section of a mover iron    
moverIron = CrossSectNotchedRectangle( ...
        'name', 'mover_iron', ...
        'dim_w', DimMillimeter(w), ...
        'dim_w_n', DimMillimeter(w_n), ...   
        'dim_d', DimMillimeter(d), ...
        'dim_d_n', DimMillimeter(d_n), ...         
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([r_ri, w]), ...
            'theta', DimDegree([-90]).toRadians() ...
        ) ...
        );    
   
% Create a cross-section of the magnets   
magnet1 = CrossSectSolidRect( ...
        'name', 'SolidRect', ...
        'dim_w',DimMillimeter(d_rm),....
        'dim_h',DimMillimeter(w_rr),...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([d + r_ri,w - w_n - w_rr]), ...
            'theta', DimDegree([0]).toRadians() ...
        ) ...
        );
    
magnet2 = CrossSectSolidRect( ...
        'name', 'SolidRect', ...
        'dim_w',DimMillimeter(d_rm),....
        'dim_h',DimMillimeter(w_ra),...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([d + r_ri,w_n + w_rr]), ...
            'theta', DimDegree([0]).toRadians() ...
        ) ...
        );    

magnet3 = CrossSectSolidRect( ...
        'name', 'SolidRect', ...
        'dim_w',DimMillimeter(d_rm),....
        'dim_h',DimMillimeter(w_rr),...
        'location', Location2D( ...
            'anchor_xy', DimMillimeter([d + r_ri,w_n]), ...
            'theta', DimDegree([0]).toRadians() ...
        ) ...
        );

%% Define components

statorIronComp = Component( ...
        'name', 'StatorIronComp', ...
        'crossSections', statorIron, ...
        'material', MaterialGeneric('name', 'Hiperco-50'), ...
        'makeSolid', MakeExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );

moverIronComp = Component( ...
        'name', 'moverIronComp', ...
        'crossSections', moverIron, ...
        'material', MaterialGeneric('name', 'Hiperco-50'), ...
        'makeSolid', MakeExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );    

magnet1Comp = Component( ...
        'name', 'magnet1Comp', ...
        'crossSections', magnet1, ...
        'material', MaterialGeneric('name', 'pm'), ...
        'makeSolid', MakeExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );    
    
magnet2Comp = Component( ...
        'name', 'magnet2Comp', ...
        'crossSections', magnet2, ...
        'material', MaterialGeneric('name', 'pm'), ...
        'makeSolid', MakeExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );    

magnet3Comp = Component( ...
        'name', 'magnet3Comp', ...
        'crossSections', magnet3, ...
        'material', MaterialGeneric('name', 'pm'), ...
        'makeSolid', MakeExtrude( ...
            'location', Location3D( ...
                'anchor_xyz', DimMillimeter([0,0,0]), ...
                'rotate_xyz', DimDegree([0,0,0]).toRadians() ...
                ), ...
            'dim_depth', DimMillimeter(0)) ...
        );  
    
%% Draw via MagNet

if (DRAW_MAGNET)
    toolMn = MagNet();
    toolMn.open(0,0,true);
    toolMn.setDefaultLengthUnit('millimeters', false);

    statorIronComp.make(toolMn, toolMn);    
    moverIronComp.make(toolMn, toolMn);
    magnet1Comp.make(toolMn, toolMn);
    magnet2Comp.make(toolMn, toolMn);
    magnet3Comp.make(toolMn, toolMn);

    toolMn.viewAll();
end

%% Draw via TikZ

if (DRAW_TIKZ)
    toolTikz = TikZ();
    toolTikz.open('output.txt');

    statorIronComp.make(toolTikz);
    moverIronComp.make(toolTikz);
    magnet1Comp.make(toolTikz);
    magnet2Comp.make(toolTikz);
    magnet3Comp.make(toolTikz);
    toolTikz.close();
end

if (DRAW_XFEMM)
    toolXFEMM = XFEMM();
    toolXFEMM.newFemmProblem(0,'planar','millimeters');

    statorIronComp.make(toolXFEMM, toolXFEMM);    
    moverIronComp.make(toolXFEMM, toolXFEMM);
    magnet1Comp.make(toolXFEMM, toolXFEMM);
    magnet2Comp.make(toolXFEMM, toolXFEMM);
    magnet3Comp.make(toolXFEMM, toolXFEMM);
%     FemmProblem = toolXFEMM.returnFemmProblem();
    
    FemmProblem = toolXFEMM.removeOverlaps();

    plotfemmproblem(FemmProblem);
end