Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243336;
	b=jH1EF27v/sfHJJrzxeikIV7If8GXrPGeUhXbhW9WafUg/w0xwfyZoXCMaq1alCoUFLTI
	 zPT9FB9WsT48m/I9j7b6Y+wnaDjyj/aod8HjS4US9wAF3gI4970rUIg1KdEkSpwRDdoUz
	 6Z4PT0vnbHOByf0b5KqDeVOpvxFZo7+A5IppoejgZs2CWJwvEmBHlm3CrOl2KAIKPXZMD
	 0jM7+WoD3L0vJuQ/W9cDddy5S30T6cWYS+JqbwWzzgHiqsL0r1mwFafHFkwH9rSIhFMiK
	 latF5GbO6DPXwPD+fDZr1wzQ0KjUWHvVJmaZJU1ZcrOwKH35QqfUw72V1LNHR9UgzZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
	b=o9EA4edVlQkcclf5YFKvSeHmOq7waKtd+t6BxeR5QZkSgOa5gXOnnHTGhiX0Nyh/XIPp
	 HANln/VR2l3TqsDEitIroIM2lzDP8W+RL4lahF55g8LOTHG6TAqASBov7JDrC42IehVae
	 t01FJb4vJ85Ki4dmeiiesPIShfV5o9+YWmG01TC1gfWpqzWfJyBd3+7sDWf8QTcSPNYml
	 E3m/ugcCwRMUkF70GasG78y0k6Yvw6FE/r1pQxL3zi1cjUhbGRERJqwpaWJCSLxtL4qKM
	 pT8ZkRBX/5OUyrWpe6pepnHyxEsX9fdRLJwn+5aYN4ullQoNfWBHBVrNQYntyQ+BPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C14606EE8F
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C14606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOrfwyWE
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so743082f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 08:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243334; x=1794848134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=JOrfwyWEu5DGKVu2Z+gm6dYF7VYMJiVUjHqNcpHtdO8J2Bmk1rRkyS7bJCL7lKZxiq
         kKWJ2Y0dOHi9hkTY3KptK5DxDpOosKjfwtc7sIA2CgP9g2/w4CJHDHMkVuVkO6HidWxo
         snX9gLVAowCKgxeotSrD3DwuTJ2153gsKhC9x8+nYWrR0oO0tsEwoFgwzqU7pKOOQAwT
         1JUM2AmU5FEMGftwvolqCZbdEte17vMkgqxBW+QpXe0Zbjj12YCv4bZTxalBIVLrICcL
         iGwQS0AHXoTcT3ge6QlIzJsntavOA4lMUXJPaCAuTMvXufp+J9FZ6FNawH6vJWPMnsf5
         2KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243334; x=1794848134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+/Qu4BG62Yv3y9M2zB+9eKFlQqUCr0CqLxpIIRMTlc=;
        b=tXNSKQiicPJdf2erVOoPFhBOO+VNwMKR9nRlU0PyQoWrF+q9Wru2nprx/0EXcREt4S
         JambbP9U2+KdaqjjtmfAHMycPaHnDIBHq9hTgzol2ebNqVQgg0se8X8w46IiwLs5QjMH
         NrSurnQ7fKuGK/Hs0IdApKY00foSCOzbK8to/7Fj3lYNbY6u5/cuupz3hJWc+n41SHTA
         7aQW4cAC/EAlEOCLZGNDVgFoXM0VMgQD/7e2O4uKf1RuByWxXBpo0inarWZ/AkLyj7KL
         yWpb5Fys6gaKQWbsHy+Gd980TKvm8RGp1MPQqFY+d945uZRdDf0PsF+j6Gn4bVHBbO1e
         5f7Q==
X-Gm-Message-State: APuU4Z8GmTA2Lf+OR9TfU40tbX9G5tb0tiTlqfnisRRX/SMCR6S13GMX
	9e+RtsoOwP/KEVZSkMH3bUZGKNDqYcbIs4izzyQ1enUmHJuj6RCYL3EA
X-Gm-Gg: AYBFou102PyoLIf1g2qAxZOeZnXa6zqAuD2w3hVQ/0nzG4Rma3EasXWLbWvTO6wBxuf
	+2SXZKywUbyRKX8b+nEvqSDQuB4ool8NnJkncudzzUCcbqsXwM8a30XjJ/mOZDk5klKfVCJe6Yw
	RSJEpx04tOfMjo/FaGERISNsS65SdHWyrPlDx9pacTfu4yh1fIJ1xCMqRD7/boFZjLoHEi28iKY
	8DqRaCoy8lNI9NpTi/ld2ULFK6LCd3QiBcKxeSAIGA3BFt7NxAzqAkRIhutB6wjvjUeU6qN4IGj
	UojVSPIFLHfKalrA7WNhNhAbMLcvKjBB3bMlfLIvjyKvSVJB8U1CuAQ6+OtlEEazNv4CPpa2JKs
	N4NOkmsQbalcD9l33mEyhK/OacvwT3+zGijRCudHmHukQyxG3eCm1KhZfS7gIL+RH+if0v8wuFt
	5ZUtA6vDRe3YGc3/+sVJLu17q4am8legKj40sjIyIO3yfZL4sWdB+ShMO0vmiAhjzrMNgd/UaDF
	MnYrEcQFkLB0O+8x1B3ibcEs25z4Uz8K1drmXbsS565iuBn0iwzbry8Xvc0ibOoTxDRSvXp0WCJ
	wz7cdAtpRYOI23odXo8DufKV203BUJUeIOwtcZi6pY2Dg2Dcww==
X-Received: by 2002:a05:6000:41dc:b0:491:d3b4:4e42 with SMTP id ffacd0b85a97d-498319f20camr30918f8f.52.1794243333939;
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
Received: from salem.wifi-guest.upb.ro ([141.85.150.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm11492234f8f.38.2026.11.09.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:55:33 -0800 (PST)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorena Tanase <tanaselorena3@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: wm8741: Convert to DT schema
Date: Mon,  9 Nov 2026 18:55:22 +0200
Message-ID: <20261109165522.6663-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Convert the WM8741 audio CODEC bindings to DT schema.

Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8741.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8741.txt      | 29 --------------
 2 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8741.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
new file mode 100644
index 000000000000..a9a7fc2414bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8741.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8741.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8741 audio codec
+
+description: |
+  Wolfson Microelectronics WM8741 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+properties:
+  compatible:
+    const: wlf,wm8741
+
+  reg:
+    maxItems: 1
+
+diff-mode:
+  description: diferential output mode
+  $ref: /schemas/types.yaml#/definitions/uint32
+  enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    wm8903: codec@1a {
+      compatible = "wlf,wm8741";
+      reg = <0x1a>;
+
+      diff-mode = <3>;    
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8741.txt b/Documentation/devicetree/bindings/sound/wm8741.txt
deleted file mode 100644
index b69e196c741c..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8741.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-WM8741 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8741"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Optional properties:
-
-  - diff-mode: Differential output mode configuration. Default value for field
-    DIFF in register R8 (MODE_CONTROL_2). If absent, the default is 0, shall be:
-    0 = stereo
-    1 = mono left
-    2 = stereo reversed
-    3 = mono right
-
-Example:
-
-wm8741: codec@1a {
-	compatible = "wlf,wm8741";
-	reg = <0x1a>;
-
-	diff-mode = <3>;
-};
-- 
2.43.0

