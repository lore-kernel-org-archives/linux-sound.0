Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EEC13B280;
	Thu,  3 Oct 2024 08:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944576; cv=none; b=Ctr0smyJjLXLABUEdjvKVGl5km35D6bJfmuWRi/2qdwp7SEsHctEOKnzYwcNEOMjRz65bG845RNj/UrPhIvcVtXDUXtCm171PtKUdzLwlv/6yjVjoDzN9A3TLjulHTC+MYmjXQtVPJRspNbQT/FKG/ZW1AF4IkgWQSS+NPS9S+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944576; c=relaxed/simple;
	bh=aFhHoczV0rMWeh+VcHeNazYdIGsQ9DwYb7Mz6aNO70I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DsX3mpcupYQBTtimtFvIU5qKBNi5iFv+7geFETGpaMWHMw513pc5gUNcqaAfypkKwRbxbBQgCG4qdf0b3aGh2UYpTqEUWzaBD+5k+FnPULm3mHR0gecyOmoC3y4x/R7zbihLOmSXgZodaS4H8J5+aZl0vnfjTAizLLAvOF3PAkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b2kb5dVf; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b2kb5dVf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5769FE0009;
	Thu,  3 Oct 2024 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727944572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sQ9rph851MPwAwZwNHdKiFp9HyVOi/6POo4Z12r84Ug=;
	b=b2kb5dVfJ4wTrXp881WOyqsREtea0iLIMGxJqHlw65SNFYfVdOFKQm/uufmr8futTjECFd
	8CFV/F5pTqt8ZSo8/tSlfqKyE+iUBwscK6SZSscopBAZAhxXDtpQLHZU/OschV8CGWLy4t
	IzZvUdB4lJ3vwke4kNymA2cQg/GVg6Bj+znq2Wk/gUWciqICGq5tKCmMIojl5utxXCs9TP
	8BCgYcqpir/TJUxBzpxGZvbMVUDbWVsbK7MHp6kM0xlVfuggkb7U1PalZdEQNUarhYXqU6
	HFtmMWa5bdMBV67G0zPUWY2jQ76dxGc7wmWzu2/8o7TYj0YI8mzjf7zrxx80Wg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupt properties
Date: Thu,  3 Oct 2024 10:36:11 +0200
Message-ID: <20241003083611.461894-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

Combinations of "tx" alone, "rx" alone and "tx", "rx" together are
supposedly valid (see link below), which is not the case today as "rx"
alone is not accepted by the current binding.

Let's rework the two interrupt properties to expose all correct
possibilities.

Cc: Péter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/linux-sound/20241003102552.2c11840e@xps-13/T/#m277fce1d49c50d94e071f7890aed472fa2c64052
Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Hello Mark,
This patch applies on top of the one you already took, but if you prefer
you can squash them together, I don't mind.
Cheers,
Miquèl
---
 .../bindings/sound/davinci-mcasp-audio.yaml    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index ab3206ffa4af..beef193aaaeb 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -102,21 +102,21 @@ properties:
     default: 2
 
   interrupts:
-    oneOf:
-      - minItems: 1
-        items:
-          - description: TX interrupt
-          - description: RX interrupt
-      - items:
-          - description: common/combined interrupt
+    minItems: 1
+    maxItems: 2
 
   interrupt-names:
     oneOf:
-      - minItems: 1
+      - description: TX interrupt
+        const: tx
+      - description: RX interrupt
+        const: rx
+      - description: TX and RX interrupts
         items:
           - const: tx
           - const: rx
-      - const: common
+      - description: Common/combined interrupt
+        const: common
 
   fck_parent:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.43.0

