Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80C2D0C64
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780205132; cv=pass; b=QldnHZ50Glq8D6kUzyVjT06AZSvVckxUrdKk+uqGHJVrfiI0f1G4ujfxs1dcmLhG3elGcyt1oEPwromA7poDtwqVM+EkBvhZcFBf7i3ZqOYnbf9VqloE3GtbVVg3k2pX0QkSUQiMXsdIkmxAvS9hZI9AqM+lZUbXDubwl+bIsAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780205132; c=relaxed/simple;
	bh=Y4espx5U3bdCL4fedilzWt6u1AljLe1FZcRfL9vRULY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJuN0l5tQR91CL+svHGYipbzRKGqA4Em4rNq7K7xxmMiuaiew6ihofTVhOFM5yBYwJNgC5HLkf6vFuGCrUj5XB4th6G7bxFIm8RO80zcZhghAJHeQ3dAknWLLfySM0fN6+hj34r73zZU+uY2XiakpAQqBPzwBww0Cr8gWH4TSX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEuh6B2k; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEuh6B2k"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-914bbfc2464so706542885a.1
        for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 22:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780205130; cv=none;
        d=google.com; s=arc-20240605;
        b=a7/AkR6C7wdWb7i6XYEPeF7rQ6UYHk73IyC8t9EAV5BaV37bzun/UKk0FgZ+ymAKBU
         BQRaqZQZlcMzMq/9Kv01wEYiXhQ9hMV1+Oz3uvjqTUBaWgFV4xuEZbBZyODmjEkLSyH1
         UvtTxq0ABTaEuBPRm2U5OOKQa2S8hz8h5OCm2KN9rKI3WXMYPVKLnyuvN8ATeQcf2jQm
         oq96gn/btqmcBWEhp/4FUpwnUATDsYv5LQPsV0uM0hZ+xtFdr/gulV4/IgQjRLZuodrm
         JthIrjXXwwuLxiqjVg29SdmH6uTy+ecb9zxZFl6Ynz+ZaJRcJaURqUKW3QvXwTzC++yF
         wKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hjIwfhgsjk7AaRwSWVw1F4oudFIRGZdx1WiISKYONKE=;
        fh=IylYMErpOMw/aPWeZs6ZTNmcMTNKQWXH5n/OxdE8O6w=;
        b=jlc3Kq6eiqXlEmjvg9YKfh0vSGOqMZ5ZgN6Ayo/wg331OIESPBTnU7KYMmYxV2QB60
         g4adLKDKLGtE5MRexMbTCltgs956OcllzzVx70qTPy15rLWPKGHNNDCZNcqi1BZXdtJa
         +fc6PqvWgm+QwhObCVSqGL4y7Ys8qZKtT4QbgBcowO6prHaUy3eZVjuD8QuwPyX8ctPa
         vHqARV+baDzpJ1olAMBR0T7qYyiNeqOiH7N0Qs+fAZ41hglF9pshYTb3SUYN+y9ywZk0
         ZADZUhZEDEqdqTmcYAwTB6105wbmF7cMPjWsC7l6gEWB/zhTQ7+jg63OcgJp8QNMzDP6
         9Few==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780205130; x=1780809930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hjIwfhgsjk7AaRwSWVw1F4oudFIRGZdx1WiISKYONKE=;
        b=WEuh6B2kMvGgQ8p7jPS4jLZTnEaw4eNfb5Jdz13TCYAZIBXUrreHrQ0N1A0SWiWaQv
         9eCXNayN9wWyPqe+9PaPLykeaW7KlWIhAqMxgUmyoCaRGOsIRQTF5BPYE564LctAF6oh
         jGQDOuLZalVZzw72Qbgumnb/hxSHB1QrXtAm4Dxf0D3Ez3pJwFM9xFofSJ3oBKTPDIiF
         J1cdZcR+u2v2cLyjt+Y4F+1DrACleviw80ze3s5yHpyhkaRAo0u/JeNaZZjUfniBWpZC
         VHIQfZtkn7x6JYUf4JFYpgjyIhN/yFeWFOeYIOUnC2oKJm/jpEP3B8lSgb8GxJUku/At
         9xkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780205130; x=1780809930;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjIwfhgsjk7AaRwSWVw1F4oudFIRGZdx1WiISKYONKE=;
        b=XsQp6rViKLhEoCnyQv5wMIWVMN0/lTo5gdejuLl6ytVkvMQ3xhqU92FJlk3q8LmDxI
         MjnAzIv5zisC+ZPqFQeBu+y8z85qfSjwUkcJvmD5aAijfYPm8turycK6KN/D/fD1vUZW
         Ba5Y7wMh9k7BAdYzgmQgZyuQtZCpMvfAD3C1J0A3e9Sf9sDgh6MkYyq8rzDBgeLkJi6x
         gM50x8MlkHPkEAdvi3JufCw9/fDjeo9LL7CLeG8c7dntgOkbx0aVq8WYTPS4T1QaIows
         LAmI8fgECHYmirOzur2eR7tnUwnNUPeuvfoKbwNXx7yKsXmnlpMc7B+gZtI4F5g8Fm3E
         EgOA==
X-Gm-Message-State: AOJu0Yx12hTzAtqHeqXp/6xGAeMmBy/KBe15O/2o4P5EnBoIILwx1VmI
	4S8xvk/yX2ZDlXRv8A1s4BVJ+WVzoUeK+uE524E6ImAAI/H7FyH8FMUrSJw6u8ZJfkRAF8xrqZ1
	4yPv/Nm+AFJ7IeOJLrCW5MA88jYU5sGE+zNM8
X-Gm-Gg: Acq92OFT+cLEBf7eW8r3Dq4axFGYUbYGA2XjFQaPGMWFe8CUBmYAUpQpKZMRtKBQ/VH
	rP8Kn3hNlfUCqQjyXe1HuDZcQrn1LE/wS6uesRA+YnjMNlv0ZL7952+t7b4dAbQW7VxShfVLpKt
	Ux6tLeBcMCWk5zY4RMUESpy/CQPnvpnqGxFlmb+eCJLwzpkq8baU/onmOacaWdPT0xpholA9FXA
	BroUxSWKbtGjkN/RNw5t0/plw+I/iC7RTMka/TpqZ7voNQK8kxpnaUmK4YzW5DyiLvi2COlj45Y
	wkbkRij7Wd0nGfFkL6CSLSAbaC8e0e7BGcls9peFKu2DaJR8Vg==
X-Received: by 2002:a05:620a:371b:b0:915:3d27:a816 with SMTP id
 af79cd13be357-9153da3ce1fmr921619485a.49.1780205128988; Sat, 30 May 2026
 22:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: kathiravan <kathiravanbtm@gmail.com>
Date: Sun, 31 May 2026 10:55:17 +0530
X-Gm-Features: AVHnY4Ltatjf4Nxbvpo08XdNaNQCwk0c7tUFURHsuZ1mHNYaiD5IUG74aBt_B38
Message-ID: <CAAP00YMg1xfPhTERsaVYKaktiz3txF2qFRKL2is5HzRMMB8FYg@mail.gmail.com>
Subject: [ALSA] HONOR MagicBook X16 (ALC256, 1ee7:2038) SOF exposes headset
 microphone only after ALC2XX_FIXUP_HEADSET_MIC
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz
Content-Type: multipart/mixed; boundary="000000000000579fd40653164e48"

--000000000000579fd40653164e48
Content-Type: multipart/alternative; boundary="000000000000579fd30653164e46"

--000000000000579fd30653164e46
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report findings from investigating audio support on a HONOR
MagicBook X16 laptop, and to suggest that ALC2XX_FIXUP_HEADSET_MIC be
confirmed as required for subsystem 1ee7:2038.

---
Hardware
---

  Laptop:           HONOR MagicBook X16
  Platform:         Intel Alder Lake
  Audio codec:      Realtek ALC256
  Codec Vendor ID:  0x10ec0256
  Subsystem ID:     0x1ee72038

---
Software
---

  Kernel:    Linux (Arch Linux 7.0.10-arch1-1 )
  PipeWire:  1.6.6
  WirePlumber
  SOF audio stack

---
Background
---

The machine can operate under either legacy HDA or SOF, but microphone
behavior differs significantly between the two.

Legacy HDA (snd_hda_intel):
  - Headphone output:          works
  - Headset microphone:        works
  - Internal digital mic:      unavailable

SOF (sof-audio-pci-intel-tgl), stock:
  - Headphone output:          works
  - Internal digital mic:      works
  - Headset microphone:        unavailable

This forced users to choose between the internal microphone (SOF) and the
headset microphone (legacy HDA), with no configuration supporting both
simultaneously.

---
Investigation
---

The machine matches the following subsystem entry in
sound/hda/codecs/realtek/alc269.c:

  SND_PCI_QUIRK(0x1ee7, 0x2038, "HONOR MagicBook X16",
ALC2XX_FIXUP_HEADSET_MIC);

I rebuilt the kernel with this fixup applied and verified behavior while
remaining on the SOF stack.

---
Results with SOF + ALC2XX_FIXUP_HEADSET_MIC
---

  Driver: sof-audio-pci-intel-tgl

  - Headphone output:          works
  - Headphone jack detection:  works
  - Internal digital mic:      works
  - Headset microphone:        works

ALSA exposes both HDA Analog capture and DMIC capture devices.
PipeWire exposes both microphone paths simultaneously.

This is the first configuration where both the internal microphone and the
headset microphone are functional at the same time.

---
Summary
---

  Legacy HDA:
    - Internal mic:   unavailable
    - Headset mic:    works

  SOF (stock):
    - Internal mic:   works
    - Headset mic:    unavailable

  SOF + ALC2XX_FIXUP_HEADSET_MIC:
    - Internal mic:   works
    - Headset mic:    works

This confirms that ALC2XX_FIXUP_HEADSET_MIC is required for correct headset
microphone support on subsystem 1ee7:2038 under SOF.

---
Remaining issue (separate from the above)
---

Headphone ports report correct availability. As a result, headset insertion
and removal events are detected and device change events are generated, but
automatic microphone switching does not occur. Users must manually select
the microphone source.

I believe this is a WirePlumber/UCM profile issue rather than a kernel
issue and will follow up in the appropriate upstream tracker separately.

---
Note on testing environment
---

I also experimented with PipeWire, WirePlumber, and UCM configuration
during testing. I verified the kernel-level behavior using arecord
directly, independent of PipeWire/WirePlumber configuration, so the
functional results above are reproducible on a stock installation.

I can provide codec dumps (cat /proc/asound/card*/codec#*), full ALSA
diagnostics, and additional testing information on request.

Thank you for your work on ALSA and Linux audio support.

Best regards

Kathiravan B (Baymax)

--000000000000579fd30653164e46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I would like to report findings from investi=
gating audio support on a HONOR MagicBook X16 laptop, and to suggest that A=
LC2XX_FIXUP_HEADSET_MIC be confirmed as required for subsystem 1ee7:2038.<b=
r><br>---<br>Hardware<br>---<br><br>=C2=A0 Laptop: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 HONOR MagicBook X16<br>=C2=A0 Platform: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Intel Alder Lake<br>=C2=A0 Audio codec: =C2=A0 =C2=A0 =C2=A0Realtek ALC=
256<br>=C2=A0 Codec Vendor ID: =C2=A00x10ec0256<br>=C2=A0 Subsystem ID: =C2=
=A0 =C2=A0 0x1ee72038<br><br>---<br>Software<br>---<br><br>=C2=A0 Kernel: =
=C2=A0 =C2=A0Linux (Arch Linux=C2=A07.0.10-arch1-1 )<br>=C2=A0 PipeWire: =
=C2=A01.6.6<br>=C2=A0 WirePlumber<br>=C2=A0 SOF audio stack<br><br>---<br>B=
ackground<br>---<br><br>The machine can operate under either legacy HDA or =
SOF, but microphone behavior differs significantly between the two.<br><br>=
Legacy HDA (snd_hda_intel):<br>=C2=A0 - Headphone output: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0works<br>=C2=A0 - Headset microphone: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0works<br>=C2=A0 - Internal digital mic: =C2=A0 =C2=A0 =C2=A0unavaila=
ble<br><br>SOF (sof-audio-pci-intel-tgl), stock:<br>=C2=A0 - Headphone outp=
ut: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0works<br>=C2=A0 - Internal digital mi=
c: =C2=A0 =C2=A0 =C2=A0works<br>=C2=A0 - Headset microphone: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unavailable<br><br>This forced users to choose between the int=
ernal microphone (SOF) and the headset microphone (legacy HDA), with no con=
figuration supporting both simultaneously.<br><br>---<br>Investigation<br>-=
--<br><br>The machine matches the following subsystem entry in sound/hda/co=
decs/realtek/alc269.c:<br><br>=C2=A0 SND_PCI_QUIRK(0x1ee7, 0x2038, &quot;HO=
NOR MagicBook X16&quot;, ALC2XX_FIXUP_HEADSET_MIC);<br><br>I rebuilt the ke=
rnel with this fixup applied and verified behavior while remaining on the S=
OF stack.<br><br>---<br>Results with SOF + ALC2XX_FIXUP_HEADSET_MIC<br>---<=
br><br>=C2=A0 Driver: sof-audio-pci-intel-tgl<br><br>=C2=A0 - Headphone out=
put: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0works<br>=C2=A0 - Headphone jack det=
ection: =C2=A0works<br>=C2=A0 - Internal digital mic: =C2=A0 =C2=A0 =C2=A0w=
orks<br>=C2=A0 - Headset microphone: =C2=A0 =C2=A0 =C2=A0 =C2=A0works<br><b=
r>ALSA exposes both HDA Analog capture and DMIC capture devices.<br>PipeWir=
e exposes both microphone paths simultaneously.<br><br>This is the first co=
nfiguration where both the internal microphone and the headset microphone a=
re functional at the same time.<br><br>---<br>Summary<br>---<br><br>=C2=A0 =
Legacy HDA:<br>=C2=A0 =C2=A0 - Internal mic: =C2=A0 unavailable<br>=C2=A0 =
=C2=A0 - Headset mic: =C2=A0 =C2=A0works<br><br>=C2=A0 SOF (stock):<br>=C2=
=A0 =C2=A0 - Internal mic: =C2=A0 works<br>=C2=A0 =C2=A0 - Headset mic: =C2=
=A0 =C2=A0unavailable<br><br>=C2=A0 SOF + ALC2XX_FIXUP_HEADSET_MIC:<br>=C2=
=A0 =C2=A0 - Internal mic: =C2=A0 works<br>=C2=A0 =C2=A0 - Headset mic: =C2=
=A0 =C2=A0works<br><br>This confirms that ALC2XX_FIXUP_HEADSET_MIC is requi=
red for correct headset microphone support on subsystem 1ee7:2038 under SOF=
.<br><br>---<br>Remaining issue (separate from the above)<br>---<br><br>Hea=
dphone ports report correct availability. As a result, headset insertion an=
d removal events are detected and device change events are generated, but a=
utomatic microphone switching does not occur. Users must manually select th=
e microphone source.<br><br>I believe this is a WirePlumber/UCM profile iss=
ue rather than a kernel issue and will follow up in the appropriate upstrea=
m tracker separately.<br><br>---<br>Note on testing environment<br>---<br><=
br>I also experimented with PipeWire, WirePlumber, and UCM configuration du=
ring testing. I verified the kernel-level behavior using arecord directly, =
independent of PipeWire/WirePlumber configuration, so the functional result=
s above are reproducible on a stock installation.<br><br>I can provide code=
c dumps (cat /proc/asound/card*/codec#*), full ALSA diagnostics, and additi=
onal testing information on request.<br><br>Thank you for your work on ALSA=
 and Linux audio support.<br><br>Best regards<br><br>Kathiravan B (Baymax)<=
/div>

--000000000000579fd30653164e46--
--000000000000579fd40653164e48
Content-Type: text/plain; charset="US-ASCII"; name="codec_dump.txt"
Content-Disposition: attachment; filename="codec_dump.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mptc2day0>
X-Attachment-Id: f_mptc2day0

Q29kZWM6IFJlYWx0ZWsgQUxDMjU2CkFkZHJlc3M6IDAKQUZHIEZ1bmN0aW9uIElkOiAweDEgKHVu
c29sIDEpClZlbmRvciBJZDogMHgxMGVjMDI1NgpTdWJzeXN0ZW0gSWQ6IDB4MWVlNzIwMzgKUmV2
aXNpb24gSWQ6IDB4MTAwMDAyCk5vIE1vZGVtIEZ1bmN0aW9uIEdyb3VwIGZvdW5kCkRlZmF1bHQg
UENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAgICBiaXRz
IFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCkRlZmF1bHQgQW1wLUluIGNh
cHM6IE4vQQpEZWZhdWx0IEFtcC1PdXQgY2FwczogTi9BClN0YXRlIG9mIEFGRyBub2RlIDB4MDE6
CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRDNjb2xkIENMS1NUT1AgRVBTUwogIFBvd2Vy
OiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKR1BJTzogaW89Mywgbz0wLCBpPTAsIHVuc29saWNpdGVk
PTEsIHdha2U9MAogIElPWzBdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5PTAsIGRh
dGE9MCwgdW5zb2w9MAogIElPWzFdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5PTAs
IGRhdGE9MCwgdW5zb2w9MAogIElPWzJdOiBlbmFibGU9MCwgZGlyPTAsIHdha2U9MCwgc3RpY2t5
PTAsIGRhdGE9MCwgdW5zb2w9MApOb2RlIDB4MDIgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0MWQ6
IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iU3BlYWtlciBQbGF5YmFjayBWb2x1bWUi
LCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMsIGRpcj1PdXQsIGlkeD0w
LCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4NTcsIG5zdGVwcz0weDU3LCBzdGVwc2l6ZT0w
eDAyLCBtdXRlPTAKICBBbXAtT3V0IHZhbHM6ICBbMHg1NyAweDU3XQogIENvbnZlcnRlcjogc3Ry
ZWFtPTAsIGNoYW5uZWw9MAogIFBDTToKICAgIHJhdGVzIFsweDYwXTogNDQxMDAgNDgwMDAKICAg
IGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBzdGF0
ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApOb2Rl
IDB4MDMgW0F1ZGlvIE91dHB1dF0gd2NhcHMgMHg0MWQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJv
bDogbmFtZT0iSGVhZHBob25lIFBsYXliYWNrIFZvbHVtZSIsIGluZGV4PTAsIGRldmljZT0wCiAg
ICBDb250cm9sQW1wOiBjaHM9MywgZGlyPU91dCwgaWR4PTAsIG9mcz0wCiAgQW1wLU91dCBjYXBz
OiBvZnM9MHg1NywgbnN0ZXBzPTB4NTcsIHN0ZXBzaXplPTB4MDIsIG11dGU9MAogIEFtcC1PdXQg
dmFsczogIFsweDQzIDB4NDNdCiAgQ29udmVydGVyOiBzdHJlYW09MCwgY2hhbm5lbD0wCiAgUENN
OgogICAgcmF0ZXMgWzB4NjBdOiA0NDEwMCA0ODAwMAogICAgYml0cyBbMHhlXTogMTYgMjAgMjQK
ICAgIGZvcm1hdHMgWzB4MV06IFBDTQogIFBvd2VyIHN0YXRlczogIEQwIEQxIEQyIEQzIEVQU1MK
ICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwNCBbVmVuZG9yIERlZmluZWQg
V2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MDUgW1ZlbmRvciBEZWZpbmVkIFdp
ZGdldF0gd2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDA2IFtBdWRpbyBPdXRwdXRdIHdjYXBz
IDB4NjExOiBTdGVyZW8gRGlnaXRhbAogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAog
IERpZ2l0YWw6CiAgRGlnaXRhbCBjYXRlZ29yeTogMHgwCiAgSUVDIENvZGluZyBUeXBlOiAweDAK
ICBQQ006CiAgICByYXRlcyBbMHg1ZTBdOiA0NDEwMCA0ODAwMCA4ODIwMCA5NjAwMCAxOTIwMDAK
ICAgIGJpdHMgWzB4ZV06IDE2IDIwIDI0CiAgICBmb3JtYXRzIFsweDFdOiBQQ00KICBQb3dlciBz
dGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMApO
b2RlIDB4MDcgW0F1ZGlvIElucHV0XSB3Y2FwcyAweDEwMDUxYjogU3RlcmVvIEFtcC1JbgogIEFt
cC1JbiBjYXBzOiBvZnM9MHgxNywgbnN0ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11dGU9MQog
IEFtcC1JbiB2YWxzOiAgWzB4OTcgMHg5N10KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVs
PTAKICBTREktU2VsZWN0OiAwCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAg
OTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTog
UENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQw
LCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgyNApOb2RlIDB4MDggW0F1ZGlvIElu
cHV0XSB3Y2FwcyAweDEwMDUxYjogU3RlcmVvIEFtcC1JbgogIENvbnRyb2w6IG5hbWU9IkNhcHR1
cmUgVm9sdW1lIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9
SW4sIGlkeD0wLCBvZnM9MAogIENvbnRyb2w6IG5hbWU9IkNhcHR1cmUgU3dpdGNoIiwgaW5kZXg9
MCwgZGV2aWNlPTAKICAgIENvbnRyb2xBbXA6IGNocz0zLCBkaXI9SW4sIGlkeD0wLCBvZnM9MAog
IEFtcC1JbiBjYXBzOiBvZnM9MHgxNywgbnN0ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11dGU9
MQogIEFtcC1JbiB2YWxzOiAgWzB4M2YgMHgzZl0KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFu
bmVsPTAKICBTREktU2VsZWN0OiAwCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgw
MDAgOTYwMDAgMTkyMDAwCiAgICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgx
XTogUENNCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5n
PUQwLCBhY3R1YWw9RDAKICBDb25uZWN0aW9uOiAxCiAgICAgMHgyMwpOb2RlIDB4MDkgW0F1ZGlv
IElucHV0XSB3Y2FwcyAweDEwMDUxYjogU3RlcmVvIEFtcC1JbgogIEFtcC1JbiBjYXBzOiBvZnM9
MHgxNywgbnN0ZXBzPTB4M2YsIHN0ZXBzaXplPTB4MDIsIG11dGU9MQogIEFtcC1JbiB2YWxzOiAg
WzB4OTcgMHg5N10KICBDb252ZXJ0ZXI6IHN0cmVhbT0wLCBjaGFubmVsPTAKICBTREktU2VsZWN0
OiAwCiAgUENNOgogICAgcmF0ZXMgWzB4NTYwXTogNDQxMDAgNDgwMDAgOTYwMDAgMTkyMDAwCiAg
ICBiaXRzIFsweGVdOiAxNiAyMCAyNAogICAgZm9ybWF0cyBbMHgxXTogUENNCiAgUG93ZXIgc3Rh
dGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKICBD
b25uZWN0aW9uOiAxCiAgICAgMHgyMgpOb2RlIDB4MGEgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0g
d2NhcHMgMHhmMDAwMDA6IE1vbm8KTm9kZSAweDBiIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdj
YXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgwYyBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2Fw
cyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MGQgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMg
MHhmMDAwMDA6IE1vbm8KTm9kZSAweDBlIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4
ZjAwMDAwOiBNb25vCk5vZGUgMHgwZiBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYw
MDAwMDogTW9ubwpOb2RlIDB4MTAgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAw
MDA6IE1vbm8KTm9kZSAweDExIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAw
OiBNb25vCk5vZGUgMHgxMiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNDBiOiBTdGVyZW8gQW1w
LUluCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMywgc3RlcHNpemU9MHgyNywg
bXV0ZT0wCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDAwMDAwMDIwOiBJ
TgogIFBpbiBEZWZhdWx0IDB4NDAwMDAwMDA6IFtOL0FdIExpbmUgT3V0IGF0IEV4dCBOL0EKICAg
IENvbm4gPSBVbmtub3duLCBDb2xvciA9IFVua25vd24KICAgIERlZkFzc29jaWF0aW9uID0gMHgw
LCBTZXF1ZW5jZSA9IDB4MAogIFBpbi1jdGxzOiAweDAwOgogIFBvd2VyIHN0YXRlczogIEQwIEQx
IEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgxMyBbUGlu
IENvbXBsZXhdIHdjYXBzIDB4NDAwNDBiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6IG9m
cz0weDAwLCBuc3RlcHM9MHgwMywgc3RlcHNpemU9MHgyNywgbXV0ZT0wCiAgQW1wLUluIHZhbHM6
ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDAwMDAwMDIwOiBJTgogIFBpbiBEZWZhdWx0IDB4NDEx
MTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0g
QmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9
IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MDA6CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIg
RDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDE0IFtQaW4gQ29t
cGxleF0gd2NhcHMgMHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iU3Bl
YWtlciBQbGF5YmFjayBTd2l0Y2giLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDog
Y2hzPTMsIGRpcj1PdXQsIGlkeD0wLCBvZnM9MAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5z
dGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHg4MCAw
eDgwXQogIFBpbmNhcCAweDAwMDEwMDE0OiBPVVQgRUFQRCBEZXRlY3QKICBFQVBEIDB4MjogRUFQ
RAogIFBpbiBEZWZhdWx0IDB4OTAxNzAxMTA6IFtGaXhlZF0gU3BlYWtlciBhdCBJbnQgTi9BCiAg
ICBDb25uID0gQW5hbG9nLCBDb2xvciA9IFVua25vd24KICAgIERlZkFzc29jaWF0aW9uID0gMHgx
LCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4NDA6
IE9VVAogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQw
IEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlv
bjogMQogICAgIDB4MDIKTm9kZSAweDE1IFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4
ZjAwMDAwOiBNb25vCk5vZGUgMHgxNiBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYw
MDAwMDogTW9ubwpOb2RlIDB4MTcgW1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAw
MDA6IE1vbm8KTm9kZSAweDE4IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA0OGI6IFN0ZXJlbyBB
bXAtSW4KICBBbXAtSW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3
LCBtdXRlPTAKICBBbXAtSW4gdmFsczogIFsweDAwIDB4MDBdCiAgUGluY2FwIDB4MDAwMDM3MjQ6
IElOIERldGVjdAogICAgVnJlZiBjYXBzOiBISVogNTAgR1JEIDgwIDEwMAogIFBpbiBEZWZhdWx0
IDB4NDExMTExZjA6IFtOL0FdIFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENv
bG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAg
TWlzYyA9IE5PX1BSRVNFTkNFCiAgUGluLWN0bHM6IDB4MjA6IElOIFZSRUZfSElaCiAgVW5zb2xp
Y2l0ZWQ6IHRhZz0wMCwgZW5hYmxlZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBT
UwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDE5IFtQaW4gQ29tcGxleF0g
d2NhcHMgMHg0MDA0OGI6IFN0ZXJlbyBBbXAtSW4KICBDb250cm9sOiBuYW1lPSJIZWFkc2V0IE1p
YyBCb29zdCBWb2x1bWUiLCBpbmRleD0wLCBkZXZpY2U9MAogICAgQ29udHJvbEFtcDogY2hzPTMs
IGRpcj1JbiwgaWR4PTAsIG9mcz0wCiAgQW1wLUluIGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgw
Mywgc3RlcHNpemU9MHgyNywgbXV0ZT0wCiAgQW1wLUluIHZhbHM6ICBbMHgwMCAweDAwXQogIFBp
bmNhcCAweDAwMDAzNzI0OiBJTiBEZXRlY3QKICAgIFZyZWYgY2FwczogSElaIDUwIEdSRCA4MCAx
MDAKICBQaW4gRGVmYXVsdCAweDQxMTExMWYwOiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAg
ICBDb25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2Vx
dWVuY2UgPSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDI0OiBJTiBW
UkVGXzgwCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMiwgZW5hYmxlZD0xCiAgUG93ZXIgc3RhdGVzOiAg
RDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQwLCBhY3R1YWw9RDAKTm9kZSAweDFh
IFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA0OGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAtSW4gY2Fw
czogb2ZzPTB4MDAsIG5zdGVwcz0weDAzLCBzdGVwc2l6ZT0weDI3LCBtdXRlPTAKICBBbXAtSW4g
dmFsczogIFsweDAwIDB4MDBdCiAgUGluY2FwIDB4MDAwMDM3MjQ6IElOIERldGVjdAogICAgVnJl
ZiBjYXBzOiBISVogNTAgR1JEIDgwIDEwMAogIFBpbiBEZWZhdWx0IDB4NDExMTExZjA6IFtOL0Fd
IFNwZWFrZXIgYXQgRXh0IFJlYXIKICAgIENvbm4gPSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERl
ZkFzc29jaWF0aW9uID0gMHhmLCBTZXF1ZW5jZSA9IDB4MAogICAgTWlzYyA9IE5PX1BSRVNFTkNF
CiAgUGluLWN0bHM6IDB4MDA6IFZSRUZfSElaCiAgVW5zb2xpY2l0ZWQ6IHRhZz0wMCwgZW5hYmxl
ZD0wCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQw
LCBhY3R1YWw9RDAKTm9kZSAweDFiIFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA1OGY6IFN0ZXJl
byBBbXAtSW4gQW1wLU91dAogIEFtcC1JbiBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDMsIHN0
ZXBzaXplPTB4MjcsIG11dGU9MAogIEFtcC1JbiB2YWxzOiAgWzB4MDAgMHgwMF0KICBBbXAtT3V0
IGNhcHM6IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1w
LU91dCB2YWxzOiAgWzB4ODAgMHg4MF0KICBQaW5jYXAgMHgwMDAxMzczNDogSU4gT1VUIEVBUEQg
RGV0ZWN0CiAgICBWcmVmIGNhcHM6IEhJWiA1MCBHUkQgODAgMTAwCiAgRUFQRCAweDI6IEVBUEQK
ICBQaW4gRGVmYXVsdCAweDQxMTExMWYwOiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBD
b25uID0gMS84LCBDb2xvciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVu
Y2UgPSAweDAKICAgIE1pc2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDIwOiBJTiBWUkVG
X0hJWgogIFVuc29saWNpdGVkOiB0YWc9MDAsIGVuYWJsZWQ9MAogIFBvd2VyIHN0YXRlczogIEQw
IEQxIEQyIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCiAgQ29ubmVjdGlv
bjogMgogICAgIDB4MDIqIDB4MDMKTm9kZSAweDFjIFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdj
YXBzIDB4ZjAwMDAwOiBNb25vCk5vZGUgMHgxZCBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNDAw
OiBNb25vCiAgUGluY2FwIDB4MDAwMDAwMjA6IElOCiAgUGluIERlZmF1bHQgMHg0MDQ4OWE2ZDog
W04vQV0gU1BESUYgT3V0IGF0IEV4dCBOL0EKICAgIENvbm4gPSBESU4sIENvbG9yID0gUGluawog
ICAgRGVmQXNzb2NpYXRpb24gPSAweDYsIFNlcXVlbmNlID0gMHhkCiAgUGluLWN0bHM6IDB4MjA6
IElOCiAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogIFBvd2VyOiBzZXR0aW5nPUQw
LCBhY3R1YWw9RDAKTm9kZSAweDFlIFtQaW4gQ29tcGxleF0gd2NhcHMgMHg0MDA3ODE6IFN0ZXJl
byBEaWdpdGFsCiAgUGluY2FwIDB4MDAwMDAwMTQ6IE9VVCBEZXRlY3QKICBQaW4gRGVmYXVsdCAw
eDQxMTExMWYwOiBbTi9BXSBTcGVha2VyIGF0IEV4dCBSZWFyCiAgICBDb25uID0gMS84LCBDb2xv
ciA9IEJsYWNrCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4ZiwgU2VxdWVuY2UgPSAweDAKICAgIE1p
c2MgPSBOT19QUkVTRU5DRQogIFBpbi1jdGxzOiAweDQwOiBPVVQKICBVbnNvbGljaXRlZDogdGFn
PTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6
IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDEKICAgICAweDA2Ck5vZGUgMHgx
ZiBbVmVuZG9yIERlZmluZWQgV2lkZ2V0XSB3Y2FwcyAweGYwMDAwMDogTW9ubwpOb2RlIDB4MjAg
W1ZlbmRvciBEZWZpbmVkIFdpZGdldF0gd2NhcHMgMHhmMDAwNDA6IE1vbm8KICBQcm9jZXNzaW5n
IGNhcHM6IGJlbmlnbj0wLCBuY29lZmY9OTEKTm9kZSAweDIxIFtQaW4gQ29tcGxleF0gd2NhcHMg
MHg0MDA1OGQ6IFN0ZXJlbyBBbXAtT3V0CiAgQ29udHJvbDogbmFtZT0iSGVhZHBob25lIFBsYXli
YWNrIFN3aXRjaCIsIGluZGV4PTAsIGRldmljZT0wCiAgICBDb250cm9sQW1wOiBjaHM9MywgZGly
PU91dCwgaWR4PTAsIG9mcz0wCiAgQW1wLU91dCBjYXBzOiBvZnM9MHgwMCwgbnN0ZXBzPTB4MDAs
IHN0ZXBzaXplPTB4MDAsIG11dGU9MQogIEFtcC1PdXQgdmFsczogIFsweDAwIDB4MDBdCiAgUGlu
Y2FwIDB4MDAwMTAwMWM6IE9VVCBIUCBFQVBEIERldGVjdAogIEVBUEQgMHgyOiBFQVBECiAgUGlu
IERlZmF1bHQgMHgwNDIxMTAyMDogW0phY2tdIEhQIE91dCBhdCBFeHQgUmlnaHQKICAgIENvbm4g
PSAxLzgsIENvbG9yID0gQmxhY2sKICAgIERlZkFzc29jaWF0aW9uID0gMHgyLCBTZXF1ZW5jZSA9
IDB4MAogIFBpbi1jdGxzOiAweGMwOiBPVVQgSFAKICBVbnNvbGljaXRlZDogdGFnPTAxLCBlbmFi
bGVkPTEKICBQb3dlciBzdGF0ZXM6ICBEMCBEMSBEMiBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMAogIENvbm5lY3Rpb246IDIKICAgICAweDAyIDB4MDMqCk5vZGUgMHgyMiBb
QXVkaW8gTWl4ZXJdIHdjYXBzIDB4MjAwMTBiOiBTdGVyZW8gQW1wLUluCiAgQW1wLUluIGNhcHM6
IG9mcz0weDAwLCBuc3RlcHM9MHgwMCwgc3RlcHNpemU9MHgwMCwgbXV0ZT0xCiAgQW1wLUluIHZh
bHM6ICBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4MCAweDgwXSBbMHg4
MCAweDgwXQogIENvbm5lY3Rpb246IDUKICAgICAweDE4IDB4MTkgMHgxYSAweDFiIDB4MWQKTm9k
ZSAweDIzIFtBdWRpbyBNaXhlcl0gd2NhcHMgMHgyMDAxMGI6IFN0ZXJlbyBBbXAtSW4KICBBbXAt
SW4gY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBB
bXAtSW4gdmFsczogIFsweDgwIDB4ODBdIFsweDAwIDB4MDBdIFsweDgwIDB4ODBdIFsweDgwIDB4
ODBdIFsweDgwIDB4ODBdIFsweDgwIDB4ODBdCiAgQ29ubmVjdGlvbjogNgogICAgIDB4MTggMHgx
OSAweDFhIDB4MWIgMHgxZCAweDEyCk5vZGUgMHgyNCBbQXVkaW8gU2VsZWN0b3JdIHdjYXBzIDB4
MzAwMTAxOiBTdGVyZW8KICBDb25uZWN0aW9uOiAyCiAgICAgMHgxMiogMHgxMwpDb2RlYzogSW50
ZWwgQWxkZXJsYWtlLVAgSERNSQpBZGRyZXNzOiAyCkFGRyBGdW5jdGlvbiBJZDogMHgxICh1bnNv
bCAwKQpWZW5kb3IgSWQ6IDB4ODA4NjI4MWMKU3Vic3lzdGVtIElkOiAweDgwODYwMTAxClJldmlz
aW9uIElkOiAweDEwMDAwMApObyBNb2RlbSBGdW5jdGlvbiBHcm91cCBmb3VuZApEZWZhdWx0IFBD
TToKICAgIHJhdGVzIFsweDBdOgogICAgYml0cyBbMHgwXToKICAgIGZvcm1hdHMgWzB4MF06CkRl
ZmF1bHQgQW1wLUluIGNhcHM6IE4vQQpEZWZhdWx0IEFtcC1PdXQgY2FwczogTi9BClN0YXRlIG9m
IEFGRyBub2RlIDB4MDE6CiAgUG93ZXIgc3RhdGVzOiAgRDAgRDMgQ0xLU1RPUCBFUFNTCiAgUG93
ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMCwgQ2xvY2stc3RvcC1PSwpHUElPOiBpbz0wLCBvPTAs
IGk9MCwgdW5zb2xpY2l0ZWQ9MCwgd2FrZT0wCk5vZGUgMHgwMyBbQXVkaW8gT3V0cHV0XSB3Y2Fw
cyAweDY2MTE6IDgtQ2hhbm5lbHMgRGlnaXRhbAogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5u
ZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29k
aW5nIFR5cGU6IDB4MAogIFBDTToKICAgIHJhdGVzIFsweDdmMF06IDMyMDAwIDQ0MTAwIDQ4MDAw
IDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAKICAgIGJpdHMgWzB4MWFdOiAxNiAyNCAzMgogICAg
Zm9ybWF0cyBbMHg1XTogUENNIEFDMwogIFBvd2VyIHN0YXRlczogIEQwIEQzIEVQU1MKICBQb3dl
cjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwNCBbUGluIENvbXBsZXhdIHdjYXBzIDB4
NDA3NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczogb2Zz
PTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6
ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQ
CiAgUGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1J
CiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9
IDB4MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFn
PTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNldHRp
bmc9RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBDb25uZWN0aW9uOiAwCk5vZGUgMHgwNSBb
QXVkaW8gT3V0cHV0XSB3Y2FwcyAweDY2MTE6IDgtQ2hhbm5lbHMgRGlnaXRhbAogIENvbnZlcnRl
cjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdpdGFsIGNhdGVn
b3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MAogIFBDTToKICAgIHJhdGVzIFsweDdmMF06
IDMyMDAwIDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAKICAgIGJpdHMgWzB4
MWFdOiAxNiAyNCAzMgogICAgZm9ybWF0cyBbMHg1XTogUENNIEFDMwogIFBvd2VyIHN0YXRlczog
IEQwIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwNiBbUGlu
IENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAog
IEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRl
PTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQg
RGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0
YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAg
ICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoK
ICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBDb25uZWN0
aW9uOiAwCk5vZGUgMHgwNyBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAweDY2MTE6IDgtQ2hhbm5lbHMg
RGlnaXRhbAogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9MAogIERpZ2l0YWw6IEVuYWJs
ZWQKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29kaW5nIFR5cGU6IDB4MAogIFBDTToK
ICAgIHJhdGVzIFsweDdmMF06IDMyMDAwIDQ0MTAwIDQ4MDAwIDg4MjAwIDk2MDAwIDE3NjQwMCAx
OTIwMDAKICAgIGJpdHMgWzB4MWFdOiAxNiAyNCAzMgogICAgZm9ybWF0cyBbMHg1XTogUENNIEFD
MwogIFBvd2VyIHN0YXRlczogIEQwIEQzIEVQU1MKICBQb3dlcjogc2V0dGluZz1EMCwgYWN0dWFs
PUQwCk5vZGUgMHgwOCBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNoYW5uZWxzIERp
Z2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBz
dGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNh
cCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1bHQgMHgxODU2
MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwg
Q29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAweDAK
ICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dl
ciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIERl
dmljZXM6IDAKICBDb25uZWN0aW9uOiAwCk5vZGUgMHgwOSBbQXVkaW8gT3V0cHV0XSB3Y2FwcyAw
eDY2MTE6IDgtQ2hhbm5lbHMgRGlnaXRhbAogIENvbnZlcnRlcjogc3RyZWFtPTAsIGNoYW5uZWw9
MAogIERpZ2l0YWw6IEVuYWJsZWQKICBEaWdpdGFsIGNhdGVnb3J5OiAweDAKICBJRUMgQ29kaW5n
IFR5cGU6IDB4MAogIFBDTToKICAgIHJhdGVzIFsweDdmMF06IDMyMDAwIDQ0MTAwIDQ4MDAwIDg4
MjAwIDk2MDAwIDE3NjQwMCAxOTIwMDAKICAgIGJpdHMgWzB4MWFdOiAxNiAyNCAzMgogICAgZm9y
bWF0cyBbMHg1XTogUENNIEFDMwogIFBvd2VyIHN0YXRlczogIEQwIEQzIEVQU1MKICBQb3dlcjog
c2V0dGluZz1EMCwgYWN0dWFsPUQwCk5vZGUgMHgwYSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDA3
NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4
MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBb
MHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQCiAg
UGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAg
ICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4
MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTAw
LCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9
RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBDb25uZWN0aW9uOiAwCk5vZGUgMHgwYiBbUGlu
IENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAog
IEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRl
PTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQg
RGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0
YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAg
ICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoK
ICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBF
UFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBDb25uZWN0
aW9uOiAwCk5vZGUgMHgwYyBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNoYW5uZWxz
IERpZ2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAw
LCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBp
bmNhcCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1bHQgMHgx
ODU2MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRh
bCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAw
eDAKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQ
b3dlciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAog
IERldmljZXM6IDAKICBDb25uZWN0aW9uOiAwCk5vZGUgMHgwZCBbUGluIENvbXBsZXhdIHdjYXBz
IDB4NDA3NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczog
b2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZh
bHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1J
IERQCiAgUGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBI
RE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlv
biA9IDB4MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDog
dGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNl
dHRpbmc9RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBDb25uZWN0aW9uOiAwCk5vZGUgMHgw
ZSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNoYW5uZWxzIERpZ2l0YWwgQW1wLU91
dCBDUAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAw
LCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAwXQogIFBpbmNhcCAweDA5MDAwMDk0
OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1bHQgMHgxODU2MDAxMDogW0phY2td
IERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0gRGlnaXRhbCwgQ29sb3IgPSBVbmtu
b3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVuY2UgPSAweDAKICBQaW4tY3Rsczog
MHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVkPTAKICBQb3dlciBzdGF0ZXM6ICBE
MCBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogIERldmljZXM6IDAKICBD
b25uZWN0aW9uOiAwCk5vZGUgMHgwZiBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDA3NzhkOiA4LUNo
YW5uZWxzIERpZ2l0YWwgQW1wLU91dCBDUAogIEFtcC1PdXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVw
cz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEKICBBbXAtT3V0IHZhbHM6ICBbMHgwMCAweDAw
XQogIFBpbmNhcCAweDA5MDAwMDk0OiBPVVQgRGV0ZWN0IEhCUiBIRE1JIERQCiAgUGluIERlZmF1
bHQgMHgxODU2MDAxMDogW0phY2tdIERpZ2l0YWwgT3V0IGF0IEludCBIRE1JCiAgICBDb25uID0g
RGlnaXRhbCwgQ29sb3IgPSBVbmtub3duCiAgICBEZWZBc3NvY2lhdGlvbiA9IDB4MSwgU2VxdWVu
Y2UgPSAweDAKICBQaW4tY3RsczogMHgwMDoKICBVbnNvbGljaXRlZDogdGFnPTAwLCBlbmFibGVk
PTAKICBQb3dlciBzdGF0ZXM6ICBEMCBEMyBFUFNTCiAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVh
bD1EMAogIERldmljZXM6IDAKICBDb25uZWN0aW9uOiAwCg==
--000000000000579fd40653164e48--
