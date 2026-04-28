Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA753B27C1
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396622; cv=none; b=LN4aspECgV2p0IOCnqQKP8Y8DLia0dAlAOuWBmQ0LLsybopHKHikxuvgVoX5gTv2AEbE3SO8xLSmL4OaCUiXPhTDjDaSHLjg8q5iVrtNQDMoaTEPFRlLm44rpxFvEccexfjqbwqLTMl/8EWDXA0GJivazqE2lTupwwqwvgrq6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396622; c=relaxed/simple;
	bh=p41M+koMx91lPJmBjuCWC+58XSTPcrB9gBbog3CHX6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaSsBt3Te0tZz8Sok+FMEIlAkBqbyblVSbyUCCA+jrC7J3gGYO/2XfhPjgw9mZ8vPg+qvH/k+mNK9VxBrHab12L06syGVppi2NwS51zeqJ/nwUR7kd+gBGH3jB8KeCzyR+ArId0SvhXYDOYk94HQzViWPZxHYNfm3v1pwZB6JZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0TlOuqL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0TlOuqL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8318293f02bso34187b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777396619; x=1778001419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=B0TlOuqLH3gPl5Yf7ejA6MZshJroZrueDVOqBl/yGEv5Rerlc5IdovfUuA94/HcRIQ
         zBJfWsqfkQ7HJgZNVHY7Fw16IF7OfOE1IJUnnimYGsZnM/z/fr+O1Nq3sX6nzetH75aH
         Z0Z9j0CmipBVSwmyhx+OdDIMJwiyqNnXdcPsgOeHFgtszKNhgHdgSidkcSOfqNAdfU5t
         5nnNBLG8fl3Vn2RAMrLcN51ri7ihXm+wxKuJz2jtsncmYhwQBY0gjwELHJ5FURnZc53O
         3uQEX5+KozoygMMtGpLdGngoINLlR5juU7ABt3XHCGM9vwaqEm/ftYoZN4S8H8V5T9Y7
         wLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396619; x=1778001419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=dH+g1OGZLqQfyrzpE39QnGRk+wo2/xDkNsBp3f4wdOup6rgT6QP+52fE11UlXs9pfj
         ZPMsWouyVIIqoIrFjNnOeKCUTeXzSUfU9rTove6mPUKJrDIqlIGV7TvCnTkATVj+0j3A
         bQNnr61tDlW2udTGzQLKF8MZa9hfFaxLYLHtr1h7oyDKBq2HMGQmKURTthzuD90O30Yc
         MiH0oMJ8yAK+ZiCZ2vEadrH2ZOe/5iwL/b4Fq0zryfuJlITgLPPO5QT4p2UNk7ecwDig
         27oZ1pUo91s4cTL7ROFwo3n10gdHvYgEve8hxLs1+YQ9bYeljfjzzTe7/2/6NrLaIlLb
         jf+g==
X-Forwarded-Encrypted: i=1; AFNElJ8TZ1J/MPJFh/m94MB0sx86Ehbf68hnUkRT59Q33MtqMscyUb3aue+GOjj/SmamUMy/fCroKjBhQ2HWVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IwmV5nKUbLQrcI6R4lJ0nddTqP88+EuWz5VnvNbdwo+OD8aT
	dsmQafaTWV7kOIO0p64LEXlBNM++5EtNTwXBnnbVw4gt8lAVNci4XT8A
X-Gm-Gg: AeBDietA8EO9hiyq0C19MblWo2l941lB2w91A+tqANR1B21PuxKG5Jn/wD8dCr2EQip
	fX4CvdkgB3dxVc8+9tcEjpJXJ/yRDGbOAx4qxawDlf4whC0o4nZwj9ZvKPfwnOJ6fPIg5mI4osz
	zcdKPG2CdcHzuJsZqaSFOU1Pi1m2qOx8sIfTwTwS7OgxbSOwcpj+qYW12dfRgEJb58gw2e3Z+E+
	zFd84hJp4Xozbf3i5JzqHh/bO7xJoekUKqfolf+LlSiDzFU819201MzRjb4uqGgGaEDl0xYrCFc
	HbkfqYiHS7T4nOv4kXhjOrXS1rQs/pQoqdY3yqiYe+mAsCx8nJEETQsLpSXhFboWVAHPnKDGV49
	Cl5SllJ/sqy2+42Sr+kDDAtfGJqZ/B7DcM+iYXbGPTMN4qFEqQ+0QexUpTtFjWad27I9Md/n+PI
	X/NPARS+lie5ITlI+ZY0FiMeoQ9HzXgJ1EfpcY//ZqSd3wADjHQYBmbi5oAMvGsJ530btjPD0mO
	ACxww==
X-Received: by 2002:a05:6a00:4fcf:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834dcb99cafmr3645484b3a.13.1777396618489;
        Tue, 28 Apr 2026 10:16:58 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2226bsm3370743b3a.18.2026.04.28.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:16:57 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Tue, 28 Apr 2026 17:16:44 +0000
Message-ID: <20260428171644.5703-1-manishbaing2789@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
  - Switch to unevaluatedProperties.
  - Add missing #sound-dai-cells to properties and required list.
  - Update example to include #sound-dai-cells.

 .../bindings/sound/mediatek,mt6351-sound.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..b422e238b512
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,37 @@
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
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+       #sound-dai-cells = <0>;
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

