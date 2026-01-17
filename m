Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFCC2E7F0A
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681174; cv=none; b=BKZBGV50iI3oGfnSMowKVwMsTnpT+KS5fEzQEMatFNI4K80B4Ctbkyf6wSLUWzGgyQCUx0tXdREnR4aDK+TB5I9SvbDZDLZC7LONrUJKQ6AfC7+/yo1VZ604GOkwN/BPp0PsBhjs8aLvKBIa5E82hG/f5fgVrP00kB2RZ+nNjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681174; c=relaxed/simple;
	bh=xkpcY06T5wFRQA45eU8MgJ1mdP3AEvbYjLzx5NAKsb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=simC/ULpUGlxoP3MJM25Y3QzcUFgWZRO/Y3wqWH4rJvOCZ3yLQCDHIUL0VFVO7r//x0LvodSvRV76xjwSWplaSz7zpL/7Dko1xs+3knoPUb0AUQBnPvWmJ/Lnq4IxEwAYdZlMs95ZDmW1iYKmx5LbAsKOU+CrmXmVF5JMy29bvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr/JQACY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr/JQACY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso20986945e9.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681167; x=1769285967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=Gr/JQACYn7XdU3g+9aQ4zx29WlDtHLTcnSHcFkROpfV+VVTixIpR2w3XVZPRb1JOOu
         Rz+vsj+wZ9nSjb9UUmqMZEAN1/5397aBxvJkCquSp7n2QAR5inksBjuzqg5YMpxNw0DT
         1CCTOfkxyij5kX+Puj2YiBywP8d00r5dwkuafQy+p2GiqvhL62Ng9sBgF1ChQh4N45D5
         2vH4TO+USMbzF+Bi6KyKsSApvn1h7w3TGjadtA+VMjTG236Gp8UY0JcsXyfduQ+gUwFf
         RM5ztohjPiu+df27W9e1/9ZAhxt1TvdaYzfrJVcaLYrkNKuHDRMAm3chkkbSxFFs3dUY
         pPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681167; x=1769285967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=hYfPOYFJuKCNw5AJuvtTkiB0JfLUaYj2s1scNE8+tuJ60x7nDOA3G6boa9XbuCUzC2
         erxqejFUv0Ar2IsTgg1tLpyd97pdzI8OAns/u9VlLQC8534l1XaP2RcBKsZMBq0HDWDV
         7FkKktBxAZ+F4QiBDfebn3Z8FcrWK2I7GLcP1iVVNdcaUW8PEt4W+BFBcA8XVTJFRw7k
         Zad+jCzIs8vBO2qwGEZv50YJCb9ZiuQuMsA5X9DMDgXKag3Fe3LqpM1HV2GiySx12U//
         0xcSiEdT8Zkd1y8oW12xz1l4hydz8Gf2A2hNMdjIKNcJTLHWG21w10xjJmkidah1ra3Q
         kJNA==
X-Gm-Message-State: AOJu0YwH38rvO2RmywZv4DS8fWAwl+MQRdqWFM5Sd3Wj7lqfBwkJ68Gg
	I3cQ/JeQxrt+eos5kly9A5fXuR7R7MGaUswfS5j63ljTjIT913s2YyMJ
X-Gm-Gg: AY/fxX4mQD+MnEO95ZkEh2zDtT9e8/Au9ibpY9xqr2XMnM3M+d/FoRkjCetjl8JNuIn
	dEc2R1mt+HTeH84iGXpc53Dvpe8qp4RaiywOGjBahTHEMKg9nmTGHMvc5jlEIsb73uY556xXjRd
	AdSjdPlw0OU2k5lcvZ3iuUUjP3uQ4HQJwFlRg1636I/Z1gjXWlhmexSE4G3qjiTxPSLZkpjAfSr
	4fUvUV0ntUufWwI87kIGrbL0GpuAIHg1KMDdd1fStABtdqutywbus1QgLaja6gi4NZNJv6asmY8
	HHtkvJASTjcCC8M5gQYGZBjTw0rVhdhlnhQgnmy2fh77ZwrCzsT8VisUfdNals7tznjFPBoDJBZ
	KuqaLimnKNYGRgOn2EyrLFB2bIky2ZIx7Rs24EE6O2n2zJb4CYLkXmdqx1Rzr60LOhhS6pUFusn
	P4NOcwvSnJNLYy990G4ApY0z2oi0E5B3laMcgRE7U5jvjM
X-Received: by 2002:a05:600c:4ec7:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4801e30b6f4mr71192545e9.11.1768681166795;
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:53 +0400
Subject: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=2586;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=xkpcY06T5wFRQA45eU8MgJ1mdP3AEvbYjLzx5NAKsb4=;
 b=pC6DV7GcI29FzrC3Bw4ofC67X6yqQvXg4mNStfo506jWw3oV/KO8EwPu9xuatoEK/rpgZTG54
 zNxte7NQmWECIAwaPL6+eJ/2yQ9EfbdX8Lgg30Tihx77gEimpIQSPnn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Purpose: introduce DT schema for the CPU driver
The driver uses dma to transfer data. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..cf30880a62da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    description: |
+      Names of DMA channels. May be omitted. If present, one entry
+      selects a single direction, while two entries select RX and TX.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [rx, tx]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s1: i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+    };
+...

-- 
2.43.0

