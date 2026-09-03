Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98579388876
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412364; cv=none; b=UjAEr6fTDw2jHMRaEetBan7uww6++cj/wbxigRbu4BWAAmwjiHawq7Gb5mxxgGxDsBK7jKWBYIO+iuTAH/tcbILpXTMKNm3xo0Z6EZBXoaYaDLYxDF4mc1wM+vJ3s5JB0JlfJmZdasMc+WX0va2UW/tnkSOhdhlD/DJt7Pb3NWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412364; c=relaxed/simple;
	bh=flUUxagMMbbwFuTrQc7nygferYAal45fxbtXaeUEeAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARjzamZZKA8HR8QTN2q6o4iUHkc/5h0DVo5v7b4vLYKkaO9t6FvZ5wLhnww0WM/pQAFvdDzM/2EMclm0INB6K7vje4YOeAP8zcf+jJ4ICazFfc7A5L9T59BPUXy1XdYBc0fqSQyA2hCrPtWP0/1W1SmciHOVijZcl41igNRfmtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra9Lmt8q; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra9Lmt8q"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1541718a12.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412363; x=1789017163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=ra9Lmt8qykVXchYl3k78dLka0Dzua2jGwnv+TRZNUuH69nHM+z9jR3I+7dh5EfJIrY
         9McuXCYxjYQxDvVSUCiC482xNo1JljIOaSHXuQXNkTB/NfOIHYaIsMkuyXXCTWi0GEq5
         COYcfDpHKzr8OgPtSjKRaNKMrvfVA0sDb1JZ8/vEt/RHQg++OUWuc42Vh9dS6bZiPwMC
         sSF+FWxT/YUN/yOwsPCEcWZaIq8NvB2dAsZiMkmp6gJqDlouICWtGYUnoGunjLPvRnCy
         lyhntSZ/rpRtppgRsRELS31fuEjLXsysQ2NPop6lk1V6xO2dhTpo4/8U5jJaOoh1J3uk
         TGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412363; x=1789017163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=VpfzeuOakK/JjL6uxwfz95QCf16/sVTU4K+CgsyErMsmlf+dHUmNZ2hGJuEYWeb4cT
         UVPaBTCBuJMVbuiOQDJ0dmtZaur56RC27CokRnYh4VDia/flKDH9g/UpNxspKxqKIDma
         R65uXsphZ6FhvPu99cxAEOzgwvFpcw82Dmo6uw9VhQOOFReLpLb5z3+chq1KjX09VfgH
         9wYDL0HIw9saRVBHMM/9/SZXJ8pu2nEstubIyiF3xdEoZuFNBXtLT+TlMS0E82bf2hcZ
         /mrLM4dsrezym+kbENwdbEMPfUXatvxSGCgLdXIcHe/mLbvIvwQ/V3lgdwoW5Gk4/igL
         FReg==
X-Forwarded-Encrypted: i=1; AKwUvBznEboFUG2S06Mh1pyBoFEc/DdX7TMb4EivAe7Apn2LoHuy8oGSD17mQmKye7Axi4dGcURx4/+9K/2mvw==@vger.kernel.org
X-Gm-Message-State: AFuF++n5kHwbaxeAvlUIBNZT5ba9niSchTYaTmEQbyjQdffDteQnGeWV
	HVhi8RQGXpUI/oN33jvAa/m5TqA0lDevYpZZ0vw24Fijrg8ovwJJ29Do
X-Gm-Gg: AYBFou05tWIyCQDbkNEJwZ6cnX16v9APH5XYkPmajFYE2r4rGEwEdaiuEwqJ9Edx8Ni
	RtVsgeZOMaCM/MXwKAVVss/chIqeIc4/vfE5c3Hp4DHwRwWILoFj+de9kFO7C65s+ReVjLDYJIG
	6xpfpxkwpOYWAdKvFabl3CCunsfFAcKNlWYhyZw1w3WFiPx5dW80ObwbqIABGDOkXBQ0oxFoCV6
	dL8qTamVrlgXWlOKSCuwRguHmjaguOFkOUeMKRT2pk5VxkTtTHT4CY7fl8CkDCGOAkn+MYu+5br
	lW2zVdZiuGxmU34p5oNiXyHpwuUyxVD5wZPnHdIcQw1+BXDLx3W+l6oDKvboqudPoewqbKR2hz/
	LcZbLEaz3Ux0TsE2aNFbO7Rylmr3P9WweO38o2k8ngOJ2FcnDIloWLSjqepO/hvlj4nD0OShO5z
	Em0Mw783S18jbEYqT5RtEX1QpUsUCaINVR+8pex64EIQcMqqYVp14bKYbG2f90PuUidVGoJ38yQ
	S92PpEDFw50vp2KBzcd9VfRdBapORs/OtQadhPedG5hrf6hDjkOzAE3Pf3SqFuIsnmMZdweMpqR
	VM8C
X-Received: by 2002:a17:90b:4c4e:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39aee0674ecmr13930896a91.12.1788412362952;
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 12:11:50 +0700
Message-ID: <20260903051150.178057-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0

