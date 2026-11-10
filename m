Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304637;
	b=hO9xaVtGPbfr/HoT7wCKyVg9iS2vPNB5csCOOBIafy1xyaG4vEqvhxlHmRa6bfJseYvW
	 9Qyhe2hrgtVcTHvQT6tgQj5fwDK0Q4U53OH0tg6MjWoVORcu2ITTmsr38wFvuobgG1uLI
	 AUoMwiy9hjABv4IydiihIXGmeofJ43U5OLyd15C1ZEXnjUqVhDTJahpRhW9+ifu9F1l+y
	 VQULjdcqBB8LQUHIKGHIspPMKHKDkAHpZN9SYqNSaNLbouXRWizEQtL04v+KpI5q07CeB
	 iAmj3oNIQWL72TqZp46OpjWwAt8XRVfrPps31WTIIa3bCWKFDKunJY02vOE433goJiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
	b=4zTJLlvfUglI0f7rpfHCoKwGkpIDlh+kbPLStcokgSgVXu3rkzT+p2iusuJrBNFCDwKY
	 Ox0Powkej6kBR81Mqa8AKVS6uMsOoCcsxtnWkDlGbAkTQJLTZ3lFY7117BFfaWA2HIoIh
	 pC8hFKaPou22d4S9jzKemdnmxvZ/eClx/GjxzLKt0/cINl6ei105FvT0no6kUMOvAWGeA
	 WudMTyCqwYwIztCWK99D9C24p+yn9F2KgoTgFKAvVpHHvd+Zhn0ayHCECGBXeVDuV/Z1s
	 R4eW6Ds4mnuGJ1K2k5qNoQdBJUA72uENf1Q4+xD+46BS+YAXu0bmJvnL3WMYYV3SHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCYdfsfA;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80257606A902
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80257606A902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCYdfsfA
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so2173857c88.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304636; x=1794909436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
        b=aCYdfsfAXj3vohBdQYRudfCUIdjPEyILDtym05OSKtEwd0jXMpavlqauHhDA+pKctU
         OProCkm8DPgk6iUW+SOa3Sd5NjlogFzBUvRWew/U6LtsZ0U29pfqgIg8bgJl2OF/M1Qy
         GNJ1meuzJ492VoKYC4bEkHtz5rJJ/DF9RgLTrLLT5ra9nkEU58y3ECFa9FbkV37ZOkBa
         SXgnmbr/l/kG8yZqkL1u6ZQ8H2H6nj1um+BYSHI9+73O4mZXuzfrq4NGunBaQGHVrJ5A
         vrLjKcr27NvRuiXl3rhN2i/BzzsT/P+CGThWKqMJ1X6koOYUsjTTIDHTjIk0UC/MZrjX
         Yj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304636; x=1794909436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr1HltizvWayFo41XNkNxw+fGqlfdV0vW0QjzKRC/tY=;
        b=GmuVOL1PLVeFvc2yQaVI9yVC3XbVD+8lIyU3pWZablXXtg0Hk/FzFxAted3NYrQAcC
         LZL/tJO8tw8h5p/go4aZoJkA4hSmrHe7KsvpMKR4jcH9DDgibHEL8vhhxbA4s141EI4a
         JQRZ+/Wg1nQg1n7f1oGXLWneWz7Ikpt0XgKxJauVFQkOgrK45KGVhuj5W9goEIz7Doec
         A8ihTxSgMf1l+IUnwV1q6Xiyi7ooQehnu5T1M4Jmb8krUiMhaaPh51DrZ0w1g8ePNf9C
         oQObn89yo8nUFs+HCjwLndZKPz7ySG1XMAZ4yqkGUEXilejKE92z9LdH1uSio+jlBJb/
         mu5g==
X-Forwarded-Encrypted: i=1; AL+hErFiTQ+8NqJTBvTPmn9IAB/IbmpevWVRN5IQ1zuyq0aXD46rfXI+jDt3bH1DNEsjZMrxp60CnjDWYLnvJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/nhOPtwqtIDUejOdADHPV3BoB6otbflhp2BSOIKh7EBiAFs3CB
	JyaljYMZjLCtb8EeHTDMQ8NrR5rCIW25wTpVuv0JEjpDF1Su627b28OP1h2Hwg==
X-Gm-Gg: AYBFou0yQgHm9eBlgCboA+vl6mTgPjMj3QiEYYRZoOSd0j2uCunksbTMnoPSoj+otJp
	Xs1J9J0X/2Et/qEuQUTfBNc0YKfOE8HF0ASvsWHy8BN5kHzWjSJYemftCGxH+Go8MktaBCcYf1I
	BNDuTBjCd40d3Yj7lBLetbYAuPo/AKs/Gs+U6E9ozBbV+HYaATd+hNQ9cWIAELUhG6hGWOLo9yz
	u1iBSNr7OaidzQLvGkQpalplkhg7JSHteucF48+05atV3Cg+EdJcdkaqNhyp7jMByfX+00hFnEH
	A3WY0DQDZXBNTxT4Ojh67QWdkFB45HeFUUTf8H5SvsJSjX8Szbe3iNmN2mp/MhkHAADL/m7W8aX
	4jQt5J6OcFYuvJT68+LpyaXcjAvLJ+xoMo248znc4sq9N/NBTdinvC88wCFiO9zTVEOnrlYzsFi
	42b18UUegBwJ3NQAgSWL7DRkiWHw9mctdg1hQixaRph+0damYNlPbFpgZ9gbunPkTNIWsBBBSJT
	dJwO5iNTUUquXZ8Tcg1GgeCOpuuD9Vrw+PhFogx1Al+/5FZVX3+N8BWZUskvQ6maxXrXQR3MnXu
	siETYbD7XD4lAutWuDvzr6S824aW7/m5ddR597SglKYRSE7BdFyzQCTKxZJA1pumUlLDDDNiFOE
	0yMueDVBxjBubXlxsaQoh0ZgTFpDdJNgUnSSaHG4RSbiHPA==
X-Received: by 2002:a05:7022:f503:b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b3b6180311mr2664542c88.31.1794304635203;
        Tue, 10 Nov 2026 01:57:15 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:08 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
Date: Tue, 10 Nov 2026 16:55:24 +0700
Message-ID: <20261110095525.504660-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

platform_get_irq_optional() can return errors other than
-EPROBE_DEFER. Propagate these errors instead of silently
continuing, while treating -ENXIO as the absence of an IRQ.

Use dev_err_probe() to report IRQ lookup failures.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index b0d3413c27d2..0d2be2d8d31a 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -961,8 +961,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
-		return irq;
+	if (irq < 0 && irq != -ENXIO)
+		return dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-- 
2.43.0

