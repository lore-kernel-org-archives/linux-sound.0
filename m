Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948448CD46
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570175; cv=none; b=sMQtleTvnqKy+vU0RVaRZkZSYBHi53SZVplrgf/9ojRuvEIVpepwZUquAp9xSv/IMRGXGiWxDf6nJq4uSmcYlyoNAzQxK6iUn1DBMMRgC2zoGCXtdimd7tn8tWFUGDZhbE+GJAGNZ34xitWbxGv5EkW7H42QC0K0Tlp390OStWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570175; c=relaxed/simple;
	bh=4T5T0MQ6AkshbH+QGrHPozTGAoEFhJsve10CPrr0Ob8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvfNLfAaRQqyihNJRSAhFpUzP6VEZIc2TL54aKR8ITxy1/Nop63MiErhvzjDSAvaVCoxBTm2Gk+NLLMlrSyDT7YQeAOlf9U4KuaLaTMQ6PrnIHpVjc7dhm4ufzFhJ8iccINlCVUn/F6aVphCLDISBRyLnTLR+30JQAJqqLtdNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2VZfB8T; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2VZfB8T"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1273448e87.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786570172; x=1787174972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/BYKF84+irYO74EPPjBQDmGzxNhpd/vZTionbVxeCc=;
        b=F2VZfB8TB+ZrRTiB8PPVAR0UsQPFN2L6tEpe40AzEc7f50Iik4DexCoJ0sslCox2Pu
         PYiM3QP60vpgf7WeJ3gHW2MK2iAAIUI9qQKJrI/G5Nj430ChFzusRhzfYStb4kyf1WvI
         8gQlQF7P1mvBK5kzEepmV9iI2zS54K+0YAZ7HT/xxQbF9bcdk3Ky/7RaLMbSDZxhrOJu
         n7vIY+qpL8ASkz+rIZPqqgU8lOR7aOXlq/6JL9IRBJPkHdh9G0ouVCdG3c091430SS+o
         OCR4a0zzOtzzuAR9wxZ4wIZQ62aNEf+VoczkIEkGeaT6K/jGbEZs/a/yQriQlFyIl+i1
         u8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570172; x=1787174972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/BYKF84+irYO74EPPjBQDmGzxNhpd/vZTionbVxeCc=;
        b=eONxoiHN/WwNoTsiqPvaKB+sWemqHpADxCbaH89cBUWBS66gLhCCGLSPaCGoFk5pmD
         xHjEg+3K5XA5rUvpKehUB6Nr6+R3YIBeo/LjcFJwKcQPlsSzi6Qw5uP9oev0H4rsVH70
         2wY8RjU38d2gowRzdlT7S5T0EQLzsbOhNuXdp9JvaLB4kbujEhtpQu4BRyWANK36FuGF
         aQcOOU5/j64yapaAq5By2y9LQW6RdqRx3KBjLLk1f7GC6iLxJZz6Cmu1PIrvNkC151O/
         HdtQZB5zCGGXKNXcaoobJwr/t+ziMu/5d32+FlTjaPuGlspdaykzMcf/rKVYHgrAyQLQ
         rqPg==
X-Forwarded-Encrypted: i=1; AHgh+RpVqYxzbXDuQdkfBOdeW3ocEc3WUPCVdNNdy5Ak4v2AIGP9vqpDa2IcMNsZ/Xcj0FZ95jc7thS8l1Ie2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi4Mltc5Gdvn13ocjVP9F9GUkJ2QwLNApz9cXQmw1D+HJT/JQl
	rIY/Wr/YtGE8vkHpvlM2fhtg0Wzwz/9NPDDFRsrO0aQ3YaPYNsA4RZAJ
X-Gm-Gg: AR+sD12bcMgAItj6uggKNQepU6Vhk9E7JhAeQLSdAehglohTSAq+QzvpeVI7JSQ9Vro
	NJz7s3e5nAQZWNyWaCQUnSIQF0x3VxilBgMGO4qMW3xAziMJTHq1ae5m2JfNlJqJ8VHizssnPfN
	IklNSYs1V1/0YLu+Dcc/NB0PgT7OqUHh8P77SsBG/vkhq8FaMIPz2SUCveMgAZng748GgPpPw0S
	jX1peDsHhjiM7FlO5fP8wmPXtP40D0PIoOXA7CNDB5nSN8LAv6qaXW7M0xCn8mtQNEe5bZqKaPm
	TxDjdhcfHXskKOTWee+b7vKKvKn+/AFenX0QGaMig6vzZXwKnbLaMJEJ87KJ+MHDh4/+IYarjvC
	XgLb4Wz0Jl+PVA85fmZ6Yjy8cdZn7EPSX2pcaYHcBHlNtn0xF9RpqFFrtQGx7vfv54yAkpWjkZF
	hTsNlUe4+uVxKWMvff3LxlflzUUs4ka8cUlS/cLUsuIFdQZ4kaunTa8aaw5Yq0E/xbX+ySTcDgi
	vVoVV9a6NxTizacG3+Dh44=
X-Received: by 2002:ac2:5b05:0:b0:5b1:5f8f:bc1e with SMTP id 2adb3069b0e04-5b453f4493dmr64421e87.3.1786570171382;
        Wed, 12 Aug 2026 14:29:31 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539ea6fcsm70229e87.32.2026.08.12.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:29:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 00:29:27 +0300
Message-ID: <0df69e3405cbb059f5e1d7326eeddf4f@gmail.com>
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
In-Reply-To: <20260812192500.7714-1-andrey.golovko@gmail.com>
References: <b1bc21c8a403fe15e742b6a6ff30b27f@gmail.com>
 <ef0cc45a88cf0b5b5a65f7634b710a42@gmail.com>
 <20260812192500.7714-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Answering my own question from a few hours ago, since I said I would
report back on option (a) and the answer turned out to be more definite
than I expected: (a) cannot work, and (b) is enough on its own.

A patch is posted here:

  https://lore.kernel.org/all/20260813001500.9218-1-andrey.golovko@gmail.com/

(a) does not work, and not by a small margin
============================================

I built a kernel with SNDRV_PCM_INFO_RESUME dropped from the SoundWire
DMA PCMs and nothing else changed. Still silent after resume. The
register state says why:

  DPn_PrepareStatus  0x1 / 0x2      still not prepared
  ChannelEn          now in bank 1  so the stream really was re-prepared
  PDE23              req=0x3 act=0x3

So dropping the flag did make userspace stop trying to resume the stream
in place: the port was prepared afresh, the bank flipped, PrepareCtrl was
written. It just did not help, because after resume userspace calls
snd_pcm_prepare(), which reaches .prepare and sdw_prepare_stream() and
never hw_params() again -- ALSA only requires hw_params() after
hw_free(). The Function power-up lives in tas_sdw_hw_params(), so it is
skipped on every recovery path, flag or no flag.

That is worth stating plainly because it kills a whole family of fixes:
no PCM capability flag and no change of userspace behaviour can put the
power-up back, as long as it sits on a callback that recovery does not
re-run.

(b) is enough
=============

The patch powers PDE23 up in tas_port_prep(), in the PRE_PREP case,
immediately before the PrepareCtrl write that function already does. The
dependency is thereby satisfied on every path that prepares a port,
which is what the hardware actually requires.

No ACP change is involved: the tested kernel does not carry the
INFO_RESUME patch. Same machine, s2idle for 8 min 51 s with 526 s of S0i3
residency, px13-audio-restore workaround service disabled:

  PDE23 req=0x0 act=0x0   DPn_PrepareStatus 0x0 / 0x0   audio after
  resume, with no user intervention at all

Two remarks
===========

Niranjan, Shenghao -- the hw_free() path still writes PS3, and with this
patch the power-up now happens in port prepare while the power-down stays
in hw_free(). That asymmetry works, but if you would rather have the
power-down move to the POST_DEPREP case for symmetry, say so and I will
respin. I left it alone because hw_free() is also the point where the
stream is removed from the slave, and I did not want to change the
power-down timing while fixing the power-up.

Pierre-Louis, my question about simple_ch_prep_sm from the previous mail
stands, and this result sharpens it: the failure was silent for months
only because the core skips the NOT_PREPARED poll for this codec. Had it
polled, sdw_prep_deprep_slave_port() would have printed "Chn prep failed
for port 1" on the first resume. Whatever happens to this patch, TI may
want to reconsider that property.

Thanks,
Andrey
