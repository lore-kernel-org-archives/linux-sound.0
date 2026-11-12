Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464285;
	b=srBwnRRMm/rR/9Z76bimEEydijB433KSzKBJVGICVD2SX6JejqSaTubrG1u+GH3qKj/r
	 a3+u6QZZOO3u7nqZx28V0kfvDJ1YXUcPEgL140tGGH5V2hDQGV+YrrAspvABKpwCLpqfY
	 ZiE/8MFEUSp/QjmtIxY8nROrto1CXvNg8FJhwMgpG1Q6d3bFbOFzhGzrG38nullLkawM+
	 0Wqjqh4mk7vTsArIwvByFyrDdrYGD0z00rMihpQsuHitiDGjZ96J/oJ0eGvB4zmQ1Sc+z
	 DFJ0RfvNM8ByhKtceB0mNIEAdoAuU9a5nu++3aI2x8zx19sn69daGO1euWcOmsixwYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
	b=hoJ01p+ZF0/rMi60F038ylhpc/XrXjD9hc4QwloSrDvHdQPU36opHkNMLluhYvKxgXzz
	 cfmH/Ftul+TH6e5Tl4L00Go7DC2DsdND1K7NtifFTmjYb6G4u7XcNPCMv2p9YXxwbyyO1
	 InxC1z0tUbNipNG8dbS2lEmyl7nenBxaoY/Xml1nlbg52xA4lzcz0cOXTISXKLMSKO1h0
	 SADD5WAnDvykm8s1piwRYOWZKYww7w6rF99VWAU3jiIwMUU+/yDHT5oWvO+hLOvhtI6NR
	 OURurASBvCC28729BxN6J03zK8+6hOyINYBGJmXbr5QEkNikiKKPwTXG+yBpgr5l+SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXDgBWS7;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D2606A8AB
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7D2606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXDgBWS7
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5366463571cso46180651cf.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464284; x=1795069084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=qXDgBWS7iiuYaUU6CLz7LDkIhvYowwhHNaWI9iXy8JrJGb9ldHuxdU2L8/Xd83dI2e
         L1O44EcNrPJynRbi0VNR5iVSGPK6mYhGVnm/cSzohp2cXjo8wmDzozoUMQQj3XqCXaCI
         kI4BcCM8xK0SaJOZTxNcryAhfPh9BId8skiADnMnjJeNPhTajKDXsioIWVwL2HuMbBID
         2yeVxBtVBalZf0Y26eP7pUXKme/+cFDbvTh3PBMaodKyG7o7Tc+c27zoOSnS5A6gYy6K
         qQvvuJjg29rNBEM1MEIoE1Rp7ACq6X6LnerASqrI39UgEfzV1/+meSSj/AzXDW5co4eD
         QaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464284; x=1795069084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MIwZSnhApfikm80S9HZrGcLf+++ffdILf8yJv3pCLw=;
        b=dfJKxooyJ7tMlT4Ugjwcpbsk13+859r0oL16lxEvy2SdxC6kNBEA5PbyaPw2MCFjDs
         RC3vQpFqEWOzs/igebvB8PsiOQLLYSOYx4dVzsMRZDNdb/UdNhE7Pc/WKyxnyEHX9ziI
         zZBjZ8iFhIiUpl3OsUTlV6wImzchlWXBpkyTxpCwfP6ehxgeBmdZivFQ70fqX93KbNWn
         cflEVdO3XBUmCsTll4FqPbIt5g24xq3bF08OMiQKxHqGrDTcJM1HuAdwAFpzAPhogh6Q
         ob+02wSGfs0TLo8TYixbs4Ha0JgY1/nyA/M3GNQ8EAUQGr7I+w73pw/eBKNox9fQM0L2
         Wviw==
X-Forwarded-Encrypted: i=1; AL+hErHQ/AySTVOLDl/bIPpSvpKG0bkD5/4B/6G1Jp+oqDs752Qgo5v5snCs9w6Xbt++mG1dcG1xAi75fJU5nw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sMN1fxBe9Dpc3DfxN+CL3LhuTvvOD6wUoPxZbkWPYAJ7B6InD
	/SZMandIsAZVBezHsVpede7t4hYzXgMLla2/neYNm5fMilHyG46X1J8=
X-Gm-Gg: AYBFou3shZlleg1YBO4gWjLRyLdO2TDKW4whf5zVNUkuDPRxRdhhQ4uLDDYhbr+kZgG
	T2zQGmOmPDAnynBXIsP6HAtoFfgwteDWbHABY235IB9HwYXid1UciVxuRBsezEMnasHEWkF5Far
	Z4yEVu5KXaD6Og5HjtNpXCdS0IWYL0wGAyrwwIn8/TK7GpQ3wWbXEP0VxAlyLO6KsQ1JVeLaQgw
	ADoI4/SKsTAX0S0ECYO5+awF3Z6XrpxFW7OLeT4bz/xDOMbl5oiBAPpRo5qxbqcEUVe5FcQKp6f
	SN47WakzL/BioE5Q5aXQ9i3RxYNoKVw3Di9qvkJNNwaDb2D8Lxa5ij9/loGVD6k2YZWB7kfiFrI
	ody7q7N2XbO5sEFGquS1kBv53E03GDQftWQce6/By8c22bG4dGEQ5kD5hxektvJVuILhZbC8hS4
	T7TLg9peKFJZDMxhxPBjPkCewstsxAfnA2F7XsPh/DuyBCLTmDVJBEJ2Fu5YCTrEhHqXbgWdYRX
	CXmsQc3aCNV/q1U5iRHtAbQ1PSh6YQAtysIG4XnyDG5im4dP3VqO6P6GeutSWz/ubNmhy64hmYG
	4nlYju/00FUuxmdc+sCI5vozw1u2gSMD5rKHCLC9ikjhcv018voteI+VR7IF/51GZgrj5GCMbd7
	3tedjN75Amc0hpPty8cpPlMKdPxbT4uO2tVXzLMJGgwx5iAVMOpn+/feGkcoeTZgW8wkvbwFbtJ
	EZnEYZE0HEe9kyHAVE/BGQFLZHtxMiJznf
X-Received: by 2002:a05:620a:2257:20b0:947:b201:fad7 with SMTP id af79cd13be357-947b2022eaemr552868385a.67.1794464283900;
        Wed, 11 Nov 2026 22:18:03 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:02 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 5/5] ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:49 -0500
Message-ID: <20261112011708-afe-v2-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and devres releases the component, the IRQ and the regmap in
that order. The driver has no remove callback, so the IRQ needs no
explicit release.

Found by a static analysis tool under development.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index d9c82cd8869e..2a27e5de9184 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3306,11 +3306,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
@@ -3362,6 +3357,11 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-- 
2.43.0

