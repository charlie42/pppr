require "awesome_print"
class VisitsController < ApplicationController

  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  @@report_hash = Hash.new 
  @@param = Hash.new
  @@all = 0
  @@ri
  @@vertical_counter = 0

  # GET /visits
  # GET /visits.json
  def index
    @doctor = Doctor.find(params[:doctor_id])
    if (params[:patient_id])
      @patient = Patient.find(params[:patient_id])
    end

    @q = Visit.search(params[:q]);
    @visits = @q.result(distinct: true)#.includes(:treatments, :primary_diagnosis_visits).joins(:treatmentsrj)
                        #.includes(:primary_diagnosis_visits).joins(:primary_diagnosis_visits)
    @q.build_condition
    # @visits = @q.result.includes(:department, :employees)

    @param = params[:q]
    @all = @visits.count
    @@all = @all
    @@param = @param
    @first = 10
    @second = 20
    @arr = [10, 20, 30]

    @ri = ReportItem.find_or_create_by(name: "Отчет") do |x| 
      x.quantity = -1 
      x.horizontal_counter = 0
    end 
    @ri = @ri.children.find_or_create_by(name: "Всего посещений") do |x| 
      x.quantity = @all
      x.horizontal_counter = 0 
      @@vertical_counter = 1
    end 
    @ri = ReportItem.order("created_at").last
    
    @@ri = @ri
    #ri = @ri.children.create(name: "1", quantity: @all)

  end

  def add_to_report 
    @param = @@param.to_s#.tr('"', "'") 
    @all = @@all    
    @ri = @@ri
    
    @@report_hash.merge!(@param => @all)
    @report_hash = @@report_hash

    logger.debug " RI QUANTITY #{@ri.quantity} ALL #{@all}"

    while @ri.quantity <= @all do 
      logger.debug " RI QUANTITY loop1 #{@ri.quantity}"
      @ri = @ri.parent 
      @@vertical_counter -= 1
      if not (@ri && @ri.parent)
         break
      end   
    end

    while @ri.quantity >= @all do 
      logger.debug " RI QUANTITY loop2 #{@ri.quantity}"
      
      if @ri.children.first
        @ri = @ri.children.first 
        @@vertical_counter += 1
      end
      if not (@ri && @ri.children.first)
         break
      end 
      
    end

    logger.debug " RI QUANTITY AFTER LOOP #{@ri.quantity}"

    #@name = "Поле "
    #@name += t @@param.first.second.first.second.first.second.first.second.first.second.to_s
    #@name += " "
    #@name += t @@param.first.second.first.second["p"]
    #@name += ' "'
    #@name += @@param.first.second.first.second["v"].first.second.first.second
    #@name += '" '

    #@name = @@param.to_unsafe_h.to_a.last.last.to_a.last.to_a.last
    
    @name = "Поле "
    @name +=  t @@param.to_unsafe_h.to_a.last.last.to_a.last.to_a.last.first.second.first.second["name"]
    @name += " "
    @name +=  t @@param.to_unsafe_h.to_a.last.last.to_a.last.to_a.last["p"]
    @name += ' "'
    @name +=  @@param.to_unsafe_h.to_a.last.last.to_a.last.to_a.last["v"].first.second.first.second
    @name += '" '

    if ReportItem.first.descendants.exists?(name: @name)
      logger.debug " IF "
      @ri = ReportItem.find_by(name: @name).siblings.create(name: @name, 
            quantity: @all)
    else
      @ri = @ri.children.create(name: @name, quantity: @all)
    end
    #
    # counter = 0
    # ri.siblings.each do |s|
    #   s.horizontal_counter = counter
    #   counter += 1
    # end
    @@ri = @ri

    respond_to do |format|
      format.js
    end
    # redirect_to :back
  end

  def build_report 
    # @report_hash = @@report_hash
    # @report = Hash.new
    # @c = Array.new
    # @first = Array.new
    # @each_c = Array.new
    # @report_hash.each  do |key, value|
    #   @c << key
    #   @c.last.each do |key1, value1|
    #     @first << value1
    #     @first.each do |key2, value2| 
    #       @each_c << value2
    #     end
    #   end
    # end

    r = ReportItem.all.destroy_all

    respond_to do |format|
      format.js
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.find(params[:id])


    # @chart = LazyHighCharts::HighChart.new('graph') do |f|
    #   f.title(text: "Population vs GDP For 5 Big Countries [2009]")
    #   f.xAxis(categories: ["United States", "Japan", "China", "Germany", "France"])
    #   f.series(name: "GDP in Billions", yAxis: 0, data: [14119, 5068, 4985, 3339, 2656])
    #   f.series(name: "Population in Millions", yAxis: 1, data: [310, 127, 1340, 81, 65])

    #   f.yAxis [
    #     {title: {text: "GDP in Billions", margin: 70} },
    #     {title: {text: "Population in Millions"}, opposite: true},
    #   ]

    #   f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
    #   f.chart({defaultSeriesType: "column"})
    # end

    # @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
    #   f.title({ :text=>"Combination chart"})
    #   f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
    #   f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 
    #   f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
    #   f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
    #   f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
    #   f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
    #   f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
    #   f.series(:type=> 'pie',:name=> 'Total consumption', 
    #   :data=> [
    #     {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
    #     {:name=> 'John', :y=> 23,:color=> 'green'},
    #     {:name=> 'Joe', :y=> 19,:color=> 'blue'}
    #   ],
    #   :center=> [100, 80], :size=> 100, :showInLegend=> false)
    #  end

    # @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
    #   f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
    #   f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
    #   f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
    #   f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

    #   f.yAxis [
    #     {:title => {:text => "GDP in Billions", :margin => 70} },
    #     {:title => {:text => "Population in Millions"},  :opposite => true},
    #   ]

    #   f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
    #   f.chart({:defaultSeriesType=>"column"})
    #  end

    # @chart3 = LazyHighCharts::HighChart.new('pie') do |f|
    #   f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
    #   series = {
    #     :type=> 'pie',
    #     :name=> 'Browser share',
    #     :data=> [
    #       ['Firefox', 45.0],
    #       ['IE', 26.8],
    #      {
    #         :name=> 'Chrome', 
    #         :y=> 12.8,
    #         :sliced=> true,
    #         :selected=> true
    #      },
    #       ['Safari', 8.5],
    #       ['Opera', 6.2],
    #       ['Others', 0.7]
    #     ]
    #   }
    #   f.series(series)
    #   f.options[:title][:text] = "THA PIE"
    #   f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
    #   f.plot_options(:pie=>{
    #     :allowPointSelect=>true, 
    #     :cursor=>"pointer" , 
    #     :dataLabels=>{
    #       :enabled=>true,
    #       :color=>"black",
    #       :style=>{
    #         :font=>"13px Trebuchet MS, Verdana, sans-serif"
    #       }
    #     }
    #   })
    # end

    #  @chart4 = LazyHighCharts::HighChart.new('column') do |f|
    #   f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
    #   f.series(:name=>'Jane',:data=>[1, 3, 4, 3, 3, 5, 4,-46] ) 
    #   f.title({ :text=>"example test title from controller"})

    #   ### Options for Bar
    #   ### f.options[:chart][:defaultSeriesType] = "bar"
    #   ### f.plot_options({:series=>{:stacking=>"normal"}})

    #   ## or options for column
    #   f.options[:chart][:defaultSeriesType] = "column"
    #   f.plot_options({:column=>{:stacking=>"percent"}})
    #  end


    # @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
    #   f.global(useUTC: false)
    #   f.chart(
    #     backgroundColor: {
    #       linearGradient: [0, 0, 500, 500],
    #       stops: [
    #         [0, "rgb(255, 255, 255)"],
    #         [1, "rgb(240, 240, 255)"]
    #       ]
    #     },
    #     borderWidth: 2,
    #     plotBackgroundColor: "rgba(255, 255, 255, .9)",
    #     plotShadow: true,
    #     plotBorderWidth: 1
    #   )
    #   f.lang(thousandsSep: ",")
    #   f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    # end
    
  end

  # GET /visits/new
  def new
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.new

    @visit.treatments.build
    @visit.medications.build
    @visit.examination_results.build

    #@visit.condition_visits.build
    
    #@biz.save

    #@visit.primary_diagnosis_visits.build
    #@visit.concomitant_diagnosis_visits.build
    #@visit.complication_diagnosis_visits.build


    #if @visit.save 
      #params[:liver_conditions_attributes].each do |key, value|
        #@visit.liver_conditions << LiverConditionVisit.new(:visit_id => params[:id], :liver_condition_id => value, :details => params[:details])
     # @visit.liver_condition_visits << LiverConditionVisit.new(:visit_id => params[:id], :liver_condition_id => params[:liver_condition_id], :details => params[:details])
      #end
    #end
    #@visit.doctor_id = @doctor.id
    #@visit.patient_id = params[:patient_id]

    puts params.inspect
  end

  # GET /visits/1/edit
  def edit
  end

  # def populate_join_table h, det, name
  #   h.each do |v|
  #       @lc = @visit.send(name + "_visits").build(:visit_id => params[:id], (name + "_id").to_sym => v, :details => det)
  #       @lc.save
  #   end
  # end

  # def populate_join_table_custom_name_det h, det, join_table_name, id_name
  #   i = 0
  #   h.each do |v|
  #       @lc = @visit.send(join_table_name).build(:visit_id => params[:id], (id_name).to_sym => v, :details => det)
  #       @lc.save
  #       i += 1
  #   end
  # end

  # def populate_join_table_custom_name_res h, res, join_table_name, id_name
  #   i = 0
  #   h.each do |v|
  #       @lc = @visit.send(join_table_name).build(:visit_id => params[:id], (id_name).to_sym => v, :result => res)
  #       @lc.save
  #       i += 1
  #   end
  # end

  # POST /visits
  # POST /visits.json
  def create
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @visit = Visit.new(visit_params)


    # if params['visit']['treatments']
    #   @visit.treatments.build(:treatment_factor_id => params['visit']['treatments']['treatment_factor_id'])
    # end

    #r = params['visit']["diagnosis_visits"]
    #if r["diagnosis_ids"]
    #  populate_join_table r["diagnosis_ids"], r["diagnosis_types"], "diagnosis"
    #end

    #r = params['visit']["diagnosis_visits"]
    #ids = r["diagnosis_ids"]
    #types = r["diagnosis_type_ids"]
    #i = 0
    #if r
      #r.each do |v|
         # @lc = @visit.diagnosis_visits.build(:visit_id => params[:id], :diagnosis_id => v["diagnosis_id"].to_i, :diagnosis_type_id => v["diagnosis_type_id"].to_i)
         # @lc.save
          #i += 1
    #  end
    #end

    # @a = params["visit"]["condition_visits_attributes"]["0"]["condition_value_id"]
    # @visit.save
    # @biz = @visit.condition_visits.find_or_create_by condition_value_id: @a

    @result = params['visit']["consultations"]["result"]
    @ids = params['visit']["consultations"]["specialist_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.consultations.build(:visit_id => params[:id], :specialist_id => v, :result => @result)
          @lc.save
          i += 1
      end
    end

    @names = params['visit']["condition_visits"]
    
    #if @names
      @names.each do |name|
        @ids = name[1]["condition_value_id"]
        @details = name[1]["details"]
        if @ids
          @ids.each do |v|
            @lc = @visit.condition_visits.build(:visit_id => params[:id], :condition_value_id => v, :details => @details)
            @lc.save
          end
        end
      end
    #end

    # @details = params['visit']["treatments"]["details"]
    # @amount = params['visit']["treatments"]["amount"]
    # @ids = params['visit']["treatments"]["treatment_factor_ids"]
    # if @ids
    #   i = 0
    #   @ids.each do |v|
    #       @lc = @visit.treatments.build(:visit_id => params[:id], :treatment_factor_id => v, :amount => @amount, :details => @details)
    #       @lc.save
    #       i += 1
    #   end
    # end


    # @lc = @visit.treatments.build(:visit_id => params[:id], :factor_id => params['visit']['treatment']['treatment_factor_id'], 
    #       :amount => params['visit']['treatment']['amount'], :details => params['visit']['treatment']['details'])
    # @lc.save


    # @details = params['visit']["examination_results"]["details"]
    # @result = params['visit']["examination_results"]["result"]
    @ids = params['visit']["examination_result"]["examination_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.examination_results.build(:visit_id => params[:id], :examination_id => v#, :result => @result, :details => @details
              )
          @lc.save
          i += 1
      end
    end


    @details = params['visit']["concomitant_diagnosis_visits"]["details"]
    @ids = params['visit']["concomitant_diagnosis_visits"]["concomitant_diagnosis_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.concomitant_diagnosis_visits.build(:visit_id => params[:id], :concomitant_diagnosis_id => v, :details => @details)
          @lc.save
          i += 1
      end
    end

    @details = params['visit']["complication_diagnosis_visits"]["details"]
    @ids = params['visit']["complication_diagnosis_visits"]["complication_diagnosis_ids"]
    if @ids
      i = 0
      @ids.each do |v|
          @lc = @visit.complication_diagnosis_visits.build(:visit_id => params[:id], :complication_diagnosis_id => v, :details => @details)
          @lc.save
          i += 1
      end
    end

    @details = params['visit']["primary_diagnosis_visits"]["details"]
    @ids = params['visit']["primary_diagnosis_visits"]["primary_diagnosis_ids"]
    #if @r
      if @ids
        i = 0
        @ids.each do |v|
            @lc = @visit.primary_diagnosis_visits.build(:visit_id => params[:id], :primary_diagnosis_id => v, :details => @details)
            @lc.save
            i += 1
        end
      end
   # end


    # @details = params['visit']["condition_visits"]["details"]
    # @ids = params['visit']["condition_visits"]["condition_value_ids"]
    # i = 0
    # if @ids
    #   @ids.each do |v|
    #       @lc = @visit.condition_visits.build(:visit_id => params[:id], :condition_value_id => v, :details => @details[i])
    #       @lc.save
    #       i += 1
    #   end
    # end

    respond_to do |format|
      if @visit.save
        format.html { redirect_to doctor_patient_visit_path(@doctor.id, @patient.id, @visit.id), notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      #{:post => params.require(:post).permit(:title, :body, images_posts_attributes: [:caption, image_attributes: [:image]] )}
      params.require(:visit).permit(:from, 
        :date, :complaints, :anamnesis, :allerg, :general_state_option_id, 
        :diagnosis, :doctor_id, :patient_id, :constitution_option_id, 
        :effleurage_option_id, :postural_pose_option_id, 
        :subcutanious_fat_option_id, :from_id, :complaint_list,
        treatments_attributes:
          [:id, :treatment_factor_id, :amount, :details, :_destroy],
        medications_attributes: 
          [:id, :medicine_id, :dosage, :duration, :details, :_destroy],
        examination_results_attributes:
          [:id, :examinations, :examination_id, :result, :details, :_destroy],
        consultations_attributes: 
          [:result, :specialists],
        primary_diagnosis_visits_attributes:
          [:primary_diagnoses],
        concomitant_diagnosis_visits_attributes:
          [:concomitant_diagnoses],
        complication_diagnosis_visits_attributes:
          [:complication_diagnoses],
        condition_visits_attributes: 
          [:condition_name_id, :details, condition_value_id:[]]
        #,
        # condition_names_attributes:
        #   [:names, :detailss]
        )
      #params.require(:visit).permit(:from, :date, :complaints, :anamnesis, :allerg, :general_state_option_id, :diagnosis, :doctor_id, :patient_id, :constitution_option_id, :effleurage_option_id, :postural_pose_option_id, :subcutanious_fat_option_id)
      #params.require(:liver_condition).permit(:details, :liver_condition_id)
    end
end
