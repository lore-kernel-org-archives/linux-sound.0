Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42D1492E53
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455964; cv=none; b=ScLq6iAqGds+yDSOI44wElyQ4Qu/HYT0Q+NrubuGpby0m+Idc02RYZO7B8BxF4NwEvgWRzS1UnTnS3AuRRUIm9LpP3dv8qL07pH703GwkJ+3LJVoRBPHny1s6mMiDrycH4HQK6VFD+fouQAdypC16KcDsgXMRfQni58urowVfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455964; c=relaxed/simple;
	bh=P0PnLczAmd/aMiJpLkV3Uc8hCTghUUniVfLHJq8xHow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o71pKHzl7T40jXYy/qkgFblBOGAQ16ltf0gx8cJ+yq34J0r9UEuR8WpXs+ee1Dcu5s55+BuJfZguxpTx2EIwFzAxFyTAAuiZH4EgvdThlyYjwU50hQ6PgzTKgf03e4rRzJ8msgRonf68ufqAuMPkmZFkwlWBQXS7tAD63sTqzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfajH7ny; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfajH7ny"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3516c82e96cso2572636eec.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455962; x=1792060762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=HfajH7nySLUxysMtlztgvqFDcQyqqn+Sb6XnGG8FJunbnUjPiebSXZuDXRLYo+DvLv
         d5eu9KozxnVjBoYt7y0/w571Klj8Mmh6gFzLPHhCwh60poUdL6HL+FKBTxc6l9viX5mW
         x1cubDJb6WtAyc7mQe2ldVuncUfJXMRktFNbPZ79ahtcdT0Iu1KHxrMBqIku4U+McVb4
         zyJBEp/L0Zn1rIHtsJvSUNlJElNLtACNw9fJfGBDbW4fO8Cv1Xm/UIOSA9zbb2OeSYjR
         SMITjhr/Bi9omvLOB+LOrWJx1hd6ZjzOomqHt1AGBsQPOZfy2XPMN7zblD/TUg3jGeve
         hoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455962; x=1792060762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUBcm/HidbDHRMMNHvpjEcX/Cn/b4904BqGN3eWGjuM=;
        b=kzS3SSRfuwaLLgBD/52K/ySxfY6gi8CEtFp63eSck1otoQmhyiCdLaNk96vJVaiQuy
         cwf7nSjm74D9NMwn8G8G3ibXhij+kdThWNKBZd56KwjgtZ6qGH84uD8YgIu7wUuQC4nQ
         SDm3USzcUgDLc4v+LEmpZJWTaGcws7+eAFbMP1zRkIE+U+WLqxuz3lNDgRvCwsMIvTnD
         3Mx9061aBZN4wwNJbTPbHievR0gWtjhOtAblZN8Jod9SC/KfbiA4UBw6+1QlAWGAQrUk
         yL7q1Cy3WamjOVr1EO44tKnfqIVaUQ7TFIGmPIsUCTKMxflgtZzi+0s8/B6Xv0Iyx6/o
         nFHA==
X-Forwarded-Encrypted: i=1; AKwUvBwavBder3ez1btq2Ed403JumZLpdeq1kZSbKujOVG7JuetSk7VIwlQxK2p/4qNFGngbNaosPGNWctrjEA==@vger.kernel.org
X-Gm-Message-State: AFuF++mk88kLHiV6Dcja4N80ziOpr4jZfUA0COtwCxrqtImLhGbo677O
	7IPnL5oVEdbEVoOUl3j7uL79+rbFa9lVo42USEVTpGIpmsMd3ZrRXsxp
X-Gm-Gg: AYBFou3Ka19gnAgCxRE2Xd6k1iiGnMak+jPe/COpGI/zxs3LiBbJ3dhvtNgp7wEIz1M
	q/TNQn2SxsraIhLbsMdYTNceI0jr0ZAB9b/IBPakGN+iFOrwG0DTt02iIuxRLPjnjNU8TslDgy6
	1cyLYXkS4+Ktvg0uvIdMl0U+x1ODg1UTHvB7A9IIVeTRAoMFv0jD0SB98jrxNPZfeYeekJyscz7
	7xfsT9MNgRvC4PuJg5ss2P7SUHKK20Cy7QeUegwbJ81g00qN6Q/I883lgfSD7wjUpjaJT5Zg3Wn
	mE1tB/Yo2rm6JgwBoVLdFI9inr4ldfs9xcZnLaW71d/qcV4JFEjRXG8YbppYPQMe0VPanQaUL3p
	3IMdHBnjKPffKOrbROLJqH0jJqI4A5jndaIE1RmfVDd7xLHkoAVPVY352LM+5Sd8JcROVDDheeR
	8Qh0VO8Fd/PYGrzKd5Ksf0Wl/7OyGbj+/LQ/Tdy1a6YQLAE0xDj57+7hqwfexDK4yjpC/9lkNJ7
	SVKMDz5XG0PCr3UiOUn/ZyjVl/u0mzgtadPBgYhoZzaR+L8bM2dDrGGS+kzBc9gSZ3WYjfrKl4u
	JWvSEbPRj0JCkQ==
X-Received: by 2002:a05:693c:41d1:20b0:351:b65:63e5 with SMTP id 5a478bee46e88-3515de8cbe2mr5796544eec.41.1791455961706;
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:21 -0700 (PDT)
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
Subject: [PATCH 01/24] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:08 +0700
Message-ID: <20261008103831.542533-2-phucduc.bui@gmail.com>
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
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..ba6dfe8fb6b7 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

