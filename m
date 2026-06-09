Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A632B12D
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968698; cv=none; b=U0M6bGLrvDkJ4lF85iqxGXNJjyvQ3cPzPGWq4aTg2nxD8yNtFob2ZDf6XGioS9nKTOmcZ+8qB27BEmgt07nePzoqAyvl6G6IBODaBpyXGWq6jYShXZG9LaAQn1jSPteDb93bab1bt8KQl/iacaEycBgJSHUz1pISeqTZV6bpoqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968698; c=relaxed/simple;
	bh=wrpwFKkIZo/+BJHnbehZY+5qtwnBH5pbVivYfsnCCkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDKy5jVeKQDC9JybOR16iXwXE9KPgMpJsUW/zqQ7CXKdRUED21jIgx5y9D1Psd9FgP3F904Ze/UpslGjVWvmi5ch9R0SKWHlydStFBTuT5np41iROMw4MRalzToWe3gqcDn7qbn1TjrSQWzEtz223AAaC/doNz1xFJkKYW+/Rvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu3Uxzca; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu3Uxzca"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3184c71so37654255ad.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968691; x=1781573491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Zg5GMFb64gMq7K11JlRqMEO4YXM4lX5yZVioY/q1Lo=;
        b=mu3UxzcaDOzYGMqPVh0Xt64xiHInA+oa4plEip8uTegbEfyl5L73sT52SH1snCD+NI
         Ip8/cnV2SXDB4RtGp8PuV+L5oMVRUUiZjiTXvxfw3Y7Upg8h4rFfts/fp10fYZULl4bz
         TEISiMxs+vpQI5zUJ2rlPRrNZi38g+GEsCquKnq6h5SbSPJrClEZRJO1svGvG9ispkir
         O9+KyxHc4RbrZB91wf/8Ti3/CrvPmNNczQyg/IKgoIQ67HqIHHEmh0CiieB2DAZEBuha
         /WaGUd+EUWIpS59dLWn1jdPPIKmt9ByNpNkYX6LzgPZllFM0jxbyPKLKvCoW34YIDxaw
         toaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968691; x=1781573491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Zg5GMFb64gMq7K11JlRqMEO4YXM4lX5yZVioY/q1Lo=;
        b=KOfR0Girvqfs7Lnb88sEyJeve33P4ple5TvkFDzM2b8dVIkvJhtzwsbBWth/JirtTO
         xRkmYrDER9Ry69fzfez3mY3xMMHh6uweNyx8ogYiCVWQ4QhdU5QO6bGXY/rRym+yd9nl
         Q/yRDaoevTSXCGX8CFckdwr9DopHwXHSsnoQwkQyqBgM8HoP74ZJ+NQmvlSk7PfGZuXZ
         q/M0rpJL6oPTbKSNxrsK8fHKzuKpHGE6gbmc0pC32vEabT1uTuvi8avNp8FAAjT2clOZ
         wqc9zHfKlk6OdsjrUX9ON5GSfbEtgwoO4RE6erFXjIAUmv00QhmOqnHcROR7WDDqSEJM
         4O+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Dt9aCJuYqQCJvmQ1jkwTHc2I9USx4t/I2XjhJx75KrOzzIfWKbfRlcqV233lk8nwUN86rvAcuilJRTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBCZhzsH+ke7oqMB8SKzu7YiK8FfcM3cXVNwVVvjm3H7pSW3PD
	MCNKHnvZZrnKYXR0JybNOCmPg7sC9nkgE7wv1E6HMidjY9bUQX4fyRaa
X-Gm-Gg: Acq92OHXwi6pZiqmuw2ADh+BnVZhKKBUr6LuKWIvp5wOWy7S6CbbKfCz+nGc1sZAYqw
	WXUgLdtgBwFGJUl8AtPHmRYgI0FIPLip4n5gCWySnQJRusnZZymU5pgsIEIVBaSZxgLz/i0BeVb
	kAUhfJmupHrwLy8CO3M0P4UaYSp8s3SfMVgAF3boSM1Mn0Yzg0gBqUpCBC5PlVPokxKdOgFJqMH
	XwH+jRcYwjQeRk0GfOMjtOJR6VlEzjK80FdZyZqjYUZl+Mp9jALymPGqdccxN4mEPs+Ai8U/prS
	Ac77tdJbGXCb+UzYX4Zi7HWVoeRSoGh6t9NSPG2s+v/1OT7PBf1tx8B+c0nTvB+biFi8RYL3aSB
	lQC5MrzhgqpbZBupQ+pYAIXXgdVlDVUSayts4CoJ8p87H7kst7DBNM+31mfN4pZ6aDZGMDuZcHm
	B84R+U27n0PxZ4ZPm0CKFOMcROlb24IdXYy0h0qhMd+n3RS0W1esLfH8gpZNWV8BRK6t2k
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr152134705ad.27.1780968690526;
        Mon, 08 Jun 2026 18:31:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Tue,  9 Jun 2026 08:30:57 +0700
Message-ID: <20260609013107.5995-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock.
  - FSI dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.
Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
0xe6150084. The binding therefore documents the clocks supported by the
FSI driver for these variants.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.

 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..b966b55ff772 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -38,7 +35,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: FSI dividers for port A used for audio clock generation
+      - description: FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional FSI dividers for port A used for audio clock generation
+        - divb # optional FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
@@ -69,6 +91,31 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      required:
+        - clock-names
+
+      properties:
+        clock-names:
+          minItems: 2
+          uniqueItems: true
+          items:
+            - const: fck
+            - const: spu
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +124,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names = "fck", "spu", "icka", "xcka", "diva",
+                         "ickb", "xckb", "divb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0

