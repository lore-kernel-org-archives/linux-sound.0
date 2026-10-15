Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA60370AFD
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029024; cv=none; b=brKJ93G3Dk775ccbpPnR+nrNV+PNcOF1H6KQQGRNp1B9LsDfwzJz6HVwb7pGjl+CmaEk/+KS2ANXLSEGTuuFEXXjG2UcHM3APGtDEaDw81cKAmUG3BeFonEDjFAv5F9NBS14/8Hw3CIcPP4vDdjcHIJNlldNOwa3zP+ySOgjNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029024; c=relaxed/simple;
	bh=FZEwana/OW3ODi6xFN55pPX+MLagNsoGOIMAf6UwyHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkuNfeXzXtdSAbqwxiEXdNMpNEixj7S2hezCUMwe7M5dZQ/JAyk8DW+EZXn1lzpK4mndP2jKaDZKPz4dtSUPqt5SKnfzhZs9nlngZGjWDkBf6FTG0fsg7da3Loh+ir4PeQ62oDXPbfP6i9Ap7zhPsTcG8dRAnZnNTm2ebRF4wUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgBgoVUJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgBgoVUJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27577495ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029022; x=1792633822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=EgBgoVUJTnuF4KREKAxIN2diuHFmGGPnfnIbWlAnrKO0ME0gk/EhQ5kOo4ByxjTtZp
         nA7hCkRqoPe4S1WU0X390GhZUUp9RfBHEpdaQlQMy8XzSKVO0ss7mxYhP+wQWXve4c1U
         zXzSGtJ4E6OtbsMVtz6ddZMOFApE4vlPpr4383gRkeo0NK34yJqX+w12eN0c25jsCW4M
         UPidPJPMzCRvawE+QRgDgphEGTvcBiyjwXJnEaIFL0UrI+dRPiVrIrw9mdX8EK+uLP6h
         EwM7jwC7Sr2ApMnHA03oGsGJdOsnvih6rNuBCuws238gsSO5ultLRh0j6KNTb9KTTgOL
         j2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029022; x=1792633822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=Orr+za/870YwW42jLUCG1OyzQ/QcykXwhVlAAkgApYLamj68nkDOA8bVdbuPkXI187
         l3LTQayALkyZXzWUuvfjCmfaMLanpFueEcuGoiiFfrTQYUh7HSJAC/hRgQifE+Miub9m
         NS2BHy8qvetJp9uKKtgiC5gV3wdMne+NkSr55kYQDrDRUHsEGqRhwgWrgJqqppKQpFzr
         q7ffkR8ibo58NHZlzfZimTyTB0AijoPun7CW29adVrUoMuk03VxZYBb+tC0aqIshs6/N
         S2XB9+3gkDwR7L+F463DqxpeDUUb0qklbzm3xx/mYRe1phaezfHNTthT9rBIqimG8hdp
         FCeA==
X-Forwarded-Encrypted: i=1; AKwUvByS/uj45oL5td8I9JJUR02zlZ/1uc5hTWhuHw3yiZjWaxi98kg/UbLxF8zKuLh24+9nywOZej6XoWFz8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJR0X3J88rII7uNix1GhIm0xV93J3/Yc9mvjSkXKUD/qdvwiedZ
	6HkLyWvJ7EZgtn6zYelwJTVEmcD97CtmMquBOBmwthaDxmhG/9vFyegk
X-Gm-Gg: AYBFou2RDKcjQeD8Ph1E/X7v4aDYzmZfGjee9Y5ZsVjPPCHEpUB9mUK+CyNLCoAPg7D
	EhJcoFx3HZr8Kj8aYyc/fww+e5FWODD/8XdLDrG1BYprRXxxsKFJcu77tR6Zrv17mDKJQxsO6ZI
	DDxpy7fkTAlTvpVA81q8jvgB20InL9YLE6uRgOZnjOZkoKVHW5MJIlhkPw011FqCgQsBkM/3m3i
	vz/APf0xSGSTm+h64IS/Pk1qhskU6p4qOlTFy7X92aEURzoP7ea15/908vRC1x0UTqfJb6L7VzA
	JCRAVSQ94ajAsRj+Q/1eflQXKq1t81wliJw0/OqmJ3UABoZt8JNXocDHyfpudwCTkwb7ndqE3YF
	XKQ/e7yfpSgwC0YBz2RDl3+5ixv6BPdwJDW/byoM+tNnKScF9v9cwjxaOiMDyQOqctaAjloxbZW
	wPPoIobcRmOtjzX/4KhEgMmQhXmaH71hQrrb6UOHRLYyuQx4Ba4vX9NIGxtGw3fvxZjy367b/8H
	uFtsLEn82eRAZWePTjV8hHvH0cvWiUq1DnjeYBzRR7nJnkK5MjAb2vcbMIlIab0vH1qkfz2brgf
	XI3baG4jnauvMA==
X-Received: by 2002:a17:902:ef44:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2e842bc6930mr140413355ad.55.1792029022012;
        Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 23/25] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Thu, 15 Oct 2026 08:43:22 +0700
Message-ID: <20261015014324.5569-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5f4a53886541..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,13 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1011,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

