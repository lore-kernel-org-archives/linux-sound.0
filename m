Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353539;
	b=qF0ZhJaKisy6N2vnkG/V9Go1pZ/rhc5PwemjerRwmVv/yVio/8e6qcOeRYEatnNlKNGl
	 KVnjySe0NLWt9yJlV8h8T5Y0AF52IUOSyIUIRvfd2CXcwAdLjIV6sb/q4yk1BhK511cEE
	 G9zEkZ8Dv0CafYd7rd+gAeqvojjltSRiUQsC/pMBN7WtUBhqmz0NWZscKO8FnF5iwLEQK
	 YT0ZoioUG4frRnAHO5LcdrS1USMoxQtll68OYHGoD+/3Xgpn0V4PbMXz9xpQ9ZeP5W8Kz
	 G0JepS21GCHN8X4caTNF/nN60Tq2RYyYV7FB8+O/IFe//fkeer0tAMfFyVGRNJSEcjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353539;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9n7OHhMwryl0v58d7QKLsEuKx94ItXDQZiR7pWaFO+o=;
	b=SdF1MEe5aSL10xvFKkzylRPfNoDkwZLmcK6wxjjiE6diFIIHQ8oTfFhgCU3hIedd/W1E
	 K1lG5ZSpqVbm555gOZ81cFnKLcIhTNYJv6jBrCybmZDy3OYAHRqBY9/3RcTlTXxHpotT0
	 z4P6SZyNehVFs8OJM49guw5mlDV2mkFuHyEeXpx2B3BC0H+WFj9RmL7+CkmuZQKavxKYx
	 SRhygNoiWvNNo5eJ/Qyk5X4AWBZr8V/mOz26jr2FPev9QCySL5OaunVya+r8wR5Nf3wJM
	 aaVYkaPqziSIWx3Vyg9WJaaUqnAppOCABioYHuh2X7O4wercAkwJPz8ckETWVOMlUlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kert.fi;
	spf=pass smtp.mailfrom=kert.fi;
	dkim=pass header.d=kert.fi header.i=@kert.fi header.a=rsa-sha256 header.s=protonmail3 header.b=NOF1Bhph;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D37606A320
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D37606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kert.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kert.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kert.fi header.i=@kert.fi header.a=rsa-sha256 header.s=protonmail3 header.b=NOF1Bhph
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kert.fi;
	s=protonmail3; t=1793353535; x=1793612735;
	bh=9n7OHhMwryl0v58d7QKLsEuKx94ItXDQZiR7pWaFO+o=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NOF1Bhph1iRWNV2wi51AI0clqNemrPjPjYSH8xFb2MGydXWReNNgyp4G4c5PmuDNr
	 EyYVjqHziJsn2wF7N38u2jIaHqEPEleOHBHaFkB8OytnP1E4M/GXagjFUrwPPwGIcP
	 GN7jY8r8/znRAlMGugeIbR1j+bLTlnmTf0VlCLNNMxjY1ECzhLjELFc25B2Uq24U/A
	 sYM1+xsHwfPidnvmmF8JcHeQHWO3Fgg6xOuF+488Msrles/uKiXEq/k+OBLv/xyktK
	 27//INS9zk1aoSCqaSjba/8VEOjTToZfcmsRVLyRx9JDgFxkfsNEV4eePLNnT+MFcx
	 kUhzzzPeD5Dlg==
Date: Fri, 30 Oct 2026 09:45:30 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: Ile <ile@kert.fi>
Cc: "tiwai@suse.com" <tiwai@suse.com>
Subject: snd-usb-audio: Jieli 2e50:0040 (beyerdynamic MMX 130 wireless dongle) ignores feature unit playback volume
Message-ID: <VAHRtk3a46g7zeZ3Bq-mAopkeaTLPklqHvaG8rdJgdjtGAfUQJD37X8V_a9VJHvfhDDxSnz2v-etlrE20nAvZvF4X8faiTnWbDyCq0sePHg=@kert.fi>
Feedback-ID: 49247821:user:proton
X-Pm-Message-ID: da74dabebd55727706c4511e80908c1163237dee
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

The USB dongle of the beyerdynamic MMX 130 wireless headset (Jieli
Technology 2e50:0040, UAC1, full speed) ignores playback volume set
through its feature unit. Changing 'PCM Playback Volume' has no audible
effect, so userspace (PipeWire) ends up doing all real attenuation in
software.

Kernels: 7.3.0-4-cachyos; also reproduced with the Debian 13 stock
kernel.

Observations:
- 'PCM Playback Volume': 0..147, -28.37 dB to -0.94 dB, 2 channels
=C2=A0 (FU id 2: master mute, per-channel volume).
- Setting the control to 0 and to 147 with amixer while audio plays
=C2=A0 causes no audible change in loudness. The control value itself
=C2=A0 updates (PipeWire follows it).
- No errors in dmesg when setting the control.
- 'Mic Capture Volume' reports the identical dB range, which suggests
=C2=A0 placeholder descriptor values.
- On macOS the same dongle's volume control works: at the minimum
=C2=A0 (Audio MIDI Setup shows -28.38 dB) output is far quieter than on
=C2=A0 Linux with the control at 0.
- The HID interface only carries consumer control and telephony
=C2=A0 reports (no vendor volume reports), so macOS should be using the
=C2=A0 same feature unit.

Practical impact: because attenuation happens only in software, the
headset firmware's gate/expander audibly pumps on quiet content at
normal listening levels. This does not happen on macOS.

Is there a known quirk for Jieli-based devices (e.g. a different
request sequence or channel addressing)? I can provide a usbmon
capture or test patches.

amixer -c 0 contents:
numid=3D3,iface=3DMIXER,name=3D'PCM Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D4,iface=3DMIXER,name=3D'PCM Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D147,step=3D0
  : values=3D0,0
  | dBminmax-min=3D-28.37dB,max=3D-0.94dB
numid=3D5,iface=3DMIXER,name=3D'Mic Capture Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D6,iface=3DMIXER,name=3D'Mic Capture Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D147,step=3D0
  : values=3D147
  | dBminmax-min=3D-28.37dB,max=3D-0.94dB
numid=3D2,iface=3DPCM,name=3D'Capture Channel Map'
  ; type=3DINTEGER,access=3Dr--v-R--,values=3D1,min=3D0,max=3D36,step=3D0
  : values=3D0
  | container
    | chmap-fixed=3DMONO
numid=3D1,iface=3DPCM,name=3D'Playback Channel Map'
  ; type=3DINTEGER,access=3Dr--v-R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D3,4
  | container
    | chmap-fixed=3DFL,FR

lsusb -v -d 2e50:0040:
Bus 001 Device 015: ID 2e50:0040 Jieli Technology Dongle MMX 130 wireless
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x2e50 Jieli Technology
  idProduct          0x0040 Dongle MMX 130 wireless
  bcdDevice            1.00
  iManufacturer           1 Jieli Technology
  iProduct                2 Dongle MMX 130 wireless
  iSerial                 3 4650303435343512
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0114
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0=20
      iFunction               5 Dongle MMX 130 wireless
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0=20
      iInterface              5 Dongle MMX 130 wireless
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x004e
        bInCollection           2
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0=20
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x01
          Mute Control
        bmaControls(1)       0x02
          Volume Control
        bmaControls(2)       0x02
          Volume Control
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID               2
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0000
        iChannelNames           0=20
        iTerminal               0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               4
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0=20
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                 7
        bNrInPins               1
        baSourceID(0)           5
        iSelector               0=20
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          2
        bSourceID               7
        iTerminal               0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0120  1x 288 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0=20
      iInterface              0=20
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           6
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0060  1x 96 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0=20
      iInterface              0=20
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     184
          Report Descriptors:=20
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)


Thanks,
Ile
