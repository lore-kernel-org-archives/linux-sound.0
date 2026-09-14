Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E33E8330
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370974; cv=none; b=mNgV9xbJ4VzP3gjoCOqDU4MtgFh1KcTo9HYcBmoPql2isg2r3QRfhs8S5aR7n5IDnzbNxUNG+wAVvKN+iJmGnCgQ23hiFyH0+KM19E7esizhoyYHXpPtfWO6b1sq8llqb6JLlA8Cg/fUlqQY1X3GjaJ9LEErAeYML7NTB4JsO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370974; c=relaxed/simple;
	bh=yOM3Ftr+tZ+A5ui4+ZQHA4pRO70m1aCA1F6hMr5fOqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrlnNDx/PBTLyYviQL+BFKvKYRc0sjkeoZrmPZlLqd0ldWzrvEOffcFzVNvUauSu5nh4YV0Fd2ceSY2isFh1b9lxFPSJNwR2KN2By1BT1hDCXSjkbYhCvlbKxWIx0nate3ic3lNb9KUK0gt1HVv6soO4pQQ4F1pdcUs3toXtAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNdjVXis; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNdjVXis"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1174350a12.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370972; x=1789975772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=LNdjVXisSUAw5dGg7GymYf40hNE6JRhnpXn5mA5waTNlGrXVHbgO6UVZHmm4gSpy/I
         oSoANvg/MbKLpepRdsq2lUqlPiPXSVThMvNHqdhbNArnJMG946liup4nDTLqBMCSR8HW
         sJ0o4uK9faIzoaf9935/nWNdFJKqZ/D5me3JCs7lSiTGGi/isIM65sE2v/rEoxKVeUZZ
         rlT1FCZI8SSYKXT3HD4X1CGQZhPUhGqYvO9dcxzme95YT6Z8qeec0hbL1n+qALgRra2h
         fWI1wyeyHe6AdTPld2vy+4oYzIe8ip7vwoCapDqsboaw7Yr+1ByRQRYU9hWov143LdRT
         gyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370972; x=1789975772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=TbJzTMaLqzvlTMZpPJuRS73zWohz3saV24GLy39TJPUbFDVvlEtLJXY1BBAI3LhaaM
         9sE4FoXk0EX/vuaPjIkqGOfiB+fVV5HEfDbiCgg9tKsws/Ml5HFj7CS5ZZOa73r7uU86
         xfAkl6yCfSHjlfNm8k/dy4eJ2REg5YRIYgDsO/0mfnD2ZYNdrFS8RF2CkL39q1Tu6wnK
         x25uzuq0ZQ2hga9XZ+rTOo9xeWqFCdN7bFBn0tE6Y3hCsLIcIyUQ8LTl8k0muUwn6HI1
         KaTilAeXNtBHaws21uhlgczzuciQZzZ6lyeZjo0I+2xdot2d2223FrYDta5aGwADQi85
         JKdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx7fPfiYD/+S3/UM8DbLQWmqBMs7E/pMFsqIV7eT6UhYHLNqLBXXljnh8ySMKZy7GYXaI5MRMnKPFlyg==@vger.kernel.org
X-Gm-Message-State: AFuF++nYHUZws5+SemoFte4wn8Rq9F4pUmXvvYpuCg0MIwEtEooJXfra
	iD6O/bZ71EQPjCt5ptPzoPxhlbxO03eyDb8YIjZJ7N/Id1gN32D1lHMy
X-Gm-Gg: AYBFou2iLcypEAjMqsNcEAKAhKvtx+NeaWz7/bgF3fIMXcwwSgHKs6VMtofDZ2afAnP
	839yGOl/y9Ml4MoQBBv4E6jtlsxriiby9Xx+HuSxavGBDKeRj4BljlqwYQao+C3WCKWUjX+r0jv
	sq9z4IguA1mrKGkFEfqf59imHDfPuLw9tblU8i7okZpL5FJ41y35Rvxv2JijEa63krQTZBYsxBi
	49xsvIbdO/hGIjK479JfzSMFjpalhfs5i+8a0eCqGcagUsx85UHO5lUC0LBkXamooSqpUuXb8fe
	ens7SI/sQjde9eCW6ZFff8DZeyiuPiXsXyOIIKHPMrIn61DhcOvhPfyujJDvgw8O1tIJ2bE2ice
	PEHUEPOCQgWps+5vtFUVU7OQW9U48XN5TxWIW038cKLs+uaiotqGH4DfHO0jDMjrb43aPqH83wF
	PVhRi20h+0IvgGx/w0CenA71cOC5ghcxRjFjuP+u5UlCXkznPbBJ686hgzBtwygsXU7olxclm4n
	E3pCZSrN6GlHdTiEq1xmaBx8OTf3zoQBsMGWYblVl+zhJ9mTypudOcfp44Z7AhQFyN9dinnF6sq
	Vswa7iaMcehAAGqrhzOiqbDCUQ==
X-Received: by 2002:a17:90a:1189:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39df06469efmr944725a91.15.1789370972413;
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Mon, 14 Sep 2026 14:28:37 +0700
Message-ID: <20260914072842.24420-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
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
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 67fa40afdefa..981e660981e3 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2488,13 +2488,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2528,13 +2527,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2603,10 +2602,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0

