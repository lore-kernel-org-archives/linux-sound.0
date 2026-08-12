Received: from mail-m1973195.qiye.163.com (mail-m1973195.qiye.163.com [220.197.31.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB265315D53;
	Wed, 12 Aug 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527674; cv=none; b=e1zOJlwS7BQnXjSOJc1IQM5aFNQV9Df73RCiplZnfHIpPTAZ8d0x0aDTHjt2Yw9PXDsuIWqiSB+e4mgUmCRrkTHmDpCVaEMsH/Tbw2kZlUGFd2AjgJojV4a0/AXNh9YA7SmZBURcgSLZUf17Dksw93bzOErf3uwX6rnC56+3BYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527674; c=relaxed/simple;
	bh=sTfEKZgOLyicEcnETGdoLTBfJ5F7qbaFwJJcp8i3KUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWwzeijrcx6ryDnMihAFfBtRGhi66PGMaI7v1qHNZdfGwtOJosHyudk4vPYlO8PhBuke1FFH69gHB4Pbo3RB7TgyJ2fdueJ2BiXZQ05cwuD2TtVZw0XQFMwKoC4MO4iA5KoBeEJMlvjuG71PI6tTj6GdXPAgeOw5TakfUnWly9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=mHOvHcgw; arc=none smtp.client-ip=220.197.31.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="mHOvHcgw"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b6d9f27;
	Wed, 12 Aug 2026 17:35:53 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 12 Aug 2026 17:35:43 +0800
Subject: [PATCH v2 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-es8316-regulator-next-20260722-v2-1-e7078bc9bc9c@thundersoft.com>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527351; l=2163;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=sTfEKZgOLyicEcnETGdoLTBfJ5F7qbaFwJJcp8i3KUM=;
 b=CLAvkZFFTMAbSuA0kLd3QA5ps3hjijoncKj4M8SY5e22RfFq6re9zf4dBm1Ip14SYfQNcnGwn
 TlVAPzV8509BTNP8bnqMgq8gCllu1b2BAsDRQ0zpa0Zz4Kzc5AQmqMH
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff5540ac509d5kunm921ee5013c51cf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTBlMVhlLGUtMGh8ZGEsZQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=mHOvHcgwVP/Yb0pMrqeie9+fWRPdtiA4UwxGS9d/kOpBR0fwpmatOLfR3r8TH6ukYByT49CUNJN7q0q6LFNCmGzR3AXbZejNR6wY6/+nSzR3EfMxN3UZ6lndvFzK6llX5hH4NzOq6Rr+oq8H3YJAhN9I4wvv29ej+JJXxmVfbhc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=1gFL+/Qwhs1LjL2C49Otf7vsepeJXs1MZOmMwoRL+wg=;
	h=date:mime-version:subject:message-id:from;

The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs for
its analog, charge pump, digital core and digital I/O domains. Describe
all four inputs so boards can model the codec power topology.

The binding also covers ES8311 and ES8323, whose supply inputs differ,
so restrict these properties to the ES8316 compatible. Keep them
optional for compatibility with existing descriptions.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../devicetree/bindings/sound/everest,es8316.yaml  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index fe5d938ca310..276c73bb4790 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -30,6 +30,17 @@ description: |
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: everest,es8316
+    else:
+      properties:
+        avdd-supply: false
+        cpvdd-supply: false
+        dvdd-supply: false
+        pvdd-supply: false
 
 properties:
   compatible:
@@ -49,6 +60,18 @@ properties:
     items:
       - const: mclk
 
+  avdd-supply:
+    description: Regulator providing the analog supply, from 2.0 V to 3.6 V
+
+  cpvdd-supply:
+    description: Regulator providing the charge pump supply, from 1.6 V to 2.0 V
+
+  dvdd-supply:
+    description: Regulator providing the digital core supply, from 1.6 V to 3.6 V
+
+  pvdd-supply:
+    description: Regulator providing the digital I/O supply, from 1.6 V to 3.6 V
+
   interrupts:
     maxItems: 1
     description: Headphone detect interrupt
@@ -77,6 +100,10 @@ examples:
         reg = <0x11>;
         clocks = <&clks 10>;
         clock-names = "mclk";
+        avdd-supply = <&reg_3p3v>;
+        cpvdd-supply = <&reg_1p8v>;
+        dvdd-supply = <&reg_1p8v>;
+        pvdd-supply = <&reg_1p8v>;
         #sound-dai-cells = <0>;
       };
     };

-- 
2.43.0

