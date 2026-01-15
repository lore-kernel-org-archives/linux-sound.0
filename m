Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ADD2F1FEA
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504694; cv=none; b=VK3w7EBe9NA8OFTHDu6bCK0HZ/rpwheeJzYEyzgGx40xA90AlQCfEk3ppGGwdbIkBM2CJuHSDGljJqrN91BDzv3joFySJigpnVrqDdWnwE+ynKmKCAk7+Sl1EvJJxjDYNB+OzX30gdzBZoS2+MxdyPmQ2TOH/CBVtlSuwmzUeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504694; c=relaxed/simple;
	bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHoUQ5ibejE3VB8CqRW2TqWMvOnAyjyhyf42BE73sX8ny6nmv7+NWIj51+XqMC5Ln3iLJNnLLWJovRHLwC5YjSNRhL64dgpatcOoYI4jueLT2gnJT/xR1wZ0nulaVnLJfVBLDVutK9WVCxOFQcv4TeAlw9IW0Jpn+BlhV5rps5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr/lS9LF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr/lS9LF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d2c96215so1106893f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504690; x=1769109490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=Rr/lS9LFamyMrQMPL0m/iSjVGqAgVWbPmdV2fYUwih5n2KwY9qKp8XCi74eEO2Me3r
         C4pt3O18GWMt4aXk/Bb7mrL1FFiR2mES0zPpvuUqC9jTu2xdDBTNeHxUZc0CQhVwagvj
         t2Se2D4RNyNtDuD7l2jLcLbEsOm/FgWEcVMIUu4LQ/Bg5zvddmm26KcZeUtkfpMiMNUP
         /JEYSHfRPwc7NbQcy0RrOdzZbbuFu0cbXKSGhLW1C4oaJwzh7nzuNpyNZDzVLaXSCBC5
         FwnvuSe+O8AGMx1e4FgiwOISPUCFqQBtIirkhE/7kTobUvv9gqrfsHwciQcglK0de14V
         U3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504690; x=1769109490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=X1B+OkwDUuEyC1t6O2ZEr3BjPgtyeOO3rEQDNqZWZLEMiyL19+Bu9hav6pl6iiqNz8
         ONgTp8k0TYgAfiPg/IsnM4BV793mthcLQPyXY3BR+gKZ8uX0nBB47nf7iYlOALZrqFMo
         vTA4q5dnDCbunUSJjL3N9Xv9Nwvhz9/AkCmgyIt9nhMeWDS5Maj+aeHOLOkCRsYLHQOB
         /GdBTi8PVEE3Yd/SJGKFUNGUBLkoCWKC6RcNSw3YLa4cbgUWeTBjkLMUiy7XXNp5FSJh
         8NuxOz9cHqeCRtAOM9uSupt5M6CaBQTe2UjOeIKEn/tuXeFkccZ+ou12IpFrsfLfN/fQ
         MrnA==
X-Gm-Message-State: AOJu0YwQZRad4kI6k872FHc0ZfKuTJc7DMdehOvqzQuUvtR8ax0mxUTW
	W7Wz9BpxhBEyK5rDU2a9Mk5q4Dfm8JQm30mfFOu7Ti32tTs9JbFmZcdE
X-Gm-Gg: AY/fxX5muKk3NqJoD43PDwSGaRbM9qRhWq+uX6sdsjZQVxLV3Fr0GRbYsgfwcYN8OeL
	N+8GpFTtweZBxQzRiCTb76ybOWYuG5TG4y+eQkNQjgPXyq52PxsXfIXKtv4phkU8fgb36KhztBt
	+sxwhTR1o3T/ntfyYRrAgoWL2XNDvZXk4xuQvzWe2sut1wS2DG+JkrQq+b4CzUPCQeUFWYpbUB3
	wTT2PSRsiVIlCgNvn/8baqs8Nq4cJJ784PtyW0ti0T4z7sBm+BNmFwdr/oe7waLuMl2AoB+tKYb
	B4yqUeKkp64AExq2K8A/mya2fBVlzQbiaNG82EHg7EWr83BWNsHKAMpAXenZMw+TSbd/3PWz5CL
	E8PM3GgQ9bgzWy8aL5HJbqE9hatsmF/3DfpPbDAU08NvdKawsP6+sQ/q2/Bo7aFrJyL3Bx1HUsK
	sGObsZxX+EgjlX4ZTVlrq9GqR1Ddv+RI7s8r9xbGp4Kubb
X-Received: by 2002:a05:6000:26c2:b0:430:f6bc:2f8b with SMTP id ffacd0b85a97d-43569bcf1b1mr533301f8f.45.1768504690389;
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:40 +0400
Subject: [PATCH 3/8] dt-bindings: sound: sophgo: add CV1800B internal ADC
 codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-cv1800b-i2s-driver-v1-3-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=SQniyJ8r3rp4gJLKkMe/RuCjhYd1U6T6Xou1eZP38X8wwCyHO4bzGi5Ane4ARCg4LHldz4dOK
 Wzh/SCWOZwjCVC/3yMCdble9F+bcH7/0nBnSX9sk6GKlfWbbVy5qbyz
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..339b60e317e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the ADC register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@300a100 {
+      compatible = "sophgo,cv1800b-sound-adc";
+      reg = <0x0300a100 0x100>;
+      #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0

