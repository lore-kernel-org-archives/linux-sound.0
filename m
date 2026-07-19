Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D445472B
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 00:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784422418; cv=none; b=Gozx9tjNZKeCEVIUN6z5eo/3ia9bs4U1VhwsgMz9NcCojDhIch+HS/QVqMV1X445GJGDh8NuyvJwETrBiitoqinbTMVvyNXSlAK35dLEdieQpgyDTmdDYqq9ODlFQMdd4PGjvVtDradN/idtF6yKp6csmwxA4DNmbGjhnipvHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784422418; c=relaxed/simple;
	bh=DRtESRSAX/QtMhn0NE8GkXeAQoxffdhhbHkq2Wf9yj4=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=mTDEzK8EpREOf9sJ6PnRi1D2y22eDPWWdiBPVP+abl60ytmma2S8wkU3cX4+swdRZ3BYq2B7PdlPg7DS8lQTwOUh7wje8FFZJuwYsgsx8yBleRwGlWNXi1HYc1cO4rV7VccDj1k/5RYzC08DZ5ylDsm7fFLMlFlSm34kDb0eicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6WRhmUV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6WRhmUV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so18395985e9.1
        for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 17:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784422416; x=1785027216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Dh1soKEQySXKjgc6fGCPYB0LOrI9izAQteLhFhZz+U=;
        b=b6WRhmUVoiLdsrm1Ju8bh5bhI+TV17QkovPrGaX2abfJ0jytC7IbSdrc7R8eyBivjN
         R0q6ocImJ2PhgIMROB4oJBWy+tEtoRIxoR012nzjTVM9HY1aEWFsX6llrQ0aobzVhSGO
         ge0Vug0NCmrSELFalAqO+iLZVKlhVzRGcbGS5Vsdub3t3TcA2iBgN3qmlqju5LkZ+t5s
         H1xq5ZC55WpmdZOkE/lwey36Q5+OBRggOegnA7KH9pasbIHrJ+te3fA7dxBv0+ud4s49
         hdDqVFHNWlJtHOFBdkXTarXP4RKNy8QX1HdrSFgP/xoSCHOzq/xoiTcl5680oY7fR/Yn
         Yzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784422416; x=1785027216;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Dh1soKEQySXKjgc6fGCPYB0LOrI9izAQteLhFhZz+U=;
        b=eEe16Ujq+jX1GtddOg8elGInswaP+5myjljacMZ5ai4Q+6CQ0rkljTUZ/pCKCNxh3o
         V6K3rMGAqC6xSeQRvRgrET83+UUVuNZfP4UWmx8I5ULWwbtMjkMEQpFmgelQDhFeZM7l
         PVfAbvu4Me4zBHCPhrsfy/TfiUxr88g84SFawQ7Ndv16M4IteoGf6Y8Wz0zYQkO+n6Lc
         J/WlLm9uUInyfDRqMmrKAJsbS7T4LD94vJU+AIfb4xwXBjR0UvKIC8uUUaqRm1No6l8+
         lzSp3ICLFI5Yks7DD1FEvj4uvUTT9AZT+EWt1QcqbWekNHKyuGCg4CrM3jbW3l2u6hpg
         kjJA==
X-Gm-Message-State: AOJu0YyZ8YKUs0dWKUTsFkrLlBC1O/KuG7MaoiLm6xu4y68YkUiuDKAQ
	03ktHTHGT7v+mCdJTr8+7OG38K9+1yeNKGq84OTMYzapE5q2bu7g/HWEd7jBLHcfOqw=
X-Gm-Gg: AfdE7ck3/UYYo5AhYBsAp2QyNUCcv3qY4hz/kcH4TlMg84zbS+pmJpOpqlIwO0OAcjr
	B0+Hx9MentbDIIXj16CrqD/KoCD846TIi4Da2r8bSXci4Q7oYtF74GlphSV2oKlwAvqP+lGxEHB
	bzw0Ei6ahHQllR6R01Rq+9fVsBUd69hP7ba5+gHsr3Xksvq6NhT3+dx/6Zzfb5sjLLauy+3AKoN
	P3du8oJ3E/3+9bUxW4g1/d1UTJ8g+ljEEoAGnZN7ZaHgIxv1amEorzq7eRWUlqlKANhXdlwh6Z8
	MW5dxE5aNK8mZgYaxuLbCvPBwKd8xfcpjiujPKRlSoK0qYHFCaWIrPXxvsJxqYAZZiGMDwetMk2
	vItwaqLcid2iyJob4HoU8GWPXJzM38iqKBv03WrezSwNmUopGiQ6MmDUolEGHj9ToD9wHSfyCrt
	F2hPHB3Ia54ay4VjAytT8HurXGsHogdEuHd4YnCMbDoZA2CqFEJF2FGA==
X-Received: by 2002:a05:600c:e54a:20b0:495:4b40:88af with SMTP id 5b1f17b1804b1-4954b408964mr52683805e9.8.1784422415530;
        Sat, 18 Jul 2026 17:53:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f07:9aa0:b05e:a34a:d47b:7849? ([2a01:e0a:f07:9aa0:b05e:a34a:d47b:7849])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm177093605e9.2.2026.07.18.17.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 17:53:35 -0700 (PDT)
Message-ID: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
Date: Sun, 19 Jul 2026 02:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-kernel@vger.kernel.org
Subject: ASoC: tas2783-sdw: no stereo channel split for two mono amps -> mono
 output (AMD ACP SoundWire, ASUS ProArt PX13)
Content-Language: en-US
From: Antoine Monnet <monnet.antoine@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On an ASUS ProArt PX13 (HN7306) with two mono TAS2783 SoundWire 
smart-amps on a
single AMD ACP SoundWire link, playback is effectively mono: only one amp
produces sound and it plays the *left* channel out of the *right* 
speaker; the
right channel and the other (left) speaker are silent. Both amps enumerate,
load firmware, and stream without any error.

Environment
-----------
Machine : ASUS ProArt PX13, HN7306 (Ryzen AI Max, "Strix Halo")
Distro : Debian 13 (trixie)
Kernel : 7.0.13+deb13-amd64 (Debian 7.0.13-1~bpo13+1); code identical in 
7.1.3
ACP : 0000:c4:00.5 [1022:15e2] rev 70, subsystem ASUSTeK [1043:1714],
driver snd_pci_ps
Amps : 2x TAS2783, SoundWire link 1, slaves 0x8 and 0xB
(sdw:0:1:0102:0000:01:8, sdw:0:1:0102:0000:01:b)

Note on the build: Debian ships sound/soc/codecs/tas2783-sdw.c but does 
not set
CONFIG_SND_SOC_TAS2783_SDW, so this is the unmodified in-tree driver 
built as an
out-of-tree module (DKMS). The relevant code is unchanged in current 
mainline
(verified against 7.1.3).

Analysis
--------
In tas_sdw_hw_params() the driver does:

snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
port_config.num = 1;
else
port_config.num = 2;
sdw_stream_add_slave(sdw_peripheral, &stream_config, &port_config, 1,
sdw_stream);

snd_sdw_params_to_config() sets port_config.ch_mask to cover all stream 
channels
(0x3 for a 2-channel stream). This runs per-amp, so *both* mono amps are 
added
to the stream with ch_mask = 0x3 and neither is told which channel to 
reproduce.
There is no per-amp channel assignment anywhere in the driver (the only 
other
ch_mask use is the port-prep write of whatever mask was handed in). The 
result
on this board is mono out of a single amp.

Diagnosis on the hardware (per-amp mute + isolated-channel tests) confirmed:
only one amp (tas2783-2, the right speaker) outputs, playing the left 
channel;
the other amp (left speaker) is silent regardless of content; no 
"without fw"
or port/prepare errors on either slave.

Fix
---
Assign a single SoundWire channel per amp, e.g. right after
snd_sdw_params_to_config():

if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
params_channels(params) == 2) {
switch (tas_dev->sdw_peripheral->id.unique_id) {
case 0x8: port_config.ch_mask = 0x1; break; /* left */
case 0xB: port_config.ch_mask = 0x2; break; /* right */
}
}

With this the two speakers are correctly driven:
speaker-test -Dpipewire -c2 -s1 -> left speaker
speaker-test -Dpipewire -c2 -s2 -> right speaker

The unique_id -> L/R mapping is board-specific, so a proper fix should 
derive
the per-amp channel assignment from firmware/ACPI (or a machine quirk table)
rather than hard-coded SoundWire addresses. Filing this so the driver 
grows a
real mechanism for multi-amp channel mapping.

Reproduce
---------
1. Boot; internal speakers play but only one speaker is audible.
2. speaker-test -Dpipewire -c2 -s1 -> wrong/only-one speaker
speaker-test -Dpipewire -c2 -s2 -> silent
3. With the per-amp ch_mask patch above, both speakers work.

Happy to test patches on this hardware.

Thanks,
Antoine

