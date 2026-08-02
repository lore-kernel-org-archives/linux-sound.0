Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4E62E7657
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785690303; cv=pass; b=bnSSgE3FSvNrAStwBu192SYRq7MU4cEbkS4xfq8sM60ouhUr8XItQguySMDh+3SkJ5YcJljNBzE8wKQoONBiyfkuTO1eej3ZHB9kik4hoEHiApHiNZvFdl9sEHDtLsNqGi3nfZ+76ohBOA2HW1thVSUeMyD82aMIrdZ91KB4CO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785690303; c=relaxed/simple;
	bh=BgPCwKAUzTDerVq4uWfPtExzIIVJazRkSMk+aPiXeA0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZxgY+zAxKDI7M4cGBr1CY2QIz7quCt1YxXXFIAQy0NLZLznDth6riLzJ1F6X/p5UPU6JGK+j/iHrvKLIbLjC+Q9rlfqp01v3OSx4aFZA+Wc27mdylZgSK/l2WCOB88OcfSATdTtAJohTj0FkYGP6UJvaCTciFbHOVF1ZsQGZ0HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qcb6J3lT; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qcb6J3lT"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c15bf5000so10680711cf.3
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 10:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785690301; cv=none;
        d=google.com; s=arc-20260327;
        b=h0a3LPN4JLNDpJifDD7Hgjd+zgQRf2rWkUZhZLwmDK6Asq6qGOLKMeJfRPZxBwkWXh
         9W9NNcubhAGwHkNqJFK6Q02cQT7TgdIDewR+Ia6Gm7J8gDbdLn4pDOzi/LgI3jW13/UD
         s2X3m/Jv7e4YWOVb1DB5a4j9O38w16WmQArOz7r2Z/ghs4f7YRKu5v9xtGyEb1n+zopC
         Vp5v3+wndvqS9kt23AiM1f7i+Ziz1K33lCWjeYPhaIBZN86wYXjBeaSRVBvjlFGKiddk
         ETrqjG7VtU9a2TrCkP/qbgS67oEmyvUKbsBfVmET8QtqBv83WKAq03SP9Fv9ThvMzjjF
         JzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:from:dkim-signature;
        bh=+da4BobdZx9vrCJR2X8ridQP5FKqasRzDK+ikQ6NAaM=;
        fh=5TioDRFO7ovtfWveTjubbs0gggxuwh0JTadV9lo06bI=;
        b=eyrBMCMfGvegvuQ5YyG1KsdNOHt10eRtlb9cQqlAf6869itsEtojXFaUXd6ooWwUGf
         XNDQ/DMCaTUaiIFMzUgl1ukbb5lW7gADM3hj+9YLONsE9f29b+qS4PuIjCPYZtw+J0Fb
         ZeAMt6fGpLkJBBXlSshRV0EWUCCfG9wxqaI5Y30Iz1x3a4buZ2LrQ8MiHkZeluod5fzb
         YxPEMCZRXYbOF7+C5eq+jM6+BH7bhXvmC3KuKJa6EPUPapkcrNPutd8kEfeiP8elJ3+B
         TlZSu2DodXJ+Zu/7F+o11v2enSVqyoL0toilEV/8qNYy/H8f1Ow9xeqLmskXY4PlJr1a
         Q6GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785690301; x=1786295101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+da4BobdZx9vrCJR2X8ridQP5FKqasRzDK+ikQ6NAaM=;
        b=Qcb6J3lTW95zwlYYwL4H6ShOjFF2LcDyQhYPg8YHkY5T8WI7HQacu5pOjgYyDAh6Lf
         D32WOazJqww+l/9Wp0p4W+didgkFnMlRrFyDYq61qE4vaJj+MMano4lKMuao5YqxDtKH
         WUpGtzqwrJZzfz3SVA8mQOhl/6EE2NjrkqyOMULaYTJ7e2d+0+zR1lhGLXwZ56OLHQ2x
         yAvHxTzsFj6zsZ03vyC5dV2bAPK9nNqdfLs91oQIgaz2Smsj834ZLHOzJjE3Crx5NXIK
         N7fIgAzi3WQLRCIoXpJm06tDVgfFh/BY++ZhoYQ6CvEpPt/LZ4HxrmY53NQ0y280vRF+
         xJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785690301; x=1786295101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+da4BobdZx9vrCJR2X8ridQP5FKqasRzDK+ikQ6NAaM=;
        b=or5iCgldEMPFcYRhZryjLmpN2JFNussJQJNg2YrXBsGgnwUHmZo+LppHqaDsqB6EYl
         LnT8peFlrhwSnrPQu0uNxRINwhdN31Fsf3XBWOdio6Li4C20xyW74iUON3NxXTlGNa4N
         nnEvXQPFhlyt8v4F8yWXQs4/dNwmVHxQ35P0TszPqio1/3/3VOaLl+e2nl6VqZ5nhOng
         o1XPshgSRMMUIbwio8LHw+rZN0eFuSwZhob5EvbaGBjlrrgYI1MVbVfWSQ1MolSe9whZ
         A5nMOsThI6iv6ldBm8mxiXPA23ljdwIBNYaZPfbrsNhXMVe1TUDIhnUqAsdHr19Fjr0C
         XCiA==
X-Gm-Message-State: AOJu0YxpT8GiNQ+2qJ2sKELfz9WTMzatcx9l9Tv5fAsaB2TysBNGq7J1
	uIIK/2hT90XrSci4trZ3DTUmPjJEtDl+m2+StLc9KtOjO7Wk89gghhXbCs4Ee81O5vT7YZXvCCG
	ZJ8PsD9JU8z7tb0XbE1YS5axU2aKAhtyJjC2d
X-Gm-Gg: AR+sD10WV+QnADkgYEvnMiD/kbYhQCkR2nOD/bYIh2MkUngDIqC18ptSX/VHhxAhrIy
	tpskInqJvfR4iPShPRaeECeK147PaU9adBzFwmTxkXr/eA9xp6aBM1JlIw0vZ/vAilxpQZ6tSuG
	yGZBUOTIKXAKimp8rH6bJuj3WXiVN46OoW2D1OMgUrWh8Dy6F+csGsyi8q/k1cAml/5J+aoXxo4
	UoHPQA3U/bgOIOqvQS1SHdNJxOQHzRgeWG6hHHQxwQiX5A4dBR3RWKgKxB4mcW/Q8XCY9fNVmXD
	vkMkz4vorl5wvNvpN9/QVRzReSZBKo01ZwjvVq1Tg/p6UwjNOGS7jCpM
X-Received: by 2002:a05:622a:38a:b0:528:22:8c61 with SMTP id
 d75a77b69052e-52b567f58a1mr130042341cf.38.1785690301109; Sun, 02 Aug 2026
 10:05:01 -0700 (PDT)
Received: from 874647158048 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 2 Aug 2026 10:05:00 -0700
Received: from 874647158048 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 2 Aug 2026 10:05:00 -0700
From: ramirosanes@gmail.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 2 Aug 2026 10:05:00 -0700
X-Gm-Features: AUfX_mz_2SLYxyGsNHtAsTPsNPbQ11ZWfXacDsnAGa6iPlfCGq1p1RgvJh46X9k
Message-ID: <CALch4NKfxs=GWpru1ncAXYbzD9Kh8-Bm2quif5vzb2nPo6Hnbw@mail.gmail.com>
Subject: [BUG] snd-ctl-led: computed LED state never propagated to audio-mute
 trigger (SOF + ALC245, HP Spectre x360 14-ef2xxx)
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to report a bug in the mute-LED handling on an HP Spectre x360
2-in-1 14-ef2xxx (SSID 103c:8ba2, ALC245 over SOF / sof-hda-dsp).

Kernel: 6.18.41 (Arch linux-lts) and also reproduced on 7.1.5-arch1.
BIOS: HP F.09 (07/29/2025).

Symptom: the keyboard mute and micmute LEDs never react to mixer mute
changes. Investigating the chain end to end, every link works except the
final propagation from snd-ctl-led to the LED trigger:

1) The codec fixup is picked at boot:
     snd_hda_codec_alc269 ehdaudio0D0: ALC245: picked fixup  for PCI
SSID 103c:8ba2
   (note the fixup name prints empty =E2=80=94 possibly a separate cosmetic=
 issue).

2) The LED class devices exist and drive the correct hardware. Writing
   /sys/class/leds/hda::mute/brightness toggles COEF 0x0b bits 2-3
   (0x8 on / 0x4 off) on the codec, and hda::micmute/brightness toggles
   GPIO 0x04 with inverted polarity =E2=80=94 verified by reading the codec=
 back
   with hda-verb after each write. Driving those same registers from
   userspace lights the physical LEDs, so the register programming of the
   fixup matches the hardware (this is what
   ALC245_FIXUP_HP_X360_MUTE_LEDS programs).

3) snd-ctl-led has the right controls attached automatically:
     /sys/class/sound/ctl-led/speaker/card0/list -> 10  ('Master
Playback Switch')
     /sys/class/sound/ctl-led/mic/card0/list     -> 42 7 ('Dmic0
Capture Switch', 'Capture Switch')
   and both are in mode "follow-mute".

4) Muting works at the control level (both via amixer and via
   PipeWire, which does toggle the hardware switches), and snd-ctl-led
   computes the LED state correctly:
     /sys/class/sound/ctl-led/speaker/brightness reads 0 unmuted, 1 muted.

5) BUT the LED class devices never change:
     amixer -c0 sset Master mute
     cat /sys/class/sound/ctl-led/speaker/brightness  -> 1
     cat /sys/class/leds/hda::mute/brightness         -> 0   (stays 0 forev=
er)
   The audio-mute trigger is active on the cdev ([audio-mute] in its
   trigger list), yet the computed state from snd-ctl-led is never pushed
   to it. Same behaviour for the mic LED.

So: fixup picked, cdevs functional, controls attached, control events
flowing, ctl-led computing the right value on sysfs read =E2=80=94 but the
notification path that should fire ledtrig_audio never runs on this
SOF+ALC245 combination.

A userspace workaround (daemon following PulseAudio/PipeWire mute events
and writing the codec registers directly) works fine, which further
confirms the hardware side is healthy.

One more data point: with the previous BIOS (HP F.05) the fixup was not
picked at all (no hda::mute/hda::micmute cdevs were created), so the
codec SSID exposure seems to have changed between BIOS versions; on F.09
the quirk matching works and only the trigger propagation is broken.

Happy to test patches or provide any additional debugging output.

Thanks,
Ramiro Sanes
