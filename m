Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8A47ACFD
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198201; cv=none; b=dUuebFMWXIW1aBLccixQlP8eruKJ5m+mdcqaUj/xJGDeMshArt27r7wV+bg8qAZEFpYQov5VqWsk+JcrKMRSt9bk4poj969TK6hBWK+DgsrTbx/G8U9xw1UEcFGl0p6P+1eohzSGyR8aOZT0ek1KK4fIYLmry5fGV+K+7E0IvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198201; c=relaxed/simple;
	bh=BqOIdOWIc7Bbbr8ZxXOpLUQh36ChMcfJeTwhKtu2ZR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7U51FShsUajmwcGC16ZgtIfniYWtO4b0jUVd3WAwyPGcSbC6aMl5F1ZK7aTp4cJ63YvySQj9RzPg6gWCQ9ohdDHtIspjwDXmn+b30jct5oWMi4YPAtq++nHAwmgJXQsyXtaRitMbMZcFB6Dy3IoCu6YCSDG05b+99g/ZDqGBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=seCWvC6f; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seCWvC6f"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1244141a91.2
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198200; x=1791803000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=seCWvC6f5l8DPz1JfzsJ5wIlxiqDMr5AQRu0WJvXKYsSNlTM3W1YrlYMyoh7ka0JVy
         oAQjqF+BJrbfDIwU9UpcgiTVsBCpof+Azmxz+jN/xMKA90EUCVrOAgb1SrpCW8sM81Zm
         3/UqEeYQUuiAzIgwWuTt2b2LRNRguQq/7lK3UYd68AZCxoruOfRjcWW52qBNUH70fF0T
         HlrROtgGcbpikdHBABKGNHmavwfuOlUeg/7skOzOGVMO6Uy6dP8DNQI9vXND/qetH2l0
         NAYciNiFj0Zj7IVleiexdmYOb6OcwtaKo9VoXkXDpCiMasTPn52825SvgdeaOzA+8Noh
         sURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198200; x=1791803000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=PeHgSm2/8hDeLhTgRlo2aGNYhxGwdUchcg3n2HBky46fA0JuDmW8yTtKyZ+Z3+7ZjT
         Wm8LcSlo+R+Sn7VcFARJWrz8fF+1lFD+Cbb8Dky6Qq9q9VVKkC2JEdpSLwVeixg/zFMi
         A4P7k1lBNd5xSwxczVh8ltkmcBorIHOB/ymjmiYiU5UG3/6xelhCjhzoL6WuFI72b1UV
         BXadu18E1lo3lioDWBspnwKmv8cA201fkS8RKr1p8YUens0Ds0nFy9AP6Yul1mdl7jbD
         iMJdiKgniZCjdnVZMm+pXCePAJ1a8km4kaRFNveM4nJF2ILe5PmBkXzFLqbcwi8GHlid
         uN/g==
X-Forwarded-Encrypted: i=1; AKwUvBzlKd6RQCtgFCi+5rMQTCBecf7RWn+07xJRLVljH0Uc7IZbvmygNiIfSqxUz3I/+K4giYVg09xNgdSo7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxRcHKIME6KUQ0UOb2qpGZ1Nn5lKo2Rwru0aDf30/HxTolmetC
	nLoY0oZCy+AUIrv6L7roLAekUGyHb5hEfRaUBDX3cUDX4Sye7V+RKt/h
X-Gm-Gg: AYBFou1HoytlGl3EBcWtYsRFaDl3sfs9HCMJbkzr6EwA9A5DfSm9gXuxnI5Fwi1Zsla
	DHr8xi/W3hRB9mggLvdxsmvH8F99zJxAqcqh6Ac39Vsf/C8s3/3GaXXtgnMtOpdnpx600gSw1Rx
	05gplrq32g9YvMKaQ1WDzPghStxXrVJoUzegGyFhy9S8KQ9jDfTAnMMHU/QfXNTfD1BtQ7X0A3a
	FuvAjufJLTt7HKnMg13vTfcwDJd6c16AQQG4vunFTmw7nqEPLR7kv0greCA3OZ7UlVHwTVcSsoE
	CATgvyULb3JsW7lP5EB/HEOwij+8MdszMGyx0XOhs/eCx1j/LaJJn4as56itBlGF8ZmoIaBQw8L
	CKaCjeSJ4bXNia3e01CG63pmoCaVpCFlerQGaD6PTYq1USXXH9/KwIRuTQjwvTIWhw/5PzduH/A
	uiPbMOORLO0izD8UpsDrVNH5bkA20dyrlxhlNbNl2xkoblq0sPu3/I1v44huxLQsahk5c3qsEGM
	mUrLVxiqfRCZkpvf4nc3AjqwPVuxZIZ/gjqJt2QztGqHgnjfHgK+UVLsLgoXX4Ri1pC9Hq5TLlz
	FSZQCRTftqesVA==
X-Received: by 2002:a17:90b:586e:b0:3a0:f5fe:74d9 with SMTP id 98e67ed59e1d1-3a6ce3a97e0mr9329608a91.4.1791198199561;
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Mon,  5 Oct 2026 18:02:44 +0700
Message-ID: <20261005110257.50145-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0

