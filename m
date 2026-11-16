Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821085;
	b=fRglTFR6lSxJHF249q+csckBgtY2lVETWLNPakkOQlWwBqCl068EThBWNODkB0fWoTvv
	 pNiZY0IbQe/5s6Q/bYZQhOkzDXRrShCZPTTwJ1K+oMelANUMGYrm07E97heqTtQ2lHVIL
	 xphth53/BIzbCUxUJSMySp/Oawzfv63VRqB0kcyJwjkmWpf4tKA0Jy2t1kSe1CQ643T37
	 1/fzSpKy2Mo2lwYDvg8I5osNRyj5HNKCLkROadlnG7mkz1POxju1bCydq8tjvVcd7kGbx
	 moG72Bz48H7oKVvXrPwxjss0FdZ4+4v2hwCBr6LVEZN6es9YFc0f45YqeRwbf9wAuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
	b=LAVv8gQLWpfvCFWcQ19shkVt9skrUzdX/7BaSj/6u8NxRoESKmvgwJ8H8HNqP3oFII7G
	 5RfkRJouxgR38SlOKQEuy8YAuPqk0Z5qhtCFQzrED1WTlrL3/qgfEZ8HyqH9gyKZ3gIzu
	 Xhr7dM28px23807AM8A6RUemOq+6XHpeDNiAh7twZfVPd/tpVgbqT8DEjGeMkd5lcGwuP
	 Uj3MD6wkzmrDvTzrG1DxpM2q9lOcKiLGmbKZhHLPqUti3lyxQQt8QBkRSxnxCORs5myCV
	 /LUG+nuetFBQSrGavO52/vmHBb0ZJXp5NHyjNZ1laHwkkXHntQr4mHTsJWem2faP+MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0tOu826;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB97606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0tOu826
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1738348a91.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821084; x=1795425884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=l0tOu826uUrQ9BsMsFcGGhILaMOE96u3mOVvVUqEjKhXtXrgxQlGBVBk045EdhC8AM
         dw+nQk5Yp9eY1+ZKjXOdsiaQrEmYTgekhHXM1hSvnbPC36ufmSrbQkd0UJvAxGkv2XOH
         NQFcjqbJ6xAi1yTlUF5ihFVfhvVefdoro3Z9WcNlz6uyncG5tetgrPkIiSlhpTPzhpJX
         +gAmC0BJbp7R5UTJL4kNLwHkux2+MCEh631AneqwksOUvoN8XVae1uiK3wUwBZQ/falY
         AFuHhR81TtLuWcYVldnCMjeRwMzB//rXJko+t0rt3vfU0BZXxJPM+r8+aWZI/tOembTT
         CZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821084; x=1795425884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUxp2BAdKNaxPyxlUG7gwr+X39RWETzd5B6iN9Tnzbo=;
        b=pANumVrjvMY5PTU7RIZGNRy1wTyqh6wqTa20xnCaJskcKt6oQg/DbwbddBCziME/YV
         pmaam3QErA48AUXZi2NF+N2G3t8S7ZNC4uC9sdFomIsL6vqfKwGP/FIIm2mKZAeELN/w
         3XuHA7aADRvW+7TpZkWl2QRO5LTvB4MquBruOWeJrHxTLMKwJppp+5c/LeWFmOT2QIgR
         a8JjPGdJ02fyTU04IUGsRFlkIhyRkaN2bwbO/d1d1bGGyd1MbQKcgL0pP2mNdgAiAbEs
         En3XQXs0NR6rILLHG6xC8o5ccq2Bpi5/GNYhmao/7ARUFMCoZMUJM5kZ4IXyUhG8U2ae
         edGg==
X-Forwarded-Encrypted: i=1; AL+hErFFqkzdOAj/vBDYg/zKeJwsDCgwWbCQZeveY9DDi4tA0R+/1KBwGbUEMmNRWn+3Vqq/Pbtt2yaXsWaACw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/G2Vbe9R0GTfxBIPCZrhhmikIZGjDAGK8Mtca/M4j1Oy5u9VOE
	IrS3FaXs5eaKuYZe5Bna8TTYsoAIxwGZ+yESnzNhcMpfsYwns46ugpb6
X-Gm-Gg: AZFdTZfhfxsq7Sgge8NXX6qAYuI1CVMTb2a8l7V9kLEoYvTuXI8qEjHarVh98j5BsIe
	+B00hMefVRdHI6PnNydYtGb8N+vEod5aLcalmoq8G64UiY8vPiwLk4vUNYTAVU6rVCp9x/W0FeO
	ElZlX4U2Pn3f103Qgrxk9vSOq5dC0+6xF848F0turKr68RGQRI/95+zPVkhPM5POvwxu8MPt9qb
	/8DbFKf6GCT7E/WJ9vlQqiIFfw/Lra5dB05MzFSdRTcUTKMsyiXRAikfWTPiIriXDmh1RL1f6ul
	7ARq9y4zSyOxsPBJv02ON29Sp4MrliUUxkpafPpvEwgbBOgECrFPOb5EgZo5KpQA9IuDgpVJpXm
	QSfzpJ4NPDcTBZesgNZzQS2OAdCXqjvWxkEH3EReYNJgpoURbBfoApJAYsVZXSbK6fIjsxU3O//
	vEeRY/2X6Fl8jeupQpAUAxglCnaxs4feEAQ837lg0LCg9+vGnqtJpoAl1/AHrGWZ6/z3DD7BBi0
	H5Hy+pPuCyRv+LuF1FMLy/0YD0xxkuK/i1uyyFfF88tQswCiFgaVSr2NXJhRKjzke41UIfwM/Qb
	DCM2SRl+I1iuBO3oWa4h9RMmRQp3CgSROEOFxlJYEt9cdtYjYAvcG+zAQISpKEv6CgBzRTsyDNf
	pbWiqTRzTWqgzjbQDGPfhfi3Iw4vWzSYf2rxsMxVpJNVK
X-Received: by 2002:a17:90b:1d03:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b1b0b49f55mr9644834a91.26.1794821084142;
        Mon, 16 Nov 2026 01:24:44 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm15661189a91.10.2026.11.16.01.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:24:43 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: atmel: mchp-i2s-mcc: Request IRQ after enabling pclk
Date: Mon, 16 Nov 2026 16:24:06 +0700
Message-ID: <20261116092407.514998-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116092407.514998-1-phucduc.bui@gmail.com>
References: <20261116092407.514998-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Request the IRQ after enabling the peripheral clock to ensure
the clock is available when the interrupt handler accesses
hardware registers.

This also ensures proper resource cleanup ordering, with the
IRQ being released before the clock is disabled.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index fe42a8c2cad3..6a54d3d67e86 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1059,11 +1059,6 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
-			       dev_name(&pdev->dev), dev);
-	if (err)
-		return err;
-
 	dev->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(dev->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(dev->pclk),
@@ -1084,6 +1079,11 @@ static int mchp_i2s_mcc_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
+	err = devm_request_irq(&pdev->dev, irq, mchp_i2s_mcc_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_i2s_mcc_component,
 					      &mchp_i2s_mcc_dai, 1);
-- 
2.43.0

