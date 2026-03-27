Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C131E3E3C47
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619261; cv=none; b=DraG0er5APqSclkyDosTge/Wr/h8EgvVk6Mh1wXoLlE0J3WK0XCZGa6Qc1MF+A1ISCpsPfK+QNFhubrQe/+KeKlRVYI/88h8zQFnPyDLn7pTkjF5tFidpr24aB5M4VxbDaK2Fa7s06cqBORf+R4sIl/E6oEkduAL2lynCxi8Bkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619261; c=relaxed/simple;
	bh=ETu1mxBwykyQb7lRYZO43uSaHPXnM7oaVSiLyiX3Y2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UX5ev0w94UCVmmdjkT+wZ0G4GqAvyiYrlwnrruMawOc8iGf3rUIDXddQsF7hxApntXTO0qCg1LQAQwJVpHtmh1CVROAlaMcS1H9GSsvni0hUHja39HT8M/3ytU3kF344sPEB3+6ceeFg4GHHY6zqEYEe6MNm0CrM1LM23/vaazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Fqpupp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Fqpupp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2addb31945aso17091675ad.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774619258; x=1775224058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=E9FqpuppDELxNj/zMCzvlADh1wvR3xYIA64/67FvjS3NO+c7tfsqbqijznQIV+4ReJ
         IoAQ3QTQOm+LXr1S8au/U+IkjNFm+f4u2uxSC9KDHD2MeU590SU8oDD9JvtBJy9etXgi
         +bZkU/E1wP90VFpmf4gQ9IgEmfLhvdonwaFRDjm4UmACazNbExWwDtHbAv6H0mPuioSM
         jqxXKRhfMlGUkmmYuRbh6VNq4162uebVdtmKtPMvlKV0eK/Vld7ySFA9XaZaSTxeYfsH
         XrJrdgr9rH5ZQN+YDdyLgSifJYZ0PIBlYv5C6IG1mSVcuJhWvFM6XNsUtSv1UEOE/EWy
         F2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619258; x=1775224058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=jANU0I0R00AF6dlNac09Cs82lvyN787ODFalt9OcWhgILeAHDDMNiBHNAg0c19K6IA
         r0nf7OMhCwcg6m1CLrG7DU5+ipz7k5pAnbS1NL1oUYaMK1cB7fYiYbdN5rBqbUeO0BiS
         PDy0mohF7rxS1Qh8nuhTp7YoSaFJKJ4kXmkR3/Ra8A64ZThMrTpaVFMRNm8ZRBHBAbfk
         49R3IlwQpi98cyGaS98kT8IyAesA/lfXSdAqufGW/Al/vLAb3JSLiXeZIoArOb8+kQro
         0QsjICoviqtopTDfWl+f0U6/w1q/ttKuoWFLxtzDI+a2eeempWZ/DzpzEvt/1u023Kqk
         s2wA==
X-Forwarded-Encrypted: i=1; AJvYcCVjYj23CtPj9XG6fBC0T3wSrOLxaKNOfOxVC7RBy/mKk1ElrRURZitjqSm83JLNRo35039P7EvbSUmQXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGOYqFIsc/WXeSQtE7UWSAxgHj4rKVbxxlq74KtBD8W0o2pHYb
	sVoD0zMp2Bo8FQ1B5FGjdVJd09f9TUyVcKSqwHnP32xy5s7/YzAzj25O
X-Gm-Gg: ATEYQzy5RP0pL0vJD5rHx4TMGQ6n6bXiPxSWMa7fBJqMS8FmHLcqD8DRVxd9c0YBw75
	i3lqPRLLj23Pjywa+aSJ3r2/BJHueUc/ItynxW5heq2o8kTuSC6NtcjAhKOlLAXvu5fkLrOphK5
	8i87W+0icrCchmjfmf90WCDml4Rr9QkhvBfxqKHf1mdzzKme5lO/jgc7rGEPp+Ra8ZYwuhrmp0R
	uHayUJt21o73cCfvvdAJLwbgto2mGf5Yj6WiPsgBcLdEBMySZRoLLTgPNr1j8RxbzjFSXZ/cQ0L
	ayduyEpA46rvGoerWdRkFMdX8+lzzi0Ucv/z6PTvrl8qfuX7D2KZnVvG9DnlKdnDToh2RyTVpkf
	9WkzbwHd8dxMhLqhpJCcwXyn8fhV5cU7vFwgAIhGPgIxOp8b8iBMUNti+Trm/goaJ5TMF5eR5F/
	ahdwNcaOPt+ToWD9Kny24Hz2oo5F6U
X-Received: by 2002:a17:903:8cb:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2b0cdd0555emr28331695ad.46.1774619257719;
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
Received: from snowman ([2401:4900:614d:8cb4:a69f:d838:ad5c:7358])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm62403545ad.16.2026.03.27.06.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Fri, 27 Mar 2026 19:16:49 +0530
Message-ID: <20260327134649.31376-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Used two separate entries for two phandles.
- corrected positioning of additionalProperties.
- Fixed commit message to match subsystem.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..ed698c9ff42b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650>, <&rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0

