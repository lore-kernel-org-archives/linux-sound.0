Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424541C308
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889334; cv=none; b=ulH3ximPFd9hfLI6dkGr3eK8MvaOiiigPO2MgFEA1oOh6c1uqfOh9oe5xT6wgfdWbwC2QVdXMi3km9M+rqbsWvOOh60NZwYutJ3TZmnhnwpHAoyF+NcBijojWnGfanwDNH3l8fX+8RJlmoSBOeE/MPyQU/BqGTw0FtaQgDN7GKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889334; c=relaxed/simple;
	bh=VzV/fPvjI+XqWxKprvzJZVYA2YFkSP4aBOscYa8+RWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrJP3DpgHvsLTFKpCBkBcaJ9wZ5CLxrcMrJK36zytbeei4TvR1tS2XAVcehhlJwdFu0rj55erH0kiRhqhKfj31FcpXS6g4BnuXxQTrcPf/8v7SG6gMdJYaFBtRsjORagYAWjomtNZcK9Hozhth+irWRqnUpe9NSjEm98XNeSz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9QpYYZj; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9QpYYZj"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304545f5206so7458066eec.0
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779889332; x=1780494132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxLsjsge6FjE23brvA4cB6kvPU6JOYpV69fL9+pATJc=;
        b=C9QpYYZjvfkcA/JsWh2JWt7RLMRFdl9FTVUzc/ZOE9YwpzgrNglKmH5/HciVQ/9Os/
         feh3sQSEtfzRtRKJAwdIPJ2+41dAYvk/KSdUArrpmnzZCpkA2/TI10FR3InlaJoD5zpD
         oi5i/haSKFu9KYkfqw7osHRfh4tw5PYuAtOAoES6ORNmREv8M2FMdRSvhr53ZbHFpjuF
         nHrMSZL8dUc5TYYe0irSGwcG2LRl+U9zg+/oS2zxVJIL2eSerdW5jrclDrtw0gMVM2k2
         AQMnGxkvqF9Pyw56NDT9XhZ770DiIfmYLTDL23UIRFSu+OJUG50fVjWd96/GKKDvDIiA
         kixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889332; x=1780494132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxLsjsge6FjE23brvA4cB6kvPU6JOYpV69fL9+pATJc=;
        b=tFarY/rVUbcW8xunllogU/Gfq6TqYWyDEYev37K4YgitnrwJKqR2P5Z/uZ61K7zYrD
         olBVUFuwvgN+w2FsFgk3UhtiGEowjne1Xc9+pw8UK+HOZ/i2GOGM9m/hhWXdswW3M3Jz
         8jIBM+vzSITCzaXJGw8nyezlldJ9IhvpwiReB/iRMNt1OgO4tFmsmscglH0lpiXBFwur
         W3/ULOGaMGT0TAzXB7JKwKOO4dNkg5I7C2J2QWmbj5PdnC5+v6xEQJQBu/ofnUmsOCAs
         DDShvK8u8e3furbQJSaZSFDpgn3dyqJMr3AP624QjdNwdzE4dyC7SoYAdslGDrcxnpM8
         ZcEA==
X-Gm-Message-State: AOJu0YzFi92YPAyWRGmJbNpte/zX0UIPKabI7oTBd1RxgJRNNb6d73Se
	U0p4HPjfdQoXHNX3O06377OhTI0CE8UkfrTxvOXuOpM4op0cLREk8nEE
X-Gm-Gg: Acq92OFR85q3sMNXcgNELXS/f47m201Qg3ZWY/ICwqDrE8usiByGYhdAThBhAVXxgN6
	TazvN+WQBGCnVKLo420oePx4RpU3rC20nogPp7HM9o+5YjPJ1yahiZoELiJDBSzzprIKTMdb/ee
	9RCjPasHhOWdUlLd9whKaHfnnmvkY0p5x3FthTtqxcE7dyFLN7AZFYMBkxo60PiLlbS99AmrmgW
	LCft45pDwUNY39t7opJdAUzUOH1c5VNHKttcReWN36vipr61rrWnHKXTGfg7lDQbHmgHTaTZOBb
	CBgKm2IFtUXkVZA8vShszukS+wHT10Ebq+TqlfYka+a7smBGXE9uqp+uAqP7laZqE0AxTyVg0qD
	zZC55A1/horJpvCtAQ2Y27q47Qs2Pms4DaP4KL5ZMTtpLx+Fo12kE2R1t25Z2cUe55fA3a9r0a0
	WcmTLyUO2XynrjKKD+4iq453eNFqZIsH22N2X0RyqEhXCdxw5Spl9thgWJ155f7bj0RqqD+l6s9
	IX8JJbnPi8maMAv+X2BvMM=
X-Received: by 2002:a05:693c:2285:b0:304:3c33:7ad6 with SMTP id 5a478bee46e88-30449001dd5mr10880555eec.11.1779889331603;
        Wed, 27 May 2026 06:42:11 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ccdaa124sm311702eec.11.2026.05.27.06.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:42:11 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 27 May 2026 10:41:48 -0300
Subject: [PATCH 1/2] ASoC: mediatek: mt8183: Release reserved memory on
 cleanup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260527-asoc-mt8183-probe-cleanup-v1-1-4f4f5593c8d1@gmail.com>
References: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
In-Reply-To: <20260527-asoc-mt8183-probe-cleanup-v1-0-4f4f5593c8d1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Shunli Wang <shunli.wang@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=VzV/fPvjI+XqWxKprvzJZVYA2YFkSP4aBOscYa8+RWs=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliX1YeEzh78zWH703pVZqrvTeuWL526atwxjdhBwS39
 7CtZm1L7ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJfDNm+Kc1XYkx5/BGR6aP
 S5Jv73u+L4OR4d7Hw36J036ccnm7bNNjhv8JapdZPIUlUs+z7D+Tof32xs24+sMPi1v/nz0x85e
 09lsWAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8183 AFE probe can assign reserved memory with
of_reserved_mem_device_init(), but the assignment is never released on
driver removal or later probe failures.

Register a devm cleanup action so the reserved memory assignment is
released consistently, matching newer Mediatek AFE drivers.

Fixes: ec4a10ca4a68 ("ASoC: mediatek: use reserved memory or enable buffer pre-allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a7fef772760a..49a69728fd72 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -766,6 +766,11 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8183_dai_memif_register,
 };
 
+static void mt8183_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -794,6 +799,12 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       mt8183_afe_release_reserved_mem,
+					       dev);
+		if (ret)
+			return ret;
 	}
 
 	/* initial audio related clock */

-- 
2.54.0

