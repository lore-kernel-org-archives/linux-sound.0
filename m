Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506F42E41B
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455980; cv=none; b=lVYBwM8TRKJTwk5tInjN6qom5fHICNlZKMJ5V58c1uApIRK7SOTKLY9ut8xcravmAJacvjZKuF6ZHuglQgoGnMxOByH62mKHfecmO0DgcrwC3ZvJd26PrrRQdl/+ZyVFm8FG5extip/6aK8f12TB//FOeYzHyJ900urUPi5r+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455980; c=relaxed/simple;
	bh=M5phZ5RgYLMwqgmoz0IyXZlTFh80R5DGK+A0fLhzSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWWGG5oPRm0MlRayj9223fsejdTXNW/vSgCcSJ3src7OPWD2etSd7W7VWSpkxV+k1TbXVRRJSXM/SdrvcwTAxpIa6WmZtMLYuSUY6og0t8F9NQpZgSRP66BRWOk+ra/xJJ1IdlRDjqRU4dRBsqrUT8oiuJ8z0ZU8KMDNWn+axU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJuBPBY0; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJuBPBY0"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35154cb9de2so4039024eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455978; x=1792060778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=ZJuBPBY0UzWetl1adpdQpGpjTZM8MzEW3PeoI28gQvWvGtuP4FGZ7iUu4ARvksXjkj
         LY/zFtWahOB7JyHJ5T/BKwk7YF5Lh3xpsiBtXqzlc37bd4yJaGlKBajMWNDIVFLV9DDi
         3S3fakrlmk4+D285Cb9Fej6TEEzmssAIYFxDWqlJmVisbXyAPGOrF9yYXwEIG2mRLa+4
         xEJA0VHZ3u2N2SruQYyNvCmOd5kV+Ew2ECHn9gNdNH+ZgWgInTVJeY5S0PLBGySZ5Tsl
         /fahBrWsZjWwdsWUqulMhSkhJXTMB5EPf8wJE0c+dcOroFQYix+Ytdr7rCSYmZKhWLEx
         sP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455978; x=1792060778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=kPVHBrvVh9YaWpPDzYJQAyJNYhVomMLLO4EIse+y/xT4hboOLoeosTgqOaJxmJyWmN
         W2EAaqfk2+5IoZwnviYI9pVqLEEisMAM85B10dNz/e/QqHNLQI31sSxF7qcOwp8fJb2S
         oKYqjRpmp1xOSQXENwUlc3j7pmSBnQaCMKOnlWpHovNTXTppdW84j1AlU02PFhG18qC9
         7gFNcA9EN3BmZAEQw0ZMP3MpLtbsWCr7dkFxeJD9QZNK3UkbRtp4jiadgCyWYTN3J0eO
         HMuUCH5wtHCU1Zd1/Z/m22VTJlYjusdxJ4TVHYuNMi7o31Lngeyawl83iYXZjFADqgQR
         kx2g==
X-Forwarded-Encrypted: i=1; AKwUvBySS5rCaXz7h0hofLmIQICM4FX3iRZrk5pqc68OqJEetyLBZ09cmiu/+6OZm/CxXNrs8zeeWC/VR5ALcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcOFxoX7k0yjg2dFaqPeSkFIrmbcEYEyrIWUZXAhscRKWas+vr
	mLRDWsUEQcCwDz4mi/oo3UzkaDSwXemmZoXfXDzSFqOabzZJJNCYZHLk
X-Gm-Gg: AYBFou0eMAHgTHBprNz2Hcv9oX0dklRCGPwHy4XPO/NjtVHP9hOZjuFGRPLbcco5eeE
	VJT5ZuMvy5o/SrwLtPjwtRwnm4eo6D8rxlW91p3oEtDXFnWfAn0BLEfOA6p3UgPphrGw11shGiK
	IRW18T2iON4JbGdAecMplRtZiEHdCwiODo6kjRJUSCyUm2idHmBlRTZBzflxgdYNPKK8vbkubiA
	gztxyhsq6ky3AzcD/WhfeGB+HgxY1rhFal7QNbwCjScYDTsF5llWrHUbm3hwI45iNyGxobL3ABx
	ktFHzJ38f/5LjtV2/ASASr3uGEeJ9CbSRwwMjy3yOOtqfrFlE9DmbRRARW9EUtgcAuzs01yPsvm
	vAysTajrO9MtztNtRjgarbM8Ezh12xNc56woEDs8cR8FJhDmOOnuLfgAGzinJieViH+knEsn7Yw
	BDnxBTU9smxDPqQGkUYuNsfS326+ediFjA4Yd9YQjLPUbFl+ke3QW6uFRpRhBmkII5kOdfhcuqt
	7zaXF/9Mv8NaFHbwwEy1ObhUhghHw1aFPFiEDXzKSGDMTiMzsua+wcCRVsj7QzJOaGnbGz7ym8l
	fr6DP9+1RypVG/Mus/7Kd7Bf
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7231654eec.9.1791455977867;
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 02/24] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:09 +0700
Message-ID: <20261008103831.542533-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..28e0686e9373 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

