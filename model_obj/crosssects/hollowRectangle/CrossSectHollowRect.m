classdef CrossSectHollowRect < CrossSectBase
    %COMPHOLLOWRECT Describes a hollow rectangle.
    %   Properties are set upon class creation and cannot be modified.
    %   The anchor point for this is the lower left corner of the outer
    %   rectangle.
    
    properties (GetAccess = 'public', SetAccess = 'protected')
        dim_t1;  %Thickness of rectangle's right side: class type dimLinear
        dim_t2;  %Thickness of rectangle's upper side: class type dimLinear
        dim_t3;  %Thickness of rectangle's left side: class type dimLinear
        dim_t4;  %Thickness of rectangle's lower side: class type dimLinear
        dim_w; %Length of outer rectangle: class type dimLinear
        dim_h; %Breadth of outer rectangle: class type dimLinear        
    end
    
  methods
        function obj = CrossSectHollowRect(varargin)
            obj = obj.createProps(nargin,varargin);            
            obj.validateProps();            
        end
                
        function draw(obj, drawer)
            validateattributes(drawer, {'Drawer2dBase'}, {'nonempty'});
            
            axis = [0,0];
            w=obj.dim_w;
            h=obj.dim_h;
            t1=obj.dim_t1;
            t2=obj.dim_t2;
            t3=obj.dim_t3;
            t4=obj.dim_t4;

%%Create inner and outer points
            points_i=[axis(1)+t3,axis(2)+t4; axis(1)+t3,axis(2)+h-t2;...
            w-t1+axis(1), h-t2+axis(2);w-t1+axis(1),t4+axis(2);];
            points_o = [axis(1),axis(2); axis(1),axis(2)+h; axis(1)+w, ....
            axis(2)+h; axis(1)+w,axis(2)];
        
%%Transform Coordinates
            [points_i] = obj.location.transformCoords(points_i);
            [points_o] = obj.location.transformCoords(points_o);
            
%% Draw Inner Rectangle
            [l_i1] = drawer.drawLine(points_i(1,:),points_i(2,:));
            [l_i2] = drawer.drawLine(points_i(2,:),points_i(3,:));
            [l_i3] = drawer.drawLine(points_i(3,:),points_i(4,:));
            [l_i4] = drawer.drawLine(points_i(4,:),points_i(1,:));

%% Draw Outer Rectangle
            [l_o1] = drawer.drawLine(points_o(1,:),points_o(2,:));
            [l_o2] = drawer.drawLine(points_o(2,:),points_o(3,:));
            [l_o3] = drawer.drawLine(points_o(3,:),points_o(4,:));
            [l_o4] = drawer.drawLine(points_o(4,:),points_o(1,:));
            
        end
        function select(obj)
            
        end
    end
    
  methods(Access = protected)
     function validateProps(obj)
       %VALIDATE_PROPS Validate the properties of this component
             
       %1. use the superclass method to validate the properties 
        validateProps@CrossSectBase(obj);   
            
        %2. valudate the new properties that have been added here
        validateattributes(obj.dim_t1,{'DimLinear'},{'nonnegative','nonempty'});
        validateattributes(obj.dim_t2,{'DimLinear'},{'nonnegative','nonempty'});
        validateattributes(obj.dim_t3,{'DimLinear'},{'nonnegative','nonempty'});
        validateattributes(obj.dim_t4,{'DimLinear'},{'nonnegative','nonempty'});
        validateattributes(obj.dim_w,{'DimLinear'},{'nonnegative','nonempty'});
        validateattributes(obj.dim_h,{'DimLinear'},{'nonnegative','nonempty'});
      end
                  
         function obj = createProps(obj, len, args)
             %CREATE_PROPS Add support for value pair constructor
             
             validateattributes(len, {'numeric'}, {'even'});
             for i = 1:2:len 
                 obj.(args{i}) = args{i+1};
             end
         end
     end
end
    