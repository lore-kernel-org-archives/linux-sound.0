Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB59D3EAC71
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144761; cv=none; b=Ry90FYQ/qeYF1GAcr8USzdQ5SFvBcdQAipvQmQpbrDYh5LeZOY6R/oKyb+Y9buyuz2a8blYvZKnaH1qeeHtQJ/ee/jwJ8zmdyhxKogWn6bd7NqkxFrttpm1qqSuN2rSA/Vf1zoZYocx1rL8HNoJMVJ6GuGr9oEDh0VBWpcE4tQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144761; c=relaxed/simple;
	bh=bC3WdLPmIryizyFVCpxJblIsGFp7sKD42r5yPP2ZpqE=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=mqLlnGh4Z38aktWvrmX/Q4q/8SFQiW5Nfww7uv6Sc2yAXokEunJElCBqZKygeN3zTm5PI6L8JvXPrxitgY8A5NxN4zh3AMI5hQEjpnUBEHWR7E0jXqqgne1c3x9dNnd6UIazKG1zIuhSiK+0RqutHgOpI6u6N4cM94UEKKEesGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUSxhBfU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUSxhBfU"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2853616e87.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144758; x=1785749558; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AMZlrirgsRbEo18m/kUv9gZpV2LFxg99OP4vUAS4t8c=;
        b=hUSxhBfUQcWSMba4JUL89TP+0oCmCramd8gr8y4VcUdwkQjSX/hvPDsaLoJv8LxXsK
         0eD+k+VHELtFCSAr9wWuLpMlRBmqedeeScd5wUgfV9LYUAm9Qm3rzQmP8Mw/VRfiwb2n
         Y1oUXrFzS33mbYYbL7caxXNyBePHZ2ZeGixswqcKdsZIyHyC1mgzUHb3LDPq/UyTMuAB
         d2nUNDvTyrCuFXME+RuVS5klJCzjbUi4Nm/ZOmH/EWmUKWmpMye6Kh5fRuwvSRWTsJb3
         FUk0Ti9ryTFnLIKjxSe//cZiOwjtfQgzennov8cb++Si2RtqfvL7XNMvj8MkuS6cpmPS
         hImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144758; x=1785749558;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMZlrirgsRbEo18m/kUv9gZpV2LFxg99OP4vUAS4t8c=;
        b=Ztagbrj/9OfxsmK2K+GeApWNo+cLwqj3OcJaoPGsDO9xZu7n9/aC022PB/JyukonWr
         BPSBjrcql2mcsFaV96fhXH5ImXCM8HWNJ4JYm863tHA7lf3G8ZfxSU8o0c/2EK8gRXiG
         SzRNr9Lbvj6I0g+bTkQAC6WfCm21pRR1oNkC+yNOOeMFjpfwmzgtedp4J5Gq659e5cn5
         K55qlJzpGze4JiIbg52rAcxJH2PRdKqiRusyVuxyvi15slZtJOLJ1pGLdw9HzT5Davs7
         9XLulefm+XFuYRidJR6/4vagMpSncR7WqsrlCVOHzG4vqagVrjKYEiIipHQ/8U5UbkfX
         6hTw==
X-Forwarded-Encrypted: i=1; AHgh+RplsJHzDlc/fmZMtGb8FMQwcarPlfe80YTRxqUzNT4emqkfO/UQ1A4Xw5IAMTxPIJy4kavzkq0ELbO1Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUg8uqPjDtpM2b+C7Bou+kcxP/xCbEVx4l0g3fdSINjTvR0dbH
	KJM7zE531HGsOg/uCYaCoCfyMzfUmFkXLLcwct1vXStp2cFj5FyMDSet
X-Gm-Gg: AR+sD10uz4g1BvWyZvsxtFh7jVNuL8/WCJ/PDVOChvSjKVYN4fa1IaHzenB8nMU59GQ
	/21aEDwKvVYmsJnLL4xwx6JaFrc2cINygDruViMeFOgzQdVfP/G6E45jE+4Ho2iEIJ3RuWxSQsF
	UcuGMD6JzuMApCouEjm/wtpbWnRH3FGwjNUhHGf4/4YJvnaBASeKCpozDGApqyrMuA14gjzZBJB
	X/v8SI1D6wWDfMxraProH5O9p3K1P1RZ0gFAqWzGvh5GQKpEXrT+VIy91EZRAFxAds+b4HqD640
	SBfgVYeQGL1LwdfCyCWSjrcL2TWE0hbau7pxemO/VO/Lq4pQ1dVtKKVUvuQHMcF1DV7HGUPQPUk
	6k3mLXKvGClSF4f5Dl3vKMYvM0B5eu4gpN3hjNCP7+YSnyOY6b8CdW6jX2bO0lT9CbNABxfrXHQ
	8=
X-Received: by 2002:a05:6512:3d8e:b0:5ae:c926:fc18 with SMTP id 2adb3069b0e04-5b2c1b549fdmr1287385e87.38.1785144757581;
        Mon, 27 Jul 2026 02:32:37 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d84fesm1308646e87.47.2026.07.27.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:32:37 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:32:35 +0300
Message-ID: <68c1cc6c645185a255acd0c6a73fac7d@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: Re: ASoC: tas2783-sdw: calibration firmware not re-downloaded after s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <13a5a03d-8263-443b-a6ba-84d954549b2b@amd.com>
References: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
    <13a5a03d-8263-443b-a6ba-84d954549b2b@amd.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
    Antoine Monnet <antoine@montane.tech>,
    linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
    broonie@kernel.org, lgirdwood@gmail.com,
    vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
    pierre-louis.bossart@linux.dev,
    Mario Limonciello <superm1@kernel.org>,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Thanks for the quick response.

> restoring the dma ring buffer reigsters, pte programming along with
> re-enabling irq mask will be done in acp70_restore_sdw_dma_config()
> function which will be invoked during resume sequence.

You are right, and my earlier description of that part was wrong - I
apologise. acp63_sdw_pcm_resume() is the SYSTEM_SLEEP resume callback and
it does exactly that for every live substream, and it has been there
since v7.2-rc1. My claim that the ring buffer registers are only
programmed in hw_params was incorrect.

I have since measured it on the hardware instead of reading code, and the
measurements confirm your point: the ACP side is fine, and the audio is
lost somewhere else entirely.

Setup: ASUS ProArt PX13 HN7306EAC, ACP rev 0x70, two TAS2783 + RT721 on
link 1, v7.2-rc4 plus 5893013efabb. One s2idle cycle of 147 s with 140 s
of S0i3 residency, i.e. a real power gate. After resume the speakers are
silent, with no error anywhere in the log.

1) ACP registers during silent playback versus during working playback
(after the card profile is cycled, which restores audio): I dumped ring
buffer address/size, FIFO address/size, DMA size, watermark, stream
enable and the SoundWire manager block - 72 of 78 registers are
bit-identical. The only differences are ACP_EXTERNAL_INTR_CNTL, where the
silent capture has the extra PDM_DMA_INTR_MASK bit because the mics
happened to be open, and the last immediate command/response pair. So
acp70_restore_sdw_dma_config() does its job.

2) The DMA is running while silent. Sampling
ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR every 500 ms:

  +96064, +96000, +96064, +96064, +96000 bytes

96000 bytes per 500 ms = 192000 B/s = 48 kHz x 2 ch x 2 bytes, exactly
nominal. The ACP fetches the buffer and feeds the SoundWire FIFO for the
entire time the speakers produce nothing.

3) The difference is on the peripherals. Dumping
/sys/kernel/debug/soundwire/master-0-1/sdw:*/registers during playback,
silent versus working, the whole difference across all three peripherals
is one register, on both amplifiers:

  DP1 0x104 (DPn_PrepareStatus):  silent = 0x3   working = 0x0

with DPn_PrepareCtrl = 0x3 and DPn_ChannelEn = 0x3 in both cases. Since a
set bit there means "not prepared" (the core polls for NOT_PREPARED == 0
in sdw_prep_deprep_slave_ports()), both amps sit with their port
unprepared while the manager streams at them. Nothing notices, because
tas2783-sdw declares simple_ch_prep_sm, so the core skips its
write-and-poll and the codec's own tas_port_prep() writes
DPn_PrepareCtrl without ever checking the status.

I have sent the details of that part to the TI folks in a separate thread
so as not to derail this one.

I will file a Bugzilla ticket with the full dmesg (dyndbg enabled), the
register dumps from both states and the DMA counter trace, and post the
number here.

One question while I have your attention: given that
acp70_restore_sdw_dma_config() restores the DMA configuration on resume,
is SNDRV_PCM_INFO_RESUME on the SoundWire DMA PCM intended? Intel does
not set it for SoundWire, and with it userspace can issue TRIGGER_RESUME
and skip prepare entirely. On this board that path leads to the silent
state described above, though after these measurements I no longer think
the flag is the root cause.

Thanks,
Andrey
