Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB621CDFB8;
	Tue,  1 Oct 2024 20:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727815675; cv=none; b=DM9B5E7guyEVOnZUAtmq0h5kkEx4RpESu+1IO/KY1yI9ehD7WXEsquYEdjOL8/+wbON0W6AmFUVm7DBvb5ehhXNKaJLanDDKnRhoKg8jKfFVATrB4hXc3ncmeStUo+Oge+ilg6L3jNqGpnjSJxMB17YgAu0aK4R9BvI1v9Avweo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727815675; c=relaxed/simple;
	bh=JWQmFj28vAA7pfGSgFPser4PWendSu3+yh/XwPZ7QDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNtv73PmqjJrQuxgzQZ6hP2i28GBqO1xi7glrysL1fdfj4o3IruFUmDzhJDFWuBwTt1rpaCqnT2KOSm1BGUnX2aF6VpPBLhbGSqzDc0NxVQME+OsQc249UFkt9kf8op4P0Xh52q0AqJYlfj7m4t6J99F/oQ5WSzXOS7tZXHNkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cZEyP7Bf; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cZEyP7Bf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4434420003;
	Tue,  1 Oct 2024 20:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727815671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7K/Eugdwj8fUKd8disrVXoOxjLjfRgm10Zw7MAU2ris=;
	b=cZEyP7BfbsdDIRYXFoW85KZoxgrkUFjYoHO06PgZTSGhNOxcfza4NwQ+tvIn60v1P7YlSk
	FaK7AQUpxUHaCEIYq362WRBmmENU7UW1RmZFYiX5AJ+cmTg1lRMagXYAZnFi0z8S4QVNoP
	ZQFhevSmzKPWpVbGdTQV8Ne8sg2ORASSHX/EtcyPTO49LpaE4wCAWQR5p2/zuffnGqrepS
	hhzdm+g9DseFRnYFL89H1Ml2RceZPPH/3AybFwLrCld2F2ItzB1aDbT8dUJ4faP9sHmtEm
	ibOGyHl8vWXd3jbxFbD+YDeHhEg7KZDDIX208FRoEHLXqAZ4iS4EMChD9EpSoA==
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
Subject: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
Date: Tue,  1 Oct 2024 22:47:49 +0200
Message-ID: <20241001204749.390054-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

My understanding of the interrupts property is that it can either be:
1/ - TX
2/ - TX
   - RX
3/ - Common/combined.

There are very little chances that either:
   - TX
   - Common/combined
or even
   - TX
   - RX
   - Common/combined
could be a thing.

Looking at the interrupt-names definition (which uses oneOf instead of
anyOf), it makes indeed little sense to use anyOf in the interrupts
definition. I believe this is just a mistake, hence let's fix it.

Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bindings to yaml schema")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
---
 .../devicetree/bindings/sound/davinci-mcasp-audio.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
index 7735e08d35ba..ab3206ffa4af 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
@@ -102,7 +102,7 @@ properties:
     default: 2
 
   interrupts:
-    anyOf:
+    oneOf:
       - minItems: 1
         items:
           - description: TX interrupt
-- 
2.43.0

