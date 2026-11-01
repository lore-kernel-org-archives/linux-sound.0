Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520583;
	b=N9YsxdQre9xvBcIBxB2qRphw2dP95N8UGcdUx2HCbUuGn20ZTLuGKZWMQYXzBp4bY78p
	 hLG+yL1/+8gUPsT5gmuJpDTwZ15Sebbbdp9A80PEyRjk5p9xM9P6MAnt4Q04nn5F3ZQ7q
	 MEGfU7LOtaPGP7CDrcU6KAfUO+dH700/8dfQiFsn+aBhnuqBVfgzOHrvnWV/aoGtKYn7N
	 7Y2kvOJN6ZedaLRZZoUSRF+c7seugx5r9iGuawnGd6spO7FgpO55O+bBhKazAjPM9MyBB
	 glpISeHvxoh5Y87AEAQRT3lesPR2Jfrw744mSt+4rtSN3abXSyfX/PsKQeRVV76zVzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
	b=Jc/19oMtA8NLKR9iZ8OaIc/08Z0nv5vWcBQVRLonNujXvoYf1e9oJfmbGJBfq3xm9uV/
	 5Y0XC8euX0KWEMIIBH74vma77DUZ+2Rtq7oIX/TDIaLaTjqafuHs92CklwkjO/Q+oxFqq
	 Z12qOSechpqJGeUr8qEGau0B0Icmcbs89S4AeiCXnVEW8Bw11vG+jqeGZSXKTHX2S1uaH
	 N6827ZCleMm8yyvx1rURTB0Rk6bzQhvwcFRSqdFg5wF/NEQy0hH+mtHR948YWsAJEOBiJ
	 I8yZ3Q4owriYGo8wh27pJtgnPedUJBSYd0WL6QD7L9GUPEOFtnZ2gx6v9c8LtB4goog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD43606A32D
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 08:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD43606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp6k7NjO
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35829219da8so3646841eec.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520582; x=1794125382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=wp6k7NjO7CvhnB9nj/3d/3iVOtHiuOC7juvPoVeBZzvXJDmftA6/TLI4zWL8Dld//0
         wA8cHBigcXtZ4Kz4r1wdWExQsZhcveWPx2P71RdqfYdnMhnVmaNTTMgrXVV7LKRMhOJN
         XBneBxGqmDus+d7xflLQ2CiXhsg9Zey1hmbzT/0xxbNjgoYy28qLFtsXKnwo8PdhDKmk
         wDVtYqwgQIREWraLUSTzjnGyMOkuxDLZj1eV5JJuvgcinAtMjEuqkagKmu0sCNGXWGes
         CY0ezDue5rCO4+AHKFA+3Lea7B5ZxS/l7Qa7kpt5zK2J2MqlKuc2vjq/rsey1xb1/9/X
         taEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520582; x=1794125382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVRiNu3CfSkNvXBK4ERxHrAsBNy8xruX8jtIU1B7VOM=;
        b=ciMip9QLmwPYM5Pox9sOgq7RaMmHTId6DPLnOQ/YJr4a6ZbAsOPrfvGBQeQ9z+xIj6
         yK5y/fjAGGn3lFlNsOd4GTK66S4Lq2f+VGlEzJG1rURazCFWVw7pydGjypBYxZhKkIEt
         8P0w9gVKqcQJxukLx4ree3XLf4pPl969W9yi+1txNTLPn1CQI2lam9rrUIuUy3RYrqXr
         ecXU8v/Pvp39Co7rx/kJB+yJLOoRVfU5HzPLPuoy4sRYKBWgz+2fY36ymv4XCkm5x8Wh
         7PNKPJFN9L1wRUvMH1a0NTfx88ao7nErA7vIt2rMTLfIhONQjrFN2Pjq5klDMbOU/LXj
         pVhQ==
X-Gm-Message-State: APuU4Z8oXgoL+hNa8RIrFgN+Co9W0q1YkNgh1iefi6rqCoQPBACltj3k
	C7z7VUa4cbJI2MqGPK9s8W5u7B1NZri0iHm6PJSOOc626MrQbZiZ0JNl
X-Gm-Gg: AYBFou1tc4ctYfbJD2zsC0upjGVLwd9SbtiNa81LaPf4FOmXqZQ1zLzp8/6B+6pFBPQ
	TU1RnhYQw8Uq6e+LXMt7YFoo8jZrgK5q1OX1sr6zXFw/P6jasv9ncNG3fIWaciUHZNdYSICg7MC
	7T07Bs75pe/kQFCjI65EwLCh80E9CimtU+eqz73Fu9p4FCymeKWIaLgcPM+a6l5GZSNNhk0sjH2
	Xt4Bxj90rH58nGdQmXZvbHoT08bolcPG+yyK5UD0Y4uNOaHiV78/ixzFjizTmXvxLmKMEAhhB1f
	aeXvDb35eegiogh7EmRQP7W1xtjVbdQYFLz1BPTD2P2FEMbgHdXf0P+TtUknPlxHUvcV+qnOsdx
	3h7K6pAUFxQ8xBDaAkrJ4N9iXKruy2wFuGwRT5HK6wjrY41uYxAy0XAhE2dM185t9kog8kMphsL
	NV5DzVzvmbLk8uwy9LoMpTrGClyXjjMs9XSd/pQ8aAJCCnFdDOfBY88dSqnvjExUcaWIsN4+IeW
	/39D1k927AjsPRTnycwd1nBVeMiDpReIHSyvZimyFVbPsoaiPOXYUUmGEjNZrRb/bXUFyyio3Wk
	JWSYaZ46Iq6NiJNvWn6IQ82AQsnlk1UQku0FA/2z
X-Received: by 2002:a05:693c:6304:b0:36a:60f:3e9c with SMTP id 5a478bee46e88-36a420595aemr10215792eec.0.1793520582159;
        Sun, 01 Nov 2026 01:09:42 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:41 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: sound: add Everest ES7202
Date: Sun,  1 Nov 2026 16:09:25 +0800
Message-ID: <20261101080926.267041-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

