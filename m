Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242E357A4D;
	Fri,  9 Jan 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949465; cv=none; b=ZDm8USrLX5UEGkqYW86R1Fv14pOc0uJgGAc3H1vc0w8/2iDh0U4FdOlJNG/xZiYDoN89yBm9BvDDdK1opN9rmQrZQ27R5p27dMBuiiDRF1DP2juuBE3H0pbnaS0ApCmUQmUi6VWAFODK9PuL4Rz+pYYQNxaIUlqTM0+hS0BNtNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949465; c=relaxed/simple;
	bh=hgbmzeDDsQQs0XDfFCcVRqbfGsMa2Nm/xswtZT/6Qcc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjsSBuo7TF+XSN0FlaO+NkR9xrumPiUT+i5AzJZ7uE5hupjuZp7g8Zy51vue7M9nmYObwmSlFobf4wBX8oNBE44INxtvHGfKVIf4Rh6zdOKMEIiQpRw4l5AObz8SEy0QgqRyjx8a0IkEMUOrTNT0rOhPDeqQBbRTKMcePn1OFrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=P/Wpjxjz; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="P/Wpjxjz"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1767949454;
	bh=BP0Zz8xCCT130oxfbeFTlpIp3UCCu7s4TjT2o2Q1W3U=; l=1148;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=P/WpjxjzNY+R9XvpePWh52TQtXwojGVA9Pyxm8y4H1TSl+xj7uz6moW8e5PVJHIKG
	 8IzNecOdK5hXTZuY2x8xXULuFFbDIG1UdZasRhSPnupsv8P3BY8uOkty6A5jiIqy7c
	 fglDdlS4k+aH9W5XqKgltvwGHe8DckivFNzjBqR+iuZ1pEXz484uZUH3HOfiranLzW
	 q6QHqAwz/K66EIymgbwx1EnUg10rYr63X5J7O77OKvnIJZecrmF810FhsCJ/hz0fAz
	 ZBSOLYvdkAzMKrm+Lj8dSZ9AmKacTVmNYRqs7mnkkXW79pS0HfjlYZt/V/Om79YTSP
	 R0qc6x1WP3h7A==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572462:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 09 Jan 2026 17:04:00 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 9 Jan
 2026 17:03:59 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 9 Jan 2026 17:03:59 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>, <musk_wang@richtek.com>,
	<roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
Date: Fri, 9 Jan 2026 17:03:53 +0800
Message-ID: <714d1455279d8e9814e592a26dc2f8440949062f.1767948925.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1767948925.git.cy_huang@richtek.com>
References: <cover.1767948925.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Add rtq9154 backward comaptible support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../devicetree/bindings/sound/richtek,rtq9128.yaml   | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
index d54686a19ab7..a125663988a5 100644
--- a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
+++ b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
@@ -14,13 +14,21 @@ description:
   class-D audio power amplifier and delivering 4x75W into 4OHm at 10%
   THD+N from a 25V supply in automotive applications.
 
+  The RTQ9154 is the family series of RTQ9128. The major change is to modify
+  the package size. Beside this, whole functions are almost all the same.
+
 allOf:
   - $ref: dai-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - richtek,rtq9128
+    oneOf:
+      - enum:
+          - richtek,rtq9128
+      - items:
+          - enum:
+              - richtek,rtq9154
+          - const: richtek,rtq9128
 
   reg:
     maxItems: 1
-- 
2.34.1

