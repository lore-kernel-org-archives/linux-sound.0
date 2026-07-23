Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84347FAEB
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832407; cv=none; b=Wyskb0O2OhIFcMN4qcJZDT4aIPwTXdCNEQYJODD0WVsSAeVIoplhRGyrsij1MWqfmaiHMdIBqPr++QAPYhBG1QtVwuEumvjLQlhXzfCEjp37rsCaxhOkvLVV/DTmL9/aCtHxOcHJ12gNbLdzQpti49a4oInF4q4xnktje0cTpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832407; c=relaxed/simple;
	bh=LdEcFe8ztfNdGkUJ/0XyjwO4PqFfQkW74j+BaEbSceA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJOuccxZfp8+2DAelRudpdm7eym7WBvn6Xd5AM1HKp3m5luhkRdXka+Q+NYeRUwAVCncqwLbMuMFTyuiagPEjN0hjFA+D/KE7xAby/MTVH3ZhDROpQkxPNLreIIIAJP++0CXVrrsBj9/PGiMhKtKHRNLsIEtMDqivSrJ26iWWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEg41UHc; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEg41UHc"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so988596a91.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832397; x=1785437197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2nXppCiGAGzj7x2K7RacxH7dn9WK6P2XEuUv+uCRKY=;
        b=sEg41UHc+QvrQx+7X7sh2+Txwrtx9RspBGL0ZfUrA0GcUMafGPO3nMBd+AtFONAgxd
         mnZN+k4JGLus0qQwGCDpYyUDcM81Tm5KZaD5c4vWhB2UNKqcayehioeNrNiprsId2q3B
         6URoPqxtNQ8mhkhdpiAfvetCYIQxw6xmjnwBY6X85X/MyVq1dWCMCwLo77JKiskyz9Ys
         hqZBcEYu2MOPWRExnYDrR7WIZ8zl+2d4fG7SZ8l8ePw1W0u8P3Sk88oALPZ+gbQu2+Eh
         wQeOFa2QMihCFhhADwyms9x/+Vs+7CBi7CihoZlhDy+zEiBw4Jl2PElaaNFoojdcH90V
         Hhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832397; x=1785437197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2nXppCiGAGzj7x2K7RacxH7dn9WK6P2XEuUv+uCRKY=;
        b=lwcdkSUzjVmynuf0hm1RrAH/o0Q62GC8XyNqKBaOA1Pv7+UBRP7zltNimhpSioFait
         CBN9rjj5GOChpAwJXgnR4zakxtIYFFBzlHLHWPkZsYkB8RaGF3wPSz3vkGJhMgCW76fe
         boBf/4AQxGIB/mqgfySU2QKpVDm/20CEzG4U2rDmf1W4ATpSShDmrdGVPT1noGAJfyNX
         Soq6XgmMZ47Ftkhzrf8MUSrKh3IEF0pRygHO3rzeWaLTBi5//GGi4G6vOti5UeAXLcen
         o2ExTUHs4BbWGjvtXg0yaDsgDoIodl88/pk3N03GyMM7nyrTCFztjISlHWYsck3FQy7a
         ly2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpnD5wGlKA8IOW1iQWKM/k6W5r7H/3lmKwR/hQ7odk9qhotcEnHalT21iLlSiA46Ft3crl1qUZkKBCizA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVw/1+yrFjIbXYg0GK2qJdDtW+zbpGoBjKuePbVbiK2A3O1PrM
	WOFREZ2EaEd32rpTuZ/KPosOVaRYYo9Gy/VFnKRpZB8KNOkhB8/p/kYL
X-Gm-Gg: AR+sD12AZdP9NVOqwcac7NBFa/tRDGWzyHzx8zv0TL8ORt2mJC0FmWIHzO76dQQf6/j
	N924T0hs9XvYLW7wmlWWUGR651hvijRmRBXj6LH9U8/e3IszqV2s+/0f6vHqpYNpxY3LJ5zqEnr
	5YVZO2EDnIf8e26iTYWU24XrV5OrXDXUJm0sC/xfDrky/eiqSwnF/vddI8AsBo+E1dp95/zVvJB
	mRwTBpPpRmJjcIusJ6PDUOt6DHL885SjSbw3OU5lipPNQaO9P4n0i4IwAs7YfqP8N+aVPTGSCKq
	wl7F5UeN2+mhgfI1K7PKDXtmHA5/5AAXkySMBqkjQV3Oe2Y/VPPUqgZMm958ZiZnCodhSi+zXbW
	HEjG9LAkQm6RECKJSeWazHMdzGVQ64KnveBdQgBjAPDpKLq0eH5Wyo92BOfMmKexMAEOwWcyi
X-Received: by 2002:a17:90b:2e84:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38ec6a965a9mr4789308a91.37.1784832397395;
        Thu, 23 Jul 2026 11:46:37 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:36 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: cocci@inria.fr,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH 14/36] ASoC: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:16 +0900
Message-ID: <20260723184538.3888637-15-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/soc/amd/acp/acp-mach-common.c          | 11 +++--------
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 +------
 sound/soc/samsung/smdk_spdif.c               |  8 ++------
 sound/soc/sof/intel/hda-dsp.c                |  6 +-----
 4 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index ef784cca13f2..01a0aaa60246 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -938,15 +938,10 @@ static int acp_max98388_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai =
 			snd_soc_card_get_codec_dai(card,
 						   MAX98388_CODEC_DAI);
-	int ret;
 
-	ret = snd_soc_dai_set_fmt(codec_dai,
-				  SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
-				  SND_SOC_DAIFMT_NB_NF);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return snd_soc_dai_set_fmt(codec_dai,
+				   SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
+				   SND_SOC_DAIFMT_NB_NF);
 }
 
 static const struct snd_soc_ops acp_max98388_ops = {
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 9ee4d9926e06..a4c8cbfba096 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -236,12 +236,7 @@ static int sst_platform_alloc_stream(struct snd_pcm_substream *substream,
 
 	stream->stream_info.str_id = str_params.stream_id;
 
-	ret_val = stream->ops->open(sst->dev, &str_params);
-	if (ret_val <= 0)
-		return ret_val;
-
-
-	return ret_val;
+	return stream->ops->open(sst->dev, &str_params);
 }
 
 static void sst_period_elapsed(void *arg)
diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 2474eb619882..515e4dfc1432 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -130,12 +130,8 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* Set S/PDIF uses internal source clock */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
-					rclk_rate, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
+				      rclk_rate, SND_SOC_CLOCK_IN);
 }
 
 static const struct snd_soc_ops smdk_spdif_ops = {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e9f092f082a1..b9b2bdff4ccb 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -1114,11 +1114,7 @@ static int hda_dsp_s5_quirk(struct snd_sof_dev *sdev)
 	usleep_range(500, 1000);
 
 	/* Restore state for shutdown, back to reset */
-	ret = hda_dsp_ctrl_link_reset(sdev, true);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return hda_dsp_ctrl_link_reset(sdev, true);
 }
 
 int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
-- 
2.43.0

