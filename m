Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05F3A0B28
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761815; cv=none; b=Rp+Fdc87k2OCpCJgxBLq3jCsmPIajTzLq8ELaNNH3bRjzBX/hFhnEXZe/xpNCd0R84sr9xJg3G1PCpuRq2SmHwK0hC3seBDsmTuZi+RU2w4bDc2hkFB/IbpMY77DjWT5faNBq23tPKYr7/k+67DceiepFogIycF6h5AtsadIyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761815; c=relaxed/simple;
	bh=9iZHTlK6xpfJU/WZl8CV+b5YzH/jAbEAS66ZdJyd3Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCCC6XBYIh0HKRN5QUwq5coxt0TVTp/Oi580NoKmxjrHBdLU4zv/rt6qCPcERFYhyQsN1WwyBx6h1oS4DthJbgMkBrpS4ljwANN/CcxeBnMA4c9gHqKPnZiUDWR6fggUYU4j+WYK/d4zhLJa3JJ6WcEKkP9mJum6WXCqC/zU6wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUV36HeD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUV36HeD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso670627a12.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761813; x=1777366613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ziz7Mrkr+sJ/qW8jpuomIbosBf3JNZS04tKrJ4e8a4=;
        b=BUV36HeDr4RYgMTAvVaMLVhBy1wL8JU9qH8QWSmBkdPu4LwaD6jb5mG8iUTcZru8k7
         0gYkvZc6+02oDkDlMYKSgpqchqkFoJ4+rIYphgZ116e5KtFAAVylWeS3t0vtC6iKPbuK
         HD/y7mDiTctZdaMz8ERdbdTyW4o+vCNgzG/y7HNoKjlcPg1wdCSYWQhPP1lxLIVF2H4b
         dtiw8rjW102FfIKoR75OFR+1cYkb1RuBqWFwbFH/4NwWucxrKX/zNky3KX7FtNW08bwt
         4iFziJGxGz4/rGpPl7cC7/pIKQOJq4if5Q9dZklPOtbVVMiYnFlDol/wYJVP4mDiBdS/
         GIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761813; x=1777366613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ziz7Mrkr+sJ/qW8jpuomIbosBf3JNZS04tKrJ4e8a4=;
        b=tCQ2F+MeAjiqpl8MMht8/humK1G83tRoZepSxky+Q4Jr8l2SbpWvMNOxb1tEd+ZzX7
         snI48EpSLrtHCmDq5GFy+gIkLA1rY14drI9HAQqSFH3HArYTIigZGJ3RROA2PjwoNlmU
         Yxk3upphnO7qyBNIn9duSaVDw0v3k7eIXg5DZkURvhvSREwToDRAdVnb7cfUif3TmL2H
         LERKvqDs2g2NIkq/s4ac/dTGkh1mfqNlFjE477mjF7ul3OtcSrKolQmW8VJB+IR6RWLc
         s1T4oX832XlW7H6+gsnLCzSp3GUV4uyKhJhHpCvn/5Cj1JEsy5si2MzXG8rGv6NuJixo
         OOig==
X-Gm-Message-State: AOJu0YyIU8juJ5KQjZ1zcsn1NVzMGP0RnsDtp+qXMJkVzP88fKlSJcT+
	qTyAn64jqlLOzC/Qh3Cf3fq01XqX8xFLURoJcX9e1O63I7y2Qm3YQ3hk
X-Gm-Gg: AeBDievx+QLoRNwXbnTbPTWpyIbB63hTrgKUncl6wRuOwFrSM+bu94fiXxdyxK4BFDE
	L4zSjkSYMeeH/k/73fAs7NQV5nraknLe3SM3KBANnXEm5kywsOpOSvjmFaM1jMKZ7WmuPzAY5dk
	YzLFitkWi02BaNe59emXiXjs7zONvUZ86uWt6xyszvTc+q1lC66P63Nm443ZF6Xag6Jzf+MTmZj
	uYAr+4yI5NpBgfBRqXmuBp4vy/aoGHr8kZcG8tQO2bMT067Cf3z1iNbzp1mjdYoxmpnSCAJoVkA
	SUxNfaTQYkCXIRvwn812eESCsaRN+bnBgBHoWs1Kl6uW4j54P9fqxs7ZTf6ZPbQw3OAgeK0gydJ
	/ZM3gG1d9KUhvw8nNsTL15HIF7nyb886h9+76wtx1XvDXaGwB27/X1VHj5qwVBNFQxGvXMgQgww
	sMyf2Mi6QgUhmDsBmKfHUW/dfhzfrh2WtJQT3vQHzcPCKt00eNefWAXOHQC4WG6pE2aBSHVFUJM
	Bpgb27RvSk=
X-Received: by 2002:a05:6a21:6d9f:b0:398:b95c:51ed with SMTP id adf61e73a8af0-3a08d8a3490mr19258719637.35.1776761813170;
        Tue, 21 Apr 2026 01:56:53 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm9868875a12.28.2026.04.21.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:56:52 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Subject: [PATCH v3] ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to dt-schema
Date: Tue, 21 Apr 2026 14:26:34 +0530
Message-ID: <20260421085635.4490-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the xtfpga I2S controller plain-text binding documentation
to standard dt-schema.

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

Also explicitly define the '#sound-dai-cells' property, as it is
required for audio routing but was omitted from the original
text properties list.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 .../bindings/sound/cdns,xtfpga-i2s.txt        | 18 -------
 .../bindings/sound/cdns,xtfpga-i2s.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
deleted file mode 100644
index 860fc0da39c0..000000000000
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Bindings for I2S controller built into xtfpga Xtensa bitstreams.
-
-Required properties:
-- compatible: shall be "cdns,xtfpga-i2s".
-- reg: memory region (address and length) with device registers.
-- interrupts: interrupt for the device.
-- clocks: phandle to the clk used as master clock. I2S bus clock
-  is derived from it.
-
-Examples:
-
-	i2s0: xtfpga-i2s@d080000 {
-		#sound-dai-cells = <0>;
-		compatible = "cdns,xtfpga-i2s";
-		reg = <0x0d080000 0x40>;
-		interrupts = <2 1>;
-		clocks = <&cdce706 4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
new file mode 100644
index 000000000000..9617acef3f0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2S controller built into xtfpga Xtensa bitstreams
+
+maintainers:
+  - Max Filippov <jcmvbkbc@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cdns,xtfpga-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: phandle to the clk used as master clock. I2S bus clock is derived from it.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2s@d080000 {
+        compatible = "cdns,xtfpga-i2s";
+        reg = <0x0d080000 0x40>;
+        interrupts = <2 1>;
+        clocks = <&cdce706 4>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

