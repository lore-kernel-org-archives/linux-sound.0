From: Sebastian Reichelt <SebastianR@gmx.de>
Date: Tue, 22 Nov 2005 00:14:37 +0000
Subject: Intel HDA/AD1986A without surround
Message-Id: <20051122011437.2eb8d7c9.SebastianR@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Tue__22_Nov_2005_01_14_37_+0100_Yn.ikSHFBOB9G6+D"
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Tue__22_Nov_2005_01_14_37_+0100_Yn.ikSHFBOB9G6+D
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit

Hello!

It seems the AD1986A patch (file sound/pci/hda/patch_analog.c) does not 
provide the AD1986A_SURR_DAC and AD1986A_CLFE_DAC channels on my 
laptop, where /proc/asound/Intel/codec#0 gives the following info:
Codec: Analog Devices AD1986A
Address: 0
Vendor Id: 0x11d41986
Subsystem Id: 0x0
Revision Id: 0x100400

Playing sound usually fails completely (in 2.6.12 up to 2.6.14 kernels) 
but works with the attached patch, which simply disables the two 
surround channels. This has been tested by at least three persons 
around the net who own the "Amilo Pro V2040" laptop.

Of course, this patch can not be included in the kernel as-is. I guess 
there are basically two options:
* turn support for the two extra channels into a config and module 
option, or
* somehow detect whether a given patch supports them.
The second option is probably the better, but unfortunately I don't 
know how to detect it. (Maybe the numbers above help?) In my opinion at 
least stereo sound should work out of the box, but surround sound does 
not necessarily have to. If you need more information on this, please 
tell me (cc please; I'm not subscribed).

Thank you.

P.S.: This is the relevant entry given by lspci -vvv:
0000:00:1b.0 0403: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 
Family) High Definition Audio Controller (rev 04)
        Subsystem: Wistron Corp.: Unknown device 2017
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
        Latency: 0, Cache Line Size: 0x08 (32 bytes)
        Interrupt: pin A routed to IRQ 22
        Region 0: Memory at b0000000 (64-bit, non-prefetchable) 
[size=16K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0
+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [60] Message Signalled Interrupts: 64bit+ 
Queue=0/0 Enable-
                Address: 0000000000000000  Data: 0000
        Capabilities: [70] #10 [0091]

-- 
Sebastian Reichelt

--Multipart=_Tue__22_Nov_2005_01_14_37_+0100_Yn.ikSHFBOB9G6+D
Content-Type: text/plain;
 name="hda_codec.diff"
Content-Disposition: attachment;
 filename="hda_codec.diff"
Content-Transfer-Encoding: 7bit

--- sound/pci/hda/hda_codec.c.old	2005-11-17 07:08:51.000000000 +0100
+++ sound/pci/hda/hda_codec.c	2005-11-17 07:21:05.000000000 +0100
@@ -1704,15 +1704,6 @@
 	if (mout->hp_nid)
 		/* headphone out will just decode front left/right (stereo) */
 		snd_hda_codec_setup_stream(codec, mout->hp_nid, stream_tag, 0, format);
-	/* surrounds */
-	for (i = 1; i < mout->num_dacs; i++) {
-		if (chs >= (i + 1) * 2) /* independent out */
-			snd_hda_codec_setup_stream(codec, nids[i], stream_tag, i * 2,
-						   format);
-		else /* copy front */
-			snd_hda_codec_setup_stream(codec, nids[i], stream_tag, 0,
-						   format);
-	}
 	return 0;
 }
 
@@ -1724,10 +1715,9 @@
 	hda_nid_t *nids = mout->dac_nids;
 	int i;
 
-	for (i = 0; i < mout->num_dacs; i++)
-		snd_hda_codec_setup_stream(codec, nids[i], 0, 0, 0);
 	if (mout->hp_nid)
 		snd_hda_codec_setup_stream(codec, mout->hp_nid, 0, 0, 0);
+	snd_hda_codec_setup_stream(codec, nids[HDA_FRONT], 0, 0, 0);
 	down(&codec->spdif_mutex);
 	if (mout->dig_out_nid && mout->dig_out_used == HDA_DIG_ANALOG_DUP) {
 		snd_hda_codec_setup_stream(codec, mout->dig_out_nid, 0, 0, 0);

--Multipart=_Tue__22_Nov_2005_01_14_37_+0100_Yn.ikSHFBOB9G6+D--
