Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7833A544A
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355600; cv=none; b=h8cOmlsVxwshrvMxZYqvuBGsOu2lZkJueeUBuIXwey273wAB5zwCxuCBoNZ9z5jUXcO42zbMkvbq/S6LuaPDcKDlVpK161nGzyL5VvqJ8wVzJKKu5g2rOPpMgqUgjMsqZkzg8ftU3Wrx1yAsapTybYepPDZNBTKN9BYT5gVUVwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355600; c=relaxed/simple;
	bh=JKIIgqWX5qxVPEB4mEVEZFgtVqMQiJqYfzepK6S4EQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WJ5otapTyVkm3ftSIvEs3drP1HUCTRcSRgG+bkk8rKr24VYMZvocbBlZbCVrfvrz/vz/pMTIJFqXOd8kUnCHSNIGmiSoeI7gtgzOXsVV5R0rPr/gz2RC+taN18c+WjR7RS95tOax/t0IiNOPUcK+jil8X2kPCatsyM+UuHj19P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAxk+aq9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAxk+aq9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aaf28a86b9so838596a12.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355583; x=1790960383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=DAxk+aq9gNh+zgdqvHMHQK97bBvWGt3VW49kSKKlx6tgLsYY9jx3Rgj5wDkUaebdN2
         fL32I+X4TiZupDVB1MQS6GZntx+AXzJ5enVU4O7Ub6/0OtUktCQf8Acajs4qxq39tEOY
         joWmL54sLd1GqvwNcIlx8m5CWWZCyoac6pmSLTluWIXggINPOoO6xJK6GmEAe+guQ5Wm
         4Kxj8nLzsRpw+nPfm7+ovF6b+F7K9B7R0Urj1HtvwFLFSgnbwtpOEbAdNNHw9ez83xGi
         ftcK2i6Bw0REnibEGKmGAfGYdX2PVDis1CfwMzlSZ/f0uTLDpoVBhHN8xZlD/nLqDr6h
         71gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355583; x=1790960383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2oQDwCwCo1gfWj8hUM2bE3rJ8xWs7DjrsEeE/nug/Y=;
        b=eCVkB6roDkbG9Xx26G5cHK7FS9HVTdvWnzbGcFPUuwha1NfcU0LIf7VjeDOdqCWmQe
         EUKf+D8nsWy2AyQkYJ9liLcBRo6sHF9KMsvY9Cm8nOgI3mJKQC6Mq4fedqVtyQZ5pZ/m
         xj5UZKL13ZIPwQWJBgJvt19vekcsdiwH+yYQ93LnMP7VChozDDVwhkqEAkrXMNygB+UC
         twHNytfi1zQwODDbp6ueQ0MLlGUIqmpao/Q4pQgcG1GFCf2WecBCA/Qwti/e0935kjyo
         gmSKXig/Ergr+DiM+Wy+YCrzdyqgfnC8V9qimXpE64Nttp5xyJZpxA1TIELTm8mfcZ+X
         Y2Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwYX5lu6YkZoHYmkXhbPfBD9ie103U7d3kRHmpXd42IB9axxOeJmvjtJzU78P5S3CIlmtecDywLdRlm/A==@vger.kernel.org
X-Gm-Message-State: AFuF++kSx10UNz7XZbNIdTxEdmoUDwhJ2PNvJjoi8Mzxs5WyAaWknLUs
	hqtOvlgj8Y3lNrDVtVTn2rO6+mV3Xprg4iyG1AhGzt7Rwk9PFuMYGqik
X-Gm-Gg: AYBFou1VCyoW9nq4n6Q0pxZ2aNgp36U1BJuAy2QGR3AsVvoi3pdvljqfklPhbsOxFMr
	EzPtfqzuHVbeDoWhet///21aDavgB3dypY/f0RSJHxpCICGZ31bQ1WagTeVfg6oWzgzRY4CYU3w
	UmCjPt2qJFEC6yKFQqB2HZ5owpLrrOYwx8qUPwRPULXOFP37QQlO/XkLS7gti+x01jNP16ZwWQv
	B4C2fD3kfrB5y9ZPdIjhjSlQfl+SVmIat1NAf+s0TY8E9OGHu5UgV76cUDabm/tF5/bxX8o64Tm
	2cBqBhV3bkmvD0uMhEj8ItXAs0y9aXEubjTSEnxOTuNqZylNLxANsXhhKnHqlEbSzepgb4t37AX
	He/pqmgy6qCsvJMytxpz7fIvSwrxXX5eiUfFf7wYrKQLPWSlaAYnWlG6Mb55KcDzlN1Ar1BEZGS
	yaMdHr19qO8ZmU4EizvBwMBf1/fQCb08rR+OVELX578fU1l3G9XZ9dGQHliNYekTy7faI+GNmYd
	wn4j/zi5fARAKssw3Tsi2Tdj++tRMfZFoZQ75W2Ao3i44JIxNhbySXx7bwavlxq
X-Received: by 2002:a05:6402:12d0:b0:6aa:ab94:4a36 with SMTP id 4fb4d7f45d1cf-6aac8f1b94fmr4157302a12.8.1790355582773;
        Fri, 25 Sep 2026 09:59:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb9b0asm1321152a12.9.2026.09.25.09.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:59:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: Fix sparse warning for AN7581 AFE PCM
Date: Fri, 25 Sep 2026 18:59:17 +0200
Message-ID: <20260925165919.5407-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning reported by kernel bot:

sparse warnings: (new ones prefixed by >>)
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:144:30: sparse: sparse: symbol 'an7581_afe_fe_ops' was not declared. Should it be static?
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     expected void *base
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:419:14: sparse:     got void [noderef] __iomem *
>> sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   sound/soc/mediatek/an7581/an7581-afe-pcm.c:439:42: sparse:     expected void [noderef] __iomem *regs

Make an7581_afe_fe_ops static and add __iomem for the base from
devm_platform_ioremap_resource.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609242059.t4FlJzOz-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index a1d742362538..d47edb630452 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -141,7 +141,7 @@ static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, struct snd
 	return ret;
 }
 
-const struct snd_soc_dai_ops an7581_afe_fe_ops = {
+static const struct snd_soc_dai_ops an7581_afe_fe_ops = {
 	.startup	= an7581_afe_fe_startup,
 	.shutdown	= mtk_afe_fe_shutdown,
 	.hw_params	= mtk_afe_fe_hw_params,
@@ -375,7 +375,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *reset;
 	struct mtk_base_afe *afe;
 	int i, irq_id, ret;
-	void *base;
+	void __iomem *base;
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

