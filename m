Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C75C2F7F17
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066155; cv=none; b=cYypDskjo1o0WSUTX/n18yy+irhx8j67L/OLc1V/v4JNBApfs/cTZSZv0ObW2BeVOvP/X31Bz9jBUWo4lcxbuMKWRYjMXofB2bULIRbPg3MfVZivuSgkSHw2AMid3vkraBhuc1TIAq7R3IUNoLKls6xQgyLp7zuBEi8evEB9DAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066155; c=relaxed/simple;
	bh=sww8Lb2raQqjj8RoWvZ2YliiI/HuRKAI1RZuWgCFpr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rh8IUDm1DrBBJmfpwiMSo6nu9p5meotNfI56kqnZvrWKpykUmBA2SOt3rguNS7uIpvLRJQQks1A6vp9BnkP4/YsUb5qivynAdNscPEBytWZiaMTpzocVYVybSc1c6q9IhrAtDE66i74Bh5V8+kTagTnF1xQ+CxMEhpoikVJ29+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjtKxAJL; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjtKxAJL"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso3225793a91.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066153; x=1790670953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsx02Jb7dNRE9wF+pcPid9sjNFLSwympXtBYARPiX4E=;
        b=DjtKxAJL+KfPkVywgrvP82Uq+Zg/3W5u2fIe/IcR1rasyzKH2hG+cnX4/8M9CmYsPc
         sTFvLnm1UJaXjKEB/4B2n8ty7/+0syyDbaAD375o/uT5T3/gMFx/TVXG36N70YUfTWBP
         ZxbNGT5vNHJqgP3ZD9Xg/9ffibV3jDxpFX9N6CATnPfhghcSLYKQIkWwa4JVkJ7ZAeeQ
         udwo6sOLKp4ZXSmgc9/wLCykhAEbniTPK9LvYXdEFjzXFhLKqpg1rxfbmROs/hzG09Xc
         7ru0GBt2UcqPUs3/GvstQcY3NYTk9nttvfdfAk/ik5hzGKKuiOFavIAoKRJMWK5aba6F
         oaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066153; x=1790670953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsx02Jb7dNRE9wF+pcPid9sjNFLSwympXtBYARPiX4E=;
        b=u7xuMpHGOk1D1SE1CGckVg+ww2LhJBKWspTdsA5oGDrDfLM59KUdKAs+7NwKvJsXW2
         oxgZxumPyv/J95cZwNg0VA8d7HoeLabtaLXBxUZpbSvtsDDbf/6erw5uMjBU9FRxaARI
         AtyAvr0JDQOGip5CpvyrAVqwRN1hk0VYhfWCv92waDvxcy2otJ4rgOQOJorZi33Hxg57
         AfycPc59DAy2eFBjHnqH/yHY1tmvobHGC1DgCEyTvIXTOCXCLxTAK5vdS36TREBgFADG
         SM2EcwqVieTaopAf/LSBQrrR89LVFmuTN/eU7+87AuazRTRE3iUqyM9e/hHMr+4L0DbU
         lSVQ==
X-Forwarded-Encrypted: i=1; AKwUvByXuaBTwIExqvMckPHcp5Nph3qeK6CES0R0rJ3ARC0YbReteEeRi3B23y7cDNhviOuK1TnRt0fVSHnRug==@vger.kernel.org
X-Gm-Message-State: AFuF++mf8peK+1srn4QT8w+j0PX4zY78oD56cKbT8nkKsyhezkOeXIE4
	N6QaVLO5cRB7QaRLFiiu/ZnjCr6mEGfwJC8e21eeHW/U+dlXUr2ifMLb
X-Gm-Gg: AYBFou3FJ72uGOnHFM+LY3LttSUMQQA863t9SyFVuaPiPwpWiPAb46m9oJS0OaIOIRO
	GRA70DuKdbL4W7NB7e0nV8bEtu0uFwDqizUPM983iKxvuSAirZp2eMjhYDzl/XGuZjJmdI/hBZF
	31YSpdDtL02AhjJPKVxd7dkhYcAWAuGYl3aKUpAOMKjser68yL8JqoQnNNaH5XMTnq+ia3Ug6x6
	zrmGEZ6nADdVh5l3Rsd6aruKCdt6fRrmyYjxGLJfODHgxvuwxzaidhf3JntMiq5psPZDLyvaEzp
	UIP6LgDRxn+BKpJwrJcxQ0hs/SxOejbBlHfyzHD+tNOetzKfRcpFPPs/+c9MQwlT7xLptMz+zcj
	K/+CegQPQ5jWAmOFlY485l8tYx82bzxQNyIn0KecIX7zKGTB4j/JNI2nIg6x8TnvCC//KWMUNRp
	I8E1VQHplEmzdECGLxFKl8ITA8YY+0EuZqCiSprgRNn0SXmcVoqZFiNL5QfHqQChT8+TI/Be1pn
	P1xWz+qDcavEVvtQXLlw18V7xaCsgFeCyQtA0v+1bHRM/d1VSquv7VH
X-Received: by 2002:a17:90b:35d1:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-3a073112cc5mr432255a91.14.1790066153439;
        Tue, 22 Sep 2026 01:35:53 -0700 (PDT)
Received: from pc130107.ADVANTECH.CORP ([123.51.235.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5751f2sm2041141a91.9.2026.09.22.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:35:52 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Hsieh Hung-En <hungen3108@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/21] ASoC: fsl: use .auto_selectable_formats
Date: Tue, 22 Sep 2026 16:35:05 +0800
Message-ID: <20260922083512.2256991-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I tested this on an i.MX95 board with an SAI3 <-> TLV320AIC3101 link,
on top of broonie/sound.git for-7.4 (f42fbd560cd8), which already has
cb125dde4b5d ("ASoC: codecs: tlv320*: use .auto_selectable_formats"),
so both ends of the link advertise their formats.

Two device trees, differing in one property:

  - control:       simple-audio-card,format = "i2s";
  - auto-selected: that property deleted, so the FORMAT bits are left
                   for soc_dai_auto_select_format() to fill in.

bitclock-master and frame-master are present in both, so the
clock-provider relationship stays fixed while format/polarity selection
is exercised.

The card registers and plays in both cases, and the hardware ends up
configured identically (read during a stream):

              control       auto-selected
  SAI TCR4    0x10010F3B    0x10010F3B    FSE|FSP -> I2S, FSD_MSTR,
  SAI RCR4    0x10010F3B    0x10010F3B    SYWD=0x0f, FRSZ=1
  SAI TCR2    0x43000000    0x43000000
  SAI RCR2    0x07000003    0x07000003
  AIC3101 r8  0x00          0x00          codec is clock consumer
  AIC3101 r9  0x00          0x00          bits 7:6 = 00 -> I2S

So auto-selection lands on I2S + NB_NF, matching the effective DAI
format of the control case.

That the card came up at all is informative here, because a wrong pick
is not silent on this codec: aic3x_set_dai_fmt() validates format and
inversion together, and the codec's low-priority entry is
DSP_A|DSP_B|IB_NF while fsl_sai advertises DSP_A, DSP_B and all four
inversion combinations. I checked this with a third device tree using

    simple-audio-card,format = "dsp_a";

which gives DSP_A + NB_NF, a combination the codec refuses:

    tlv320aic3x 3-0018: ASoC error (-22): at snd_soc_dai_set_fmt() on tlv320aic3x-hifi
    asoc-simple-card sound-aic3101: error -EINVAL: parse error
    asoc-simple-card sound-aic3101: probe with driver asoc-simple-card failed with error -22
    No soundcards found.

In other words, an unsupported format/inversion combination fails the
machine driver's probe outright; there is no fallback to another
format.

I also ran an analogue loopback, headphone output cabled back into
LINE1, so the capture path and fsl_sai_pcm_dai_rx_ops are exercised as
well. alsabat plays 1 kHz and FFTs the capture: three runs per device
tree, all six reporting "PASS: Peak detected at target frequency" at
999.76 Hz. alsabat's overall return is non-zero (-1003, "more than one
signal") in every run because the analogue loop also shows a few
spurious peaks, but those are not consistent between runs of the same
device tree, so this is a functional round-trip check and not an
analogue quality measurement.

What this does not cover is the case you asked about, Mark: this board
has no DPCM link, so the dummy DAI is never the far end of the
negotiation here.

Tested-by: Hsieh Hung-En <hungen3108@gmail.com>
