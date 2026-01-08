Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC03D6664
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866475; cv=none; b=FIE+nt2cdTIWx0ZMPBH1RFtdcq6x2IWbTnZlWF/XDhYT4d5tGeaNS15LHqorAL2ChN+M8x+5NFP1i434pKa3rASH6MJgcgwWj4LsjbS+iIolTNIj4351G6nrF4h+ObR2/DdhBr6JUoi0J7ScSbJdKx4XewybJCIMFI6wsRpLZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866475; c=relaxed/simple;
	bh=v6KD22Dyx3+5ck20H0pl2sYgGNxEEsrVPo7bCwCkiBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZVtESx5ZFWFQonItd7wh4H5VpI8/FyZ1NfPIsi5+ulnuPoheeGwax7GZAftxEZ0JzINw6wCuaG3gLP67PcDP3XnglgX7x9+k7/oK7Fo7j+R4GpfnasULaWd72RrbZ0sTd/QRqGjxpSsbvm63Ny3hKK29RpqejL4aDb3xEv+BhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnZUI8EJ; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnZUI8EJ"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94130b88642so1835437241.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Jan 2026 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866471; x=1768471271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
        b=JnZUI8EJyiiQlAsSxRsNmMyRcUjB76fahcdW90Tm1hy+RSvUnAvrNpjt9g78JM3qNg
         HzTWpbJV4UNTspoPl2llqkCi8vD+q20a3nYnwq/oq0fdVIy/yvgEoHeq4/ZXJaLgCWiA
         SDcK74o3FNzz9YLb75sr7rc0olZelpBo3Pt/X3GTcuMStH9Yp73z0wDQ3cKGJ7XSsqL6
         nBslqt9HznguOk/hg0Yzj45pHspw3OEMdJtJPRqVZ1DK/mBiwj/hccf/CVflxcBceLda
         ZobB0tN9BrBUaJSFV1NS41kydKy/rOzH3PzjV0rlzhu8LOijxCEDqhMkMHSkHko40TGs
         CBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866471; x=1768471271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHhAP8tHFGp6R15hZZObJ523oYtuLJJxIs+qZwxX3g0=;
        b=R+X+aqROHN8A4V5mjasticRYxUu/nRQXWY9PLvV4V+EyxSWUH6qcmyC/Yv4dd8X/fO
         uD+yecnZ9ja/q+wKSsAB6W4LjhF2i+b9nI8R+zc4g+CBDj8XUus+L+lrICxhtI9DQa3R
         d+jlfYzxnLjocnC4xMehHBNE6tmAlRNbzo9lJDgR+SQcbMNewFkohV/Fwd36zxnvQAvv
         zaHQpwH2Tf7CzmhmKfjDzEKa6TD/i5m7GWB9K8u1kg621ro4Z5XGYzkt7kuEry7eXm3Z
         FuHa1BBOc7R+imWrtV0Ia67wOrx9t71ZbsGSvFcr6CYbpjeYPKIW5NdaWia53ipTzq1+
         KNhA==
X-Forwarded-Encrypted: i=1; AJvYcCXvBUYxbSI+VdfErn76r1uxQS95yuzV3m3Ts2G5YEy2+sopBy5xcV2m4LZjetXLt0hhRr5QQKatOqjJEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1Bk3+CgR/UNvbXS6MitZUD8G10KnB1InHjeZUbWyVz6v2lXj
	zQpniHte+QOrDY42aYr2k1hhfTKK1BNnJgYfCNyBmChO8RlTEg09nInFX2u0qA==
X-Gm-Gg: AY/fxX58aGCRQeDgEV8RekgK1u0yn3oRjtv/5ikd0Qy6F0sVBfJGXL+TCogNTtDaATx
	lH2JZL8Dr9KqAI4JvIR2nbDQbr104NISXnNm5x2HspTkTWxgoz53iKjoTMGNQRjIc60cXHT/w5C
	hA0G5UHd90QKwmYhKe0smDhIY9owJSEV6hlPhvvInQQ0YeZULlp0ErhQErVzhpAgckd3mzWiARf
	tVdIyfTA03NkWFWMV0GwXGO6rJ2sOO+rQ8PipYzeFv2ftKEy4vW6IhaIhap81NvPCgyUyRLULp1
	i9/Fvg+Mreh3d6GFCC7Z5MPyf/r98NyMQQdYvxDuv7GAuFWnrpUdHKFwYNzaFTDvFLUEEJpfQZN
	VOXyKTpmjagQz7BdrX98nSfT74yKYec86XlUWiBY8Nmxfig1zc4hiGSOOzGkfeK9RY+fjwI5mhj
	JLxY8k8D/3YPojpg9pz2fE6iELaoI7d8sfKKet8QhvPHk8cvfn7RtStwdJyJOaPi3ha+c7DgLxh
	rV/NXeD+2Q3MDL7Gw2CnvTEQAgsHy0Y
X-Google-Smtp-Source: AGHT+IExPvCC8KraIjBsVHGHYTjET3yJHc/BTBjFTEdV/VDXcghpuxPJ+uczZtlqCGmQQNa17ulZcQ==
X-Received: by 2002:a05:6a00:288f:b0:81c:9f57:3090 with SMTP id d2e1a72fcca58-81c9f5766a8mr2451909b3a.24.1767859757241;
        Thu, 08 Jan 2026 00:09:17 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:16 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:32 +0000
Message-ID: <20260108080836.3777829-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
- None.

 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/pipe.txt b/Documentation/devicetree/bindings/goldfish/pipe.txt
deleted file mode 100644
index 5637ce701788..000000000000
--- a/Documentation/devicetree/bindings/goldfish/pipe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish QEMU Pipe
-
-Android pipe virtual device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,android-pipe" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	android_pipe@a010000 {
-		compatible = "google,android-pipe";
-		reg = <ff018000 0x2000>;
-		interrupts = <0x12>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/google,android-pipe.yaml b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
new file mode 100644
index 000000000000..12b0cfc815e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,android-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish QEMU Pipe
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android QEMU pipe virtual device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,android-pipe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    pipe@ff018000 {
+        compatible = "google,android-pipe";
+        reg = <0xff018000 0x2000>;
+        interrupts = <0x12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog

