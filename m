Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75C152DEB
	for <linux-sound@vger.kernel.org>; Wed,  5 Jun 2024 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717604455; cv=none; b=e2uolApGQupGUS9lZA50Ce3/MqLh0SROBXZNIF1Zh1CX16862/2a2e2CQQdKNe7oMJXD1rPnRaj2fFYeB5MbssMnTd56UCFKsi4OYOEE29yS6bf7+rHmj/2Z+INDPZyyctQlma2DvTiTv+xBvDAuqIoi8mjEsvqFMtX1O8TuA8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717604455; c=relaxed/simple;
	bh=BVB9g1nRXbxU1lO4q1xV+zm4LTA+/Q8NvRX9HKaO8Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hMvudMLkaZ8Jf0b5TvSUisEl3U7Nhhb2rOkRwt5ZbCQIh3jj2w0QSNNAHKgfDbX8fhzb3DZL80E3HYgh7v4XgLgxN7lLiNm68YlYVHXdEVT9Zcxc/snrZnJY56xrdRC2igMPAEgsvE+gnKUWaEj6Fe0KbivrHoTgvLbZ0BtQXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TapXZmpy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TapXZmpy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4213485697fso295425e9.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Jun 2024 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717604452; x=1718209252; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sDg7XH+sw4rtqqZOSPVcua8cTURLbRBu83cbcLYlcM=;
        b=TapXZmpy+YZpkk1j5NR8xjbV68eOmRrkKaZmj07jvM8/y6QKvftMXkQKeGUg0BbHoi
         CkYewsuzj9iADwNM+OElzqrrDfMOyBb5UMAp9gXQ50yM3uCWdR13S+1ps199aYeeu2EK
         RTA9ml8zbPVpkBeP08YDd88lAPulrOErAWxtZPVPrVRhPFx2DDUa19hwjNDOCSVx1J5Q
         tjzoCmzu2pkXTIYLRMJDGHO1KzOJXrnWUe2B7rvhVmWvKwNU3llkiO1RyH9zd3XpmuHL
         I3OJGWA6izBTlVF2w3vsq3+i7K8m9OUNE3e8kfNYZ90dDw0MzH9fRGgTS46w7Vxj27qR
         9YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717604452; x=1718209252;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sDg7XH+sw4rtqqZOSPVcua8cTURLbRBu83cbcLYlcM=;
        b=MopVURYRaLoOMI0zLay2q8vEjvE73jEiV8aAaeNs5cAu1jskjF/vjAtmXPk2zvvfPb
         B+RfQrWaJdSW6hjRM9wfSiyxATPi/zo5vEWGeyrFxcqz6OFWrE8qSia9ptCHZc+0PHwy
         nm+Fb6NkhrEazsi+8AVDBMslldoxUlwvyeexa6RmTEJOpDkDz4gsGXa2NQDysCNJDDYP
         1TVMpIBCK9g0tE++ixASd7YVRNZyqMtSwUVujAiNhkoNboVQAO8jSe0/xh7mZyDY/Jo5
         3sa67ePyIqH6h6Zzj1YF0hT18CktFLnqTiiOttC78oGnKUahwwJpxWQwWtgAeS/MzW0v
         yh3g==
X-Gm-Message-State: AOJu0YyzO/ki/kf/lgD6z/tZHopKTM+a8K6NQ6cF9hlL9yNrHDrYvxYr
	2AjZo3uFtkWQkpa9fSMZ+eM9aiTj0O7VXNdR73QGDg7HcqlJaasB/gv+P2nddzY=
X-Google-Smtp-Source: AGHT+IE6yOi8gqKoubeFSF5QOsNVzjvdV9WVKQEhRQutMQf4uGlI2l4PLnSNoOei/th7ig0Fl83STw==
X-Received: by 2002:adf:a15a:0:b0:351:d2e6:9296 with SMTP id ffacd0b85a97d-35e8eeff649mr2128140f8f.41.1717604451858;
        Wed, 05 Jun 2024 09:20:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9364sm15053643f8f.53.2024.06.05.09.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:20:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 18:20:50 +0200
Subject: [PATCH] ASoC: dt-binding: convert spdif-receiver.txt to dt-schema
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-amlogic-upstream-bindings-convert-spdif-receiver-v1-1-262465adbac2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGGQYGYC/x3NQQrDIBCF4auEWXfAShukVyldxHG0A42KY0Ih5
 O6Vrh7f5v0HKDdhhcd0QONdVEoeuF4moPeSE6OEYbDG3sxs7thLFcJl/ZQ0dqvaGy8reslBclK
 kknduHbUGidiYWIaRXLAx+Nk58jDOa+Mo33/4+TrPHwSdUmCIAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2021;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BVB9g1nRXbxU1lO4q1xV+zm4LTA+/Q8NvRX9HKaO8Dw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYJBi0Poo0A9N6RiOwA403jPcyu6z+kNZ/o9krTJy
 C7MM++2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmCQYgAKCRB33NvayMhJ0T03EA
 CXzdZk6QugZiahTLIlDl9oOe5Hnt/sU6YHMNDGawQwyIpCPltv8nBJlobK6/4T2asi4HpTAe9mtJ3h
 x8zYFiYz0qJ1BixHlUBwC+0EMWvXpdES+T5I2WxylAKcbWm70KivaVUonO0UH1itUAgU722Qijl6Qj
 FgKXz9CZAneOXZ25V4C25U+gbnQEVkobK/GtgWZGfaJypTrs+1+fXeKkGLxoDIMOaUSIPBwFI61BFZ
 0m4b3Mh+7+IkG+fGoHtP1K/2fI43/9VkWcRbbAKQaUmUGua7QS3TJPmo8xBYNZrHmtbIpPKC/t0FEQ
 fR+7IiMrVxotfwJ/yYfSqm7hNzq/6gbBssPqgcKT+LaehSG82e/Di7tM0259yY/IHgC3AXJR4M6j/G
 QUH0Wu62FTUFkOCooA93i+UZjanE7p+rUS67fai+Ozw7lg5uLHS5cXvh35v9JSF79x7YbAbNWCHQcp
 D2a28O/3GaI30cXw0kZpVR44IHAow9ez4a78tlwkJiJeiSuUlbdTxpHWWlkVI2jcdtO/o3fxAtLZNu
 yxTe44vncBIZw1MSpZJCLQ20LpsBxjr92pTIIkuIeBj2E7/1hXpZIqcFDamCdmC1dkOKb3wc21F9sG
 F9lY/VLzHBZvtRA6ZRyE1EXNi7tIgj0VhQDS8pothNljCckro+En+asOE6oA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Convert text bindings to dt-schema format for the Dummy SPDIF receiver

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/linux,spdif-dir.yaml | 37 ++++++++++++++++++++++
 .../devicetree/bindings/sound/spdif-receiver.txt   | 10 ------
 2 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/linux,spdif-dir.yaml b/Documentation/devicetree/bindings/sound/linux,spdif-dir.yaml
new file mode 100644
index 000000000000..ec8990c236f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/linux,spdif-dir.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/linux,spdif-dir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dummy SPDIF Receiver
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: linux,spdif-dir
+
+  "#sound-dai-cells":
+    const: 0
+
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+
+addirionalProperties: false
+
+examples:
+  - |
+    spdif-in {
+        #sound-dai-cells = <0>;
+        compatible = "linux,spdif-dir";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/spdif-receiver.txt b/Documentation/devicetree/bindings/sound/spdif-receiver.txt
deleted file mode 100644
index 80f807bf8a1d..000000000000
--- a/Documentation/devicetree/bindings/sound/spdif-receiver.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Device-Tree bindings for dummy spdif receiver
-
-Required properties:
-	- compatible: should be "linux,spdif-dir".
-
-Example node:
-
-	codec: spdif-receiver {
-		compatible = "linux,spdif-dir";
-	};

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-convert-spdif-receiver-c8d2fdb688cb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

