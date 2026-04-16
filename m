Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123AD2E2852
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776353101; cv=none; b=J2aQIQLLCFB/F1npXrm83J6dop4Mdo5wx1nQX7e6MsqpPY0Ipe2eyDnmbYtRGFvSF8sc8mJeTjD9fr9ymzeFVRGTnHRHHgqQcA1a37nTX9AfM9JTOb718keB1OpGyQWbCHwW9AtyY05hzqe+wm5k4AqpFbz+MIBdsKmCn/oBNOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776353101; c=relaxed/simple;
	bh=uvvcbjPfqTh2X7TQHVzpMcycfgm51VhlGpTLGD2o0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l85t0jVvJi6q7X4aszrG9gKSOeFPozG/lVH/Mop/9F3kGiUDz97yqSbRfJ3D2dXOILioryprzcl90us2v2G+9Qgnw4+KPimPsSK9Fb/PSRTpYCGsN0WM9xVe9h87GRLbVq5RY4dNssGEvtrLsYR7OvzLmSbzrD5JW6nAwY51CSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGVcWquY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGVcWquY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso4983637b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776353099; x=1776957899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qa/4mWjDlNB4/W0mvOpWzdJOaWWAmeTtcRYBEVEM9PU=;
        b=kGVcWquYm8trGsQR/n2NLBkvcGWMPAT2xHzSD++U0htI4kk2Qeh1yNGx6evEl7HkRa
         SyYIA0C4VVzx1ZhOzOKJu44OYS64Wrqm4hMJs5f23RqlOmmszBDT55fiL1qjrSYcH/g5
         Gs3yBXEQvGoWxlrH+AZzEzdYNaDLh+FnWlR1k1hZU7Ebs6ab56DH67GA+6PeCzwSGAoO
         Udu13eFnYUZWQ4MguLAK45KjrumfQfqSZYi0kn6hRRh0Xb2ByoUWdQfaMDm/ZvZds1Au
         i9xVYWq2ZYuQKhM7AVbUSWauCzrjtNKcF9imOkc7xm2QkyYYKgKgYfGFcSW0tqsaZAm6
         YMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353099; x=1776957899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/4mWjDlNB4/W0mvOpWzdJOaWWAmeTtcRYBEVEM9PU=;
        b=TlwlUGucNjUA0Y/711FkiaWYf76zYi+ayVw0LrBHX6+9wvCXNmkgF5CDbEaZMZL1OJ
         umbC+NaMAbcRGzpMYbL0PTDJs1ogA+v6rlpFieJQMsb1RbSD8u5u3LLR0mXnMFZVaQSd
         ZWFnkJhZF7OyZFQRuDvjRimCX8eYQT7Z5E+cuMJ1RKl8/Or8hFE/1MScFm8rbL/0WVJi
         hHoUq2Fi6/ClF9/rZxYkpDrM9OrS3yKoE3ybYWrS19mdWxmL+hlLZS8GAL5ock0TVSOs
         hjQRWi9LBq36R39wH3sKV0JSb/3EEzcU/MqipKa94lnXG4rqLCSPIGjv877P915DMo2p
         M1WA==
X-Gm-Message-State: AOJu0YxQRIngWLL3x8pyzjfsbH+r+7Uj2xtzKTG9c2s070IqrJiTJkSq
	yHReCO2E0NIkBAz0zPZtC7G8TNTin1i5w/+G/jKabyi90FG+/ld3HxnM
X-Gm-Gg: AeBDievVBrNAAJUVJkzTHEei7uikk3gWvsu9yQ8G1gf9mDfvijFHFJURtcmuPrNXJbY
	D3pLL0xxzGFa/5ZKo+N4EvTG1CuvUVoRvRoZbwrOh/bVy4tD/xKgPOtFLeoyCidbb9RexkQslLR
	v60BglosKPu+TXVn705PjpriuurfPy7iQsLJifYR1qi/3wdRhzlsV/bx4Tmfx4bmFOyRgdhFUIe
	CLk8GfYGg7yjy14FeKz861E5RYtbOzoKdq+jcJx96+dsCX1uz/bzeJJummUQzsj20JnHyP+9+B2
	h3a5rJvNd7nzXzFj9FQdScC1g+5Pm8TyXuVVZZW0gOuuzgUhFzbYFzSwXPN5ywIramI2WsxH12D
	fW/pWt8s9jNQR81cDDdcSOnU1nx5dn4KhICroS2D/7rBHjxuL1QpCZbvm/VjgFsxgthQwGBwh7d
	tjP2Iw2ztsz8GadphSv4oRh8s1xfhV6RouayVHKwj/W8bgcurrU7UKYWLq6tTJE4UvAQOMS3Ioq
	9gZFEgPI6s=
X-Received: by 2002:a05:6a00:400e:b0:82c:9f7f:3495 with SMTP id d2e1a72fcca58-82f0c351b36mr25862979b3a.45.1776353099219;
        Thu, 16 Apr 2026 08:24:59 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6744b350sm5322841b3a.54.2026.04.16.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:24:58 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: cdns: Convert xtfpga I2S to dt-schema
Date: Thu, 16 Apr 2026 20:53:29 +0530
Message-ID: <20260416152329.6016-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cadence XTensa FPGA I2S controller plain-text binding
documentation to standard dt-schema (YAML).

The hardware requires exactly one memory region, one interrupt line,
and one phandle to the master clock. Verified these constraints against
the driver source in sound/soc/xtensa/xtfpga-i2s.c.

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
index 000000000000..9a4a9db3c159
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence XTensa FPGA I2S Controller
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

