Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3447D93C
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198211; cv=none; b=SIVOlhzgmCzqCIPn109B49YbYQ5d/V5qWt23Pg0wLqqWuIdZcJMdAYxJzsrQWGIfQAD3RqZWp4Ckpthh3CtozJ6tv57NOsmeCDsjJQGF+8a4vi7ARaeZIGr1+PD5dvnuFWJDTHngsRNsG3guzYPcwzOxEWwXFJAuSq2m/dDriZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198211; c=relaxed/simple;
	bh=XqsJ/oamIOk0pZvu8Ad2mVMfwzmQXZjUOK1YVDL68Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxFkbrO2NfGHNl93+MruiXKsUwQigLkeFS9la4cUr56jBCnlMapIqNvkN7QKZJydWx1UprRN2q0JUmHIz/seVhIj1XLnTWiH1gUX76UHqX6gex3vKoh+W60z5PrTa33vjTxEJ7VJWOdFWumQ14J/1lPkekEyeqg7/KRUKqi06gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duTO0t1R; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duTO0t1R"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so692839b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198209; x=1791803009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=duTO0t1RjE1t7PYmKqpS+mK06SOIl/saq3cVk1YtPoPE9qLEDxo5RI6qWNSvcXxO8C
         PwMGKF3IVj/m2qbxiH6JIoMwrECBMIQNYkYnp30usf8+Q09ASyJ7MSc5QmKrAzJ3lGaV
         BumUZCDKgSDY1Sa+A6mBVX/vHslIpYzjeWbXSFfkO2h13o5yZVx+Zc1rQuXDJtBTJGBn
         AwX5Hfn6ijOIDurqZIRmrzvpKHxowQTWLbsidqwGRJAmSxOR4oLPtkHBgYfPNT6VI26A
         awcO2/dOpwAnyKTBmzeXbGRzYvdfyyzbjYdGTw5g3ojXxRc4C5unKKX42r5LqjdF0QsL
         FbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198209; x=1791803009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=BdM3f3iQZcu0PTqhY9xHo2tnoED+6OBwiQZUDp0p4z77I0znw7Z7KoaqTvYL8iSaQz
         8uHWg6Dsn5WY1J8gdq6cHGQRIVpLkEmVG4CVhwOu1JyNKpgKVjs9ohwvoaJWhJ5qDJnF
         6oDQgcnGMYQaHuzm1kv9PFeFQzYsYhM3LnIpVOsNoPgJXJ45JhK7Jp4CEWpIgEQ6OWB2
         8zThQV3sZiHqzRlm3ZCy6Ltpwxi/B8C+pIwffrPK/c6bjQ2qzgaM2e5g0ZKq3xoj6lGj
         O4jEptHJAHcccJFDmJZybPgPcCzUTVO6VNiU71UPoSSkuPCH+zu50zR9rqipK1tnNS+l
         8Jeg==
X-Forwarded-Encrypted: i=1; AKwUvBwuY/hy+UvbnbdbVYnz9KkZTqvU7p4ywOYOGX9fgV9EQMMtyQMHsSaA6g2LKh6R/17KuWI7ZLqiUDR+ug==@vger.kernel.org
X-Gm-Message-State: AFuF++nNrI0c75JZB12DVSIVY115w5+Py1vYtncybPx2fIaI1EFfKg0n
	wuLek+IIgc0yzsO9h82dTRblZeis8E2KC+GE/8vdM2JJLMYEmdbEDMB7
X-Gm-Gg: AYBFou0Lr4478+5DFDgpwOfSNRb51q/DRxDETabxrNvV8t2fGqTW05kBomGufI2TH6G
	jVkVxmwbObnN8y8NtgI/lGY3zwfs6UKrUjg1gYE3hWaXfQHnjuDn2Vn4zAYaIydpZw/u6cNgUzf
	FMf/KVf+AmvbTBjVE+WhqwXzqrCPXzYeugoBGjeAL/vIlKO60Fma6BkqOg7tI8ws25UJ61IAyKA
	NZL1qHfDvyfEzlM58DimMq9q+flaD4qOeBQqINGzzjd7XDbRqZlqS0yQL0MGx5nAEodwzhx2wZx
	0WgbO4mSnz8XysIoH3PrB4rcA5haAmHjEi3mZKI0wZEwQKs5Auol9lu/kLQ1RhShjPOwx4cQ9tL
	2xh/wPYXHe6gdC/TS7uXzz4FJd5FLAV+mdcObqtMEUfApxjCYoLbkrevSEzG75Boh4J08zTmnjB
	eOn+bHr/xBlcfQrbq1Agy4knKJbfnjoQ5ktr7jgbSCxRmUyViEVlViyC4/ErGeou4tCKd+PvC6Q
	FfH8bem170SBRgH2bjWYu6YiVAPpOWrH3ViEfdtf2lLJvRxSaBMehOMzimfy6toBkLMyQyy7nyJ
	2ncpVDu0d2LhY+GOaqIBP5Ho
X-Received: by 2002:a05:6a21:ed0e:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e0bd42d56amr9814841637.65.1791198209069;
        Mon, 05 Oct 2026 04:03:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:28 -0700 (PDT)
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
Subject: [PATCH v2 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Mon,  5 Oct 2026 18:02:46 +0700
Message-ID: <20261005110257.50145-4-phucduc.bui@gmail.com>
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

