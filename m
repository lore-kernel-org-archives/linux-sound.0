Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC4260383;
	Tue, 11 Mar 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710863; cv=none; b=uLsRAo882LPFXHXlSwgSoSeWHwzXtFPkQ9t5pVzYmG2+A5JgkclGG2+nRpmcHwjmssPCihssyvnnu3AaifgrzEzND0oIevkvtLjsrYhSDOnmZM9tWTOzJe/x91C9PmY2ZPwItkSPAdL5hbuHo82V7UHt9S9WeuiZdbMSkGzCiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710863; c=relaxed/simple;
	bh=S4hPGT0jGZAeQzZwSLwf//+D0vqIo3lmykYBuhF/ikA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J7rKEkj5xCB32Nh8PS8sWG+7QazCOUnVrB6n3w+oXeDjlXikhpZ1Fy/IL7sqWG9vmtcxJi2Mu6iyEltU3rMgriSyu+83WU3TWULNeYeDMpqV9E5mz8HIIEjjS+ga63E48JCWJpTro/Lk0M6zacfWytUW/jQawY4EvlFSV4vhYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxD2J8yY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxD2J8yY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912c09bea5so4788296f8f.1;
        Tue, 11 Mar 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710860; x=1742315660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=TxD2J8yYcGwyHm8kz9Diam8znL/r74CgBpg/QeeqYmZ9X/DIMZPXBvuGPRztE7PWHC
         4Msyx52AXDDQ3uLdDT0kR2jmi5TrLvUqdcRA7nnNJg/sbENkXZYiGSZIVkasiHqDvUdc
         8+zvLFNGp+7w3xTgE5MKY2rMHl9oWN8711StWZwcJhfGDHVzhKXDYi6u0N2mFu2xxXL6
         LjqO4dwULoAJdAO3w574+HcvX1L2KfT2LIc8ZOH+DhFHk4FADBg8XBgQr6333yKJxJs5
         oVd1XTuhZKdYy9wwKcjPfOXolWIoAJKb83wIQEQSrbMK2pXB15M/cqe6UuXVD12ECPc4
         Pj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710860; x=1742315660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=gNLtjz6evXeRYRd+l/fmud/P4B1HR/G5ltSg36KodOMczNo7R3467xzpa6SXTtDyCc
         G62EtnBpCNZ958Ub4U3Fivsh+yvjwRmeBbYStoYab6uYOmWUz0hhWcuxiyfvdGQYAr7c
         kmY61aLSuUrnCpojwUt7WCDN5MxhTCPxMC7j4q12qokvRmRYWp6a3TtoUciuNNCYfZTJ
         KWtTG7/U7HYDDuwMN/Dn+NlPmonSiFBjBMdmG/2Ok1R+rSn9PhJHsHzAHB0bv5ALtRLH
         A1WMzFnpTcq1Vc6/AdTfSePMPYpjg4uUvqu4jUuLtS9yZL7cDFOPUyj0ML6STXF5KjOe
         75Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVmWN3zoCnazuYJz50tMcKCU3+bzTn7z5H8+tf9PCwm1XQhTTrUdOAYIODs0QHWf1k5xGC/DWQf57F47Vs=@vger.kernel.org, AJvYcCXUM4A49KkG7jUhQHhCQ0QAzARHc4QEQTmr67ColhP/2xeOeNZJAFXXZDEeHbCnD/vbL+jE7k3D/Zi+@vger.kernel.org
X-Gm-Message-State: AOJu0YwAKc2CO9bJcNqnlc2DvLk4s8vMhTD4NzWJxcE9kSpoZMo0ey02
	l0X+m6YMJTOWygxPraUm8i6M8r0AtjUWD3nsgSXwR9oYN3VbpGcd
X-Gm-Gg: ASbGncvG26M5jdTZDiajxwXR0qxagyU7XkkTSalcBrUNKmNIcfdR3lJzbyxXZhtEcg5
	hXbTnnXXRa7IWRaTzHaZYtNOA9DLFobxcOsSnpBenYcnrbrujqu0ZPOzxAk0eZs9CmXGUcKhM3d
	yF+tDjVmeCHJM7p7I3oqAoYWqqWB+Jd3+qOiInHmbX3/VbgMNoDMPkGOUm0hXTCoyNiRalxM3/i
	WwA/JSprXQBW/Ibevg494PjH44/TYqc7Krsr9D645GmHt9kjHIsvl308llif6N3C4XyLeZYBAPz
	4mxT+PEDPkO3mBflEL4M1EDpbLZD/K+33vGLRcUU8JssXULYh+WXchK8hDFYN89/C9RaFmv/ftS
	Um4foYqc=
X-Google-Smtp-Source: AGHT+IHzNwv3pt//uPp+AK3oZyV5NFTP6P3+wVUbCg1pfACSK7yZfLYQfZuyJtz1MusPNtaNgle6HA==
X-Received: by 2002:a5d:6481:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-39263bf6882mr4377953f8f.6.1741710860435;
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] ASoC: dt-bindings: support imx95's CM7 core
Date: Tue, 11 Mar 2025 12:32:53 -0400
Message-Id: <20250311163255.2664-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core, used for audio processing.
Additionally, introduce a common binding for NXP audio processors with
Sound Open Firmware (SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f00ae3219e15
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: sram
+
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    const: dma
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - memory-region-names
+  - port
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        reg-names = "sram";
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        memory-region-names = "dma";
+        port {
+            /* SAI3-WM8962 link */
+            endpoint {
+                remote-endpoint = <&wm8962_ep>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..31863932dbc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+required:
+  - mboxes
+  - mbox-names
+
+additionalProperties: true
-- 
2.34.1

