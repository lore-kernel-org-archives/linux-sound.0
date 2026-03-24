Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C73EF0D4
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360527; cv=none; b=Rq9gDRQJRGfOBAbcQijmOX1AzHw7RrjtmsLMTD0SD/gtPi5L0YYCn5tsh2exr/vnGTqvMDV1LRXk2N1Wz+iNP+qbKTq9BgVf45rsnsSWPoMMGkHaNAcsO5YbmT3lHkUA9X1YnDbHvnNWmIjM/scYZZCHjHxeJo4IMIe6K5HVozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360527; c=relaxed/simple;
	bh=JF+hD7uCs0un0E/9brqmLAixz5oU4oCoZbqipq3PBp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNXZ6nF16OmsH5zYNDc2ji02Z8b/pD98EAL5I9LvsJv0ZUwgZi7pG6RFjMEO6s5vEvnwgxpWqBXjijfC9c9rPBNcxkYZyBVHTpUma/kmETKfN6FdNXcDs+vKXqQwNuQv7WlAbfiq6QyYelbrHEwMSGTDDxA3V7TOEZ1nvtb9Ams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwpmAy4l; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwpmAy4l"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56cd71a7630so1710570e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774360525; x=1774965325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=HwpmAy4lhlxxi5tsNZSHSxMAgG7S6w2bkrci8tErrzeDmyks7UEHdr1Q3ggKMhC565
         JvGwDPYyDjk/gwj3ZpO4eZEZY+vNJngRfCQ1Y8hJy94jXxUVlwGhV1F9y2jQ/aGwgm5s
         LVCnN5umKU+90N8KsQCzl7VWWXmiWUJYwrynd5upN91ArVSYAzUZ8xnrGiLMhWOQqGsm
         sLnK3B4h54iGiDjob/jX49GZcfPnrRPgx2nCPRe2KAmwYZ41xpLBwZdHf/y1dtqEmlpo
         elyb5VPSo3dx3464pmN+u8xBlkZD2xI279UMSOVuR+DREt50iu37kBgSYLpGhvYRU1ab
         vnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774360525; x=1774965325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nh37Pt3GbzjBTjgr+edrZlsjGKmow/H+jwHdw9iYPc=;
        b=U2DwxcbZDH8qIRrOpd8bIP6hzt0o9knFKDevw3wjBBzexviZ49HyscqWmFPaXNaosI
         736mvKhxyfd6ODGU1u76es+d1MTbkPO5evNGbxSXAxOrvXk6WPjBzd+JqfAL8TI02D/k
         QKhWZEuT6eA5kI454KXaZfdaiOUs9NtQpcsmPzoIhqyjQYLOw4znBe2X2aSCmbcOUoyP
         FtbdghR0hv9tm9sjipOzYXX9n07LLC4D59t2oaKpuFSspLIf8TkSHEwQdQczMSjqXYOb
         tKueZU+NIidSZ7PfZ0ZYZh2UkVg/gR5RM//1jI8JYwVEPQvsztbezbQh5tJQ21rSIaCE
         IIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7fgsnAXc0LsX+Pl0+D11eBzX1QmVv64NS148wB7soCj5saEvzDyXJs6raG+H4NDj8NjQNqzQwzYqaJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50HtZuOBfCAi0RHDl8VXsdKPpv7gS4SXQq7ncGuwqrg8jK/bv
	cMUkas9Y6MlAaeDMf/yiv6G/uNX/g9zvf1ZZC3K/xRDc/tWRRVkfq7X3
X-Gm-Gg: ATEYQzzgXGB0vPUyQMyoZMcZ2YxV6OwBBj9vilSg67gQGzeGndy/ncTRAqEFoanFf6y
	Wk69sosOshP4A++JlzNXTG5FULudm8PAeYYCYaQlSnKzOS5qCXNI2Uc+QLr4sBf5Thj4HOlicuf
	wJZN/TCIS/UySkN8LAPRRfuUZygNgtiATLFJNF5A4ursMU+qb7C1BTM1xoazr9brxZthIBCDT76
	dwZ2lzjZrd0DpNFRT8kd+t0AuOxoZgmX/RCIsOe9iXaC2lIHEMA7hpNoFSWlB0ahO7rkk3v/D18
	NSVlMPMaqhCTjVXHITtuchavt08JToaqLndR+0GBIHklWAFPXkXZXpMq2t2GE9zb7iF26bq6yks
	fM09QdHhkPiF0oPrBaMPscUjnrfgLHqYx9eHfDWM/IzVeaVvd9wenVacpvTAbIUu88atdf94kv1
	7AdsWZR4xgtKpHxw8id8x42LsGiOI9aCqcJL+5ai/X1OZ3HFNIy3qN2bU1WhwVmhdjTGvmHg==
X-Received: by 2002:a05:6122:3a0e:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-56cde35a597mr7936243e0c.5.1774360524552;
        Tue, 24 Mar 2026 06:55:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:91c4:cdb6:8a02:47ca:2dca])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f882sm15529418e0c.9.2026.03.24.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:55:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml
Date: Tue, 24 Mar 2026 10:55:08 -0300
Message-ID: <20260324135508.839142-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rockchip-max98090.txt to yaml to allow dt-schema validation.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../rockchip,rockchip-audio-max98090.yaml     | 59 +++++++++++++++++++
 .../bindings/sound/rockchip-max98090.txt      | 42 -------------
 2 files changed, 59 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-max98090.txt

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
new file mode 100644
index 000000000000..5630652aa4c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rockchip-audio-max98090.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip audio complex with MAX98090 codec
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+properties:
+  compatible:
+    const: rockchip,rockchip-audio-max98090
+
+  rockchip,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  rockchip,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Rockchip I2S controller.
+
+  rockchip,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the MAX98090 audio codec.
+
+  rockchip,headset-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the external chip for jack detection.
+
+  rockchip,hdmi-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the HDMI device for HDMI codec.
+
+required:
+  - compatible
+  - rockchip,model
+  - rockchip,i2s-controller
+
+allOf:
+  - if:
+      required:
+        - rockchip,audio-codec
+    then:
+      required:
+        - rockchip,headset-codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "rockchip,rockchip-audio-max98090";
+        rockchip,model = "ROCKCHIP-I2S";
+        rockchip,i2s-controller = <&i2s>;
+        rockchip,audio-codec = <&max98090>;
+        rockchip,headset-codec = <&headsetcodec>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt b/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
deleted file mode 100644
index e9c58b204399..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip-max98090.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-ROCKCHIP with MAX98090 CODEC
-
-Required properties:
-- compatible: "rockchip,rockchip-audio-max98090"
-- rockchip,model: The user-visible name of this sound complex
-- rockchip,i2s-controller: The phandle of the Rockchip I2S controller that's
-  connected to the CODEC
-
-Optional properties:
-- rockchip,audio-codec: The phandle of the MAX98090 audio codec.
-- rockchip,headset-codec: The phandle of Ext chip for jack detection. This is
-                          required if there is rockchip,audio-codec.
-- rockchip,hdmi-codec: The phandle of HDMI device for HDMI codec.
-
-Example:
-
-/* For max98090-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-};
-
-/* For HDMI-only board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-
-/* For max98090 plus HDMI board. */
-sound {
-	compatible = "rockchip,rockchip-audio-max98090";
-	rockchip,model = "ROCKCHIP-I2S";
-	rockchip,i2s-controller = <&i2s>;
-	rockchip,audio-codec = <&max98090>;
-	rockchip,headset-codec = <&headsetcodec>;
-	rockchip,hdmi-codec = <&hdmi>;
-};
-- 
2.43.0

