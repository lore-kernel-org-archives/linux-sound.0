Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2E4F6461
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858303; cv=none; b=qQCqUO+NMHtnpsoTQZCtIVS8dddmaPBNPn9DxF1CC5E5zrNkMgDqEpFuqBTECtbe16x/Z3Yxq9xIMr9D5y1DvipRXBhIioSlShlG4AhWKdndIJXrx6C1hokiE8+SV5bAuAQiyTukbakUC81was1vpEe4UWGAQy1lgXrMe5xchuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858303; c=relaxed/simple;
	bh=cOTndiYvXLFAAAM2y9Xe4uyBomgWf+BKu0APrUCfPAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i45XIRMxRFJp9r6nCMga4NROppTG++Y81vj7AedCrsI0E6krVv6ZevtQySo68jWvenO1yGnAcNzKnDgiWPZ7Y1qFsMcSSybVuVYPnjp/pXvQT8pR0gFJYhWMXsG1SMGImJiuGmkbxSp9RHep3yLt5zATm94QLQS0STr88++KvH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmeO8JYt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmeO8JYt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso4700698a12.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858300; x=1789463100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=gmeO8JYtiOFIvUQvVhLHW5TNfGLV7PEyoufi7jtp1HSOyPoiHYMsEiwvVdjfqzrisk
         KcEtGO/mtcpZpVFLIm+4gLOWkWFN+eCDnMI8eM3nfw7vYfwE35ktMQiYmM2wzcbbKPVs
         IRdQeLuwUinia3l/8m1V8f8imtvp4/FvBsi2idDXVkczA/xn6bMynj41tj1s17LELv6/
         yUVVnFUvT1jWwb/LNNiZoNHnFlhXMWQ9+ZgzUn+fABMhKcVbjFPPB91rmawSaK5CdEVd
         MUfl6RaOB4+6q5KKR3HLRmT+qKUj/T6PaMi82ELZix5VqcAO8PJeDHI18uFEg3/GM9kk
         GLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858300; x=1789463100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=J+Q0/gzXgC5UEHTRm+1Gc98kVQ2S80L6QBpMRAILPtIlZT8XlJwOq859tOLkvFTez0
         yykhBhmL6+WX405Do9K97p7LxZKpQZ3IHBWSqEk90+YCkv2YwSyvRUhnmYd6/3eGZzp8
         JbSmly/KXZQXWCV7GrcCAQdKSkzcx/7aKCHe+LRh1YoA3Smvq8gvC5jIrMkUP7iQ6Rrb
         RbrgvfzoFf1clhDFqWbJ/oFSjRtDL2JBVwkioAAWnGVg5aJfA1ZJNgoUH3OmcXhHE9NG
         GQ4ylgOvdHbt0TRFNNf1yGGND6NuCrtK+NA92tC2jl+ZY9xq2KYXmDFO25oXAPJPr2xD
         pFDw==
X-Forwarded-Encrypted: i=1; AKwUvBwkUAU7W0/Tahdw/XGKVxAeSU01M1eO4VuN9jJOLNo1XvP7Xg4sd5TqJjFMrwxLokjMKtMy6OZDG6NOtA==@vger.kernel.org
X-Gm-Message-State: AFuF++l4EL9X1NPa4rKUE8p+eHISlqI+o9avXFjanEHgtLkvkGX4+iUQ
	QUczEVqVNyW3yjHlY5TUQZbcOLJz4jemfWnXOvHqFiS524SL9iJ2X3iv
X-Gm-Gg: AYBFou3Z39yh2ugajb6Zyao8xfLS/z/04MnJwJ5YGUA1KHrgAn1yL7D6p4s2h58eRvp
	mKHsXZvakb20hIsGwRsni2Wt+O6lS6iik1h8bD6lA1MgieIXMQxDI4oc2HccVl3vHEoPBmU3thn
	whO5/Lwmo4SIyOlo2iDoeKuWrbEA2riQoptGuDpbKXzzRDz7Om/s5mcTt17iCTQjnMwFnMXfR+X
	ceGeWMiiEZF8V08BPkN8NWfeoW3VbcLYcIlXCY7tYNgB2S+ybSLFdMxrOsfJTEUl34zRvDJF+fu
	+b0XFs7C950dE3GjowaQZHSIFAxvIQibkrsimUaqNWjHHVlFlq777kucHksSijErVDR5cTZqNFd
	icjbW8Hu80dD8Bzk+6PGb/QRKCQ+roSuqzdrJbu/zp78synURv//B/2m1nQbkP9k8VPQBWWdNI8
	64BcYc6PPlTkn0pxV7oXPthd/oEqscvRj0p8qOVAozJy+m4PCcigeF5lwK9ho4voAl/Rqeofwes
	jkZNmA1sL7LwjDc4SnSx0s8CoZcDKUtAl1gY81vRKV/9NFpnSji
X-Received: by 2002:a05:6402:3554:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6a7e8d4d131mr18523650a12.6.1788858299489;
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Tue,  8 Sep 2026 11:04:44 +0200
Message-ID: <20260908090448.3332-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0

