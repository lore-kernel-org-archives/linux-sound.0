Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7A390C8C
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993780; cv=none; b=jYpsnQZbL/ujOlwvh+e9/JZFVr3JV2+ulrbR8REqBIEJ8aBjM4uUK2mfdTFOkootIqlcGAbmN0998c3VUx1u3bJMW0VyHJ1UMLbMv2SX8H1MWY4DsYVGFiZtioy51YPxpjSEQv+cqTjCRBnWJ/ef64zNiLyixvplOP8j7BmBGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993780; c=relaxed/simple;
	bh=KAAr5zoIJwlBk/iLdsACy777/GugcNzG+D87af2gC3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fulTw7vQmyCZzgozKp7nwmBYSFG86ih7Cw2PfnupZfV0vOGczi1qtntx/ZjK0xI6o8461B0qkBHHuvSnbFsr7hgVVsmZHbs1GrMDgBr+FKiOA8+BvLT7+tRUd/ANKyHY6Wzmc0i4zIXST8Au5zM91IcXCnQzKLrsoj8P6S2z0Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TANfSXfc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TANfSXfc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848593533cbso631481b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993779; x=1786598579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tvFFAh4lS3mG6cJ5ZjUOGQHSvP38stbFXiDSwTmBNI=;
        b=TANfSXfcpZzhnoaGE5vkiJTALtupjfrMBFddrBh60m76NyuO8epnHbF9SV//L5o3mC
         OrBLrQGZgB2v84T0yLYHaV+IPEXNG/hnvAv9GBDvney3kvvpDEo94a0cP/O5gia2BzbJ
         P6cQ/3OM8a+Rl//OgXYmCJp0aho/ILIWQr2A+N7emFBQpVmU5B/zX9hnU3+SsiYBo4GL
         7RaS70XpN+O4kyroVTY7E1u5wx0ho7ir8c6LT0Qs6Jx4ivue6nMCZT7mnbwnI7DVxat6
         c6TI76Z2CPT7riai2EllHXM2HPh5xRvTGqQ9tBDAPFFgEh1u71Bv2HKc9p86451PH3bI
         65Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993779; x=1786598579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tvFFAh4lS3mG6cJ5ZjUOGQHSvP38stbFXiDSwTmBNI=;
        b=gFAseoRVY8HdJbCrBOV/HpwGj8ZU0WFsVQJ78p02JvNoMNyCk13+Dlj/MQ59aM3mm5
         KUkIrJ/hgzz7VTwOpiLrMACpDthPFBPDj8mxPKf+6MPRWRG2opkR8kyswXsowO/9Qsh4
         Q8ucQBbHFxjhTyEd8fLRIOPBTs3ggaYxu8DteVEvX5PimGqM3zSCXkk2lrz+AlAerC4L
         fV9Rb8zkpt1xxebgQmh6sSrU+92e0uHbR5gOTeMPqyIUdtGGFGiXVzvOsPX4NHuWqrBd
         q3B8nDkczPtiFdOcE4M11dg0wzNqwRV/1kxCS0wTfqz3t12qdLI3z6TQuFRAaRdz/hD9
         meBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvpUmWyrPHL1ThJZLe4Imnyj4DkbaCC50q3xs5XhorXw6zsZAytW/QcIkNmSIeCi5o9ccYZGt3paGRSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Y1L+EdkemTxVJ5mJHePLvhuQZHIf7RiETc0eJPOdIvwhzs5m
	MaQvCmgzdwjGBHHPpJzAuibQms9IoLFeux3V2V9ugeyq+yTGrNAziHnL
X-Gm-Gg: AR+sD13rQFTYqG5uiKFhbOiLqnnB3In1w4MeeoD4g1HhQ99eVIvOr/JG2L/I/0G8wgU
	gpHRRb1bWdHTU4sy5fvEf/fuvP5RemmVmm5oaFpqK6UMDt8Z7lkdNgUSXJ/IAVG8NJmL6qXlt8/
	3mPPjHnMxL77X/rx4+/Xi+N1fW/HS+KptLcY9wCg7WWnfbcXlYEx1wVWu3w4+kGaSDqLng/XKEv
	my7iq2BSdmMMJAtDXRMISZtedU5BGPcQqiLRHEOU5KtrD0aDwSLp94RV02u9OFXWbV6W2dqqIF0
	oJwLtbHDmhVkkv74hk08LRTZ6/vJ39zU/c+9zXonE0b3VNP9T05Yi9gHaAb7DRoNoja2cyJTghI
	NpJHsziIy2gm4S9Sco8RDI1q6tPw0LcRSXrWPV6oesa67NPYeXnx+HLNU4jCL9GBhugjBFo938q
	dm31bemqvtk88x1GtVV3izazWLbCeeSnBK5UgIX/MqgZjGpP2qcrpVXByHrPijwPQZej9nN4L+/
	PB1rOE47eNjiqO5jPAGfUVGo+bZkFIbwfbyZZHgj0pQ+6ZpyBkTtEt4Cy3QvX9u2Doi7p4AkdxQ
	thId
X-Received: by 2002:a05:6a00:1310:b0:848:8027:cac with SMTP id d2e1a72fcca58-84f2e04d03fmr13506845b3a.23.1785993778592;
        Wed, 05 Aug 2026 22:22:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/14] ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 12:21:33 +0700
Message-ID: <20260806052136.21034-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 585e89f61f0d..522b4f4f6a7a 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1428,6 +1428,8 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 				     "Failed to initialize regmap\n");
 
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, rockchip_sai_isr,
 				       IRQF_SHARED, node->name, sai);
-- 
2.43.0

