From: Richard V Robinson <robinson@goAmcan.com>
Date: Sun, 03 Feb 2002 20:22:49 +0000
Subject: Re: Driver for Philips Acoustic Edge (PSC 706)
Message-Id: <marc-linux-sound-101276765620830@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101207524703621@msgid-missing>
In-Reply-To: <marc-linux-sound-101207524703621@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

  Thanks for your response Zwane.  I did as comprehensive a lspci as I 
could do and got the following results.  If you can direct me to a 
working driver commercial or otherwise I'd be much obliged.

-richard r

# lspci -vv -xxx -s 02:0b
02:0b.0 Multimedia audio controller: VLSI Technology Inc: Unknown device 
0307 (rev 06)
        Subsystem: VLSI Technology Inc: Unknown device 8051
        Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B-
        Status: Cap+ 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
        Latency: 32 (2250ns min, 10000ns max)
        Interrupt: pin A routed to IRQ 11
        Region 0: I/O ports at d000 [disabled] [size8]
        Region 1: I/O ports at b800 [disabled] [size]
        Region 2: I/O ports at b400 [disabled] [size=4]
        Region 3: I/O ports at b000 [disabled] [size=8]
        Region 4: I/O ports at a800 [disabled] [sized]
        Capabilities: [d0] Power Management version 2
                Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
00: 04 10 07 03 04 00 90 02 06 00 01 04 00 20 80 00
10: 01 d0 00 00 01 b8 00 00 01 b4 00 00 01 b0 00 00
20: 01 a8 00 00 00 00 00 00 00 00 00 00 04 10 51 80
30: 00 00 00 00 d0 00 00 00 00 00 00 00 ff 01 09 28
40: 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 02 00 00 03 00 00 00
60: 04 00 00 00 00 00 00 00 40 20 00 00 00 00 00 00
70: 02 00 00 00 00 00 00 00 15 00 00 00 d3 00 00 00
80: 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 01 00 22 06 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: f4 f4 f4 f4 53 53 53 53 00 00 00 00 00 00 00 00
 
02:0b.1 Input device controller: VLSI Technology Inc: Unknown device 0308
        Subsystem: VLSI Technology Inc: Unknown device 0308
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B-
        Status: Cap+ 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
        Region 0: I/O ports at a400 [disabled] [size=8]
        Capabilities: [d0] Power Management version 2
                Flags: PMEClk- DSI+ D1+ D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
00: 04 10 08 03 00 00 90 02 00 00 80 09 00 00 00 00
10: 01 a4 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 04 10 08 03
30: 00 00 00 00 d0 00 00 00 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 01 00 22 02 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

==================================

Zwane Mwaikambo wrote:

>On Sat, 26 Jan 2002, Richard V Robinson wrote:
>
>>Hi.  Can anyone tell me if there exists a linux driver for the Philips 
>>Acoustic Edge (PSC 706) sound card?  Or if someone is working on one?
>>
>
>Could you please supply a lspci of the sound card.
>
>>If not, I'm a fairly resourceful and clever programmer.  And I have the 
>>card in question.  How does one get started creating drivers for 
>>hardware like this?
>>
>
>You can start of by finding out the chip on the sound card and getting the 
>datasheets for it. If the chip supports or is supported by some current 
>drivers, you could make the appropriate additions to the supported cards 
>in the particular modules (add Vendor/PCI IDs) and see if it works. 
>Otherwise you could start work on a new driver :) It might be an idea to 
>read through a couple of drivers and see how they do things. For 
>additional help regarding kernel hacking in general, check out 
>www.kernelnewbies.org and the mailling list is at 
>kernelnewbies@nl.linux.org
>
>Good luck, and happy hacking :)
>
>Regards,
>	Zwane Mwaikambo
>
>


