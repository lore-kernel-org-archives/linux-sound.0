Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9F3CFF5A
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365195; cv=none; b=nAIARFd/d6VRBMJprq5Sd/Unnvh/tVQdMZUVBqET0cwjvxzlE3VlDmCExIS45UQMB4hdcGgYChDQvVS/yS/LlC5evoPntqmA5rYqpwGZcG9QET+HN1BqAjC9TjV2RbMVJltNAER0fUaQkc9njUouvWLXSinNWY6EK+e9+eP22ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365195; c=relaxed/simple;
	bh=ocXw/ZHX2uwQ+TKC2dQ9M2w9Z4PmAFjY379ZrQOHowo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y8ogBtfOeQCzddkhXjZvqXEgTwdGKpNEqrVSDDugtDmVHNUbhsgLKUo/xg0k8tu1d4cqhVeq7GbrEU/tX1UbUGSGXKIIXOdx4EhA637tzm+idjiOGW1pQDViRHoWluGC44Klzx/QhT1L56eoQAPDvCtmPcffgPw7Bk4QKNPpMUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=D2vtBxdj; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="D2vtBxdj"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6979PbBF23694237, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1791365137; bh=8KPC5bz3FLdp/7DY77pjW6HZ/i0+R2M9A4Phb7Pv8vY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=D2vtBxdjQ1iBSYfNcOqcxrCLqWOk6n3IrqIbrkUT3t/Xug3/6k8lWYq9BDXesNce2
	 n59guh+laUDEJ7j3Y2FDCJ9jtYGgKev8imMdqa+HPPYuglMKj7zxZrpsczzV6kZhms
	 SS03gLpqmayc62nCw2RVyFOZLZeUo3ykh9c0pqosTPGkmNKPT89CdvXgcrs7LsdNx+
	 d4O7GCnG2sV7BoIpyCBA3rgwAdqWZQ36/LOZUH5Z0SAW/K9W7G7qV7tqFlJCD/CpSz
	 MWhhHWfxWxykrGUSuJClhHkEF6dmmG1HWafSHQJTqeeHIVLqdT8QewmEbVQ7EuCT6R
	 Uu1Fe0/bqOk0w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6979PbBF23694237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Oct 2026 17:25:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 17:25:34 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 17:25:34 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt766: trigger JD when system reboots
Date: Wed, 7 Oct 2026 17:25:24 +0800
Message-ID: <20261007092524.3711965-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The initial jack detection at boot time may be missed after a warm reboot
if the blind writes are not reloaded.

This patch triggers jack detection from the .set_jack callback to
ensure that the jack status is updated after a system reboot.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt766-sdca.c | 8 +++++++-
 sound/soc/codecs/rt766-sdca.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 28b4118e05c9..2e891b99dc27 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -176,8 +176,11 @@ static irqreturn_t rt766_sdca_irq_jd_handler(int irq, void *data)
 	if (!rt766->hs_jack)
 		return IRQ_HANDLED;
 
-	if (!rt766->component->card || !rt766->component->card->instantiated)
+	if (!rt766->component->card || !rt766->component->card->instantiated) {
+		/* trigger again if card is not instantiated */
+		regmap_write(rt766->regmap, RT766_GE_DET_IRQ_MNL, 0x01);
 		return IRQ_HANDLED;
+	}
 
 	mutex_lock(&rt766->disable_irq_lock);
 	if (!rt766->disable_irq)
@@ -304,6 +307,9 @@ static int rt766_sdca_set_jack_detect(struct snd_soc_component *component,
 		if (rt766->hid_func_data)
 			rt766_sdca_irq_ctl(rt766, rt766->hid_func_data,
 				rt766->component, rt766->irq_info, false);
+	} else {
+		/* trigger GE interrupt */
+		regmap_write(rt766->regmap, RT766_GE_DET_IRQ_MNL, 0x01);
 	}
 
 	pm_runtime_put_autosuspend(component->dev);
diff --git a/sound/soc/codecs/rt766-sdca.h b/sound/soc/codecs/rt766-sdca.h
index de4064007eb9..61af5e9c077a 100644
--- a/sound/soc/codecs/rt766-sdca.h
+++ b/sound/soc/codecs/rt766-sdca.h
@@ -50,6 +50,7 @@ struct  rt766_sdca_priv {
 #define RT766_DEV_ID1		0xc405
 #define RT766_DEV_ID0		0xc406
 #define RT766_BOND_LATCH_ID	0xc407
+#define RT766_GE_DET_IRQ_MNL	0xd203
 
 #define RT766_HP_POWER_STATE		0x1000004
 #define RT766_HP_FSM_CTL2_1		0x100000d
-- 
2.55.0

