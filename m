Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860D2F60CC
	for <linux-sound@vger.kernel.org>; Sat,  4 Apr 2026 06:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775285404; cv=pass; b=tCQXkvumxQEoPWtuP2Ae0byvxwpnb85/HxN6FYmOy7YJIrMYw9iYsHn3dEvXcsEO014auMyEF/yP+uybleGLdAtK2PenYmPWNy5J9quoj27ArzY0/hMtpZN50b+b9O6loLbRbxm2dz6rGcUZTtgaO0HMeE60D/tnNEEi2PoPvtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775285404; c=relaxed/simple;
	bh=y6MYCWkWFnRcjtISiTYOBbrX4AJjtpo9UelY7TTiW+w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qjQCy9XUMlrNcqCj5amZEn1Awxbg2hFXjtTbNaeCiDI7PIk/oPtyaTYLHh9y6EwmK1Y/PRBY93aQckGruOabUXrv7Km1D6fft7BbYxwaYCAA5jGUgi1VFzzcjKeX2/MmwdmjyGl+khOecNSomwCq93pBxAcjcheydcri0HfKYbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDd0KNkG; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDd0KNkG"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so3231738a12.3
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 23:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775285401; cv=none;
        d=google.com; s=arc-20240605;
        b=DbiUrFiPwhNOjeMsfEzhRHkjo8M2Ikb9bf0oZ4QQMASA4C2PHqEBvY3csvoHQz2CzB
         htxreXtUiep9/I67vMX8n6TYw2yKz5/haLUWKSzE7e4iJdLotTvsD54SvJfjt8Lve3mB
         tsMDwWdllzmjkDJZaa7Lu0IkuU7QhL1iNtDMtsqT6kVj11r2rTzfJonetMYFT9KNr6li
         DC8wNUnCRCRbx5jJLL6L1X607XAn65fMIgEwGlJCSXsIqoKGyj+aDTsGpK8kluHKsLm9
         f6GIKDSBvI9h2hfbOMJ8DO8hg/pKm/vIc/jsYsgSoFBd3hE8Ea1GU0Zpwf1ulLEuWqCr
         8Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9T2whuDZUYePuZYGEoBmQiC8Q95SqE+pdrKEsABYvtE=;
        fh=oRoccz0oVvJhemgmWN+IP2Bi1QJUdh52KSJ0uqPpbZw=;
        b=J+GTJH9N6OQcSFT6AdFlbpBU/E0FrjD2MniMdSaAH+AyOww3tgoMzBjPxqHPqWxScf
         k/ukqqeGpkSL+oFR2SRVcgs/A+su/6iCfLaNM/KXFGI66CNdwy1oWEY2IhY9Xh7FXazE
         VKRO5kOzVjfpB6Dp5UIFEML2i5+AUInnahMhs6Nh7fTneRPSv4Xp+1eZGx9Mdv7lTke5
         lN9nLKWeG+KbpwCY1nkOWZGc4DYJSKfqd0zIK1we5KmvRLO5vJzYXqcrRcIXvHQcGzTz
         uhhZ//kREg/Wlwoer8kaCABtFkEVBRlCsdZ40mcDjNuWxfr8cxZ1PYu3rrb+GcPG0Ksj
         Y/zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775285401; x=1775890201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9T2whuDZUYePuZYGEoBmQiC8Q95SqE+pdrKEsABYvtE=;
        b=qDd0KNkG9xjS94iDojxQTNaJrmZknUGijG12TUya15evf2C2sWuhvwkffdarBBAPNo
         IuGSBTRa/UEf3gN5IGaahPP/5/a4v7tRkIx1P1B6NXf65ZVN632/CpR8XnO7IAtYeiTw
         8KNwD1uR1ncbRFGnlLLiOIYSecbZ3bFZzLMAbl5ZDLClKkapFyVhsQMeQVIiswambDEy
         a2z5GfAXK5xF1/xmVFY5uGSNy4+m6Hc7B1Bgrd/JM6JydJNODf++YJ18yjsFDpbr60cy
         th5gWxqA95+ZATDcxx71xUv+MnPpbk/l+OHgdNI5mfZy3RnQPPLANgt1BvXQLz4J8XxR
         Iigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775285401; x=1775890201;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9T2whuDZUYePuZYGEoBmQiC8Q95SqE+pdrKEsABYvtE=;
        b=aQJV3VIsz2i2QevVUT1f0n+ygg6zSr98g6fADCLStA92JkVRXFR3g3Ms9wG5JlT0fX
         jPeKsiX17u0wsfZqnPfgvRfA6IHn6Z44TI8GX9GKlQJI/UIuEJls/wgy8JUdFY/ZZPP6
         VAL8lHlfEbKky1lHccBEzvjtLQrELsrt+IU+s/F/dPX0+81P8O0cIWFo2eW8aK67fOgt
         gBJ86x5VzjSvujCYkS1cwM9ANGxKShruR2q/SarfEbWKsTKToisdbwzP6UF+PF7x5Oo+
         37gs7XtFrK/LekLTPLDN7lE4ihPjHUR6ngx28f+LSu9+GM9sNnGMaq2TW3lIvs/OE00Z
         eP6w==
X-Gm-Message-State: AOJu0YzVrmZHQ91fWnTZ3scr92bOPQY0Dra+rL8M43yBXxzyt2w2Wdzc
	JHgRBSFDFUyrD2BTRuIdF/Txd0KXH4HYusuRF1ifMGzKRZfAHeKQdlmN//7+y9gvVMmIPRTGYGQ
	f4iQDi+kfoWoc25LRJ/XDLb5e5flksNsDwfwo
X-Gm-Gg: AeBDieurRhecoLiBFYh4OG3n4R1FsF135pBv4osjfmjrBg4845j9BbsZQKiJ/oTL/q3
	ciw4zCCQ7n+QNrTQD+0VOnbHLeOn9MxhpQl5zilCvPHcSeegiv7oYWquqJl+kGsaxvoDohjm3VB
	oWm7OolzX1dK9DhGZSfFY8CKTod29e94PGvYT64D8otaQbmtNoFqL+HgE/GeCshSEL3Qc0e1DHQ
	srV/hJLtCC5U90EjdPb61AaLYrrDlAGJvrry5+yaSBZsqMQjLwCcgXQ1NG3pYAB5nSJ02RM5Fsl
	SBeE1eQ=
X-Received: by 2002:a05:6402:34c3:b0:66e:44e:3103 with SMTP id
 4fb4d7f45d1cf-66e3f3dc018mr2792705a12.9.1775285401031; Fri, 03 Apr 2026
 23:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: wbw <wbw2494@gmail.com>
Date: Sat, 4 Apr 2026 15:49:49 +0900
X-Gm-Features: AQROBzArxwpCE7g6hYscMceE_k0sMDGoB0FDi6QPT4FAbji2i_CpOtjWuItniuA
Message-ID: <CAM6MnuXSY+KqzFuLhMkxYhN6DCg3jdJw2p+wwRVXyzBF-FUKTw@mail.gmail.com>
Subject: [BUG] ALC274 codec apparently suspends itself, causing lags
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I encountered problems with Realtek codecs.

Hardware:
MECHREVO (aka. TONGFANG) CANGLONG Series-X6xR55xY

Kernel:
6.18.9+deb13-amd64 (debian 13 'trixie')

Problem:
The speaker works, but has lags. The first one second of an audio is silenced.

Steps to reproduce:
- boot the machine.
- play some audio (with aplay,mpv,firefox,etc.)
- pause for about 3 seconds and resume (or if audio contains silence
of similar length)

Expected behaviour:
Audio plays normally.

Actual behaviour:
Audio is lagged. About one second of audio after resuming is silenced.
(For example, "Hello, How are you? (silence) I'm fine."
would play as "Hello, How are you? (silence) fine.", dropping the "I'm")


dmesg:
[    1.885308] snd_hda_codec_alc269 hdaudioC2D0: ALC274: picked fixup
for PCI SSID 1d05:3019
[    1.886016] snd_hda_codec_alc269 hdaudioC2D0: autoconfig for
ALC274: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    1.886030] snd_hda_codec_alc269 hdaudioC2D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    1.886037] snd_hda_codec_alc269 hdaudioC2D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[    1.886045] snd_hda_codec_alc269 hdaudioC2D0:    mono: mono_out=0x0
[    1.886051] snd_hda_codec_alc269 hdaudioC2D0:    inputs:
[    1.886057] snd_hda_codec_alc269 hdaudioC2D0:      Internal Mic=0x12
[    1.886063] snd_hda_codec_alc269 hdaudioC2D0:      Headset Mic=0x19

lshw output:
*-multimedia:2
                description: Audio device
                product: Family 17h/19h/1ah HD Audio Controller
                vendor: Advanced Micro Devices, Inc. [AMD]
                physical id: 0.6
                bus info: pci@0000:05:00.6
                logical name: card2
                logical name: /dev/snd/controlC2
                logical name: /dev/snd/hwC2D0
                logical name: /dev/snd/pcmC2D0c
                logical name: /dev/snd/pcmC2D0p
                version: 00
                width: 32 bits
                clock: 33MHz
                capabilities: pm pciexpress msi bus_master cap_list
                configuration: driver=snd_hda_intel latency=0
                resources: irq:95 memory:fc5c0000-fc5c7fff

lspci -vv output:

05:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family
17h/19h/1ah HD Audio Controller
DeviceName: Realtek ALC245
Subsystem: AIstone Global Limited Device 3019
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin C routed to IRQ 95
IOMMU group: 23
Region 0: Memory at fc5c0000 (32-bit, non-prefetchable) [size=32K]
Capabilities: [48] Vendor Specific Information: Len=08 <?>
Capabilities: [50] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
MaxPayload 256 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency
L0s <64ns, L1 <1us
ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 16GT/s, Width x16
TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+,
MaxEETLPPrefixes 1
EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
FRS- TPHComp- ExtTPHComp-
AtomicOpsCap: 32bit- 64bit- 128bitCAS-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
AtomicOpsCtl: ReqEn-
IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-
EqualizationPhase1-
EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
Retimer- 2Retimers- CrosslinkRes: unsupported
Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee00000  Data: 0000
Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
Capabilities: [2a0 v1] Access Control Services
ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd-
EgressCtrl- DirectTrans-
ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd-
EgressCtrl- DirectTrans-
Kernel driver in use: snd_hda_intel
Kernel modules: snd_hda_intel

attempted fixes (doesn't seem to work):
tweaking pipewire, such as session.suspend-timeout-seconds
setting snd_hda_intel power_save=0 or power_save_controller=N
tweaking sysfs such as /sys/devices/pci0000:00/0000:00:08.1/0000:05:00.6/power/

Working workaround:
`ffplay -loglevel 16 -nodisp -volume 10 -loop -1
/usr/share/sounds/alsa/Noise.wav`
This works by playing a near-silent noise in background.

However, I do notice setting snd_hda_intel power_save=1 fixes the
issue with one-off audio playing (such as `aplay
/usr/share/sounds/alsa/Front_Center.wav`)

It seems the device suspends itself in about 1.5 sec of no sound
played (even if the output stream should still be open), and the
driver does not correctly register the auto-suspend.

For one-off audio the suspend is enforced by software (snd_hda_intel
power_save), but for continuous audio (such as youtube), the driver
does not suspend the device, causing the problem to persist. However,
The driver correctly suspends after about 7 seconds)

setting snd_hda_intel power_save=0 makes it worse because software
does not register suspend at all.

Also, on Windows (booted from installation on an external disk) this
is also a problem, but can be fixed by installing a Realtek driver.

Thanks.
