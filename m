Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4032FA2D
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979730; cv=none; b=Qa38UJLXROfslsja1hRrzAVBIl2sWk/RsNE6JyXb2iyRpKKtXZDWh3Kd0W/uRETfq5MhPur1le9xjynHzrKpNAGWTdw7M+xNfiwRZce+CSOXYzg9PBPmMFdc1Wc2dwKO9LmEHqa6z3xRF1XxwDP5g6XTmfNETHh9+MevNWO+eqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979730; c=relaxed/simple;
	bh=Gt/yd6Gg1gVsX4My67tGlLMQaMCQ6n106Zyf/PV/7CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+phSWu+iXLx8p5WujZ+jLa6VZ+BdcodiItKMMBRc/FyluytMl8qubFVMM5H6eL0J9VQUh1wiC5xP7hrif+GJ4zZbg1rR+wFTNwyCtI1A3dcvsfbgddojxOQVdrFUrI86gR5SaKLS9QqYG+12YHGOxeINoB8BVtzWFMPREw2rrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vVrzW-00019F-Ai; Wed, 17 Dec 2025 14:54:58 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vVrzR-0067Yy-03;
	Wed, 17 Dec 2025 14:54:53 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1vVrzQ-00000004tQv-3ZHF;
	Wed, 17 Dec 2025 14:54:52 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 17 Dec 2025 14:54:57 +0100
Subject: [PATCH 07/11] ASoC: dt-bindings: add avdd and iovdd supply
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-sound-soc-codecs-tvl320adcx140-v1-7-293dea149d7b@pengutronix.de>
References: <20251217-sound-soc-codecs-tvl320adcx140-v1-0-293dea149d7b@pengutronix.de>
In-Reply-To: <20251217-sound-soc-codecs-tvl320adcx140-v1-0-293dea149d7b@pengutronix.de>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Dan Murphy <dmurphy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kevin Lu <luminlong@139.com>, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765979692; l=1231;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Gt/yd6Gg1gVsX4My67tGlLMQaMCQ6n106Zyf/PV/7CU=;
 b=rB5ByCR5VKwlfo7/AiAe/IG2Hmxb2hBPhIfcQ5eg3p+K90A/hUOhma2tV2v4wTq208D0A+bqt
 xR3KKPPTKXtARZgTCGu7SP+ddv7f5s1A/rrvcXElPdIK96itWPiojx1
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org

Add bindings for the avdd-supply and iovdd-supply which are named after
the corresponding pins on the tlv320adcx140 chips.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
index 876fa97bfbcdd3b9450aa6ff57de42f1faed350d..0f043a51f1822f4d39214438818e3bc84d3e8681 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
@@ -44,6 +44,16 @@ properties:
       Regulator with AVDD at 3.3V.  If not defined then the internal regulator
       is enabled.
 
+  avdd-supply:
+    description: |
+      Provide a handle to the regulator supplying AVDD. If not provided, a dummy
+      regulator will be used.
+
+  iovdd-supply:
+    description: |
+      Provide a handle to the regulator supplying IOVDD. If not provided, a
+      dummy regulator will be used.
+
   ti,mic-bias-source:
     description: |
       Indicates the source for MIC Bias.

-- 
2.47.3

