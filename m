Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2F1DEFE6
	for <linux-sound@vger.kernel.org>; Sat,  2 Aug 2025 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131582; cv=none; b=ANgcFnxdjm9W/zjsIxDcvhbq1jyQpT5D3gdsOsYpV8Je7GsV+DPsbIH5yOM6Gd0x+53VMY3u8tdckiOTxgOmBAWzM8fbHZBvMzkcj9M7tUTy+xXWO67B0iaqXL4jCFcqK5DOh2X0BarTnFyDTRP4epYNwvuQk91b1OthmI0Sxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131582; c=relaxed/simple;
	bh=GjC27LUcG3dn5srVyYuXU1hib0j8skFeguiq7xLh0n4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Tp3jxrIyD7x/yxThKRa3vyU0qYm0kP18WhFDbXfVRa/Xeby9lvjqAliuXzKgViB7rxVtIR3260vzQ2cj+P6v0AQbvf9Mh8CIoB6u0pEbFaDe2vATOq5euA7ctZT9tDp49VvOzWgsBCdRvU/pqca/lUrC/UehtUTzO7/xeLqeR9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=tometzki.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=lbZ4l0E8; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="lbZ4l0E8"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4fce686dd78so535779137.3
        for <linux-sound@vger.kernel.org>; Sat, 02 Aug 2025 03:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1754131578; x=1754736378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AshJ86qbLOcrlRovTGnUwx2kL8dbcNk45DlyMc1ddH4=;
        b=lbZ4l0E8dBCLmI+M49z4V99jLK/jOGrnUXPnOdNpsvInZbs39VH0ksXmeIHo4o4atm
         uOtq4Fe7ihum+cdoU+UNYfElWGljMSsCsT57JzSjJfVwfJqmuK3OkTy7XH7UuXsSERIy
         hpHre50sVU6Qho7GIoDgCMlOrtjhbBMJGnDmRwEeSF5EeiO2i+DwwTzodY2WWSICmIL1
         L9hFDTMChWb/u3DqMg6WirtRehNqcQ9jhidRemphJF2Yrb48pZPg65UoD6dZsvteyuI8
         vKbqv5Qq1ZKTL1qB45J+XdpnLq2fkFOekYRRlTIWb6zrkHWRUjEbuhD5IwWV+cs6rakK
         OPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754131578; x=1754736378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AshJ86qbLOcrlRovTGnUwx2kL8dbcNk45DlyMc1ddH4=;
        b=DItUCsdMTJaLIcPwE9p6OvxFK8pafa8r3krIjr8oaDp92JGCUlBfAz7Q2pQO1vE/YF
         hodYMF+Nbd/nXsoFNaO0XMyMFGfNEqTwCN1XZNjq0bzlgKVxiSIjTOYDx5BKRebd/Lx8
         51hX0b7yP15KCQHL1knFN04pKo0spvStLBGdvgiwZi9mrSiNeon2eFLeTnRDqBgKzzCG
         JvUtRWBIfDIGXZSMFoRSo6EYdht/1UdkIx3CuXVf/+GRP2b9K3TbcDLVdI0f4Z7oyhZr
         j/t9C9RGZUBypBWiZgyJ/WwrWg7szxVqegOsdksxDzq89SQ/YXNkXL9BJ24roeNb391Q
         3+fA==
X-Gm-Message-State: AOJu0Yx0d2dwA6fD/Cb4aONSOtE7acczqFP3VvR2BB1rb1dQmLkOIRug
	a9c+QKsxUdf+QlxDg4he4OHx4uGFLPV1HXs4UK9yBcujQZ9ZeXrFw0s49fmFjbAuGs0dL5thHHk
	9jepYoa3zGOx/Ql9CXXrA4ybbBdkG5KlLZ80X6BtejtM56rv8aYpxza+yovRp/tA=
X-Gm-Gg: ASbGnctkIW+bhrGRG1jTBsPZpYUAE0uxyoM0Do0ZTJycFAILkIKkUtpTpmqf+KK2rSU
	YtTx47+a6fle15xhGgYP9AG7JaavSXnvP90hU3WlAwOANQH2DWHHvmUR+1eEUOcDiowlI3HzTHK
	xiW79k5GT7JTyfzfq+wale8sBGwRilu0BNT4M9frN3xks9w/XZdjpemToAm33mXil5ozDSzbBhM
	oHScake
X-Google-Smtp-Source: AGHT+IFNMQJlun1qhxFHABWfxEe4KXtT3gNasKqMjDslvq9o8yprzFRDSd2OfmO/KqUVhWtkOIuixDQkpA+9Ab8xO2E=
X-Received: by 2002:a67:e7c8:0:b0:4fd:b392:c500 with SMTP id
 ada2fe7eead31-4fdc3c23228mr1068821137.24.1754131577856; Sat, 02 Aug 2025
 03:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Sat, 2 Aug 2025 12:46:07 +0200
X-Gm-Features: Ac12FXw3uVxz8cdzoSLE1B6V0R4dpw0ngfLhuQZars8kAjQDrE7g_cZeOxT1qlU
Message-ID: <CAL=B37=-_dBswNrQHc4dgfgZhoyjmaYQxE5dGZhQeB0ZGf0GtA@mail.gmail.com>
Subject: ASoC HDMI errors with sof-hda-dsp on Intel platform (no PCM for intel-hdmi-hifiX)
To: linux-sound@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm experiencing ASoC errors on an Intel-based system using the
`sof-hda-dsp` driver. After boot, the kernel logs repeated errors
related to HDMI outputs:

[   90.933290] snd_hda_codec_generic ehdaudio0D2:
snd_soc_find_pcm_from_dai: didn't find PCM for DAI intel-hdmi-hifi1
[   90.933295] snd_hda_codec_generic ehdaudio0D2: ASoC error (-22): at
snd_soc_dai_startup() on intel-hdmi-hifi1
...
[   91.016259] HDMI3: ASoC error (-22): at dpcm_fe_dai_startup() on HDMI3

These errors are repeated for HDMI1, HDMI2, and HDMI3. It appears that
`snd_soc_find_pcm_from_dai()` fails to resolve the DAI to a PCM, and
this breaks HDMI audio initialization.

**System info:**
- Kernel: current Linus build 2938ae2fa7cd
- Distro: Fedora 42
- HDMI monitor with audio capability isn=C2=B4t connected

Is there a known fix or workaround?
Thanks in advance,
Damian
