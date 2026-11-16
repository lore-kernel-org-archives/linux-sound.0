Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803251;
	b=sjcEt19Hok16unYq/2Acyj5JTYnQuXGQwSKTEFV+IkGczc0jv0+bisLB/V2NkH2rQCFC
	 3GjL7H7YFkDZbFZsj9GWovyn4cRKB5Ma9EUAUIV338yErlG0dhwCVYT1X/2r/0IKOOpUC
	 yRIXC58JlBlyNr753kiwhp/2kNZHBVrM90mjiV6ibvpH+OSMLXXF+WrDK5mwN/XKcud6D
	 YrdrPPKLkFHhQi/jVT0MJqPRXvPZJ5zIUrqhfPy4ScWQ5lw+J7qX52+/MZohfP774u1RA
	 UVByIUxbgQlbhhI61ig+k7AOXClfcyBSWDapBq8K+hT6MIU4WSgtINgdlcMFxHvB0SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
	b=PD1yKU2awK3m6MhYbHzohsNCKKBD55MQ+DvIQNDaKhnkwfTOcJKOCYhJftCWe4ApapIT
	 +7nNVMLr1v6HkvQhXMWpWxTba7o6OMzGg+rG1/7idKRpu90E7SwDl+YMj+/03ApRD6vAc
	 ThzVrTbqxyuK9eOWnXdHkeKMVct21T4JMwtAXMNjmjYqaBRtTOIKBtpZl1/gFoO3KJRJb
	 C1B7IuSCEfRzlsMOzPfysjOVeHRLcoj3adgb2JEa8yWpKVykurXcQJ9CqYufaW7uxvQ7p
	 RQL3qEdBE/BgPl9VJZaTsPLYsD8AGJyi+geMohaITNJb4TElLSq47ZGScDGiXFNI5ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2LUE6NO;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9D606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R2LUE6NO
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so928134c88.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803250; x=1795408050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=R2LUE6NOj4PZSAUa2sdCAI45rv1OltN3TLI3chKU6BluHY9ktO6yP/9H6ftZTIJt8Z
         oWF86MvvH7aocEe7Mt4yOqk4qLLHvsWGJUYe+8oTlpm17kLUjiBvZFKILB7lfsUmKSiB
         qFKh/uHXmATEuCk46iisRKEL3c6XrFQGN1LxSfgrkpBkfa+CAeVfgHC/FWUC/TMrRUDI
         vofYfkeED2kzh5G4fBCpANSSyG7KatgaYbvNJAx6l4VM+Ltm6kFzYQFgVGWkmkCzjcKS
         CSgOs5R8+LIdsKsGdiyecYd5dYKDA4SuJJhpIWOYGFzLqZYauFBayn/WSVTtqLdME+Qp
         04nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803250; x=1795408050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+vPKyAW8x8lk/lFIW4uRVkXgnzau8sRMCBsKJVkefc=;
        b=jyG00NZm39DiLaI9NrCnrrwv6zddLWKlnbZVBJpDVLsCWg/hH1S7iUcsyTypsemCyd
         s8npeLSqxhSSoE4SB8+7fNKcYPqALouA/5zny8UkFHTMF0fcmXRLx3GCwwIO12cVV/dk
         ozlfBnkZYfHAC6SdUD7Nil+/5lHPZUpkss/uqznbtYW3sYQX8hfwTWwXRIGxr/+yTU3j
         oCVKLtGnrwtYvtcLDZA4kHh+WLmSv+DX5aGFiApuL0A39ifmP4ipYHVBy4AhkJJ4J+tI
         BuskxR32dxMADk23ebPKuCHqgrxUgorAO6vcBeox+1Xz1y2fc7S/1XpeOQ8cIa7ci9OP
         QYPg==
X-Forwarded-Encrypted: i=1; AL+hErE1doTxx7u80zwX4JFwpHsuZhJKEnHD3izu7Zke9zAtkIEBXy2FklaT4pwdhxliuUQgEEiPZa1VUz/Yxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9U4H637k3rjjrczEHo3DjAFa+dXfHTKTjWrAWpz4auFIR1vS63
	EKbDroRTxY6m5HB2T5qGPCxWrZfiB9Ji4mtIQD/N+4lJmarVr8nbW71o
X-Gm-Gg: AYBFou0EA4xnSoaZKzWdUwiDQzlvLRg3KdOTMEF9nFWnFzQdYtB9wFaeM3sYDqnC//o
	CqwZycSonUrDYsRCRh0s/EmeCSmk2DWOuOt2787tNkoZVDE+DLfhvucIaenea/78FiwhqjVQEHA
	S2cdTf92gg1MBAEFQocGbnNJsZiUC0PWZbbk6iqOsm5o/bboFAfwX0WI/nfSoxNqmQJTmRngbxj
	feU2y/gXQlVGo2dN4xnAieYDrHdWubPXr35jH7Z//fD6HBx6Qij3VDE9WOK/iXIxaIC7aqfWl0V
	ofVHPRVbQfh0br91nbOSzzgKFY/zf+ChD4ibywaDNibFn7WUY6V1hx1FCj6F3urPPQfgecH6Rhc
	LNK40loTtzdq/s5i/eCbLPumpLhPcA0kjo8AXv7QIJZ3eS0EC1fKPeZMJbgUU0EJcTVO4zG/T5X
	e/zfO6wes7ofJnoyFZyDg/knWsPHuxe6f6QL+W9d91Hkm2Icx959cSw4R3mV8cUfMxIRg2EdKw1
	somLTQy/9ZBOSnRw4gljpvvZUZsS1vP6o51H1TrK6r4aEIZgTwN83Zk/maDn4pOL0PieTvYROip
	KgVQ45jvA6R5YMhJKOGztn5P9/7Zcp4yUH3VqiuFh5neiRttbFsYs4FO/wFBdK8MT25lm+0KJJ/
	6DVQv3pEtHidyck4wOrTdB/wr1M7+7iHexvgRcSleB4g8
X-Received: by 2002:a05:7300:d584:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-379679dfadamr9965275eec.31.1794803249582;
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:29 -0800 (PST)
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
Subject: [PATCH v2 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Mon, 16 Nov 2026 11:26:32 +0700
Message-ID: <20261116042633.497423-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() for clock acquisition and regmap initialization
to suppress probe deferral logs and simplify error handling.

Also remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Use dev_err_probe() for devm_regmap_init_mmio() error handling.

 sound/soc/atmel/atmel-classd.c | 37 ++++++++++++----------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 746e6bbbf423..59490e9effab 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -547,18 +547,14 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dd->pclk)) {
-		ret = PTR_ERR(dd->pclk);
-		dev_err(dev, "failed to get peripheral clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->pclk))
+		return dev_err_probe(dev, PTR_ERR(dd->pclk),
+				     "failed to get peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
-	if (IS_ERR(dd->gclk)) {
-		ret = PTR_ERR(dd->gclk);
-		dev_err(dev, "failed to get GCK clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->gclk))
+		return dev_err_probe(dev, PTR_ERR(dd->gclk),
+				     "failed to get GCK clock\n");
 
 	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(io_base))
@@ -569,11 +565,9 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	dd->regmap = devm_regmap_init_mmio(dev, io_base,
 					&atmel_classd_regmap_config);
-	if (IS_ERR(dd->regmap)) {
-		ret = PTR_ERR(dd->regmap);
-		dev_err(dev, "failed to init register map: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->regmap))
+		return dev_err_probe(dev, PTR_ERR(dd->regmap),
+				     "failed to init register map\n");
 
 	ret = devm_snd_soc_register_component(dev,
 					&atmel_classd_cpu_dai_component,
@@ -593,29 +587,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc_obj(dev, *card);
-	if (!card) {
-		ret = -ENOMEM;
-		goto unregister_codec;
-	}
+	if (!card)
+		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, dd);
 
 	ret = atmel_classd_asoc_card_init(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to init sound card\n");
-		goto unregister_codec;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to register sound card: %d\n", ret);
-		goto unregister_codec;
+		return ret;
 	}
 
 	return 0;
-
-unregister_codec:
-	return ret;
 }
 
 static struct platform_driver atmel_classd_driver = {
-- 
2.43.0

