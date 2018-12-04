declare name "Esposizioni Elettroacustiche -- Esempio 002";
declare version "1.0";
declare author "Giuseppe Silvi";
declare copyright "Giuseppe Silvi 2018";
declare license "GNU General Public License v3.0";
declare reference "giuseppesilvi.com";
declare description "Monophonic shape evidence";

import("stdfaust.lib");

gain(x) = x : sf.db2linear : sf.smoo;

sinslider = hslider("[3] [unit:Hz]", 500.1, 20, 10000, 0.1) : sf.smoo;
pslider = hslider("[4] [unit:Rad]", 0, 0, 2, 0.01) * sf.PI : sf.smoo;

process = vgroup("[1] sine 1", sf.oscp(sinslider, pslider) * gain(hslider("[5] [unit:dB]", -20, -96, 12, 0.1)))+
          vgroup("[2] sine 2", sf.oscp(sinslider, pslider) * gain(hslider("[5] [unit:dB]", -20, -96, 12, 0.1)));
