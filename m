Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506710;
	b=CSei5VhO0VSGGkZqxEq53LISRDXrG+N113GXs5ez47nqMRgmAZnAxLSiO5aF5OIR4qFU
	 zUAR4RU2+6Ll7EiI4YxNY2B2m0PJF9vNxb/ovjm0hByZV9VXSopbdoy8iXw69JM754OhG
	 /imIxgmy7/VMdROTzmR5rr9amFRzKrUFqJvnrUf+1G5b1xhIVbUKJXAW6bqwrrWYOsnM+
	 AaXc1eAt7gfW7pGEoadhFUyixE7Yx/4GEKOVy8Hh+ejxOz+b8a4SSWq1ylw2CwzSdrNcB
	 1VEWUCk5T5jKzaRuPYoomIsrASL0y+1Ho59cA9IAe4YxpjuThwFf5+vUIvwk1P9BtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=jFR8zXAPPiZsQLEr+kahTIaw+c8sirKmWlEM7RGQdjhfFfq79ZJWfxDuwsS0QrM5Fod+
	 7E+Wln1CWo29bio0flVqWpWGE5tFT1H1JUnl6h6OCr+q7BTFG/lBUQjEsydUEGhEot7uh
	 gPZ0HmH2wuM3RDFQaOq+puEblnEr0FcRzluDusYHyBNQrlQ+8AGSCGXxK+Tf/c3hAuHlI
	 j5TRmJLZRSY87eDAmCccTYmHWjeuMmQj7sYuQ6Zk3aT6v2JqEnI0xqOjM140to2rsk0h4
	 6bD1Ouyg8LpAigNxJqQFM8J9GQiK6e37lBHD/zM4cYfxkusGNmWXK7UKQK9BbKoFdsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1B606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M4tx2k2x
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06e79e152so908370b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506709; x=1793111509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=M4tx2k2xmNZJMm8m6vMwhs1IRwIr+yzNrp2rpQ+Em5MLK4HkH+geJySjymeetl+A8c
         dlNgIFZW78l8bFnBJ0tkA+lnZhuFzWlXW5f/yC/Z90+f2Sa1eFUDE4xcpNmnS1whNvu2
         jitzNnOWqx8aY30hBu2gQFIo8wTJDrPDExBHFqosVnrVWJmKmRLr/JJjoQSzllu3ofb/
         3UphdECxSAaKqt8pas2w+NmZebFW3zKU/8i+Jv/b6d+YfhxeGCv840GBWLSyHhjRqKEP
         TLw1s4X6zKPkc348Q+a+fHtSViHAsm6a8QE4k5JXnM/gr7XZ6KYW9fvAXGbFjy9S7iHL
         +SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506709; x=1793111509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=O751w9sbKq12HzNSB0BRI/wOL0NKexjO//yy74zgVfNHGhv9QWvlhy7fxWW8P47Hns
         8EiKN6cxO62oJb0jkj9EjMJfVWMOKcksmoOcpwUOpfC9XI+YSmi7B/t71jGdJ2A3SnRd
         nxxZ9vPpnlbzlBKJRGTQTuZVKDXjiwsTKuCo1aZS8h9gc30b0SG3pD7cO2FI2fxh00db
         Q+ltxcGCjL+o7jVzKKEWTomSqgeXB26I9w7SZPs/AJjb8G2EEhIW/BxwQY92JLeHkIwf
         dvbWztetDegTvFE5p6mKXMAijDkb2A1LLuiFMURw8CaKbsrrhGCa5nAk2iVsC0WYar/m
         jNxg==
X-Gm-Message-State: AFq9FYLrdjGe/R9commSPsA7U1gna86eFU09ron802ITCU81rjzz3agm
	A4kOXdw3urrPPpogY5za9+gmpx9vVUQNk0qzOklIwNdaOWjNvWUB6eCz
X-Gm-Gg: AYBFou3M0bes7a2cqfRmx9P/QE89+efq8CMXGxMJYcrCZg9DHqNTKEhXQvmFBrfYrwd
	WZY7Iqn79OEWtEpbYN/0jE7ha7JVIhSiMGA+ICUtYNA75bEzFa0i2Gju9h6qeKQaxfQ1iay5q/b
	3upk36gGYFC8arz3t6JhYhrwjaA14+v2JQJJp+n9FA2dB1w5QYsky6k0RZV2lymsm5Rjgz2xCr0
	G48mSRneiS98LRwbMKXesR35muemFvLuTZdKn058rYIjZbLHK3itiO3eA8He4vwp1dHSsgG90Yu
	YMKZbRrnXCwDKReqpnUUO44Eth6kgN4jbl5S8gGTPaNGhH4iv8NLz+1VWG8+FKPqracqZqXg53C
	YcOOKk/2lDDvM3qmH9+9PfN2JuN6R2lhtfbB7d1coE20NdYAkVGWtr3B91yghUJY5X3n0ddlI5T
	KCUVGb4YrV20CGb0g859TmlpMv8lyOPTLjeOZrsu6ufx8+uRtiQlaW4DhPfPAgJ446uttMLR7A6
	X6NoAb5v+iwhSQ3OtBeFih8IsajRElfbg==
X-Received: by 2002:a05:6a00:4f91:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8a04be20ccfmr8218788b3a.32.1792506709197;
        Tue, 20 Oct 2026 07:31:49 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm4789001b3a.50.2026.10.20.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:31:48 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: sound: add Everest ES7202
Date: Tue, 20 Oct 2026 22:31:31 +0800
Message-ID: <20261020143135.623897-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020143135.623897-1-jerrysteve1101@gmail.com>
References: <20261020143135.623897-1-jerrysteve1101@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

