Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDC3B7A8
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784420572; cv=none; b=Ez89uR3+zKTx3mkgXfTuqYFRUBuqb/15R5vb0VLEr0XrzTy0C1jASlDZXfJ86Dfgk+OvCgy49Zwa1CDo1D/eF2WH5e3WlIAJ06HrIDkwldfyZ2C4ayCMd4Z7xzEbubvl8VPeF152DykdkDdfpy2wzIvLi+dXYMJ9q1cW7LA5Rsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784420572; c=relaxed/simple;
	bh=XVNrmOvZ8mqN4c03knT92DmHWes1niHXH9JLa7gVHeQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=AQ7jYENwePGxZmDtIkpGlF0+AMfQ9BAndNjnTfVfW8Q3tv4QowHO5BJj//xmPqh+jWdjAtThVrAOqeEw0W0y0SvDJfs0Vgo5chlf7InM2eVRgjHVh6jWE75YkuSZYakLN9O7uqOrSM8QMyw8tbNHS2wnXMAXl++8vSO2LuI/AB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech; spf=pass smtp.mailfrom=montane.tech; dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b=FStGI/nU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=montane.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=montane.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=montane-tech.20251104.gappssmtp.com header.i=@montane-tech.20251104.gappssmtp.com header.b="FStGI/nU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953ddae026so28644295e9.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 17:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=montane-tech.20251104.gappssmtp.com; s=20251104; t=1784420567; x=1785025367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dOoyrgWFzOD737F1+W3OCztHf5gHGhh8QSblKBru174=;
        b=FStGI/nUWHmM02JEMg5BiX3VeWGSIXO1RZgC3sdBH3TbVBo7jjoDazUGwv1x3xdwl0
         FzB4KPneyKTpROqvWhK6AztdoxO23TZziUbqpZM8YHsaenpclGWpKCLkbu/I2fUb71d7
         13HZ487+9AnMZkTsd4hHvWvWV+vMqVniwcEJ2d8+OfJA9i8jEzKPtz0vpKnByyCCoyTM
         2lw9A7Hk9rORFijjaygY0vxF8yezw2oqL0HX0ddP5UpP06+7I4PB2jQmzNdB/bRbZL1l
         HL4yjkIP6vPNQ+87/fjaxqzRF/vA+JgS91105mcCBjq0FQyJVZs1YfgjL2vo5snMQ84+
         Yi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784420567; x=1785025367;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOoyrgWFzOD737F1+W3OCztHf5gHGhh8QSblKBru174=;
        b=YdUZuOgbc8h44s9GgNn9zgCTtmhlKOXeL+XqYmCwkFop00EbVVcKodke0wMwuNc1qp
         Hamnph83TJ9PvNlJ2665mGuaU+7SvpspnMOkzv/AzB/vS8KR9egTe61qLN6OA8oeG7Xy
         BD082sxYIEGc+as403BXsq/KiEhxZAv9YUoJA+5VkTvgC6gUYR2PpQOiub4pDFOnCJt0
         6qdZrbZUBMc3+SD20UAzQN3azjfUxKkpup7QM3qO8wqaTka4ayLybX24IIVLFNtake9b
         Ey1mAfzfnclj1j1dCuk+VLNnoKvpFU9gMcf2tzV+9PIrIU+qiTnbBuIyYSULzS62X2Yu
         EgBw==
X-Gm-Message-State: AOJu0Yzbvejf4/upaREUxqV2TsV5z7Yztrq7W+2Jd6J+gFM5H9gFeqre
	p+GGkoCtLLW4yFLY7fP4FH8YkwBTa9cj2ormDn6HEQW5zYaWjkHKoMER+aaHLMxVmL7Pm5bXKsM
	YvByVxeXe0A==
X-Gm-Gg: AfdE7cnZZxAVayvcbVH5I89v0/8I+SGJHx6GBVi5s+4+cDpB9Rn9keQMlL+2zM/HRHR
	bnmSwy8oXtL7cQGo9OzydxGitfobPp6OqzCIr74lGMKTftMtqvUynaBora6D+8SIZhjpi4L1Nr5
	PIvcevVRHXzQHWpPSHUcnGYyYq+YFDU55A7PDaRHHqIQabVyRkrEeBeqnahJ73t6hXBBVzLSHLf
	bq2D93XulWjR+Dx5IXmclZXhKCjqkGf44NO5SZDiIvq19pYVlWoTycMCDBDdoZXpZb30Oom1f9E
	79ZDsO/mSGUwH4tYyANhj6haTQbS91PnuAOzOXKpAspvuf+ZyO3IWJ3NGeFa8zA3viqmBGR03H8
	DjvxdvXnqFD/VSUHpuIJ1nbg5Z95q3xSevXdWycmxSGlYZlJCywuG7hSW39zfT1ZC6EYD/JSO5z
	nc2ToaWaD0r0ffGGRnPHGyEsLgIvFGqUpLuXE0Mw==
X-Received: by 2002:a05:600c:6a0c:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-4954a40bd0fmr68269955e9.31.1784420566596;
        Sat, 18 Jul 2026 17:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f07:9aa0:48db:88:99a:9eb? ([2a01:e0a:f07:9aa0:48db:88:99a:9eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm141465835e9.0.2026.07.18.17.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 17:22:46 -0700 (PDT)
Message-ID: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
Date: Sun, 19 Jul 2026 02:22:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 broonie@kernel.org, lgirdwood@gmail.com, Vijendar.Mukunda@amd.com,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, linux-kernel@vger.kernel.org
Subject: ASoC: tas2783-sdw: calibration firmware not re-downloaded after
 s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
Content-Language: en-US
From: Antoine Monnet <antoine@montane.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On an ASUS ProArt PX13 (HN7306, Ryzen AI Max / "Strix Halo") with two 
TAS2783
SoundWire smart-amps on the AMD ACP SoundWire controller, internal-speaker
playback works after a cold boot but fails permanently after a single
s2idle suspend/resume cycle. From then on every playback attempt logs:

slave-tas2783 sdw:0:1:0102:0000:01:8: error playback without fw download
slave-tas2783 sdw:0:1:0102:0000:01:8: ASoC error (-22): at
snd_soc_dai_hw_params() on tas2783-codec

and userspace (PipeWire) drops to a dummy sink. Only a full reboot restores
audio.

Environment
-----------
Machine : ASUS ProArt PX13, HN7306 (Ryzen AI Max, "Strix Halo")
Distro : Debian 13 (trixie) 13.6
Kernel : 7.0.13+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 7.0.13-1~bpo13+1
ACP : 0000:c4:00.5 Audio Coprocessor [1022:15e2] rev 70,
subsystem ASUSTeK [1043:1714], driver snd_pci_ps
Codecs : 2x TAS2783 (SoundWire link 1, slaves 0x8 / 0xB) + rt721-sdca jack
sdw:0:1:0102:0000:01:8, sdw:0:1:0102:0000:01:b, sdw:0:1:025d:0721:01
Card : 1 [amdsoundwire]: amd-soundwire -
ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC

Note on the driver build: Debian ships sound/soc/codecs/tas2783-sdw.c 
but does
not set CONFIG_SND_SOC_TAS2783_SDW, so I built the *unmodified* in-tree 
driver
as an out-of-tree module (DKMS) from the matching 7.0.13 kernel source. The
code is upstream and the defect is visible by inspection in current mainline
too (checked against the 7.1.3 tree — the resume path is unchanged).

Analysis (root cause)
---------------------
The amp's calibration/DSP firmware is downloaded once, via
request_firmware_nowait() inside tas_io_init(), which is gated by 
->hw_init and
only runs on a SoundWire UNATTACHED->ATTACHED transition 
(tas_update_status()),
setting ->fw_dl_success on completion.

During s2idle the SoC powers down and the TAS2783 DSP loses that 
firmware. The
system-resume callback tas2783_sdca_dev_resume() only performs 
regcache_sync();
it does not re-download the firmware, and the downloaded DSP 
coefficients are
not part of the regmap cache. ->hw_init stays true, so tas_io_init() (hence
request_firmware_nowait()) is never called again, ->fw_dl_success stays 
false,
and the next hw_params() bails out with "error playback without fw download"
(-EINVAL).

What I tried (none recover it; all consistent with the above)
------------------------------------------------------------
- ACP PCI reset (unbind/bind snd_pci_ps 0000:c4:00.5): the card is fully 
torn
down and recreated (/proc/asound/cards goes 1 -> 0 -> 1), yet firmware is
still not downloaded.
- Driver-level unbind/rebind of both amp SoundWire devices: fresh probe, no
firmware download.
- Full module reload (modprobe -r snd_soc_tas2783_sdw after ACP 
teardown, then
reload) + ACP rebind: still no firmware.
- Only a cold reboot re-initializes the amp DSP and restores audio.

So neither a bus re-enumeration nor a fresh driver probe re-arms the 
download in
practice; the one-shot ->hw_init gate plus a resume path that only does
regcache_sync() leaves the DSP permanently firmware-less until a power 
cycle.

Suggested fix
-------------
On system resume (and on any re-enumeration where the DSP may have lost 
state)
the driver should re-run the firmware-download path rather than rely on
regcache_sync() — e.g. clear ->hw_init / ->fw_dl_success and re-trigger
tas_io_init() / request_firmware_nowait() from tas2783_sdca_dev_resume(), or
gate the (re)download on DSP power state instead of a one-shot ->hw_init 
flag.

Reproduce
---------
1. Cold boot; confirm internal speakers play.
2. systemctl suspend (s2idle); wake.
3. Play audio -> "error playback without fw download"; sink is dummy.
4. ACP reset / driver rebind / module reload do not recover; reboot does.

Happy to test patches on this hardware.

Thanks,
Antoine

