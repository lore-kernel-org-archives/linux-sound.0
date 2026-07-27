Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B73DCDA7
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142126; cv=none; b=ts2azpvAvvxiBkKmbH0GXvxux5N77zZFZDkrYaH98MrkV6Te0LPPz46npvZ1rkYvrhtfJ8G/5f3fx9Vd1hrD/VQqICS6KwhkKBLam88OKEsFh6X84kJ1wQhGSdTdyTyaI2TJHeXLR/Z//8HV+m7O2NsgBB+unEx3frX6/RHw098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142126; c=relaxed/simple;
	bh=SGwfYW81FxYNAiBeKWItdf2GfVXUFb7wXTN9n+YbMuo=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=D4xa4H+favlsakg72OJBTPl8prvJFWRDyW2Gq1G5sD+UT+x3ZNTYwhlql4/eA3d8k3CugjGBjleEC8saWnB6g0ByPfXk/VvQzzG84xZwKoj2UIIuRCeicctefkq4obSDb3IsR63tpF2sIzXuEZKrxmAv9yBBjEfnhAOBG68v8a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd4i5JTr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd4i5JTr"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0117dda13so2332076e87.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785142122; x=1785746922; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ekyw2UUXFURS8L/UD+ZnROGbMPTa5zPXUVjONUoP1Z4=;
        b=bd4i5JTriESQdMTFK8Slv6rffsgD1d8PVrZKhhxe4uYy/z+3u4uW+qKis/yBo4kPq0
         DuyuMyxfVEu/xB2wsZBIO/Mtmw8XauVrC8BR16gF3D9Z0uzPGr+nW+6oW1g2PhVtY/GC
         LetrhkrD2D8bghRMB+NUpgRTR37NZHge10WBuZcsDlNxVw9lY5nu2PQkOkzpkftUTAi5
         spF2vHmduGoBisvIk5TQ8kJ+QcZv256IF3sptoYAFoCDm/otGiPed0VXC+NFfnDX6o2+
         rwq6nuefA8Q+TWytRzbD7DNOvtJly5s1ZaRxcjB/tEhokF2qGlsAn2UYoQVt3DdE7hPH
         TnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142122; x=1785746922;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ekyw2UUXFURS8L/UD+ZnROGbMPTa5zPXUVjONUoP1Z4=;
        b=GVfQxwo1lGr4BDNIj22R44WOOjRI6kpTd4hf3svBSv69k4JPzTR8qPnc9zd5uDu7Rw
         eUV48zC1dVj5iMENS1fEkMlD+cjXG4HIaW4XLCiRXaj7LrDSKpWvNu1zC483hofY4/g3
         vbsFhJDt9hYlZx0AaYGOgasVBKB8aFt/jVOtXOdwzJyjMw1XSpEwblOnmqWQyeQyKYyT
         I6FF5AMrWhHk7FKwL3T5oYj3oA514tV7ahyzGvkPBr/gcRFqnmUQjf9BmLCT8hew0m60
         0PypmpO2kx0lxCIpoK973JbXi82k3uxG7vihvN8AKmyTV0XSewMIwzfR/sbm7lBISf0i
         pSxw==
X-Forwarded-Encrypted: i=1; AHgh+RqbHDB2ojeYQZopTU7O/nxpd3WcECMfAQ4s2mnzVveiMEj0s1Adav4mbHpRA/HzCHMfczW83dpFtKinbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4VSDFSrkuMi/YD7+8Y7i/5DI9/wie5Xjq1vicwkBiWzktQQI
	IrLDxvFrlwU8HqKH+KSvlJiWGNBq7g7rJLb7o2wcUO2iZAau5tK00e15
X-Gm-Gg: AR+sD128h2KDL4JuwYMVLdMV0PeWRpMDhScJFvQEGUGIQ+npBqPKSGWnZYhs5U1OKVi
	MCx6UgTH+bYUBdGRFvbIYeqWgSqfOgmRw+PE3JZS4rVhSqmdsRODI941mnKov1yaNPfVSuRE5ah
	09+G7p5LJTnBRtqVczv3A+AN9uH6SOW6rXVcF1wAEv5fnIauDcDNRjUrPFYPZOLdJw4bt3/LYyH
	eJrYOuNsQ7sloxiIimDuTLBiCYU0BazYjlKSxt6y1aFvZljCLM9kb1IJs0JhpAqQLNqP5/ICHhS
	hz/Nt1b4PVTjF69+30MCvNLFqkDO0ZZdc11vbXibOrBoRyup9mX5fGg4uLXw1TsfUcREal0jy9S
	m+rcmWhCJP2bip4+0Y7amnDPOqOEVQiCT/JjR5aB9JG8Fwux1DoT+GibUxOf9+puYvarO+NQYgP
	w=
X-Received: by 2002:a05:6512:3da9:b0:5ae:c43a:c18e with SMTP id 2adb3069b0e04-5b2c1affc4emr1391379e87.23.1785142122375;
        Mon, 27 Jul 2026 01:48:42 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1f303csm1310668e87.65.2026.07.27.01.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:48:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:48:40 +0300
Message-ID: <20b6c100ec50c0b9eb1dd31a338dbc9e@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps -> mono output (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
To: Antoine Monnet <monnet.antoine@gmail.com>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
    Kevin Lu <kevin-lu@ti.com>,
    Baojun Xu <baojun.xu@ti.com>,
    Sen Wang <sen@ti.com>,
    Mark Brown <broonie@kernel.org>,
    Liam Girdwood <lgirdwood@gmail.com>,
    Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
    Vinod Koul <vkoul@kernel.org>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Hi Antoine,

Confirmed on a second machine: ASUS ProArt PX13 HN7306EAC (Ryzen AI MAX+
395), Ubuntu 26.04, 7.2-rc4 based kernel, same two TAS2783 at unique_id
0x8 / 0xB plus RT721 on SoundWire link 1.

Rather than judging by ear, I used the per-amp mixer controls, which
makes the result unambiguous. Both amps at full scale ('tas2783-1/-2 Amp
Volume' = 20, 'Speaker Volume' = 200), all four 'Left/Right Spk[2]
Switch' on:

  speaker-test -Dpipewire -c2 -s1 (left channel only)
    - audible
    - 'tas2783-2 Speaker Volume' = 0  -> complete silence
    - 'tas2783-1 Speaker Volume' = 0  -> no audible change

  speaker-test -Dpipewire -c2 -s2 (right channel only)
    - silent, with both amps unmuted at full scale

So exactly your picture: one amp (tas2783-2) renders audio and it renders
the *left* channel, the other amp contributes nothing, and the right
channel is never reproduced. Both amps do load their own per-address
blob here (1714-1-8.bin / 1714-1-B.bin, via the fallback naming path
after the 0x-prefixed names miss), so this is not a case of the wrong
configuration being downloaded.

On the "proper mechanism" question: a good part of the plumbing already
exists, and it does not need unique_id at all.

 - The machine layer already knows which amp is which. In
   sound/soc/sdw_utils/soc_sdw_ti_amp.c, asoc_sdw_ti_spk_rtd_init() maps
   the component name prefix to a speaker widget: tas2783-1 -> "Left
   Spk", tas2783-2 -> "Right Spk", tas2783-3/-4 -> "Left/Right Spk2".
   That is where the four 'Left/Right Spk[2] Switch' controls on this
   board come from.

 - asoc_sdw_hw_params() (sound/soc/sdw_utils/soc_sdw_utils.c) fills
   dai_link->ch_maps, but for playback it deliberately hands every codec
   the full mask ("Identical data will be sent to all codecs in
   playback"), leaving the per-amp channel selection to the amp itself.
   acp-sdw-legacy-mach, which drives this board, uses both.

So the driver could derive the channel from the same prefix index the
DAPM routing already uses, or from its entry in dai_link->ch_maps,
instead of hard-coding SoundWire addresses.

Which raises the question for TI: on TAS2783 is the channel selection
meant to come from the per-device .bin (in which case it is evidently
not taking effect on this board), or is the driver expected to program a
per-amp channel mask? Depending on the answer, either the firmware
description or tas_sdw_hw_params() needs fixing - and in the latter case
the amp's channel should come from the machine-level mapping rather than
from unique_id, which as you say is board-specific.

Happy to test patches on this hardware; I can also collect register
dumps from both amps if that helps.

Thanks,
Andrey
