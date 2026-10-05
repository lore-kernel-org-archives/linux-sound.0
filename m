Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8A47DD50
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198245; cv=none; b=AioQvTht5jQWH0aYBWXEoQWlqGtlS0tD2iBlTVno0vzPjoRMGw3ENYc7rGLY9m5jqsWK5pvv/7zt1ArxHNvYU+cJ9CoyEHq2jn5XDUN7pJpLExuMSgMoPXbEbKkXoxvKNFk3CdlZ6LK2xUjP/UpdIFZH/Qmy3ShzDAon5ycQ63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198245; c=relaxed/simple;
	bh=ypQXbofgJUYSU/ugIyK1wgNOcXryRiZTUAAMJdAgMxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAL49d+F3L8g8hdKQbR0sT6Iox+1BWLMIjMV386jSS85NbQGH7EuSCY6KOmmkqDB0/Ej0vpvhGSTS8DVch+PJffdBouhQgUmOV6nG3wyUzJdte6UzKP5A0c8oetmQ5XgXFq+Fw5Dd0J6DDDKa2JW9DhSNJ5NnwDoaFPmvkH3YKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5mREot6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5mREot6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbee846deecso1177289a12.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198243; x=1791803043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=Y5mREot6j1xvc7xX9PzSB8QLf1D41jR/NOjsRL33qziy6uJXgJb4TzEnXi9hi8eGzd
         a12jgphhcHpfSuu/hx/dJRP/T6lH0l31Zo0pXrzFspOPVJk2UtuXWQe4mDQ1EZ6l6Q6E
         Hn81U909qpDa1wJ9G1KXCYibUvag24kF5PQpNRp1goiBWTt6cb9jJMY1EB8OV6uYsHJ+
         5DqKLw/UasIZKS86SGQk9I/4ZeUodstLmfp8L3Op3og4CpuFdL9LjBsr1ZHBy0zRuGdN
         dxaQ1fdGVR456t/Lp66q11DrCRZmLoynVoXW1FokRk8qth5K+mdZe+//Zv2ez1LRpKr2
         PnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198243; x=1791803043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=Mf0l//SgG2ZSXG7jv+lelzPx79c+AG18gA8fZLVHCRzpLRWtsekqV7Egy4ZSZ6S7Ol
         PLMS5+/y5IfCfFnjPwPvr9PtGo0VdtBgyDN8V82DXMIQTJwLk2V+sEJuXIebQaphGCXX
         hGRFF+bZhc3xr33qZamuJiIs/gF9WDcXBK4XGdBQPWfAP1mtaBjrOrCWlvHeMcxFqu/e
         xUiBVkIryyMRT5nUzhMaIyLfcZXo4AErE7mk9hu8fEW1+dkqE9SkpB/AFAekBe8ASYwt
         efsd5hH6mtCO6JXzSegPePM6KhIUBFMACWSDrcQrsahA9Hb0oYewUHu2aebI+9Bm6uGE
         IyKA==
X-Forwarded-Encrypted: i=1; AKwUvBy9QEj7vV5cXp2/Dj0NxD42sk0jbGXOJdbEFk1GUsopWyv052mI/6/edxlO+Mw+M94Yd1RJ07IyurMurQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mviC5Jxys2N0xalriHAu11gFANzqw3Y/shPZHHiMQuHn8f2UJA
	KYnp5pX2ufh8qzdX31JwNn/yDD/oF19e0O1RZas0/a9sfEcPJYLik4R9
X-Gm-Gg: AYBFou36/rs4xN0ZLUA4XazPw6+dZpcRHgwFDbgXOCuGZ8pm/+xS0t6E4DadDqZkdJ+
	TLHnG2q5WdeYo7jBU6L7tJYJboYoZZIQuwc6mAXH1sKCQAJJEbZ0N7sEqE8dPDaqLw6wCUc7u11
	rDxR9j6OZdU9/DE+poe6Ljf+K22PgfGtVN1p2bmadOdYUlu6j3L2uXcPgZniiLT87CxpJPwCXHL
	pRrMXHCwnNf03jvqu9+ShaOWGpx6IeeabkGWROv7iqGEoqkjQkwYXs+zvMl9A+B+IWpg3FkH2uj
	hbcj3KSXpbaSmy3E5m4dghEi04BdrNKX9kODEUzoJ+DZA/3tkC5OC1UIAi1hDNqogt0L+1hhkcs
	XqL40QUDg5QA7KvV/agQh9hda8knWwRAoLwvBdgTK/LF8VAuRJjUsy+/czh1+Qbjc+HQKo+zZ9g
	/R0ypnP9DO8uDy0Rr7vFbTDbKbGijCzHn/il+MunlqBca1Sig0zorXyStz4Gm11M9+h80oaBcZr
	nzAfnpmjVqBr5fm5v5jAyG3LM53g7dEamD12PwxuPi2HacOtAkc4dephyE/sQI1xxplgUBgiJH6
	QYCmfjSG0gubnw==
X-Received: by 2002:a05:6a21:648f:b0:3e0:b1b2:2ae9 with SMTP id adf61e73a8af0-3e0d6b33a61mr6751759637.47.1791198242991;
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:02 -0700 (PDT)
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
Subject: [PATCH v2 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Mon,  5 Oct 2026 18:02:53 +0700
Message-ID: <20261005110257.50145-11-phucduc.bui@gmail.com>
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0

