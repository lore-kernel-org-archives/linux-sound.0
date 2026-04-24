Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A330DD3C
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 21:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777064623; cv=none; b=qWaSOGnI9ZzpaJu2Bq1uJ7dj4FHCaEw3EeiEtIILufrq/It1CipC9uRHzTb0kc3yyw+wSiSJOzgs0MM+/6G/GAnIUXihoH4J4AXL10wYdOfG5q1Wrkgt3EtUmwVVzh5hmely/MSykrM/yNh7t3uCYtXMIamU44bnfLoUWqMTxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777064623; c=relaxed/simple;
	bh=I+fRfGmkPvPGaNpKDlxAfO1n69/Mhn9SKg60oFSvpVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+9GuuIa/WppEpWuLfBDwvIjgEv8ZC88dLrSheCjWE0XY5559t2YLGNn/ejylZhj4waw9ptbJX0JAJKexHpJWe068pdaEQ+NAmFPMtjRjdER/v0nvHs2YEfv+6WQpbRGKhia4+Brojyylk4rk8gdlaKWvMBiFg08rsz+WFqnF8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oojix8Sb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oojix8Sb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c795eacbeb0so3652760a12.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777064621; x=1777669421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=oojix8Sb92Cf0KCBHn4uUwenGtOknsq07fxHS7Z6MluR0PiahVudD+n3rn+432MMBg
         uY10qKBtdDadKTHY7w51eRU0s6KJrDgT5r6bovLWlfJpiUuysSFWkjyuNripXDZr0+Mx
         INC4xA/U+rF+MHNNYpEpfa5aM4qf70jEJQCepBtZPxRDIjOZi+BR23v+6Co/rw09DOuE
         rx5biBcSEJbaRqa/KCkkOKf4+8Z9YP42rcvebk+fcSkPQ0SAslQ/VBSzXtsCIHjSrpxa
         rd0G4Zheylb+M/ZWmpAiVEG9/uvVHnKR7RAPqBlGhXvyYg5BVkl1uZHKbdseaE51AmMK
         IrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064621; x=1777669421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=m4pUWEyQagJjOqboksZC0gpjnVjdkubuNWfhc6/91Q0PN243Z7MY11iGG/u9ZiW8pw
         9TFyqc4okIYBktQK/97V+GHtx8xc1ovDt2s3X3dpi3WdmRuz/NGxeE3T3zURcs63cY95
         hjvAmWEmXlWv/+rrtYV6uv9IQsPDobeK5YXKjuK4pdBIUsZ44zvaQzyUAgWqXQeuAft2
         cJSAIaSYKdAMp2X1TmCLOloOBeVA40z2wzB0fk6HKBhWDmueDsu4yJkh+qG3jTMZkOB8
         koPn6L5qC+xh9+jyAIru7YXsjgDvMnontr49B721BQl05MHd6Yn2e6DBpshrwltB5FQZ
         bBUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7kmDt0Oy9EoqgA5g9ZnkrDho6vxNuu4yMngqbn4oc5ixGJ4m7Nea0frbN+y6vfrWzSB01oH5He4Pl8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCdJca36RLstqxhp/DBb5VowHOxDZkAdSZPKT6K5sRnaP4Ad3
	8AfLbIJIvzetAu4iCuVR9KWW37T+IzsoV+52WHjq086IHPFj16iR52Ia
X-Gm-Gg: AeBDievUomQQsAPWaVpZZ5Q03R7uJSIbZi9MGG3quctPexYyZOUMktt/IR4g5Ix5Rl4
	uMF0XidKpk6BPVVPAIqxwhYjlFAUmS4IeGf09FgZ2FhrSTMRrh05tlb/YKHXCOQ32ZMsUbecR8G
	5AU0KwKp5Ditnl413DFSyYYV0+iaeKHtAdao609pYP9Ip+v/rFp040RhWBJaODNyx3JV2FDRMfJ
	FxcXPg3KPzgsyYJwhTqp4XaB3UQFXbzQVjIutxMLbtBy/KEPVHUwjZ9nIe+IDSJCDWH1ztlK6Et
	4zfpOKgF13JTNwWfnytCDZDSKuIHPxW6auAux9OKTNwnEYFACEzOyqG9tItC4dhEMlXwWmtJrhF
	3giazn0BgzwxPIQeEFY9QBrkhp3mR5a/yO5EHSkClWuUqNL1tixD2sB3eSfB/qcCp7LVV5whxiI
	Fljv7dzMd4UqGdLF9DMoTotWA63D32qjhgLgldC1176z9jfPegu5+TSXbNBoVNI8MSq9EP7wXeB
	51VZg==
X-Received: by 2002:a17:902:aa06:b0:2b4:6664:97d4 with SMTP id d9443c01a7336-2b5f9f83295mr238594565ad.24.1777064621178;
        Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm250554025ad.53.2026.04.24.14.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 14:03:40 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Fri, 24 Apr 2026 21:03:02 +0000
Message-ID: <20260424210302.39972-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert MediaTek MT6351 Audio CODEC bindings from text format to
YAML schema to enable dtbs_check validation.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 .../bindings/sound/mediatek,mt6351-sound.yaml | 32 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 ----------
 2 files changed, 32 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..f9fab8962325
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6351-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6351 Audio CODEC
+
+maintainers:
+  - KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+
+description:
+  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
+  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6351-sound
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6351.txt b/Documentation/devicetree/bindings/sound/mt6351.txt
deleted file mode 100644
index 7fb2cb99245e..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6351.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Mediatek MT6351 Audio Codec
-
-The communication between MT6351 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible : "mediatek,mt6351-sound".
-
-Example:
-
-mt6351_snd {
-	compatible = "mediatek,mt6351-sound";
-};
-- 
2.43.0

