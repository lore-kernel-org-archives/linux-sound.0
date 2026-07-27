Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2064374A04
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140018; cv=none; b=QwwoIDpvVGxp93aszlgd04q3Va79HFNksEbgQSQ9DmVIaBGnspjEPwCnKxG0gccuor+MM8u9E7GCDUgertOORXJihNVI0+TmnBeve+6KxSx/f1JuCxD9bjnrk7EUzRzrF3jekCkWCBvoV275qQgK7CegupUxCf51O+0sgl/xXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140018; c=relaxed/simple;
	bh=4wmi0uwktBB60+gLClZTQrof539eNcHdK5yq44R5eMw=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=Pq9Bpz1IjcKAyRF0bBv9BtRNmwGg9LMgKn/4QE29VzQG3/EDIK0SjbpFaKI1Nngc4YtVaQE42YQM89mC05Q43PSqQeL5MEfdaYUo+qoZMOd13yXvMv+eFzYLCv9tvAK297hg6syS4NL/3GxMxHZuGAb1J1e1+n+KEJJ+5jyBpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmDV/Izo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmDV/Izo"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b015b2d792so2559201e87.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140011; x=1785744811; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oCmkrdJ0HThAc945hm7QlIO5Boe0tZp2HaWTyRug7BE=;
        b=YmDV/IzoodBvRngzuXH2h1kFQ6ivS6Jlj1oChy/soEIU/ZYYHnW3ldCoNDvFMUIHOq
         3Npm8pBkTkJhqmlGNi14GOQgiDGyuBBRAAheD89iAWV8Hwv89iIjiz/VMz5Jo3iltVXG
         qmEw6+VbPVF1BfOiMIaXner9C8qvggaM4bONHAHkitt76R65hT3vFeDZ4Mw+aIMQB9VI
         qrHshoKDYufstkC1eXND4E1k3xY9htvtqOnx5Jxu/IxDAoWpgZIN4lx+MdEWCE+6DBFP
         VqhfXDSEkjdMOLmpax0XDG1ive6udfAZ/SvyBx/V37SwAl9F+z+vJJEBEnz0FKb8cNjd
         kDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140011; x=1785744811;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCmkrdJ0HThAc945hm7QlIO5Boe0tZp2HaWTyRug7BE=;
        b=iNZIn4JGnzqwkXSbCQ7TPhEMXd54rmZa7EreX49FXfwEJXR28KR7mWdT/0zGvT6kZN
         N+/7KuAAJWnKRRrmqNpIPxAxTEUu1ygeYtQOLXbMYFUfrr3SmLveyYtKX8gOyppw9gSn
         QFOMW3/9w8eG5vCDUBKcO9o3h/vgm476ksRGuCbt4p75XwIu1dx+5aqbLnbdSlh72WMQ
         oXsiuIxV2t7/TkGCsliBkLIN2FHEwC07Yd8hT5WIRkm+uR0OlnfAQhREuuWkVxzMTwDK
         q3lUVGyS3a0GBe2dvBiHh8ESXQ04PboJyGpy6v4OCAI9zVRMdfdSWPydKXmY7ArD0K1e
         I1ag==
X-Forwarded-Encrypted: i=1; AHgh+RpzBULPirUrGt5Q0MieFaKXmWSIZRwpAHD+3YfH5rQ2Oyv6c30o3bBKkxrPUgmlq4RP7PSh6rNIzcZI0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOoHwuu42Ht0Dy1LD7QpehReDtKyZU80Ye7CN7InOUGHssfy1w
	MXbW2Uf2kytx+BcqehX0qPF2FHhRRkDjqlj2M9Ke+aXOYEsz4/C9CAYb
X-Gm-Gg: AR+sD12JM2gbLmgn4SxR6qqTYU7ZTb5F+8lnQ8gIjFsu2GAZAqPnm7UvkFVOtZzYSWJ
	BYS6vSZYf1GvGqsAJvNEmsHCm57MvRX49NclbWpQF/iSe8UI35P/QzqWezE2HLoLvyZFJ4DX21l
	rhswHUQXyMjs68uPr2X2whVTVXGTCzXEUMQufAZ3zujmZ8T0DLY0jMmnODAmzltV1zoQd6mqyyT
	nttqdhNEfdxK9ofB7yoFy7w25J9k1siRfavQ+X9xA08y9fUib9m2AJcwWu+0NZ4eRuxeyaLmUwP
	7ShiXcuEIishOFLD/fWAeiXGwnWtx7BmjAEVKLPX2JSvw4SsvnBYX9ApOjA6Nj/Jrjkh9JJt2uF
	5eq9GzgRvdboHzxfVYDGGYaM/FxyYoneKiWC4DnLdFGXehjmdGDNeiH9RmotKjDGYkUCTWcOKtB
	Y=
X-Received: by 2002:a05:6512:2346:b0:5b0:1879:1ba5 with SMTP id 2adb3069b0e04-5b2c1b4fb9fmr1144363e87.58.1785140011140;
        Mon, 27 Jul 2026 01:13:31 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be077b6asm1286549e87.15.2026.07.27.01.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:13:30 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:13:29 +0300
Message-ID: <2d59f17b67d3886a3085f0da8c8850f3@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: Re: ASoC: tas2783-sdw: calibration firmware not re-downloaded after s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
In-Reply-To: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
References: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
To: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
    broonie@kernel.org, lgirdwood@gmail.com, Vijendar.Mukunda@amd.com,
    vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
    pierre-louis.bossart@linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Hi Antoine,

Same machine here (ASUS ProArt PX13 HN7306EAC, ACP rev 0x70, RT721 +
2x TAS2783 on link 1).

First, the reason you never saw a re-download at all: on <= v7.2-rc3 the
peripherals do not re-attach after s2idle, so tas_update_status() is
never called with ATTACHED and nothing downstream of it can run. That is
a separate ACP bug, fixed in v7.2-rc4 by

  5893013efabb ("ASoC: amd: ps: disable MSI on resume in ACP PCI driver")

Details in my reply on your other thread [1].

With that fix in place, the firmware IS re-downloaded on every resume and
the one-shot ->hw_init gate is not the blocker: tas_update_status() sets
hw_init = false on UNATTACHED, so the ATTACHED transition re-runs
tas_io_init() and request_firmware_nowait() as intended. I confirmed the
download really happens over the wire with ftrace: ~81k calls to
amd_sdw_send_cmd_get_resp() during a single resume, i.e. an honest full
re-download of both amps, not a cached no-op.

One trap worth naming, since it fooled me for a while: in the resume path
printk timestamps make the download look impossible (32 KB in ~150 us,
5 ns/byte), because sched_clock is not running yet that early. Do not
trust the log deltas there - use ftrace.

So the symptom you filed is real, but the mechanism is elsewhere. On this
board, after a resume with genuine deep S0i3 residency (51 s of a 57 s
sleep, per /sys/kernel/debug/amd_pmc/s0ix_stats), all three peripherals
are Attached, the firmware is reloaded, every log line is clean - and the
speakers are silent.

Root cause #1: stale regmap cache
---------------------------------
In tas_update_status(), on the UNATTACHED -> ATTACHED transition, the
driver does:

	regcache_cache_only(tas_dev->regmap, false);
	regcache_sync(tas_dev->regmap);
	/* then */
	return tas_io_init(&slave->dev, slave);

Two problems: the sync runs *before* tas_io_init(), which performs a
software reset and thus wipes whatever was just written; and there is no
regcache_mark_dirty(), so the sync is close to a no-op to begin with.
The cache therefore survives the power cycle claiming that the DAPM
power/unmute bits and the SDCA PDE entity are already at their target
values. Every subsequent regmap_update_bits() - amp power-up from DAPM,
PDE programming at stream start - sees "no change" and skips the write.
The amplifier stays powered down and nothing in the log complains.

Consistent with that: unbind/rebind of slave-tas2783 (fresh cache)
restores sound immediately, while toggling mixer controls does not.

What does not work as a fix: adding regcache_mark_dirty() + a real
regcache_sync() after tas_io_init(). This regmap is SDW-MBQ
(devm_regmap_init_sdw_mbq_cfg) with per-register mbq_size, and the cache
also holds non-MBQ registers written during init, so regcache_sync()
fails with -EINVAL on the first such register, and the failure then also
breaks probe ("Update Slave status failed: -22"). A full sync is simply
not usable for this regmap.

What does work here: drop the stale cache instead of syncing it, i.e.
regcache_drop_region(0, UINT_MAX) before tas_io_init() when the device
re-attaches uninitialized, so the following update_bits() calls read real
hardware. Side effect: user-set controls fall back to hardware defaults
after a resume, which seems the lesser evil versus a silent amp.

I will send this as a proper patch. Note for Mark/TI: it will be based on
top of 0d6b2d6f93a6 ("ASoC: codecs: tas2783-sdw: Propagate
regcache_sync() errors") currently in for-next, which touches the same
two call sites.

Root cause #2: ACP SoundWire DMA config not reprogrammed on recovery
--------------------------------------------------------------------
Even with the cache fixed, sound only returns after the PCM is fully
recreated (pactl profile off/on), not after a plain userspace resume.
sound/soc/amd/ps/ps-sdw-dma.c advertises SNDRV_PCM_INFO_RESUME, so
userspace issues TRIGGER_RESUME (or prepare without hw_params), while the
ring-buffer registers (RINGBUFADDR/RINGBUFSIZE, watermark, IRQ masks) are
only programmed in hw_params. The DMA is then started with unprogrammed
registers: silence, followed by an XRUN. Intel does not set INFO_RESUME
on SoundWire for exactly this reason.

Dropping INFO_RESUME plus reprogramming the DMA config from .prepare
still does not fully restore audio here, so something else is lost across
the power gate on the ACP/manager side. I will post that part separately,
with traces, addressed to the AMD folks - it does not belong in this
codec thread.

Happy to test patches on this hardware.

[1] https://lore.kernel.org/all/466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech/

Thanks,
Andrey
