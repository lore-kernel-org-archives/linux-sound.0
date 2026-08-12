Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8346DFF3
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559077; cv=none; b=LQvgPfmcMh275a7g83VhJjzADlGr5A5AzYX1vsfgn5VKZhJC9zmjF6GVjINRk0xre33FLTi0bJEJ/ivbN32t+HKZpkh4qnwvD5Xacyxy1RwI5ixXuAehi3qM985OF8jWSaLNKvU4x9fl5U4GL5WUVabgPJUvQhMdRuBJXRbo2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559077; c=relaxed/simple;
	bh=Koo7v0Fb5UdYLgW7XcF0NA2F7b3UUucD/pZ4ORrMXC4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l5pMP4k1pJFqXrv61iuiVfHttgO2SMzAQAEGLOhB5tVPTYnoNkojgb5RCxDgyTXEzeRMprJkDNrMs8GZXW2t3cQ/7v70iauzU5ku/F7u4JMLv8EddJufaozYaDADzKqkwmJLOPE4Rt4VzkX3lK5M8nng8aFdWNwMpa7IgCpth+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRFS+Deh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRFS+Deh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aea0fff535so1451585e87.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559074; x=1787163874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nK7rz4qwKWvtTmEzzbtksxXgXaAc/okh1s6fZbI9X4U=;
        b=RRFS+Deh4qNoLv5yemQ/I6t6Ha5UWhcgo7nWLlDWuybLw1kD1ntF9Mm+WTTZwTSsWN
         Z501aeUqwKZC6f0nWyUnQDOFVSohK2PR4TYPCCRsyylynv3Lr/ylCoCqPOWsAALWSJOT
         uQ/yLqYRIN3lNdGkraU4Db8HWFPoEmi3Af7ylFJdXdtvywbHDntCAlkzKoM6yTFbdTDX
         d3VWoVq7Ribf3w+uOBo7pu29AK5a3C+VtNVRPl/Zw26uyD9DUJ7KjpTKJ7QIhmMYPm35
         5ppX0uChcWbNGW7p2yibfCuqHLg+dIqhY1M3qeWQq/bfHrQvC31D1uxDzOiZX1xs1Ju6
         Oi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559074; x=1787163874;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK7rz4qwKWvtTmEzzbtksxXgXaAc/okh1s6fZbI9X4U=;
        b=MNdpoj0gt0cCKD0N/D8c4/UW2tewQzQwQFZku3eDbYvM8YwrbP/NJJj17Q0pRpR9k/
         YR55UdBbrhuxzLoGmjev2rEM96P1LieLS+PBfURyh3hpY9PNCOkF1LjnJ2ze3RWU3AzG
         x4mw2JZGn7srC0tQ+R9tDXO0uEtRfAWRWOQyNkpVtTzfYSEU5RYm1e8xZbWj0Dz5hiVp
         enBezW1PZvnHl7EzyUNZ/9ywhrHCiWr/1L2A6AasrLVhddKFep6d977ZonrOrI2vweO9
         E05PQV+uySrrXXEl3KNKkkFDNKOOX1WI2LeBJV/7N0IyMEgIZjQ0U4uoWbjbgt0dta8n
         ezow==
X-Forwarded-Encrypted: i=1; AHgh+RoTgoTSoJdWYzxEANCzwyp1woNS+1Wwb5IKIJx5tFR7l1Nq0NNFI8+T2vSm4s0dPFJdJt0OvKCSAMWhdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxatUhio4IwBOHNn0jnSY7hyYMWvYKijUNPH4A1ioEGm2TQEU
	IPFE0r5moyIHq9S6hnnV7N95JeIGd5hQBkwAuUPO992Vdyy1E875QUrA
X-Gm-Gg: AR+sD10Nw2mGyE/3WsvB5imM+8cLvOWKSzUhgT1qBB/Y2WyW07c3hf9K5IhNuIoTJdl
	4PS8BsRUxesLdpVnJCYrGZ3M4nDOGeKH5PVb24sYYwv/Z5XkEPxhyUFUCuNUOLe/LgYTcqlqa/q
	U+cUXDONgD02HbDVC4UE9OH4k4bzu2LKkA27cqIZxLCiB+pduPpnZQnCQ7mmXORMss+ResrIc8J
	RyhTo80DQN3ksVAmKIfBnRSNWuMROhVksWKaj35j9s3yAd/B/neLRhGJS56SNvuGW2yLZIQTTaj
	bT3sj0Gac8R4RzFPpCrUTE+jd3HrUNpbcYRKodQzJwjvt8anNqgMG/e8lhFL7gkjPu+xTvr/L9u
	5/jrv/MihyPcGZAuh1Y5h2tL4+8Wm/iQKM4alWk9R63Xbc/fS63wsEJZfgT09yWkpDDkBHlhRc5
	p9+tinNiXvvXYfUtqMEm+swbR7Ef14ENdwdNa0XUnVo7iLsn64xe2TB0AtIjgYSr5QUQ==
X-Received: by 2002:a05:6512:a487:b0:5ae:bd66:553b with SMTP id 2adb3069b0e04-5b44e328afdmr735039e87.38.1786559073929;
        Wed, 12 Aug 2026 11:24:33 -0700 (PDT)
Received: from localhost ([2a03:d000:43d1:a982:928:400:c99c:f53d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d035e3csm642584e87.63.2026.08.12.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:24:33 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: port prepare never completes after S0i3, no
 audio and no error (AMD ACP7.0, ASUS ProArt PX13)
In-Reply-To: <ef0cc45a88cf0b5b5a65f7634b710a42@gmail.com>
References: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
 <ef0cc45a88cf0b5b5a65f7634b710a42@gmail.com>
Date: Wed, 12 Aug 2026 21:24:26 +0300
Message-ID: <20260812192500.7714-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have the root cause, and it is neither the host DMA nor the data port
itself: after the peripheral loses power in S0i3 its SDCA Power Domain
Entity PDE23 comes back at PS3, and a Data Port cannot complete channel
preparation while the Function is powered down. The only place the driver
powers PDE23 on is tas_sdw_hw_params(), which the resume path never calls.

Below is the evidence, and at the end a question about where the fix
belongs, which I do not think I should answer alone.

Test setup: ASUS ProArt PX13 HN7306EAC, AMD ACP7.0, two TAS2783 at unique
0x8/0xB plus an rt721-sdca on link 1. Kernel: broonie/sound for-next
(7.2.0-rc6 base) with b627da430357, Peter Ujfalusi's two tas2783
reg_defaults fixes, the regcache sort fixes, Antoine's stereo patch and
three unrelated display fixes. One s2idle cycle with 99.98 s of S0i3
residency out of 105 s of sleep, i.e. the ACP island really was
power-gated.

After resume, with no workaround service running: all three peripherals
Attached, both amps re-download firmware, MSI is re-disabled by
5893013efabb, suspend_stats clean, zero errors of any kind in the log --
and no audio, until the PCM is fully torn down and re-created.


The host side is not at fault, and I was wrong in July
=====================================================

I dumped the ACP and SoundWire manager registers in the silent state and
again after a card-profile cycle had restored audio (78 registers, mmap of
the PCI BAR). The playback stream configuration is identical in both:

  ACP_P1_AUDIO1_TX_RINGBUFADDR    0x048E0000   both
  ACP_P1_AUDIO1_TX_RINGBUFSIZE    0x00008000   both
  ACP_P1_AUDIO1_TX_FIFOADDR/SIZE  0x700/0x100  both
  ACP_P1_AUDIO1_TX_DMA_SIZE       0x00000040   both
  ACP_P1_AUDIO1_TX_INTR_WATERMARK 0x00001000   both
  ACP70_SW1_AUDIO1_TX_EN          0x00000001   both

The only meaningful difference is the linear position counter, and it
shows the DMA is running in the silent state too: 0x017F9440 = 25.1 MB,
which at 48 kHz/2ch/S16 is ~131 s, matching the time since resume.

This retracts what I suggested in July, that ACP loses its SoundWire DMA
ring-buffer configuration across S0i3 and would need it reprogrammed in
.prepare. That hypothesis is wrong: the registers are already correct
while there is no sound.


The peripheral reports the failure correctly
============================================

Slave-side registers, silent versus working, taken during playback:

  DP1 PortCtrl (0x102)      0x20   both
  DP1 BlockCtrl1 (0x103)    0x0f   both
  bank SampleCtrl/Offset/HCtrl (0x122..0x126) identical

  DPn_PrepareStatus (0x104)  amp 0x8: 0x1 silent, 0x0 working
                             amp 0xB: 0x2 silent, 0x0 working

Niranjan, this is the point you doubted on 28 July: the device does update
DPn_PrepareStatus, and it does so per channel -- each amp reports exactly
the channel it owns as not prepared, 0x1 for the one on channel 0 and 0x2
for the one on channel 1 (single-channel masks, per Antoine's patch). The
transport parameters are intact. Only the prepare state is lost.


Minimal reproduction, no ALSA involved
======================================

With a debug module that talks to the peripherals through
sdw_write_no_pm()/sdw_read_no_pm() only, in the silent state after resume:

  1. PrepareCtrl (0x105) already holds the channel mask, so writing the
     same value again changes nothing: PrepareStatus stays 0x1/0x2.

  2. PrepareCtrl <= 0 clears PrepareStatus to 0x0 immediately. De-prepare
     works, and the device is answering us.

  3. PrepareCtrl <= mask sets PrepareStatus to the mask again, and it
     never clears. I polled for 50 ms, the same way
     sdw_prep_deprep_slave_port() does.

  4. PDE23 Requested and Actual Power State both read 0x3, i.e. PS3.

  5. Write PDE23 Requested = PS0. Actual reads 0x0 immediately. Repeat
     step 3 and PrepareStatus clears within 1 ms. Audio is back, without
     touching the PCM, without hw_params, without re-enumeration.

So the port is not broken and the state machine is not stuck: it is
waiting for power that nobody restores.


Why nothing is logged
=====================

tas_sdw_hw_params() writes PDE23 Requested = PS0, with a retry loop whose
comment already states the dependency:

  /*
   * Sometimes, there is error returned during power on.
   * So added retry logic to ensure power on so that
   * port prepare succeeds
   */

and tas_sdw_pcm_hw_free() writes PS3 on the way out. After S0i3 the
peripheral is back at its register defaults, where PDE23 is PS3. Userspace
resumes the surviving PCM with TRIGGER_RESUME rather than tearing it down,
so hw_params never runs, so PDE23 is never powered up again.

The silence is total because tas2783 sets simple_ch_prep_sm, and
sdw_prep_deprep_slave_port() then skips both the PrepareCtrl write and the
NOT_PREPARED poll. The driver compensates with tas_port_prep(), whose
comment says the same thing -- "the port fails to enter the prepared state
resulting in no audio output" -- but that callback only runs during a real
prepare. Nobody ever asks the peripheral whether it is ready, so a port
that never prepares looks exactly like a healthy one.

Pierre-Louis, this also answers your question from 27 July about whether
playback is ongoing during suspend: it does not matter. What matters is
that a PCM stays open across the cycle, which PipeWire does by default on
an idle sink.


Where should this be fixed?
===========================

Three candidates, and I would rather hear TI and the maintainers than pick
one myself:

 (a) ACP stops advertising SNDRV_PCM_INFO_RESUME on the SoundWire DMA
     PCMs. That flag promises a resume with no stream re-setup, which
     SoundWire cannot honour when the peripheral loses power; Intel's
     SoundWire DMA does not set it. Userspace would then have to do a full
     hw_free/hw_params recovery, which restores PDE23 as a side effect. I
     have this patch and will report whether it is sufficient on its own
     on a tree that carries everything above.

 (b) tas2783 restores the SDCA power state itself, in
     tas2783_sdca_dev_resume() or on the uninitialised re-attach path,
     when a stream is active. This makes the codec track stream state that
     ASoC already owns, which I do not much like.

 (c) The SoundWire core stops letting a stream continue silently across a
     peripheral that went UNATTACHED and came back: mark the runtime as
     needing re-prepare, and fail loudly if it is not.

My own preference is (a), because the promise in the PCM flag is the thing
that is actually untrue. But (a) fixes it by making userspace do the right
thing, which is not the same as the kernel keeping its own state
consistent, so I may well be missing the intended design.

One more question for TI while we are here: given that tas2783 needs an
explicit PrepareCtrl write anyway, and has tas_port_prep() for exactly
that reason, is simple_ch_prep_sm the right property to declare? Dropping
it would put the core back in charge of the write and, more importantly,
of the NOT_PREPARED poll -- which would have turned this silent failure
into a "Chn prep failed for port 1" error line months ago.

Happy to test patches, and to run the register-level probe again on any
variant that is useful.

Thanks,
Andrey
