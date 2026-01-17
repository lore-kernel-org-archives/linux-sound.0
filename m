Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42212E7F0A
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681177; cv=none; b=qSFRICxYyOl8H5nTdLSJeLWFS1hJSgOcdgLBaNed8iyApHQ07baBCpfMTGoq98jt3+ExNvpjMoFTv7knMb03Rz24edyen0J2pIWJTC+UZp/tWSnoB7yoy5l4yW7QASxLeKuuS6QnVdyjQWQLhIBxK8npLuklXuf7u4LRCVjI4Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681177; c=relaxed/simple;
	bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ErM/i3fPLbcodRu6FxH4Vp/RkXRDB9xmxtcFaMcvfa3I56rOLSWdz9OTXfKUJiNTxVadzgaNmRetrHiiZnFn5uBieWf/nRzs/EouzG99I08dfR4NIY5JJxZKNG+ZxkjwLXr7RPIzkIwpAeiA50L0puWDXSy/No9x0lEBa34lpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHMS4I9t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHMS4I9t"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso20119125e9.2
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681173; x=1769285973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=hHMS4I9tCT1o9AAzIo6vXgO/hQYJI3GyYUo6jbNAgbXGB4AHqIsIp1dei5/1dO9Rfc
         pAfPnTi08ZwmmeXEsFAjljRZ5hZejnAXESvnSTQkTmXBh4pLCkuJlBcxMJr5Hitvc6mB
         Mo/f7AkE6QVpkMiGnIkfgx++T7TlGRhFe5+15PCLzrZjerzP5W6j/SCcvqoyDvSBnoS8
         zaww8hEfoq6lDnv7Nm6LfS95RnOYecwCn5IOO+xXfbxkQe2qlogTwS/0kUQqAlD+EeZO
         Ox/zrxsZCBcpLMn715XeAld8FGcHxAU8tFKVDqgrhgl1G3WhL2uLv39IoDA+M7lebwDq
         M38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681173; x=1769285973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=HGTuf2aJM3dO967L1vFl+EIIC8lEuUQQZnqxQ8Z0Ov2V3EmfdL/bj+TfNB2oeF6ShL
         IrQnMMfFgqn29qOO9Rdo61mtCuJ0AGo+f/QV7H/zftZ97cs21Il675B95MszzLRGW3jJ
         ssXtT7gEA82d9FMEZQoUOqKtimAFf1WiVqF2z3KeqraxJmlnsff6/6D9/lsyP+QwGnUR
         1/+ywnEGgIjGAc+K4Z5nU+JItiDjVLg/a1Rb3HVBcOxXsaNFkcYJiUivJj4MhCgSAvAq
         FYJEzb7Sihe2wxE+O920HLILSmd88JygYlxf3P6QRXoP8OS//2nSYX5IlwWdvUhoj6V1
         2LbA==
X-Gm-Message-State: AOJu0YyEJgOXnfh6rsPaOrOxi4iSGhxoHJ4cZnqsPuX0eoabke6hWMvD
	hLihdxxddCY97GAcmPp2Ckv8jibel2M/MyWBJ/7gGDg7NjfsYtTXkFYR
X-Gm-Gg: AY/fxX5GMikO6QfQ4poCFd9isvQvf9H/yRwJZ28FiJzo2sqey+PXSaF6CiuyPE8Tuln
	c+IbhGIURbnw7rU7u3bskNMs4MQn6Aos24iQXvQHsJf1L84+i1r/c0LStasc7zXsOCF5l4UoZhY
	gb9Mqev7x/H2uYYZNLh+tINeNY9mdjmn/j6kLDDI3VDxHSdb3U8HOCN9Jma29ENLJFRg8YlJ+0k
	pcKaye+/YBLomwGZ6d7IHT5Qv6MiEk9uygIeGasMvWQKwKmSPa/t95Yu5Qq8cod8B11QTjiJpQo
	mxzjAYNn9CiQWkKTuGm52xOcUT+mXmRuTWVgpCR9JpVBhMsiOISsv2vZQxAGoV3RNbOJYzwXZOq
	IL083s3tEjWc/4DnnP/HO89Or8gaSIdZh1Y8PumEW6n0ycr2FWfGdAXnQAWukHZnlEhZ+T0NnzS
	qAQfh/8JUHz6qzix/Yj8VM8keyqR2BNQa3cTotRCajFCALDpYNsj5vaU0=
X-Received: by 2002:a05:600c:4693:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-4801e2fe194mr88194305e9.7.1768681173087;
        Sat, 17 Jan 2026 12:19:33 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:32 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:55 +0400
Subject: [PATCH v2 3/7] dt-bindings: sound: sophgo: add CV1800B internal
 ADC codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=EeFcn+GCVjQQk9AlKztuSLRvUBU20OcxJTOUV5Zv62e8woM+6/UmsJtbuI2XJHrjfsIZYIG4g
 pEFujRYgLMPBsgyOGXn6+QLsWcx6nO8e2+oHmZSTG4XSGcGekrlC1RN
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

