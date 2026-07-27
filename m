Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85B3BED33
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144806; cv=none; b=FYcLT3ohMqohkbKw3y2W0AMUhq8IWiA7OxBRiRFsGsKdnKk+Sobkujsrp4Z7ae9r52dL6rwoXpRlJSbaba6DTJO11UT0j4a9/lacp5ytHfTln1XHXbQxxI1028lrivAHLQJEuGeJ0MTkXONi+8mcaBOzByQsgUJJR+LKYSpeUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144806; c=relaxed/simple;
	bh=GPQyzSacBfxZa7OHM74FL8HcQqggL8l1KIa6Je1ONDw=;
	h=Date:Message-ID:From:Subject:To:Cc; b=DI/r1XDNMi0aZu5/hKUuDVB87unsmx1YJAroiKMYPvY+oIbo+ZlZHxpCxgFFOL78HSqQpeEHbAprAmGDPLS6QKUJT2jmWpRUu5B7KY01hI+Ae7beC2yP2oy+i0wsQmaFVDXjgX36EQ1rsW6ynZnTn3gCxOdrSuDU4QDVrIjAMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqj3sIg5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqj3sIg5"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39ca300db70so21555621fa.2
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144802; x=1785749602; darn=vger.kernel.org;
        h=cc:to:subject:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGL9ApjNmqhcu6YB6bL9PVFDWC2YT7Q9eHXKTlT0TXI=;
        b=hqj3sIg5cW7EjKxq4E6cJmEa/QrHJttNusOy5XNKhcoyW/DBptsWa+rYGjuKAdHBaT
         wdK5S9IuCrNkvaxX+yiZO/ihw+tLaUona89FaqR4tVaxOLvDexryKAcuyq6y61KfFJ3U
         KD+HQjr2+l3Lhk9Fz0jvKXboYJLxEczIHm8E33Qsxmm2Muf2J2lTglutwOxryT1LmN8F
         kV1ysbqR3Y80yafvYExFfPIXboiuRajBfoh6wahN8GU/7gUGUDJqeDOMQkEedmZKUdBa
         YJZET7qXIQGL1oFJgHM7RWCVohQzOmChv5t5pIy9Xjqt2TRM2NdqFgFTfr8QMdvsIe/b
         6Fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144802; x=1785749602;
        h=cc:to:subject:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGL9ApjNmqhcu6YB6bL9PVFDWC2YT7Q9eHXKTlT0TXI=;
        b=HtqhVWNXaqcD+ymIXRw+1OQJueOMRVGOo1u35iqmSO7JoW2Bxc/blNblZpn0Gz+wb4
         pnPnxuxLW6X6rOufLFMItZbRgrKY4CyUf8Z61seDiGsp7x0mD0X90Rpq95s9Ax7z958r
         +zl54PsT4glqYW2hibPSfndZY53YSUpNiLXjw1pPOECSEAAE5v9hj4Xz3uIUoGHPvru9
         6jKAlg3PBr2kGnQYGZOzG6EhmtIUsdX4T6JN/7AFDbv6K3ECz0lK62d6JepaWqmaSwWG
         Sv15kbuH3GKYy87DhFcZLPDY90rVtlEKmbD1SyDbTOGgUIefNvBrhEdGWGBO2sFQ+C4W
         OZQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrueo2Y/0fBMsxx/Wmw+vLRDUTnEq7unA1kFiTm2u1ssFJAGyWwQMkGr8e+JWG706Apn87b7Mw1CLoqYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyafDuPjhlRd1kHT8I2AvbB8CtxG/9x+BDruH49dOlccvfZM+x
	CFyPrH9oGh8PwY/ikMgDtigOTXkoK/8AifFXg5dSndRn/T62U+kpRjl9cZW7yHz/rFfP/Q==
X-Gm-Gg: AR+sD11x/+LiVQWlQAy80IdiYO/hyT1EzsPKnWKupSlBWI1oMt2RYUl/hxTNW2Tk0cH
	31pz2UQ0Gvc3ZPqyop4d6v2nC84HvDdN42YY9fgvyTgsia4Yt7Xl8IwB5xaJVF0cWW28ceokgLR
	6QeWguLjGH4YW0uhVZm1MtGpOmCpwNP//QcchaBCsRsQdXh7cI9krnYCvP1frX/J6N/+7wAibqH
	sM9aq52708SyYrJQVEwJxXsu1q836NIGZ41CjON/y0+0NDWaRKhbQgBKgg6bcEH55kQxm16+5fl
	ysZdiyvYiInH9GdGvuXdTzTWXhHhcQ3DvwbJpN6Q0a0/FMHdsm1pAYiRobsaDW44k6+2i80siXc
	QDP6X4ltQlKP7+HT71nBYQCysjLC1TaM41oakG4kBAfXxnIloiCKK5sqC42YbhQjBa5tuBWF5CH
	g=
X-Received: by 2002:a05:6512:3e29:b0:5ae:b357:1d1a with SMTP id 2adb3069b0e04-5b2c1b206edmr1428851e87.8.1785144802097;
        Mon, 27 Jul 2026 02:33:22 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224cac4sm12734981fa.32.2026.07.27.02.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:33:21 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:33:20 +0300
Message-ID: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: ASoC: tas2783-sdw: port prepare never completes after S0i3, no audio and no error (AMD ACP7.0, ASUS ProArt PX13)
To: Shenghao Ding <shenghao-ding@ti.com>,
    Kevin Lu <kevin-lu@ti.com>,
    Baojun Xu <baojun.xu@ti.com>,
    Sen Wang <sen@ti.com>,
    linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
    Liam Girdwood <lgirdwood@gmail.com>,
    Vinod Koul <vkoul@kernel.org>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
    Mario Limonciello <superm1@kernel.org>,
    Antoine Monnet <antoine@montane.tech>,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Hi,

On an ASUS ProArt PX13 HN7306EAC (Ryzen AI MAX+ 395, AMD ACP rev 0x70,
two TAS2783 at unique_id 0x8/0xB plus RT721 on SoundWire link 1), audio
is silent after resume from s2idle whenever the platform actually reaches
S0i3. Playback runs with no error whatsoever - no XRUN at first, no
prepare failure, no bus error - and the speakers stay quiet until the PCM
is fully torn down and recreated.

This is with v7.2-rc4 plus 5893013efabb ("ASoC: amd: ps: disable MSI on
resume in ACP PCI driver"), which is what makes the peripherals re-attach
at all on this board [1], and with a local fix that drops the stale
tas2783 regcache on re-attach [2]. Both are necessary here; neither is
sufficient.

I measured where the audio stops, and the answer is not where I expected.

1. The ACP side is healthy
--------------------------
I dumped the ACP registers that the driver programs (ring buffer address
and size, FIFO address and size, DMA size, watermark, stream enable, plus
the SoundWire manager block) during actual playback, once in the silent
state after resume and once after the workaround restored audio.

72 of 78 registers are bit-identical. The only differences are
ACP_EXTERNAL_INTR_CNTL (one extra bit, 0x10000 = PDM_DMA_INTR_MASK, i.e.
the digital mics, unrelated to this stream) and the last immediate
command/response pair on the bus.

That is expected: acp63_sdw_pcm_resume() reprograms the PTE, the ring
buffer, the watermark and the DMA interrupt masks for every live
substream on system resume. The ACP DMA configuration is restored
correctly.

2. The DMA is running at the correct rate while silent
------------------------------------------------------
Sampling ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR every 500 ms during silent
playback:

  0x000002FBF880  +96064
  0x000002FD6F80  +96000
  0x000002FEE6C0  +96064
  0x000003005E00  +96064
  0x00000301D500  +96000

96000 bytes per 500 ms = 192000 B/s = 48000 Hz x 2 ch x 2 bytes, exactly
nominal. The ACP is fetching the buffer and feeding the SoundWire FIFO
the whole time the speakers are silent.

3. The peripheral port never finishes preparing
-----------------------------------------------
Dumping /sys/kernel/debug/soundwire/master-0-1/sdw:*/registers during
playback, silent state versus working state, the entire difference across
all three peripherals is two registers - and it is the same register on
both amplifiers:

  DP1 0x104 (DPn_PrepareStatus):  silent = 0x3   working = 0x0

with DPn_PrepareCtrl (0x105) = 0x3 and DPn_ChannelEn = 0x3 in both cases.
(The third difference is SCP_Int1 on one amp, i.e. transient interrupt
status.)

Per the core's own reading of that register - "Poll for NOT_PREPARED==0"
in sdw_prep_deprep_slave_ports() - a set bit means the channel is *not*
prepared. So after the power gate both amps sit with both channels
unprepared, indefinitely, while the manager streams data at them.

4. Why nothing complains
------------------------
tas2783-sdw declares simple_ch_prep_sm, so the core skips its entire
prepare block: it neither writes DPn_PrepareCtrl nor polls
DPn_PrepareStatus. The driver writes DPn_PrepareCtrl itself from
tas_port_prep() - as the comment there says, "TAS2783 requires explicit
port prepare during playback stream setup even when simple_ch_prep_sm is
enabled. Without this, the port fails to enter the prepared state
resulting in no audio output" - but nobody ever checks whether the port
actually reached the prepared state.

The result is a completely silent failure: the stream is enabled, the DMA
runs, the log is clean, and there is no sound.

What restores it is a full teardown: hw_free (which de-prepares the port,
writing DPn_PrepareCtrl = 0) followed by hw_params and a fresh prepare.
Re-preparing without the de-prepare - which is what a plain userspace
resume does - leaves DPn_PrepareStatus stuck. On this board I work around
it by cycling the card profile after every resume, which forces that
teardown.

Questions
---------
 - Should TAS2783 declare simple_ch_prep_sm at all? The port evidently
   does not prepare instantaneously, which is the premise of that
   property; letting the core do its normal write-and-poll would at least
   turn this into a visible error instead of silence.
 - If the property is correct, should tas_port_prep() poll
   DPn_PrepareStatus after writing DPn_PrepareCtrl, mirroring what the
   core does?
 - Either way: why does a fresh prepare not complete after the device has
   lost power, when a de-prepare followed by a prepare does? If the amp
   needs the port explicitly de-prepared before it will accept a new
   prepare after a power cycle, that sequencing has to happen somewhere
   on resume.

Happy to test patches, dump additional registers, or run traces on this
hardware.

[1] https://lore.kernel.org/all/466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech/
[2] https://lore.kernel.org/all/bb5064629ada99fa5163621f72fbd27f@gmail.com/

Thanks,
Andrey
