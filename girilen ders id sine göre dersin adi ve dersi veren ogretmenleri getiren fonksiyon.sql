USE [Okul]


--girilen ders id sine göre dersin adi ve dersi veren ogretmenleri getiren fonksiyon:
ALTER function [dbo].[IlgiliDerseAitOgretmenBilgisi](@Ders int)
 returns table
 as
 return
 select od.Ders_Id,d.Adi as dersadi,(o.Adi+' '+o.SoyAdi) as ogretmenadsoyad from dbo.OgretmenDers as od 
 inner join dbo.Ders as d on d.Id=od.Ders_Id and d.Statu=1
 inner join dbo.Ogretmen as o on o.Id=od.Ogretmen_Id and o.Statu=1
 where Ders_Id=@Ders
 and
 od.Statu=1



 --cagiralim.
 select * from dbo.IlgiliDerseAitOgretmenBilgisi(8)



 -- where clause kontrolü:
 select d.Id,d.Adi,(o.Adi+' '+o.SoyAdi) as ogretmenadsoyad from  dbo.OgretmenDers as od
 inner join dbo.Ders as d on d.Id=od.Ders_Id and d.Statu=1
 inner join dbo.Ogretmen as o on o.Id=od.Ogretmen_Id and o.Statu=1
 where od.Statu=1
 and d.Id=8