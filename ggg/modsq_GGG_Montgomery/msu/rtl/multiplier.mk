#
#  Copyright 2019 Supranational, LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

############################################################################
# Multiplier configuration
############################################################################

SIMPLE_SQ             ?= 1
MOD_LEN               ?= 1024

# 1 - Connect the testbench directly to the squaring circuit
# 0 - Connect the testbench directly to the MSU
DIRECT_TB             ?= 0

SQ_IN_BITS             = $(MOD_LEN)
SQ_OUT_BITS            = $(MOD_LEN)

MODULUS = 124066695684124741398798927404814432744698427125735684128131855064976895337309138910015071214657674309443149407457493434579063840841220334555160125016331040933690674569571217337630239191517205721310197608387239846364360850220896772964978569683229449266819903414117058030106528073928633017118689826625594484331

# parameters for Montgomery conversion
R_MSB = 1026
R = 719077253944926363091722076315609893447190791576922629093720324630930703222003852530833909289630144084480455519485573430635159075257666489971389722557896497511071573699461941105208878404984376477812331808340023075352602729369851525895652442163308948653402042738345192959788983753918865219341425318496896548864
R_INV = 21544081535275489914770140647434861700481135920677747052052453051692549832886753934396666063473007288335048896346946459610670598532670614963153428814355794317881771956757936605903363612409038064951661223241728791189975303271003256724388932678118461168583316598273682699895972315468726674111239801230528791331
N = $(MODULUS)
N_PRIME = 124867184571385270989337354720327000337584164347200709562073609990950012802514115629921989798362494604693879594369608913288426654446410575233330454950088185553433469813035125482964620346090787051937817672555176506983655616740477775317739794657850146388340850781931088608813165410697665018484234697867507919293

# Configure MSU parameters. These are included through vdf_kernel.sv
msuconfig.vh:
	echo "\`define SQ_IN_BITS_DEF $(SQ_IN_BITS)" \
              > msuconfig.vh
	echo "\`define SQ_OUT_BITS_DEF $(SQ_OUT_BITS)" \
              >> msuconfig.vh
	echo "\`define MODULUS_DEF $(MOD_LEN)'d$(MODULUS)" \
              >> msuconfig.vh
	echo "\`define MOD_LEN_DEF $(MOD_LEN)" \
              >> msuconfig.vh
	echo "\`define R_MSB_DEF $(R_MSB)" \
              >> msuconfig.vh
ifeq ($(SIMPLE_SQ), 1)
	echo "\`define SIMPLE_SQ $(SIMPLE_SQ)" \
              >> msuconfig.vh
endif
