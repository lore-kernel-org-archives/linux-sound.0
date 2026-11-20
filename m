Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218410;
	b=TQi1P66P+p0UQW6uarAwkKOs23EroGiQVLJV2B5TAJBUUA9I6OpKqfGXcwJHy5CXR7zM
	 B+Rj94YjoB/LQbtwn4I/OoCVxDGsQQH+xe0ZX4ULhG73Zk9KWblfQKMF1qtDnr7PdbG6v
	 J9qqqg5TPR440Qc80ME0+ik66kG4dsmK7hg6fgGtDrCJmpM2A+Pb9wFov7ZnIRYbHxPaG
	 /CwjponqISZkhs1cZhtMB1oWfvWcXOxemo9WvaudKH8Wsi5nWoaaNDxeICfh6GmGTLk4n
	 IE9pnW2pWkA75bXXXrovXGcdVN05CFn4miNdPS1CXAO021yrygqIS3QszQIpu+KH6HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=Wu+q/byjdaC3Jz57xRCBhXVWFrK3bUhZvNXKdw31iY4vzzloAXCoZg2yZV7tx4gQvvoE
	 yzePv2BdKl1ISdRy1D2FoPcwUhOP4K2D6oC3AL5I6nKJlgyLTbVuM1ygxxu92ZSaOujKl
	 QC/0zVnybaqAIo2yVcm0NFxhYuoy7YoYY7lM3qMqqw5yqgJTaiAvCMHE+QGkshyrdvlAX
	 zOxPsmBI3OXOhTw+suFQDLawF+QAIkeNRphe2Wza8bObI6x1efLBMAwRGwBn2JK4SgO3R
	 zH30ynKimcmPwaZRY4pP+MViJR9JMBOB4DpwccMC2dmY/Np8jLC4W0ETRP6sHwYIn3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F73606A68E
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 23:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F73606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN5S5ecA
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so718944f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 15:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218407; x=1795823207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=RN5S5ecAP6fgoHNRTGtbgcKstEbdj0ZpOtWHtVFDE1jtFCG/UafmMRolKfWxtWyu+3
         ez5I2ju3UlLagFqrQPoZR0Gtj6dYJec4c2NPi++cCtx4fMgNNvlWtZ62CoQ+Ca+CKO0M
         CfL7sNLW/LIQQ11JSb7IhugpRFZz5sDQo/TQkLKJc6hmITxxht9hYWZD8QXmBSjOxon/
         +Oa99VNOa1yRRqeENqHaMkW6+rhzjui/ndqpfQZ6HqBT/XO6MBkLgJXIDi68mLWK3axb
         JCeKh/9jyOFFp8i1GVBch0JtducqIQJDaWKJaEqjaW+NmXEvH6fE7w6BHhka/Vi0TBFb
         zVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218407; x=1795823207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=Ol08qCKvw+Se4KPbBxjk83QBbz1yuMAMt84Ou9wvJxaYvz2+Z2AKmQt14Fzl/dHEH5
         hAWTRGb2wKz5KrIpwH+MVFWWqISoWvU8hy4OreGZcarVhGerAjM2cSabt1HHf3Eys/j/
         8WlIamY4HGenyhrKZuzgVeQCUrGOOZ4TuSXVZX8fgup45Dp9byIul7LzxgPYxx8FVumE
         zi2yPc2KZnuPRyyjXZCvXGOJqPIp0NR1E+Znv9VShCAgwYsPxnXHPBDzHw6I/UkLXbja
         THadBSsbuBsiPPeJ7COGaFLVfy4uBCAxyBUrOMkn3IFjBYW8uHwoEdaOxEbq/tTyunCa
         hA9Q==
X-Forwarded-Encrypted: i=1; AL+hErH2bMqTCIsMzTByvbib7Y8voDvzXWr0qC5jP0hZ+57DShK6c/sbwFIZyAw2aLB2NEbXAWnG4k9ygNb9TA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JXu9LlE3pGb62A+5CYx6JjL1PY1NmA4nUz5MeMVDsjKlxkXv4
	XX6PNP4P5ygR8t94Czh3/KMaJ4TYyLAjA5Y4iiixtrJz7xkrGjxS2ChF
X-Gm-Gg: AZFdTZc8b++kPAHMoLccaIqZ+SfBjOsci+6rXPZxa3fu9XB0vrD0axUuCs5pCKw2E7R
	hiCrdBl4wR11UUh7B9a8GPtyJTV0Lp27TjUx5WqrHpoMgZskwpVb+oyXytrDgyAaRGnynry2jV1
	PaZM2X81k/mT4CFA5zbdhEHpol2I5xA/aiRjImvn0neHrtRiLjzAy4o/8Mrv78/j288AJRjE2/D
	WRsCNe4mbJ1hfc/XlkLkmDuoq8cz30JkoyYU2JZoFS9xs4ztEo4mjzoOamf8mzLLfB6jWHlt+GC
	qVgl3TCOt/HPAko6usXqTJ1vfYlVS2P8wBtHHS950u9v/+nbaIQbFtDhO9AiIyP6yU+zC1tQEb7
	55RzOvcfLgTD/1A982WWe8nIrGg6unaqzXllNanYbcnbZ5DKC61K7MBa6qNRc1LYD3quvHv/idU
	TaT36Ijnstjk3rDHcLdJUBbl9qgDPB6SxFHJzoP40w/9AvennSKxgLc2/rWmw0EtFqfq6ZhvO3T
	9T82jEC3xR7Gf+ZBmAu3ypMDtRP7T9HzusUAXegoBDn3DdCKlivWE26zSGCZHSgNWEt09uo5hWv
	Wbgf3RIjUQRyUeTWDLh+kqYEmd58zAurVjxkhaPVpSbuIx2tYaMTtyKiJwRXcxpPaM7dqjQkjKg
	EH0ZUPkgCduBdsL6tlCzF+JaQkCgon9Sa6vbdTO+b0OIGuseIFo7lLA==
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr9359436f8f.32.1795218406845;
        Fri, 20 Nov 2026 15:46:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Sat, 21 Nov 2026 00:46:38 +0100
Message-ID: <20261120234640.169279-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120234640.169279-1-ansuelsmth@gmail.com>
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

