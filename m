From: "Mr I.E. Esten" <i.esten@ic.ac.uk>
Date: Tue, 06 Jun 2000 12:17:46 +0000
Subject: ALSA
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-559023410-851401618-960293866=:7008"
Message-Id: <marc-linux-sound-96029462727163@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95557469806551@msgid-missing>
In-Reply-To: <marc-linux-sound-95557469806551@msgid-missing>
To: linux-sound@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---559023410-851401618-960293866=:7008
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi people,
	I need your help! I am having a bit of trouble setting up ALSA on
my Dell Optiplex (w/ Redhat 6). I have two cards in the machine; an sb16
built in to the motherboard, and an sb live pci card. Trouble is, I can't
get MIDI working on the sb live. Jazz complains that /dev/sequencer2 and
/dev/music are not configured, and more'ing them just to see what happens
reports the same. I can't even get the sb16 detected (allthough it works
fine with the kernel sound drivers), as isapnp can't find it. I would
really appreciate some help with all this - I've tried just about
everything I can think of. I've included the conf.modules i've been using
and the /proc/modules report.
Thanks v. much,
Ian

PS - everything else on the sb live works ok - its just MIDI that doesn't.

---559023410-851401618-960293866=:7008
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="conf.modules.alsa-sblive"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.GSO.4.10.10006061317460.7008@tanya>
Content-Description: 
Content-Disposition: attachment; filename="conf.modules.alsa-sblive"

YWxpYXMgcGFycG9ydF9sb3dsZXZlbCBwYXJwb3J0X3BjDQpwcmUtaW5zdGFs
bCBwY21jaWFfY29yZSAvZXRjL3JjLmQvaW5pdC5kL3BjbWNpYSBzdGFydA0K
DQojIElTQSBQblAgc3VwcG9ydA0Kb3B0aW9ucyBpc2FwbnAgaXNhcG5wX3Jl
c2VydmVfaXJxPTUsMQ0KDQojIEFMU0EgbmF0aXZlIGRldmljZSBzdXBwb3J0
DQphbGlhcyBjaGFyLW1ham9yLTExNiBzbmQNCiMgb3B0aW9ucyBzbmQgc25k
X21ham9yPTExNiBzbmRfY2FyZHNfbGltaXQ9MQ0Kb3B0aW9ucyBzbmQgc25k
X21ham9yPTExNiBzbmRfY2FyZHNfbGltaXQ9Mg0KIyAgICAgICAgRm9yIFNC
IExpdmUhDQphbGlhcyBzbmQtY2FyZC0wIHNuZC1jYXJkLWVtdTEwazENCm9w
dGlvbnMgc25kLWNhcmQtZW11MTBrMSBzbmRfaW5kZXg9MCBzbmRfaWQ9IlNC
IExpdmUhID8iDQojICAgICAgICBGb3IgU0IgMTYNCmFsaWFzIHNuZC1jYXJk
LTEgc25kLWNhcmQtc2IxNg0Kb3B0aW9ucyBzbmQtY2FyZC1zYjE2IHNuZF9p
bmRleD0xIHNuZF9pZD0iU0IgMTYiIHNuZF9wb3J0PTB4MjIwIHNuZF9pcnE9
NSBzbmRfZG1hMT0xIHNuZF9kbWEyPTUNCg0KIyBPU1MvRnJlZSBzZXR1cA0K
YWxpYXMgY2hhci1tYWpvci0xNCBzb3VuZGNvcmUNCiMgICAgICAgIEZvciBT
QiBMaXZlIQ0KYWxpYXMgc291bmQtc2xvdC0wIHNuZC1jYXJkLTANCmFsaWFz
IHNvdW5kLXNlcnZpY2UtMC0wIHNuZC1taXhlci1vc3MNCmFsaWFzIHNvdW5k
LXNlcnZpY2UtMC0xIHNuZC1zZXEtb3NzDQphbGlhcyBzb3VuZC1zZXJ2aWNl
LTAtMyBzbmQtcGNtLW9zcw0KYWxpYXMgc291bmQtc2VydmljZS0wLTggc25k
LXNlcS1vc3MNCmFsaWFzIHNvdW5kLXNlcnZpY2UtMC0xMiBzbmQtcGNtLW9z
cw0KIyAgICAgICAgRm9yIFNCIDE2DQphbGlhcyBzb3VuZC1zbG90LTEgc25k
LWNhcmQtMQ0KYWxpYXMgc291bmQtc2VydmljZS0xLTAgc25kLW1peGVyLW9z
cw0KYWxpYXMgc291bmQtc2VydmljZS0xLTMgc25kLXBjbS1vc3MNCmFsaWFz
IHNvdW5kLXNlcnZpY2UtMS0xMiBzbmQtcGNtLW9zcw==
---559023410-851401618-960293866=:7008
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="procmodules.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.GSO.4.10.10006061317461.7008@tanya>
Content-Description: 
Content-Disposition: attachment; filename="procmodules.txt"

c25kLW1peGVyLW9zcyAgICAgICAgICAgMzkyNCAgIDIgKGF1dG9jbGVhbikN
CnNuZC1jYXJkLWVtdTEwazEgICAgICAgIDIxMTIgICAyIChhdXRvY2xlYW4p
DQpzbmQtZW11MTBrMSAgICAgICAgICAgIDE5MzA0ICAgMCAoYXV0b2NsZWFu
KSBbc25kLWNhcmQtZW11MTBrMV0NCnNuZC1wY20gICAgICAgICAgICAgICAg
Mjg5NTIgICAwIChhdXRvY2xlYW4pIFtzbmQtZW11MTBrMV0NCnNuZC10aW1l
ciAgICAgICAgICAgICAgIDc2ODAgICAwIChhdXRvY2xlYW4pIFtzbmQtcGNt
XQ0Kc25kLWFjOTctY29kZWMgICAgICAgICAyMzkwNCAgIDAgKGF1dG9jbGVh
bikgW3NuZC1lbXUxMGsxXQ0Kc25kLW1peGVyICAgICAgICAgICAgICAyMzE1
MiAgIDAgKGF1dG9jbGVhbikgW3NuZC1taXhlci1vc3Mgc25kLWVtdTEwazEg
c25kLWFjOTctY29kZWNdDQpzbmQtZW11eC1tZW0gICAgICAgICAgICAxMzQw
ICAgMCAoYXV0b2NsZWFuKSBbc25kLWVtdTEwazFdDQpzbmQtcmF3bWlkaSAg
ICAgICAgICAgICA5MDgwICAgMCAoYXV0b2NsZWFuKSBbc25kLWVtdTEwazFd
DQpzbmQtc2VxLWRldmljZSAgICAgICAgICAzMTEyICAgMCAoYXV0b2NsZWFu
KSBbc25kLWNhcmQtZW11MTBrMSBzbmQtcmF3bWlkaV0NCnNuZCAgICAgICAg
ICAgICAgICAgICAgMzQ1NjAgICAxIChhdXRvY2xlYW4pIFtzbmQtbWl4ZXIt
b3NzIHNuZC1jYXJkLWVtdTEwazEgc25kLWVtdTEwazEgc25kLXBjbSBzbmQt
dGltZXIgc25kLWFjOTctY29kZWMgc25kLW1peGVyIHNuZC1lbXV4LW1lbSBz
bmQtcmF3bWlkaSBzbmQtc2VxLWRldmljZV0NCm5sc19pc284ODU5LTEgICAg
ICAgICAgIDIwMjAgICA1IChhdXRvY2xlYW4pDQpubHNfY3A0MzcgICAgICAg
ICAgICAgICAzNTQ4ICAgNSAoYXV0b2NsZWFuKQ0Kc291bmQgICAgICAgICAg
ICAgICAgICA1NzE5NiAgIDAgKHVudXNlZCkNCnNvdW5kbG93ICAgICAgICAg
ICAgICAgICAzMDAgICAwIFtzb3VuZF0NCg==
---559023410-851401618-960293866=:7008--
