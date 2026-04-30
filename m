Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED559443
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529680; cv=pass; b=LcD1z9Dyf7hmgEkXod61PraGCRml5/sj5wf5yIGvDtAzaLTpxEN/cua10NLsX1hVIcNo+6MSN7ok7w+tOkhkZrSaA03KH6Rrs8LpOk+/7qHdfm6lpIz5UCZ8i3GYyXPOzKJc26ZF2AWWYee6M8TkEUixYaw2VVE9M3CdSWoRgkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529680; c=relaxed/simple;
	bh=d3tGzUAC9OSobd87Cfftdm63q2dFqar/YSj1XdS41kk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MtrihY/GXy6WJ/32Zf78shZaj30Pqfj/OAUEhLn5i3/PYOgWKcp2nFXW3urIAVIVSZT5XqNZSBj8LaXJl6CBllwQ2ueUOgg2L0mW2zuOlYCSPXLaE1of5+6L73VWmlvc5KWewxzaXFp+TQaqRI31c868o/NAbBCL8xFcTd87iow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8rmKlyh; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8rmKlyh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so483178e87.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 23:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777529677; cv=none;
        d=google.com; s=arc-20240605;
        b=TxRgxh8M/P4w+MWQ+N7bFlWk3GdHb+HpoLL45eQyfrujRe4gopJ5G8ErOAMwWpBN7i
         cCO+WiLCYRMJ2hCq0VfCKv8xYm5/ybXUkLIOrMUV1VaFkbsLHtCeI3E1EE9bLQy1k2dd
         DJRxKHsO8LaeDB1B2HpnDOlTBN0W9cLBzX7i1YGLTj4urmCPlKKpNc/Yxb6/joh7pZdM
         h1Ti6T8mhnDEloWO0FT3U8rqO8pQDosJ6rcpfKE/OjJ2tQ/yorjr9e5l6qFjbKCLGVkK
         ljRI6l9BD11cvFbkYQ+0rUZqnfWFCJYpHyA7h5vlDiLdLJpmjlHAwhuM+I9QauQuQDLJ
         niHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=x/qGCnLwlRPUO2j/SZcze5hu+HNTsOOMUi0iTo8gbeE=;
        fh=/SRmtwMKVlnBiKIp7neNX0t1lqP3Ac5EIQf0WLv4lck=;
        b=GrpoYVBchEhsT7nkGQXSYJm1HVRBdeonVcKrk/6/kwm3AnVBTT1zzu8p9sp2lAi8yy
         wedA9BPPFwUEhxZmxDBiDbAqvczCIdzXDOVhPXmupB+MFoqUN6oNEtWJjejYY0yTdcLN
         NfWsNDehrclwqvbK2eu1Nv0vEiH8I60WSs4Gr+AAMTX40i9Ssk85q/suJgaN+/PEGOXy
         KV45PYt3wLG55x1CwqGG6I3msQyiVDShK11HpAYweHEQF7OQ9TtZmxKxzIljb7TNsVzv
         wEuwc+bMpMS4GTCAvY/ou6rry0ljgXNOWETV9zJWZnu76U40euie7sT5h1cowL6zgmWX
         ot8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777529677; x=1778134477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x/qGCnLwlRPUO2j/SZcze5hu+HNTsOOMUi0iTo8gbeE=;
        b=h8rmKlyhjpGzbGjovq8byOEBX25manJU59P6+I7sdZxOC8L2qrvLpYBjEfg/FTGTFs
         gzj2hZBTuCnGtPk7bELjRCRk6arlsSFKI7A9X0zencZH7B8iwzdDgreKaHn23vnLiymV
         XDC7QIoPLLUsso6Or6sTNz0+/TeMiv1rW06tJ8tc9Faj1Z+sWoRfaRDdDn3CJt3khCok
         vHqKj6Hk8jxhv39Io1oWXl1i4kpGzp18CM8A5YGsE869GdZp6yRhyYPB/ARlHjXH9gxH
         rbQCmMChWABvQr5qDdjed7eI9fVYtNWXcotrUNhASMg8IGe0QH+pAa2NBgfZeMa3i9sR
         Ebqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777529677; x=1778134477;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/qGCnLwlRPUO2j/SZcze5hu+HNTsOOMUi0iTo8gbeE=;
        b=eQAMwsqOAfb1XNis5ZJQR43cNYyqWaH3yPsBA+aiWMoLNTCfPmjX+hHDCNrOTw4TVe
         Jm2SYZdYzyieNpoNiLKiylpXBKIGm4EgYlEJmGcaKbWcz+6fzyPGytn29m+4BzInVT5Q
         SttIgaHKaJO/DWrWyz9WLaidBicwELC4679x4k56ZDOipjUrt9IEo88+owcJpbzy7Ryy
         i5yCgZYy6jniIIjfsau+0usAstPbDaLs0h0jbBkpTm72QQSWCxZO8dMTyOumU3VgU9oc
         HiBskjl0cob7O3pQyKFf8de+Oe2tMytoDxkTiDCk2ulX4iAV9zgo6CvjvOXiMLiTzYyP
         ylCw==
X-Gm-Message-State: AOJu0YzTjBB+PxTsFlFgiSNuFOnQ5XPa5xUQv3zs5x8861OqjzyG8nly
	hLEfsxKzLlOjwyykEwZcz3OjzyyVVeNYsprXy0upUezf/eRoMoRp5hwHCiy/IkmQ5bT75JctLcF
	g5vUs+P0FbM8e9aqTJHwNancDtOJYcJ3dDLr7VyU+I/Rt
X-Gm-Gg: AeBDievrPm8lcKODInnP4jjP30ImGFc2S3MmwpZDbhqKaIr0UYudqN16TuLrL1xEj61
	wx5DAz2HAiSNjgxRuHgnNdH7M1iE9uBzINwi0ujljUG+c1c7MUZ/np6pQMFAoGParoU7NvNKZkG
	0s4VxGpE9U9yV8O+0U8UEE8kR3sw4oQ0eHJd1sktRL+3AyRVuebe+DAgLkB5yC1G5KNMhsCW5Re
	3qEra2o/AKRMHR+Eg+na3mDRwO9/E/QXxzYWb6OfVPG170ph8b6bdkdKj3JSfVgibdS2KXVIuM3
	YUl7lhy1Cpqa6DXEpPnZ
X-Received: by 2002:a05:6512:224d:b0:5a3:ff48:f7db with SMTP id
 2adb3069b0e04-5a8522db507mr496883e87.34.1777529677170; Wed, 29 Apr 2026
 23:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: weikang feng <fengwk94@gmail.com>
Date: Thu, 30 Apr 2026 14:14:24 +0800
X-Gm-Features: AVHnY4KL5sUk8N5Uq2s48swm6dEG4CwL_hc_F5BKsOLma3EFvfNoTuXnsRHJZJg
Message-ID: <CAGc4AAQqoFHSeqh1G-55aL+jq0TywtPmGeoorZ0ZUH=0TGfX7Q@mail.gmail.com>
Subject: [BUG] ASUS TX Air FA401EA / AMD ACP70: No matching ASoC machine
 driver found, only HDMI audio available
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com
Content-Type: text/plain; charset="UTF-8"

Hello,
I originally tried to report this to linux-sound@vger.kernel.org, but
the mailing list rejected the message because Gmail webmail added an
HTML MIME part even when plain text mode was enabled. So I am sending
this report directly first.
I am reporting an audio issue on an ASUS TX Air FA401EA laptop.
Hardware / software:
- Laptop: ASUS TX Air FA401EA
- BIOS: FA401EA.304
- Distro: Ubuntu 26.04
- Kernels tested:
  - 7.0.0-14-generic
  - 7.0.0-15-generic
Problem:
- Internal speakers, headphone jack, and internal microphone are not available.
- Only HDMI playback is enumerated by ALSA.
- Desktop audio falls back to Dummy Output.
Observed data:
- lspci shows:
  - 65:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI]
Radeon High Definition Audio Controller
  - 65:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
Audio Coprocessor [1022:15e2] (rev 70)
- aplay -l only shows:
  card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
- arecord -l shows no capture devices
- Kernel log contains:
  platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found
PipeWire and WirePlumber are running normally, so this does not look
like a userspace issue.
This appears to be an ACP70 ASoC machine-driver / ACPI matching issue
for this laptop.
Please let me know if you want:
- full dmesg
- acpidump
- dmidecode output
- additional debug logs
Thanks.
