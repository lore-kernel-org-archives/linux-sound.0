Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795651647;
	b=aQ/Deh9E8v8TLSUMtTLDLiYA+9AM7u5ro1mZAKM2BT+RaB3ckjXdpwig6FfmObPRYIcw
	 I/1r6NqcackGW+NQrklE6vHGfhH/pF8rzlfhEEU2tAGioPKAzDaTfs6BF8Jv4ut/ld30v
	 T7nRiRy5xPBMtMp3aWmX7LW3o5U0wbGw1oi/hHtwn3E+YeadkCWFXybBuRFW24nZ+Aj0g
	 DItIQcp/t73bI1ErHOQsiavtHOFfrJqzk++Msdadp4xXa5Di3WhtcJrwXRWMXHLcOWEbP
	 ljVSDbsu1UZOWUtnCYqST+DqNlndkN60wji/tuivl0iNmns3aOwS4Sjhk9ZG2V38D7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651647;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=49rDMoD1UytKlipJ92g9zwOKQw9qPQcDIZb2J8KAmpM=;
	b=cfhqmKtzaA2c7CxcwL70iWqvK6z/hdUDkb50iwcJsB6j0l4K0ZaMdSh56vkun1t8CAe4
	 nqGD4JZT6QNyGggpAH7I5Hqu/GbBKdYc+qglWJfu/asadOkQWceCcrFKXJvcExbrT2XNH
	 osI2LjNdrvCDoLn1Rw+IA1G0eXDhz+uGJkimGgTL/kj06j5X+/i8X1gTA+58fZOJ5q2Vd
	 UDsYbHLMV8giMnITHDZNpItYy/SH7nAPUTWc6NrA27H06TdwTfWUxVr3Ea7pEYZZUcmWH
	 H/VnSpIFxrJySOGDFg33BhYW7hDNufxtLFlUfUUR6JDzEoSfXe/+6Z4Fx06SpX+IN1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fi/Ja6q2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294A606A32D;
	Thu, 26 Nov 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fi/Ja6q2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651647;
	b=RS/U2xvid8yWlqnvcSj6dfHZSQsylV9UWOfyFhGKYa8QLp9c1PecLmdaQ+lJyYxtYjWu
	 U5YBBF7syYOy3Tiq1yeaHEdUHC2p0Y3q5F8ypFWngxVzyyiwBJZvkoR1YdX73ISCG0je6
	 HR6qKfHtIl4q8sxurGX21GYtb9grvAp2idji1IdOiS6NFXIjr/Ff2m779c5y47h/quuRN
	 qGNkVlzsrIHdit3lMnfrDzrlnp3WVo6RMTHZk/oSG6N2MaKiabiWvbsVy2Z4j8FosDTQT
	 ocuRAyGZD4YU0DjVbekgMnqJHMyFfLhf3bzsayALwafxujfL8xTyn5cIu/iXDb3OdVg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651647;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=49rDMoD1UytKlipJ92g9zwOKQw9qPQcDIZb2J8KAmpM=;
	b=WT2B5guGWiQ5JFPYJeN+QdgMiya37/U+6zvoT4GcbJHoCDEvIv4lFhqcTXjyvOf3r3ns
	 xzW0RZWdI9koTK7tjxHq6S6WsAvUtvy5xCqlGey+jgjDYZHPsKsi5WhZheDDoMbi8/TQP
	 5olLVrYJrvqO1636ctQtxCW7bWVqnC9SgP+CGhgZIJt57o3KN0LdJlZXvDw8I9T5zUmcE
	 m2NuC5uoQh51nWPuTEEIr4L54rTrMJllzEZvcNeK1gtOPSUPDj9F4w2xDCZGYnivYPQYe
	 okGI2tOIpK5PznHFrmbvzwSZwW/bsJ3MjYSBFJ2Bc+fUQaKqsPLpVlGnTJEoLiR5E8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA9BB1F000E0;
	Thu, 26 Nov 2026 00:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651647;
	bh=49rDMoD1UytKlipJ92g9zwOKQw9qPQcDIZb2J8KAmpM=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=Fi/Ja6q24dijQA9iNwMWBwWhXX3whm2BLXuDl9qh/LUT89Kqs0S3zuMazE7A03B2o
	 nRO4z3WlQcWV5fvj5bjfqQ5Z+epxbjicraWc8keqNDANO8OWFGy5yee+jPCUKm64Zr
	 iRfYJ+GGT0O7N4MJ30RfEzvxY+j4Gz1QUY6EeLNNFl2PdYNLVZj36YaP9WKjWY3rrm
	 HLEJztzaOdwF9nEhIXW8TCXs6kT+wS3PJQZP57/QJMMU3FrClSSc/+mcTCLsJUbLPd
	 Y32aHhWf3QUkBZQmyydLyvTbW8Q+YhnIwKiCWQ0s8NTz5fmaBv+U9Bk3U6u6xVFavw
	 QRwlbxjx9HuJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 65B5E4D0D3;
	Thu, 26 Nov 2026 00:07:14 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mtk-btcvsd: use the interrupt trigger type
 from DT
Date: Thu, 26 Nov 2026 00:07:13 +0000
Message-Id: <20261126000713.16278-1-iasnezhkov@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651633; l=2186;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=eK0kCGN8jhYcvo75iPIlGqPqAmjRPKiR5NkFGxOHi/4=;
 b=imz1BKLz86VmdPyoyd6t5RBgPkiAnl93f6jGPcOq5pA4oJx1EvQKuzvcWprs5//TKtKop0B+U
 qCvEWlvZ3EEDz8Y1JN6omvvGnjb9JXHcTewq06LRmLxT/rTN5DdR0jF
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

The driver requests its interrupt with IRQF_TRIGGER_LOW, which
overrides the trigger type given in the device tree. That only works
where a polarity inverter such as mediatek,mt6577-sysirq sits between
the BT-SCO interrupt and the GIC. On SoCs that route it straight to a
GICv3 SPI as level-high, MT6789 for example, gic_set_type() rejects a
level-low SPI, request_irq() fails with -EINVAL and the driver does not
probe.

Pass no trigger flags so that the type configured from the
"interrupts" property is used. The binding example keeps
IRQ_TYPE_LEVEL_LOW, which is still what such a node gets, and no
in-tree device tree uses this compatible yet. MediaTek's downstream
version of this driver requests the interrupt with IRQF_TRIGGER_NONE
and describes it as IRQ_TYPE_LEVEL_HIGH in its MT6789, MT6833, MT6853,
MT6855, MT6873 and MT6879 device trees.

Found and drafted with an AI coding assistant while bringing up MT6789.

Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---

Notes:
    The same change is in the MediaTek-derived copy of this driver that runs on
    an MT6789 phone (GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH): it probes and is in use
    (logs of the 6.18 build). This exact mainline change was not built or run.
    No Fixes tag because no in-tree device tree is affected; a tag pointing at
    4bd8597dc36c (the commit that added the driver) can be added if preferred.

 sound/soc/mediatek/common/mtk-btcvsd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 19329dd..4448d99 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1298,8 +1298,7 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 		return irq_id < 0 ? irq_id : -ENXIO;
 
 	ret = devm_request_irq(dev, irq_id, mtk_btcvsd_snd_irq_handler,
-			       IRQF_TRIGGER_LOW, "BTCVSD_ISR_Handle",
-			       (void *)btcvsd);
+			       0, "BTCVSD_ISR_Handle", (void *)btcvsd);
 	if (ret) {
 		dev_err(dev, "could not request_irq for BTCVSD_ISR_Handle\n");
 		return ret;
-- 
2.54.0 (Apple Git-157)



