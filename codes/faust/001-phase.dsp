declare name "Esposizioni Elettroacustiche -- Esempio 001";
declare version "1.0";
declare author "Giuseppe Silvi";
declare copyright "Giuseppe Silvi 2018";
declare license "GNU General Public License v3.0";
declare reference "giuseppesilvi.com";
declare description "Monophonic shape evidence";

import("stdfaust.lib");

trislider = hslider("[1] [unit:Hz]", 500, 20, 1000, 1) : sf.smoo;
gain(x) = x : sf.db2linear : sf.smoo;

sinslider = hslider("[3] [unit:Hz]", 500.1, 20, 5000, 0.1) : sf.smoo;
pslider = hslider("[4] [unit:Rad]", 0, 0, 2, 0.01) * sf.PI : sf.smoo;

process = vgroup("[1] triangular", sf.lf_triangle(trislider) * gain(hslider("[2] [unit:dB]", -20, -96, 6, 0.1))) +
          vgroup("[2] sinusoidal", sf.oscp(sinslider, pslider) * gain(hslider("[5] [unit:dB]", -20, -96, 6, 0.1)));
