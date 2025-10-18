Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4B19E99F
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760780446; cv=none; b=QFkamD7nlomgXfLMWp64Pg/sEDsi8IrSW4PAUgda4PvNTmN1zDhHlF50lh6ifSgJSGJrlv2wGSDBLP5Nr+Y2iRjvtsm9RqoQQzmz7F4FfhODZabS9uhcEEKl55Zqbu9++AtLnV1jXLz3ghKGq+gQaoB3ZYaVNRBN97C+YiorHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760780446; c=relaxed/simple;
	bh=NhmTarYZwaCFNSiytVv2p55tByNLiN2zuG5PHagz5/4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VO/cBmc/WUULc/YS5aCPYFYJr4Pdmwhel970ac/JOCz/GlEyXLOBtwrXBpyDbVaQBSrtcvx3LaTJapSSXeKUHNsGf5HVkALRq3eGR+Y4xWxhxCIgZ8r4bEGp7hKeMNed/W8uWO7r3cMjwjpaBcz+8IIFG92YM2/ktQdX9wWWA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stTMG6F2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=maB8pziA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=stTMG6F2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=maB8pziA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stTMG6F2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="maB8pziA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="stTMG6F2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="maB8pziA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 36B2621D3A;
	Sat, 18 Oct 2025 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760780436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBK7JMRD0d2383yBq2sERQ9Msc0/AK2UIAK6N9AuGLc=;
	b=stTMG6F2GqSwxJExyuT9gYiDNfWmfvEsHAGLAsF++EfwaNmbW/z+faFiV890cFK1c+PST3
	wFe9klBt7qC6c2rw2SXVRWhJP1TqAB59comgTGVgX2RFsGZ3Ajn/3ucOHMo/28+nzCCl01
	K9JSUmTx9sFzIo4VmNrVFJk5nfX4Tc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760780436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBK7JMRD0d2383yBq2sERQ9Msc0/AK2UIAK6N9AuGLc=;
	b=maB8pziAjrgyOIy6qYzjGUHPpOeTj6nCTlkQQrwxOdUNeaMYLloQGFXeSVQHKIQk/oGM6N
	o692x0V+9kEQ+NDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760780436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBK7JMRD0d2383yBq2sERQ9Msc0/AK2UIAK6N9AuGLc=;
	b=stTMG6F2GqSwxJExyuT9gYiDNfWmfvEsHAGLAsF++EfwaNmbW/z+faFiV890cFK1c+PST3
	wFe9klBt7qC6c2rw2SXVRWhJP1TqAB59comgTGVgX2RFsGZ3Ajn/3ucOHMo/28+nzCCl01
	K9JSUmTx9sFzIo4VmNrVFJk5nfX4Tc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760780436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBK7JMRD0d2383yBq2sERQ9Msc0/AK2UIAK6N9AuGLc=;
	b=maB8pziAjrgyOIy6qYzjGUHPpOeTj6nCTlkQQrwxOdUNeaMYLloQGFXeSVQHKIQk/oGM6N
	o692x0V+9kEQ+NDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B962139D8;
	Sat, 18 Oct 2025 09:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UDUoAZRg82gbFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Oct 2025 09:40:36 +0000
Date: Sat, 18 Oct 2025 11:40:35 +0200
Message-ID: <87wm4s4kfg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: J-Donald Tournier <jdtournier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: Quirk for Lenovo Yoga 7 2-in-1 14AKP10
In-Reply-To: <CAHgym8JMLODPYnutyKCZg3p=s=LKE7d3vd+bkbzycCW8C76SPQ@mail.gmail.com>
References: <CAHgym8K8xZkoOxtjK2cVJDqSkNjgDobLusAWqNX3yaX7MwU3FA@mail.gmail.com>
	<CAHgym8JMLODPYnutyKCZg3p=s=LKE7d3vd+bkbzycCW8C76SPQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Sat, 18 Oct 2025 11:16:50 +0200,
J-Donald Tournier wrote:
> 
> Hi,
> 
> On my Lenovo Yoga 7 2-in-1 14AKP10, the volume control only affects
> the tweeters, leaving the bass speakers at full volume (until the
> volume hits zero). This seems to be an ALC287, and I can fix this by
> adding this to my /etc/modprobe.d/sound.conf:
> 
> options snd_hda_intel model=(null),alc287-yoga9-bass-spk-pin
> 
> This is on the latest Arch kernel (6.17.2-arch1-1), but also happens
> on a fresh 6.18-rc1 build. Looking at the device ID (0x17aa, 0x38b5),
> I can see there is already a quirk listed for this device in
> sound/hda/codecs/realtek/alc269.c, though it references a different
> device with a different quirk:
> 
> SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> 
> I can apply a more permanent fix with this diff, which replaces that
> line with one that applies the relevant quirk for my device:
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index 214eb9df6ef8..45d2865b2c9c 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7078,7 +7078,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P",
> ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
>         SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P",
> ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
>         SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> -       SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> +       SND_PCI_QUIRK(0x17aa, 0x38b5, "Lenovo Yoga 7 2-in-1 14AKP10",
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
>         SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>         SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>         SND_PCI_QUIRK(0x17aa, 0x38b8, "Yoga S780-14.5 proX AMD YC
> Dual", ALC287_FIXUP_TAS2781_I2C),
> 
> But since that involves overriding another quirk, I expect that is not
> the best way to go about fixing this properly... There must be a
> better way to do this, but this is probably as far as I can take this
> on my own.
> 
> I've included some hopefully relevant outputs below. Let me know if I
> can provide any further information, or you would like me to test
> anything else.

Try to put the entry
  HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN)
just before the existing SND_PCI_QUIRK(0x17aa, 0x38b5, ...)
This will match with your device via the codec SSID instead of PCI
SSID, so it's taken before the PCI SSID matching.


thanks,

Takashi

> 
> Thanks!
> Donald.
> 
> 
> 
> # lspci -vv
> 
> 04:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family
> 17h/19h/1ah HD Audio Controller
>         Subsystem: Lenovo Device 38b5
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin B routed to IRQ 111
>         IOMMU group: 21
>         Region 0: Memory at 805c0000 (32-bit, non-prefetchable) [size=32K]
>         Capabilities: [48] Vendor Specific Information: Len=08 <?>
>         Capabilities: [50] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
> <4us, L1 unlimited
>                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
> FLReset- SlotPowerLimit 0W TEE-IO-
>                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
> AuxPwr- TransPend-
>                 LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1,
> Exit Latency L0s <64ns, L1 <1us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> FltModeDis-
>                 LnkSta: Speed 16GT/s, Width x16
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
> NROPrPrP- LTR-
>                          10BitTagComp+ 10BitTagReq- OBFF Not
> Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>                          EmergencyPowerReduction Not Supported,
> EmergencyPowerReductionInit-
>                          FRS- TPHComp- ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                          AtomicOpsCtl: ReqEn-
>                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkSta2: Current De-emphasis Level: -3.5dB,
> EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3-
> LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>                 Address: 00000000fee00000  Data: 0000
>         Capabilities: [100 v1] Vendor Specific Information: ID=0001
> Rev=1 Len=010 <?>
>         Capabilities: [2a0 v1] Access Control Services
>                 ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir-
> UpstreamFwd- EgressCtrl- DirectTrans-
>                 ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
> UpstreamFwd- EgressCtrl- DirectTrans-
>         Kernel driver in use: snd_hda_intel
>         Kernel modules: snd_hda_intel
> 
> 
> 
> 
> # cat /proc/asound/card1/codec#0
> 
> Codec: Realtek ALC287
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0287
> Subsystem Id: 0x17aa391c
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
> Default Amp-In caps: N/A
> Default Amp-Out caps: N/A
> State of AFG node 0x01:
>   Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
>   Power: setting=D0, actual=D0
> GPIO: io=5, o=0, i=0, unsolicited=1, wake=0
>   IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[3]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
>   IO[4]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
> Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Speaker Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x51 0x51]
>   Converter: stream=0, channel=0
>   PCM:
>     rates [0x40]: 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
>   Control: name="Headphone Playback Volume", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Device: name="ALC287 Analog", type="Audio", device=0
>   Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
>   Amp-Out vals:  [0x57 0x57]
>   Converter: stream=0, channel=0
>   PCM:
>     rates [0x40]: 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x06 [Audio Output] wcaps 0x411: Stereo
>   Converter: stream=0, channel=0
>   PCM:
>     rates [0x40]: 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x40]: 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x24
> Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Control: name="Capture Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Control: name="Capture Switch", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Device: name="ALC287 Analog", type="Audio", device=0
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x3f 0x3f]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x23
> Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x560]: 44100 48000 96000 192000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x22
> Node 0x0a [Audio Input] wcaps 0x10051b: Stereo Amp-In
>   Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
>   Amp-In vals:  [0x97 0x97]
>   Converter: stream=0, channel=0
>   SDI-Select: 0
>   PCM:
>     rates [0x40]: 48000
>     bits [0xe]: 16 20 24
>     formats [0x1]: PCM
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x25
> Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x40000000: [N/A] Line Out at Ext N/A
>     Conn = Unknown, Color = Unknown
>     DefAssociation = 0x0, Sequence = 0x0
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000020: IN
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00:
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Speaker Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x00 0x00]
>   Pincap 0x00010014: OUT EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x90170120: [Fixed] Speaker at Int N/A
>     Conn = Analog, Color = Unknown
>     DefAssociation = 0x2, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x02
> Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Bass Speaker Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x00 0x00]
>   Pincap 0x0000001c: OUT HP Detect
>   Pin Default 0x90170110: [Fixed] Speaker at Int N/A
>     Conn = Analog, Color = Unknown
>     DefAssociation = 0x1, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 4
>      0x02* 0x03 0x06 0x08
>   In-driver Connection: 2
>      0x02 0x03
> Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00000024: IN Detect
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00:
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Control: name="Mic Boost Volume", index=0, device=0
>     ControlAmp: chs=3, dir=In, idx=0, ofs=0
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x03 0x03]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x03a11040: [Jack] Mic at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x4, Sequence = 0x0
>   Pin-ctls: 0x24: IN VREF_80
>   Unsolicited: tag=02, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Pincap 0x00003724: IN Detect
>     Vref caps: HIZ 50 GRD 80 100
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00: VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
>   Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
>   Amp-In vals:  [0x00 0x00]
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x00013734: IN OUT EAPD Detect
>     Vref caps: HIZ 50 GRD 80 100
>   EAPD 0x2: EAPD
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x00: VREF_HIZ
>   Unsolicited: tag=00, enabled=0
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02* 0x03
> Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x1d [Pin Complex] wcaps 0x400400: Mono
>   Pincap 0x00000020: IN
>   Pin Default 0x4057392d: [N/A] Digital Out at Ext N/A
>     Conn = Analog, Color = Blue
>     DefAssociation = 0x2, Sequence = 0xd
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x20: IN
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
> Node 0x1e [Pin Complex] wcaps 0x400501: Stereo
>   Pincap 0x00000010: OUT
>   Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
>     Conn = 1/8, Color = Black
>     DefAssociation = 0xf, Sequence = 0x0
>     Misc = NO_PRESENCE
>   Pin-ctls: 0x40: OUT
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 1
>      0x06
> Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
> Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
>   Processing caps: benign=0, ncoeff=142
> Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
>   Control: name="Headphone Playback Switch", index=0, device=0
>     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>   Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-Out vals:  [0x80 0x80]
>   Pincap 0x0001001c: OUT HP EAPD Detect
>   EAPD 0x2: EAPD
>   Pin Default 0x03211030: [Jack] HP Out at Ext Left
>     Conn = 1/8, Color = Black
>     DefAssociation = 0x3, Sequence = 0x0
>   Pin-ctls: 0xc0: OUT HP
>   Unsolicited: tag=01, enabled=1
>   Power states:  D0 D1 D2 D3 EPSS
>   Power: setting=D0, actual=D0
>   Connection: 2
>      0x02 0x03*
> Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 5
>      0x19 0x1a 0x1b 0x1d 0x13
> Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
>   Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
>   Amp-In vals:  [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
>   Connection: 5
>      0x19 0x1a 0x1b 0x1d 0x12
> Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
>   Connection: 3
>      0x12* 0x13 0x18
> Node 0x25 [Audio Selector] wcaps 0x300101: Stereo
>   Connection: 2
>      0x12* 0x13
> 
