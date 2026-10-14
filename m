Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CA4F30E3
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977331; cv=none; b=cTQxXXBrDQ9EQR2H8qCuwnfksDk5AcVSjqbbEsy/rZcPn87E11bz3+AqJvVhDkXv6j5L69fLrunUnp0YDMfm2X/aBLqwV+l/cMPmPdBgYo+1NoMG9iWuqbZlV3Mmo5ueIZNnISBNKgq/WeBBFyn2BFPKlNiAZLWhjfrVbwQt3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977331; c=relaxed/simple;
	bh=75Pi527tpe9avIX9uIyazGSmLusLOPieiQVrl5PsM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6MbruZzpW0e0q4LGFtU3pD5YX4O2qjYVrlr7sHB8BscEQ1Fyyg72n8mT4DF+Vh710xNON+kNlDAk8jOp06mFQNTYdJMneLbkn1zeDayl2CCGZ18rYlKeiVbWe8EQ++Upm++MOc1wBzd4cR943LGRQZGNp71Xl+EuZtGfI9L6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3qAkSCE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3qAkSCE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2114989a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977329; x=1792582129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=k3qAkSCE9sNP6+ILakHh/uu3RSZl40loup5+/yg1C4c/OY7j/A9d/WdDSFafbu8Hsz
         Pq5+26Ry8mxQTLK5qsOXXUkgNyxCOdBe5WU9ZVfD5CsEe+ix8Bbuhrbziodsl3lQrWtM
         S+GQAyajYRhWRd0JeEijJ7p76OMHoKIN+HWIPRcBqrX9/vsVPpJpSv2PVG9U8Gboz1qU
         woPjsAlqCyQAZ6wMfPy2GDUwiTyM3C0MuWOmWtfa5oIgjKbDtVItTxNrp9JEhnZVso0a
         LzXmDiB251AuMQXkfGmCeB/NGb9BD/w3FGNJ7tOwdxuZs5PL/dWnZaqp9b1Z3djsfTQ5
         oMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977329; x=1792582129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=fmbOuekG0K6Q6YgykK//14gv6uqB9cBiY+AXMH5wet9ZBQPDTY0c2oVssUGJR6+yhD
         O+Ann6aLpDcHUj3fudKj49qZ8A6OxNkGAJoyFePnguIgilWlh8zNDXYMKpe6mpTDiFHT
         a1F1uGTwfdBdy3xTWxiXxgy9X0dflgCpCgWCGeeX73rXRjdsMU9Foj/3uZj4Kv6s+rbO
         bpNP4/T8sBrS9rIuREKwhf8MT8Q5hxK1ZOFfYcciJSD3yka2q4Yqv8xia93BQICrNUAu
         DvrqcpEgeLiOiuL5oPUeGh2NTFX84kCCHx6uWZyu8yzrQo6IUCULYYvsaLQVWJbCA/us
         nh0g==
X-Forwarded-Encrypted: i=1; AKwUvBySrKQB4empIyFc9A30swxFslxFTaHno6ih7U0Cr34mRs/aK5SZSso+2XYyUhIdWcWDsFqOhSrOCDV9Hg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhza23RzQRyqeLpv/7cWZNvtyldCXYZQEo4EC7xh2dg4rbflSm
	z7OcKa/IWtjLAeBhHAm82uX+ond4WHSKUDxJJsKglsuYT0lz5SEBj6PL
X-Gm-Gg: AYBFou3eECeC+S/F1kQPPlakz5YqErxNGc8tKKDPk3XirgQDsDYJgYkzUdzyaOwlm9l
	i7+A1kGPP995pUBqc6cRC0fUijcCGvbhzKoIEu2G82ZetRYFlsmtHUh8NKeccAzQMCSS/f5KISy
	xGDZ2EicC1s9xHlx/Wa2mLxSB8f4C3kaOjKtsVZbsLIBQxv3X/p9frf1yPVqj6r48lTimkWxmPb
	dNDGmQrJSottnUKWhoe1TN27iLuCQlQQwaJZ3awQFqbqDNTIXOs4Oa26MWQ7aOhlBcJnsMRCCTh
	ErAy3r028t/5zcK4p4vFHMDCEz6uOMBNlsbpNWbOl4L9puSN8/BaAUv8c2icDBOJkYldFkwMsMQ
	mkZMf62xEnahLHDRdBkxdJFm4MrKt5dMELE74z7itrgr+BAvIARv5ZvqCbRrMg9YbLAutl2NH5j
	xBjra3IWkvcc6gIyzTgAtWpRiX3VUX3d0o9MQH9bGr2Pqp0nr2mZ0KOutKeL/VXQAfkeoCtcGYc
	3Dn0/QLr3higwxat83RM6nMIGWPamTPSWKR0KZIORunThlIw4KndJU2LR99RRuvHqFECikZeN3X
	q/zGPnOirZo6LioUlEBgblwq
X-Received: by 2002:a17:90b:534e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ac7f4cbb76mr561876a91.35.1791977329145;
        Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/16] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Wed, 14 Oct 2026 18:27:41 +0700
Message-ID: <20261014112752.683032-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0

