Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364125;
	b=kz9Q3kHg/BYUbuIVuZXBZGy7CBN4Q2RxzQUso8EUwEfoPCZWqWlpAmY/u3laBIt6X5e+
	 DJ/unIKP6gORL2jsLiOa2AlgDCKQ4+wZz59OKjQjbsiMquROU5TForXgtr7Judfd5qsrX
	 qGr5jyFOKrJpSQ7lzpwOnVAn6TUyEqf2VsyxsN4AE6yXBKNFzwaje1h2ApTVvdSmegSVY
	 IGne9BFlI7We3fDMujr4x+H1AIC/4K9vR07dNSpQxA194ka5W2LHCoTreVljCWEIi2+EX
	 HNOgsdHVFT33SsPdPIYivTobQD5KJ8acclbIQc/WI9w1My9qvqZFa7SsICQT7PUtqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
	b=e/ccy1vrPL7RLvCVa4VQ52lsUQjvxws+LiGiWa3rGPQcAHWGx4q/fWxVEgLdy7rzCNEe
	 lM+Ovssx1kBTiiD84NVq0K4ToyAYOOqKB9hKM7pBnGS4jeCwAJwfyAr7VakvX9oaiszDN
	 206RkmseWzklsDqmBOSPU/Q/0JJXdaco0KdlYi6k/ChBh79W+GRQOSiRjiJr9XNSi4iFe
	 iB8kvMaD5rsA5ZN7u5rcwtPNRTzSOA/Uf0nUt++zVyLSP4o5kSDlgrF/6ZQQP2f+J3PVD
	 nX5AejdKzgUBkWXi/NRZxNGkiENwRNEslwElpHlIi+QAcbiBRVUrlPawZF8TFhqVVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ubOKQ2/D";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA495606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA495606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubOKQ2/D
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso4440008c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364124; x=1794968924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
        b=ubOKQ2/DOarFo+yXs3ZdYkKzOayNrnSS+hm6eZWzlAYlMdSo5AMumLxOJhztgJLxzr
         GQg7MYBhySHxasGAWdPP9Flcmxy0xkATn3kloXOJn8/VNN+3J/r6+VArTgmy7xPha91M
         JPGbufTQ4RqqXiPnPQeZg4EK0iHEveoZxS2LlUWHPsPWqhpW9pbgAVP1BBsN9ypFYGpv
         CXzNhxCCsmrN5DM66c0XCjr6IGQp98rB3sVUjc8QV2mSjqnNdsUKiQeYdRroTax51Zbf
         1bIXtVNrCv239NAkCc9lJ8gULxN3j81dpYgsbajGn7s7QfKx7r0IGRXBSWYTA7hps9Ig
         D9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364124; x=1794968924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RO0TWmyr4SlK4vnJ9oWPCyNZsIrR50vQnWfFlV2WEBE=;
        b=NpuVRgO5Nj4RTCciKFUMV/jopuGS7scfOIkOFihyOJ3dEwqqCOXE6ikHnO4IS2K291
         ro+8NpGD4SXo26ZPOME9xY2wD7ThyM/Zjo+ts+CLD2jQuBIu/OTXpUNNtCY5qmcwPQF8
         SQqGXNyLGhk6BbSUG7v3cCsjWkZKN6iItyv36qpH1wKprgLESqoyTiTpzunRjHXsYcUz
         5hyyIF/o8eKNHaB7y72ItvrWjohxOWNMOqnMGZmqjNdThC1DRfQtF/KYGetFb42bnYXR
         KRGCpRtwIFAfnGKJPBPRah+E7Frd/zs0t6vWBB3aJIj6gMwa2Ttz83yZorVpLE+oeJUC
         FBsw==
X-Forwarded-Encrypted: i=1; AL+hErHXT2YWfDOgcRLT3jW/obfygpriKhOn8rVf+UTBOI1U/BHe5SWQwzLtSMVCSDzPKRlMgjdRfUAgQ3JUsw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zILvkGHNOZKPBwu2KEA4M0rfS1Z8hLfr179SmVVsC8F4dkFNy
	mc+4T45kI49i7T/AqYdbdrSWgw1SFn25Rgl0HtQh3d8KrSmNQgpDx9J8
X-Gm-Gg: AYBFou3zdtfEb2TxnFZDlQNF2GE1hGJ8nY8ZdC+pIcG+HR+RHAIEjbYpl9opQTct3QN
	myqSDXjX6iR1EILUCoc1rzpG5SH/RQIrRAlvnbDcUbi44a/5N1pOdRRkA12GI1Y5bB7Qo3Si8g1
	Incqjyg4tN3IV7rLqT9I3UN0hE6vVm0H+QFm7uoxgiR+3Fl12A1u41apD2JJKux7xS/PR6H2G16
	Ap1kigkmGdaWRk1We4petvurIuxBfDcJy6mtKbO1VuLBA26UzILxYSLhPbK/lZDGMg4jPcE6VrY
	U5xFpNZUNj80F0pcalI929XNVeALOkILm5uI9/9zOd2dWWS6I7n3RJ28sd7SjJ9P5G45NRl8Dr1
	YJxXA6oaISobAgB5Bv85DVkFcB/0oPae5MwUDIPNec2XIbFdQUHjoprOewT+m4m4xS/SOzODu+z
	bgObovryfM+s7rXGGrfZuUJBtxrKr1WTf4otXqBTKaPh7TGl17iYL2CP29wK+MUPTw1/o1MDpOK
	x5mfPRIQ4c7vgmZY/YnHXqslGk9rDtZ3vdzrvKRPjt/KXN1068DMpZnYEUS+bj3uJSVp4GMA4DV
	wTIuLc6rAmUvzS7ndd0PtGDy8/wKuiotNQhfxEVuQYduHLrz9xsRmBdxOPDMeJPzeG0V3SfTtjq
	WGGfcW+tvKbCsPGNbc/+3MtElAr2Sk4Ap8Uo9qF0M62T5zWCgptDavubWOrWn9cjMIqQ=
X-Received: by 2002:a05:701b:2219:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b3c0304417mr926808c88.21.1794364123831;
        Tue, 10 Nov 2026 18:28:43 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:43 -0800 (PST)
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
Subject: [PATCH v3 5/6] ASoC: dwc: Propagate optional IRQ lookup errors
Date: Wed, 11 Nov 2026 09:27:30 +0700
Message-ID: <20261111022731.8243-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() to report IRQ lookup failures and ensure
the reset is asserted when IRQ lookup fails.

Fixes: 564db8b8da8d ("ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Ensure the reset is asserted when IRQ lookup fails, 
   as suggested by Sashiko.
 - Add a Fixes tag

 sound/soc/dwc/dwc-i2s.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index b0d3413c27d2..55a5dca7b79f 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -961,8 +961,10 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
-		return irq;
+	if (irq < 0 && irq != -ENXIO) {
+		ret = dev_err_probe(&pdev->dev, irq, "failed to get IRQ\n");
+		goto err_assert_reset;
+	}
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-- 
2.43.0

