Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E503E49C3
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938879; cv=none; b=Kl6RWA5V+BCXFj10GjS+x9rlTwPYqXmDSrg3TQCbwjikTr1MpggmaD69Q+vUBb/hWWnS0sE7x635MiSO4kXoPGx5DVeejag5057cMk4BqdWK7hvMTDRYvDHr/GoDZg9WK2bia1+RdmyuACzHfAFH+b85EbfVRJ2EbRwr58fC1p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938879; c=relaxed/simple;
	bh=XZi511PqZprMyFi1XP7qILISSNX1tU1ncsOdgRoh4/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To; b=ThjVoZBMWO0uFb9RMtvX4JIuq1nrcH+Gb3fQ7eMIDS5NoDvVWx+mh8BKrruPtIurg9hruTNPfhwX6P2XKFM8kqOgGhHW6DRQuuuPdM4wjmwNPTmESYQbT+M5IGY9L/OjMgtHeb8wdGiRAmn/H1LonEsfmYEYuTV3TuS3FDnyk4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhDQOH1e; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhDQOH1e"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso2068228a91.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 14:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938877; x=1790543677; darn=vger.kernel.org;
        h=to:from:cc:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADMTsZ1OUY/8FESWFtVP3Myx8n13Fc2DdH55tYJ3tmg=;
        b=VhDQOH1e/0xFSqM+ca61iGJYtZGk3GzeFI1IuwuQuz+OBxavnMK3FqmhnA1GHyURvc
         mQ3wc3MPtsq+M1cmlEEQzyIN+8p0+fiZdrWcBH519rDwoKX/yee0AaZ1slB2qy/cOPTh
         EXVhk3zXKXZyuMgEUNj6zQ6aPPd5n6FHE290HYJxUkTVpPz0+/YPkfJ/rce5PrM9LjBX
         ha/FxzaT+QDSvxaRx1MqgFeFN0XE2cgNAh0VMt/UvKvCd38xALL+3dbLJmocV36DmDw8
         HpTFSaVkXSwQ632U1YNreEpJcdxj+jvZ36uj8JvH8oAkSzLdR8VlxCg1EQ3e/ToP7Rqm
         3kPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938877; x=1790543677;
        h=to:from:cc:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADMTsZ1OUY/8FESWFtVP3Myx8n13Fc2DdH55tYJ3tmg=;
        b=l8l7MQ35N5T2lUIpKcB6Sx79R41yJZOlGuF9jV8ZbdKPLbfBkOJVIzNjSvXYpVrEO/
         zW8n7loKmXWpBlRblN6RdTBTw0U2P3rnbh5DlCxPbKy6uBcaCY0ql3x0OrKI9/0iRS5e
         9vYvOlwje6JkW7oFE500HQwb5UumO7d1oHJZXrOrc6LMZDg0GzQlOwH/muY90Q42RW/A
         nLIy6gNfRqIDGDoIlrlb4UJf0rx/5dFZV54FA1DE4qkok0IKxwMC3/FsZYguJBTLN5RE
         sTGhtfn752AjjDgZRptyDcRg5a6pf06JkrkW6J/yOYQYtuj7OsX33o/QxovUy43WTkfJ
         wLdw==
X-Gm-Message-State: AFuF++mgOqPOKgnUGoh+2GPJInA8moHff0pisDdAf3d+DR4qC2qBLzCn
	h//vQn1jD90War5cE+1s2hH0hV/Ty3y0xhZ7BXYZNBT4Aw2wDNHA3yOZswCHw4TIkcM=
X-Gm-Gg: AYBFou0vrQSmS/cvklDs3PWplhD0eHcRuY7AfEQHIhnkkzY66RCHGjTjJABdtTZPJHr
	cN8Km9jfjy+lq5509p4IYkFMrEC5DrHCE+HThURanjB2VfQoXBLVaHYb8OBaqFKghDGY88fCAoN
	2t14UISP44EZGIrJ3TQvCjTh2nVqrM8uqopssDP6VPdmc3ge8vyZvEtz+1csICsDKmocjV+/vzt
	m9zpEK82x79BcFvllVMSbup80UV7qfflfKyLjPcACAR52Vc2C+/8m4JrXHsmjUIQ8s4BDO5Qp3L
	fVSmc/7D/QnqI875IxMTfBZ/cOmdC//rW+ZtrU2jAwLYbv+mLWVp9c5Pleo0x2jImwro/1aX/l5
	nngAr1bZLdJNaHtBaRx1tFaDY+u6FSHp5NsqA2RxLsxxJHxjm3FsiDzim8yBOtm1jsJhUJsSrSh
	Ocp6Ne5/LNDASPLOarxSznkMwWFIJIf6i0dwPImtonEUg12cPtIwz+P512S/1Oxzr1VFt2Mp1ba
	m4nXvpg7WaxIhi7sRTS12VjTpFVemVD
X-Received: by 2002:a17:90b:55cf:b0:3a0:516d:9f7e with SMTP id 98e67ed59e1d1-3a0516da732mr179082a91.45.1789938876990;
        Sun, 20 Sep 2026 14:14:36 -0700 (PDT)
Received: from localhost (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm22049842c88.5.2026.09.20.14.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 14:14:35 -0700
Message-Id: <DLKGDJMA0NY6.2C34FXZUHFK7C@gmail.com>
Subject: [RFC] ALSA: usb-audio: Blue Yeti 046d:0ab7 fw 0.20 capture fails
 until device-side MCU reset
Cc: <linux-usb@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>
From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
To: <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

Hello,

I'm encountering a reproducible capture failure with multiple Logitech/Blue=
 Yeti
Classic USB microphone and wanted to ask where the best place for this
workaround to live, as I feel it may belong in snd-usb-audio instead of
userspace but wanted a more experienced opinion.

Device:=20

ID 046d:0ab7 Logitech, Inc. Blue Microphones
bcdDevice: 0.20
USB Audio Class: UAC1

System:
Linux 7.2.6-arch2-1 x86_64
xHCI
snd-usb-audio

When booting with the microphone already connected, USB enumeration
succeeds normally. snd-usb-audio binds, ALSA creates PCM device, and
Pipewire also sees the microphone.

Example:

$ arecord -D hw:Microphones,0 \=20
      -f S16_LE -r 48000 -c 2 \=20
	  -d 5 -vv /tmp/yeti.wav

Recording WAVE '/tmp/yeti.wav' : Signed 16 bit Little Endian, Rate 48000 Hz=
,=20
Stereo arecord: pcm_read:2285: read error: Input/output error

The same thing happens at 44100 Hz.=20

I tested a couple recovery methods with the device in this failing
state:

- 44100 Hz Capture      -> EIO
- 48000 Hz Capture      -> EIO
- host USB reset        -> EIO
- USB unbind/rebinding  -> EIO
- device-side MCU reset -> Capture works immediately

Digging deeper, I tested an existing blue-yeti-autoreset userspace
utility for this exact bug, which sends a UAC Extension Unit SET_CUR
Request:

bmRequestType =3D 0x21
bRequest      =3D 0x01
wValue        =3D 0x0a00
wIndex        =3D 0x1900
xLength       =3D 8

payload =3D 00 09 00 00 00 00 00 00

After this is done, the Yeti will disconnect and reenumerate, with my
system having the device change from 002 to 003, and arecord begins to
work normally. Physically unplugging/replugging the device also does the
same fix.

At the end of the day, this looks like a firmware issue with the=20
Blue Yeti, as USB enumeration and snd-usb-audio are working as=20
intended and succeeding, but some internal device state survives=20
host-side USB reset not allowing the capture engine to operate,
with the device-specific MCU appearing to be the cause.

With there being no obvious xHCI disconnect or USB transport errors in
the kernel log, I'm left to assume this a quirk within the firmware of the
microphone itself. A couple other Bugzilla reports I found seem to show
the same issue I'm reporting here, with Bugzilla #220238 showing a
same bug I'm describing.=20

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

My main question is whether the kernel should work around this in
snd-usb-audio or whether maintainers would prefer the device-specific
reset to remain in userspace because it intentionally causes a USB
disconnect/enumeration.

If a snd-usb-audio workaround is considered ok, I would be interested in
working on the patch and can test it reliably.

Please let me know if any additional usbmon traces, dmesg outputs or
other diagnostics would be useful.

Thanks,

Jazz
