Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DB3ED3D8
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144772; cv=none; b=DPp0llGYZolg8aXOnOewJ49e3mh4kxJpcqEpr1m7eQjRl9RhXyNNb22BRz61PEHrO2H8CShEvc3hqiRQ4kSkWjFpfVgrFc1CKJJ6BWoU0y0kPdDe0XGcIwYq+xEPcReOgQB1Bd+53ppID9o/bBkpEanSMjVUtGdAjeLHNXJbW9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144772; c=relaxed/simple;
	bh=bC3WdLPmIryizyFVCpxJblIsGFp7sKD42r5yPP2ZpqE=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=lZ53dwT8W91C3NvAckIL4DKLk7V9DvZMNzTlK5K3aJKpoej7Lb1hJV+Ll7UxmgF54G+fGAiCqL1BJO33DZXTUVfOrvIw98yGeWLdrvAwhElbXQ8xXys5VFfA/QT3tmgCee5PA0j1Y+QDZOhtjlQYDrUijEaXlenBUk3lx01ECRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTejIiCv; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTejIiCv"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39d4c864bfbso21013391fa.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144768; x=1785749568; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AMZlrirgsRbEo18m/kUv9gZpV2LFxg99OP4vUAS4t8c=;
        b=fTejIiCvv6znorHCmzdIgh5WxQOvhtqfDN+RN/hYd4/+o8XGJe0WnQcqlzr/CXizI1
         LJNIEQC505o6S4Y9mFnClFJVxmsTtFqXll7EMsLrv1v8LWVS476VdM0W+viJPHdpJGDx
         fusHVgDMZEoPuMrgQBuf/KkEdVhkrLxFBXHiYKMCk/ANAbWUS06ezLSEtAWClS+ApA6r
         AU5VMHk2K284LEIcHtdN6J1BHYPl0P5dtSF7oAgZNPat9DKjgKvbY9dGji/oWvBgkhgh
         ffGdaL8uP56E0qIjaWqJgZdzHLkz+sIySQmcetEuwt+lGD/hpH8QKgUzy0hkjtS75S53
         4RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144768; x=1785749568;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMZlrirgsRbEo18m/kUv9gZpV2LFxg99OP4vUAS4t8c=;
        b=PX7L2HZ+jgjqdZS7T4IfysNzWgfdX+NSrSqCaGnhpHm72R6le7aOFRBNic+IVjcMw5
         9iY7DSQx5XWJkzmgKXQn0op2iVe5C/HUZBi4d2B6Gb6C7o2fFWkeYUoi/ekBhmtgoNIY
         phg2ZGOuG67eXscOoe46Usl+YgVeoCQ97hek+URCG1dT2iF+k+hJfPKQOchWGw+cFHqh
         4AHGFkMi5LhZIr8CPhi2c2CZ/3xjmVPdvEADD8xjqIuPTi5n8TUm2YwQQfsccxVZPVVH
         0NjjXe91KXzy1ZVyswj56qCs0CPv4rgjyuuKdT76ti8ftK+Luexksd8D6DqxBS/Hj+Ql
         3tOA==
X-Forwarded-Encrypted: i=1; AHgh+RpKKAVtT+JHBAoiODiaAxH8f+wjRjLpHQ+Dmtnc6yp+k+lsVEYK+/vHJN+edZ8UWOLmH3anJa84RWb2rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmVObbFUod4eoivOMYq0S2BU8c4QQF4oaRg/8mqXc0hRo5fzN
	4CSF/1GvVWwN+TBF87NWd7LzikIGxEmvKHgwgQFjlURFnmIM2IWe1AvA
X-Gm-Gg: AR+sD11Gs/t2NjjlN0ywjGlvW5mL9Ju30lf5dYDWS3BklJT1/U/+Y7seuKEBL5DvY24
	VZgGN7dm9HEggdTijuSp4LIQSamQHIewz3yUNq3ys99cNW8iEhZ5oSeo4v6xF3U4d8DFyzO4UgF
	Qj3vJypWq2tv9dZWlpKOY9MyzgF6PvokyDbUf4F0ggJc8hVHUNQthjgJaJs38sLcw343oZRAVOS
	yW8Osf5+dnl05dX7sKj3nCneGEKHIQ2wXeMFr3dPKj1B3SXkkrTCLn4UhMK+qTjPrjFaQ1cZd8x
	CGK6tsFBAzCaF30d98PdcACLw8er9HmNIbPssmWwH3LOq07i80hTHG5Fp4oLy4pZs7r0HEyZqGt
	C8Dh0xJo1N4d3ZVi4jEo6ejHfT8mNKoWxV/hluKQYe+BPWplx+qI9n/2UIdw1nHsAtbM8xq1Bk4
	Q=
X-Received: by 2002:a05:651c:1a2c:b0:39b:894:b01d with SMTP id 38308e7fff4ca-39f2892e2cdmr9941981fa.41.1785144768284;
        Mon, 27 Jul 2026 02:32:48 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2227201bsm11677431fa.42.2026.07.27.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:32:48 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:32:46 +0300
Message-ID: <71a60288bd13a6cf450981e1d5d0dbec@gmail.com>
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
