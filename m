Received: from mail-m49234.qiye.163.com (mail-m49234.qiye.163.com [45.254.49.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C33F5BFA;
	Thu, 23 Jul 2026 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795431; cv=none; b=AbOPU3L9YFQyZGHX3Q1wPU+8mspdbJGcSXR1Hf8jHzJRGSWMzI7xv26Ahgl9CDL0/NNY3ioNZdPqvwmGvYV76SgX8pLTTtgEhxpw+H24XMVv4zHxwoiEMQdrwys90Eup1TcCEIDlhD3JL5z2JGmQvHdk0MxIgTBJAevFS0Jc3XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795431; c=relaxed/simple;
	bh=JEoccDb8nSXcL2JmQ9CO0lERWR1sAzHWgDDgksFjDb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVDb9kQQ8CBpx9Gd4khg3Z2xiaMzco1wc3rCf74xdKtR00JBcvEoadf5hlxanv1F1fwsINxYXL66Zkf4MKP5xohBPsNb1flO+JababNNvwRHf8uTIRQ2hTl63X/nxLckXaAwN3tmtUHFxIE91+wxNAROT79bJliH/WK0l8bGWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=H6abypm/; arc=none smtp.client-ip=45.254.49.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="H6abypm/"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 474a1d1cc;
	Thu, 23 Jul 2026 15:54:39 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 23 Jul 2026 15:54:29 +0800
Subject: [PATCH 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-es8316-regulator-next-20260722-v1-1-721f757879a0@thundersoft.com>
References: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
In-Reply-To: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784793277; l=1677;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=JEoccDb8nSXcL2JmQ9CO0lERWR1sAzHWgDDgksFjDb8=;
 b=XKUpH68Tm2rqMxfPTbH4p8YM6XMkuPqWfA1tlCKPhqk0vBn1HdrZpyuVP0aAOEZx8l+OT6tfJ
 2JuudrFREBoCN/hyzSkT9bgH5K+f08QLVk+b7p+YmjA/yyFohkWQLAM
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8df82c0a09d5kunmc0741ac25143f5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkMdVh9PH0tLGEJKSRlDGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=H6abypm/mIcuUZIzdDlEzK7kOGui+JLuXQAzG/8QheKNGcbLjsMUZDQmnErMXVJ+704ieCmdm1gYnkLRYKS43G7RdG5hqqHNPFPTJ1l0Q1/bDYbO8F0o7123q5vrjkwlheLm+ewxFGK/anegaOWbyxpUzMGSRdnTANkpkNQJh84=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=bCzvgz3PNErKzP0ve8Ty5UtFs2OsEDqhcUvEDyz3eBo=;
	h=date:mime-version:subject:message-id:from;

The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs
for its analog, charge pump, digital core and digital I/O domains.
Describe all four inputs so boards can model the codec power topology.

Keep the properties optional for compatibility with existing
descriptions.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../devicetree/bindings/sound/everest,es8316.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index fe5d938ca310..f45f59b7b070 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -49,6 +49,18 @@ properties:
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
@@ -77,6 +89,10 @@ examples:
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

