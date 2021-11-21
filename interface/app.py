from flask import *
import os
import psycopg2
import datetime

app = Flask(__name__)

@app.errorhandler(404) 
def not_found(e): 
	return render_template("404.html")

@app.route('/', methods=['GET','POST'])
def home():
    if(request.method=='GET'):
        return render_template("home.html")

@app.route('/challanbyaadhaar', methods=['GET','POST'])
def challanbyadhaar():
    if(request.method=='GET'):
        return render_template("query.html",heading="Search challan by aadhaar")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            SELECT ChallanNo, CDate, Type, Fine
            FROM challan
            WHERE aadhaarno = %s;
            """,
            [f['query'],]
        )
        th=['Challan ID','Challan Date', 'Type', 'Fine']
        records = cur.fetchall()
        records=list(records)
        cur.close()
        conn.close()
        return render_template("renderresult.html",heading="Search challan by aadhaar", tableheadings=th, result=records, route="/challanbyaadhaar")

@app.route('/challanbyrc', methods=['GET','POST'])
def challanrc():
    if(request.method=='GET'):
        return render_template("query.html",heading="Search challan by RC")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            SELECT ChallanNo, CDate, Type, Fine
            FROM challan
            WHERE RC_Number = %s;
            """,
            [f['query'],]
        )
        th=['Challan ID','Challan Date', 'Type', 'Fine']
        records = cur.fetchall()
        records=list(records)
        cur.close()
        conn.close()
        return render_template("renderresult.html",heading="Search challan by RC", tableheadings=th, result=records, route="/challanbyrc")

@app.route('/delchallanbyID', methods=['GET','POST'])
def del_challanbyID():
    if(request.method=='GET'):
        return render_template("query.html",heading="Delete challan by challan number/ID")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            DELETE FROM challan
            WHERE ChallanNo = %s;
            """,
            [f['query'],]
        )
        cur.close()
        conn.close()
        return render_template("indel.html",heading="Delete challan by challan number/ID", change="deleted", route="/delchallanbyID")

@app.route('/delchallanbyrc', methods=['GET','POST'])
def del_challanbyRC():
    if(request.method=='GET'):
        return render_template("query.html",heading="Delete challan by RC")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            DELETE FROM challan
            WHERE RC_Number = %s;
            """,
            [f['query'],]
        )
        cur.close()
        conn.close()
        return render_template("indel.html",heading="Delete challan by RC", change="deleted", route="/delchallanbyrc")

@app.route('/delchallanbyaadhaar', methods=['GET','POST'])
def del_challanbyaadhaar():
    if(request.method=='GET'):
        return render_template("query.html",heading="Delete challan by aadhaar")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            DELETE FROM challan
            WHERE ChallanNo = %s;
            """,
            [f['query'],]
        )
        cur.close()
        conn.close()
        return render_template("indel.html",heading="Delete challan by aadhaar", change="deleted", route="/delchallanbyaadhaar")


@app.route('/addchallanbyrc', methods=['GET','POST'])
def add_challanbyRC():
    if(request.method=='GET'):
        return render_template("insertquery.html",heading="Add challan by RC")

    elif(request.method=='POST'):
        f = dict(request.form)
        print(f)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute("""
         INSERT INTO challan (ChallanNo, CDate, Type, Proof, Fine, RC_Number, LicenseNo, AadhaarNo)
         VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
         """,
         (f['ChallanNo'], datetime.datetime.strptime(f['CDate'].replace("-",""), "%Y%m%d").date(), f['Type'], f['Proof'], int(f['Fine']), f['RC_Number'], f['LicenseNo'], int(f['AadhaarNo']))
        )
        conn.commit()
        cur.close()
        conn.close()
        return render_template("indel.html",heading="Add challan by RC", change="inserted", route="/addchallanbyrc")

@app.route('/vehicleaadhaar', methods=['GET','POST'])
def get_vehicle_by_aadhaar():
    if(request.method=='GET'):
        return render_template("query.html",heading="Get vehicle details of the owner by aadhaar")

    elif(request.method=='POST'):
        f = dict(request.form)
        conn = psycopg2.connect("dbname=vehicle user=postgres")
        cur = conn.cursor()
        cur.execute(
            """
            SELECT RC_Number, Type, EngineNo, ChassisNo, ModelNo, AadhaarNo 
            FROM vehicle
            WHERE aadhaarno = %s;
            """,
            [f['query'],]
        )
        th=['RC Number','Vehicle Type', 'Engine#', 'Chassis#', 'Model#', 'Aadhaar#']
        records = cur.fetchall()
        records=list(records)
        cur.close()
        conn.close()
        return render_template("renderresult.html",heading="Get vehicle details of the owner by aadhaar", tableheadings=th, result=records, route="/vehicleaadhaar")

if(__name__ == '__main__'):
    app.run()