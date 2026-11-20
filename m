Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202652;
	b=oZhEjeumfcsOAbPTuP5akXrR3LUe/hI4Y2qb/l07aGZcj4Byx+peFzOUIo35oLu2qtpV
	 X2daZBnTq3MfCPmgtzC4n+qPFhqbzuHMwTCsEiSOWYrcvFtYk8xHwN3QdxJU110lsOm0x
	 DlmdDZwvyMk9sdlKOnXoyFAur+YqltQSmfpW9Qvdewvp7EMOCKPnBbQmykSAqu6B0dwkU
	 moSIcuZRwr3Wd3JvmyB6JhMqKuSxLsaSamy6gYco83n6rvMOKOPV/MOFJrZc4hyrLlQPc
	 59gNBkHgLVUBj+nWYezUH2cPCLnG6mDNEuep5fGgxaP9Wia9xMcZKSa+7v+Ps5Wy2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
	b=fY01DQJehE8L0cS1MKdQ5NP7ye+rs49n0EmioOrldHU6jlu7KMZHyNb+RT/FszpCXzfq
	 N1liro7oQTsQBlk3KLbDjWv69uKQoxRp+YV8HSWl7+jaGLr1Al5jYwOO9h6TFqZVrGZDj
	 EvS6946LsnR+RNR1kpVSoRl9cOKmXNlhoKTMms8gQcSocwpVX89aANG/bxvh9OwZ16ZfE
	 sk8XYXcgj2tbr3wl3QTymyjJBhY7514uTz8swy2H91IhixhxTPxkVV/8cbrVE+gtgqqNl
	 Ry5uQ0Arvxp8SPI76zLlsaTJcVMsTYg2SuVR01gPZY2iPDu5YwyPCR/IMW1jfiktrJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ijEouGw2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE28606A6C2
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 19:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE28606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ijEouGw2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3821eb27024so2028190eec.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202648; x=1795807448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=ijEouGw2IxD5Af4o2WQbYNAHV9WMou2u58uhHfdGmwNN2HCyvJrxJTgmOLTU9HfcSD
         A0rEPKvQ+nxEF2B7qE6sEOs7rsyyQ1gF9mu2m8SRu56RGw8y3N1FAQTHkNDyOn5Vq1NS
         hvCYE3uoM4LbyYCa6Mf96RpVljb8R5RR9tH6kssM7SSg2tHLc3oIyL4XX/WmPKr3W23W
         sd78TWYjPaA/tyJc6aBDynFdwfEEPLJyQoAbYzQVrgIk8waAQsSpgNJJqY89egN56SYb
         S1DymwZIXX45UHGYr7Jc5pFt2yCBFOrhaAnijx+m+w3LcHkGJ+1BExM6hUw5yWvEgyXb
         M9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202648; x=1795807448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=K9t5JeN1U4CfPeXJgHzbMfbIYHEo5qQHQ4hFI1qTMELAiIFrxlbyOcUFOA1gSkV5Uq
         7nYq9UESJ3pRjuCY+rVorQnqq8Fy1bEl4KK4pG/2RQ9iBmCMuyetA15MU1boSX4XmzPZ
         5et/UEbhJT92jx/o2shHTfehRPRjQOXbdIM1ydUswbTfDwSwMZnjP0vBW2TqH7FX8WAC
         I1ZJJG4aFWv1A3MvKioQ3suCIM9mOACyN4e+Uh9xO5ZqKJsemVssxREFJg79uK3o8eqQ
         SiZYB/NXYMIZet5i5byEvAoM4o19/Dc2/8JarLawg5ksJXNr4mSK759+S5Mw2Jq7uf4v
         pCfQ==
X-Gm-Message-State: APuU4Z+TlrVZGQ+18owwUJ+8dM+RrycQOWs8BicpQKqSfIsR4KtO2KfI
	y/eoENvBbk0kkmYF5YLm7p8koIF+p0F5i/ZLOYYOkJlCFZTujvIP66gCqGV/isn6jjPyUemLMC1
	/kg==
X-Received: from dybmf40.prod.google.com ([2002:a05:7301:928:b0:36c:9b55:8436])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7188:b0:384:b800:2adf
 with SMTP id 5a478bee46e88-38571027b9dmr3890778eec.27.1795202647857; Fri, 20
 Nov 2026 11:24:07 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:37 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-3-elkin@google.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8189: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

When devm_regmap_init_mmio() fails in mt8189_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8189_afe_runtime_suspend().
Because mt8189_afe_runtime_suspend() only checks if (!afe->regmap), the
ERR_PTR() value is passed to regmap_write() and regcache_cache_only().

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: 5404599c3292 ("ASoC: mediatek: mt8189: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index f39b01590f71..85b5be6d45ec 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2563,6 +2563,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8189_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog

