Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA9285C80
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703954; cv=none; b=XO+ssFlN0qlrotM0sEFHIZu4aL47j7ZZrStPTAMKNLiVD27p0ub9oQNAT0RBTkKFBMkgRFXl2VYZFIH6LxKWh8zPfrrmr539AITuBQeXHzLjOCrkO6lMzNVT8wY591Qq/gAUHUJ484Kk1HTMbjJfGxJxJQOKJv/fl9MGNTu4OeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703954; c=relaxed/simple;
	bh=hunFSs3zO/FdwbPTBz6ZDIaiUyPsRF5W3LVgIps/huI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDy63MzZ+H6MsDmi5BpcUPphM/vX+MPh62u9UzHuNiz55B6SxTaqrdEKEulnoFmjMo9SHm8lSwuleotV+7Zk9rWY/VXTX4hGC3/8F6P+cl/wrCsw1v7uT5RJamIVtAIXNReNhuwFnI4p2MjYD2vFIkdlIrzZ6ClbjZGISfcQB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ9tpRBx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ9tpRBx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b566859ecso1454033f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 21:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703950; x=1764308750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=YZ9tpRBxPk3xYfC/uz8B/RbJh0FsgodiAVKqDqbpSFgKo+uF4O4U29k+9SsFpALYqV
         NqWx+hIZ310vEF0LA6KThUwFI+V6/PfDPRgTM0qtzX793S8TPGB2uPic2jJx80lpSr4W
         xXbz1TWB1C+L9I6YLeGSSd3qBo7QMbnAvVg+zVOZE5KLYrAZDLv7BiedCl7M7Sklnhao
         VL9lqxR1k10S+c0EeRYT4wlgJ4ynp+qMCEdeYMKOJtfjeDjm/UCqQjh4hgLIJGDzkn0C
         d6NuBGadisT3G8A/6ykfg4VVqoLs4YHTZjIguyc3YR5+6X0y2EWUFq2ox5i01Ta44Yje
         eNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703950; x=1764308750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=dp+zHdIRK14mugugos7tIFxzT1I5vArU0Cxz6gfZ5hRc0UsPZlQCslGqo5c0KDY2YL
         rjoeubGUgO3PYzj947R8dlo72/e3xsWO+cMKBFJT05bAuh+Cx2fLGeyLJVONaRWTN7dY
         X5mYWaq4JJ1hT26yZ0ThWwXpaXaptOUyZTBVxU6s78e0DwxYdf58POD8hY+7/nOqSBAa
         GXbIpyITaMmo9968ImJIHfS5KQTtv0wAiX8cVQTKVwuqMJg7vEBwrY7lMsPHac0ek5cM
         kwn2aI2anAnaWuu99ICQ5Y5ivDURDb2JkBrGfu5s9iOIKllxFAhsnoP3I+QM/8HYN2yY
         d0fg==
X-Forwarded-Encrypted: i=1; AJvYcCXmuhK7h1dhiH7xRtcuH/VLzvSNHt7ZX8Suhss0LWLGiNx+XolRGV+Ij4S/YYoiBF1runprhZv32tnykw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxivZON692gRLRv1WRPIeo/C5xhO47Eb+d+eoZlsH/8Qmo3fxGu
	Qehffcgsd84A4zLRNxC4ZdhFv5zB/TMuh5Ly7y+hnEEXgYcuadiITZS/
X-Gm-Gg: ASbGncsQsjWas59fkTAj9Ghy3UnhT/dcOzf4Ji6Ei7up8L+qEaPzZ9l9E1T7ewJdXXo
	yDhN3LmZ/FssgFimixl5SjX+TGJHvpvgiOaTfIS7LQRQa6rFb1gYMCAkqPMpLa5u0ZJkEonlhts
	X/fTuzWobOhuM2SPoCt8aXPeYYiK5qjboJ72Dv3EeewD5zr22gSH8Y+CXy8cVu0oHP/ZstamE2k
	tnZXNe23AtB8Y5lshyh1KxNwcYEtCr9VhoBM4siWhLCF57fDwijTUrClCJLTxTxcLQRi9leO/Uu
	4v8T0pROtJWboIvt1tRobd3cKFyfVJ1NJH6rUbUhO3lnNHabuCgWUfg/h0/J/ATlDYJ5wvRyCEt
	+T9evGah8RGlkRJrHlrf5EM2ZWP4/vvwKSB36IQu0WhWYobcIio+zCbc0NMTxlxwmxP/fl111we
	xQdpgw86L9kFivMY9SRUO34jh6CAV9YQuU91WnL7BY
X-Google-Smtp-Source: AGHT+IFoDuD8ce0kyVu8f/bxfusUDj1z/44aLM0o3OmyBUjncNPkP8Va3UpOnWv9eDckk3QJdEc/AA==
X-Received: by 2002:a5d:64c3:0:b0:429:ccd7:9d94 with SMTP id ffacd0b85a97d-42cc1d217demr750615f8f.51.1763703950227;
        Thu, 20 Nov 2025 21:45:50 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:49 -0800 (PST)
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
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
Date: Fri, 21 Nov 2025 06:44:59 +0100
Message-ID: <20251121054537.25796-2-ansuelsmth@gmail.com>
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

Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.51.0

