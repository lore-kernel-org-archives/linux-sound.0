Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980A2E8E09
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703957; cv=none; b=G8LOPwWRJ8xSIRnZZ1YDPGs5H+R7gHx7CZkdVwrQSdpvVdgqXgX2qkvVuyFPVJ1wtW9hFRfbHUxcBv2SyFFP8weUBxlJ8ImY+jzooTlJIPXRZC6hbjRIQLKTLEWFT5r33mO+nX7oD7jDW3zfkmNeGPBebPSDOqLdzQkHmiFxXtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703957; c=relaxed/simple;
	bh=xZAMMTzqv3xW7C+UMRhWcflE3oJn9Xg5Wy7C+qUtd+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sG/x8O3LiS0MJe/LfGNWCfLgtvRhTan39++gaPQQhkIcjQCiGZ1eAdDjZ/q8Q5OtQRpNr8bTbauQqDTOB/5w9O6LNngoxxv6rqxHTldgFibdapd6OAaa3qeS5/TePIF6rhzmAx6NZB9oqPBA4KgMYLqXf7jp58vxUqiUEIKQtTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgo/YGpA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgo/YGpA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32a5494dso915754f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703953; x=1764308753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=bgo/YGpAqHaRZp0u4pwOgySD0z8MeEEcFgOSHVserojXZmq3GaN3WJQj3zT6HZC78H
         GKNgVBPxX4ERISMbC1AmWwXrSib+uz+OZWxRq61RQ+z85cHEl/j+82dIHOhjZG0vpvwx
         S6a6yZDc2WU2Tgiz/JP0lM/OptC7aH43xEegz4A+z5aXw558zOmWMCmBvg99r/ky/MvO
         35ejZD9j0EZIZeLq8h59ZJUNCxXx40X6gZaLjzC5N0aLUbpFvyz1YDBjnUlosrjqIWNG
         RpHG0YVMajvUSnwGrF3y8HFxrheHPy/xVy6auv7CFntvXTZBzYHBbtHVIJdPX84F8U1Y
         j3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703953; x=1764308753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=HVT1DOVqMjoz1sL5xdEY58FdraBm7X/GgQMTRUGdYsHWlbltOJkKU5G27jWEp7hRRl
         nl/PLE5QyTUcioQRvOdm2eh3MYdXRmXAYChwm97F3X8D9CD+fehNAln+HHFb9KQsIi+m
         jiUEXVnpTR76k8r1GLq6WkHRmGQp/8TM3agtR2jOLq4Q1twv2blhJGwfy5+hNfZiORji
         63ILOG5qzQmYcvuG5XaV1IbeT6fcD+7elT0wMHenwP5cPiZk9T6M0xe9nTep1YO1puVQ
         DGF5ue1jpL+IbZPL2WW9ZJRyk5kF8bwSjneOCg71l/3+QW+5ugK34AALzEbi5iKDNpAI
         suUw==
X-Forwarded-Encrypted: i=1; AJvYcCXsfvwyKbNpB+Th8NJcU/hmLVpkGBstgAyLhQbj/2T4zLyet2YlbDMxHOm6g7JYcZFSqnBNuAzy+qjhGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuiba1au6sixMRMkoClC2qwPpu4cWK6ojQy5ziBxb0xXSYQM7V
	uPb/11aje/wMu1/hjPcTDTAoJNNdFxNbpKPvdPvNMfOBCN0J2oyint2M
X-Gm-Gg: ASbGnct4qr9z6YaRDXu4t8uEQikyxYh1x3oFtP4LipFl1KY+ma/a5Qj8gAi9zM0yn5k
	wUxt6WboRUjQfkDy5TJ5+kJrYqJvLHWl+UO2+iZHj2mY6yz7sRfy1g9pKjA90tPqYEXL+Tn/5Vz
	5yPl5TS1eS828rG93V+xjNfpIo4gEaL33ipePfDDvxKvR71ca65Dy7/G2qaQ+dpF87cyPmpP6YI
	CTeAUXGQfhHxSomxNwxPz0ZcpxmV/P9mhZBHpWZziMP1XIlb9BzH6XQd9eRh6B4Pdhe70kXeH49
	nHXrQ3NNFTVPpmujYlLqVLbM78ekn5xxoSm9bt2kWGtnSrLTXb5ftOX3lJ+wz5+Qe4BbZego3lr
	lS92n0GDQg6srAHQrZpZP/CyoLyibk5tZVJ+xfL6usH2+UmG/4x1zJqRSwqnC98Lcqh7hpdm6EK
	M8Jf1d64ePSXosfJynq4peaywQQQPn22zHfJEvI7Ya
X-Google-Smtp-Source: AGHT+IFunXnBzaIJ7qrKtAE6gbgBrOFa4VRfMkp6LkyD/4SrkyXjB7CJEnJPFtNdz/EbfuiOOJHk4g==
X-Received: by 2002:a05:6000:22c9:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42cc1d62479mr735235f8f.56.1763703952714;
        Thu, 20 Nov 2025 21:45:52 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:51 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Date: Fri, 21 Nov 2025 06:45:00 +0100
Message-ID: <20251121054537.25796-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121054537.25796-1-ansuelsmth@gmail.com>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 AFE YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..ebeda0876280
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,67 @@
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
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of AN7581 platform.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of wm8960 codec.
+        maxItems: 1
+    required:
+      - sound-dai
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
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
+
+...
-- 
2.51.0

