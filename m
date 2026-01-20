Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB9F46AEE2
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935983; cv=none; b=jXh3/YiIb0pe1jYjxaFZ/pT9ggkfpvwKPK6+FiNos7e1GAVe1/buRnWp39NoTX40fiS+M09ZUCpscpzHRH3BUhbyWhE9wxMo5jDbHzRsrQj7T5unBgCaf1sObzWp9l/pqTYC0omt2YQ3pb47uINakqogxiEMRqOKINZFd+JzbGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935983; c=relaxed/simple;
	bh=fackHrxNCrfa3xgCHjTAFP66CR9dRJ4J/Fkm/B2DbIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqnNEMA2NU9K+bFWeZVEiX45hu+VVfLK+rlxrgSMlvHft9P0lkwQixXRhUIG1MiqCR0VR1Jn1okmvbJtjaJ6+rfPHq7+51FpcdYnwrqd1zpf7groXfHkhKduZ+UbkqU/8tduj0JjlWdWIH7OHOpEPrvA4dfryRqwBFThcf6ulaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjRQH5wE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjRQH5wE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480142406b3so31260835e9.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935980; x=1769540780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=KjRQH5wEMyUK3gGg+IY/yFKP1eaJPqLoTZb4aPrBCNP0Ickdu0775nWfmYiE4hq0pp
         AMwODCfuhrztHpfcq68Zf809h9yqbtCxo5vvLJN1TlF+HU4hdMIi543ey43raPdDfsBD
         BlZGKI3EztQoeWArKvQ1Vp5upQd9qjFqp2M43KkkRRJirTe/5/VimHHRJ+6wbp3BrCwm
         wIksgRmXY1XlA6JumhYz1xnwTqPC1cmrJdOYiSgytsLRsnvJNO7cE3uLTMeLiJZ1mhjx
         F3RJKsRypIpk29ouf5kvzjBFV68wv0tlgq5j0nk+6FugJA4JEt1Op6R+qnO4A2dFjTvj
         1iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935980; x=1769540780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=PL1tNv4wdf+uUtDjfznwREgXJw7Xja80cOYxiNOC1Gx9fsPMe+hOQHXB4NeI0Moo7P
         t28Qhit4mrvbvB+dWaET6S2tvZJKwEb9+Ssw9M9kOgsq6v8z3vw//eNKnBwHqmhEJFyN
         qRn8pbPuajPGGOZ9UtkOXSNIXaBblxY0llHoMzbpqRICGRlaUhzTEAAQLkWeK9qcYurl
         Cu+f9Mt+gOmKsyXNUVLcIFSfpLU8/B/doJdg57MAI8YwqcFvL5YdDZkUKkvihRFpd58d
         lUzC3uJ2oXeL0vaghRXoyHlp//7gLo69SSKBKMQEz4C2ixOFBnYTHQOPkHwdCdOgw5T1
         COFw==
X-Gm-Message-State: AOJu0YwbWepnx0BzAur17j/8F6QlbX6NA/Ie/ooEu07UDVX87nmfNUra
	UH7CluGx2lu9KWHVIbeOSgWvRe3WwvnHdayp8QqIAzCB7SYhww84m453
X-Gm-Gg: AY/fxX6GDqa9YvAYdThYSkwacnjVF0XC/oVM1NJllT4MV9c2bLu5pCwokbYN06xGuCG
	c2V4EmI4q6NiOSEpQ6Be/B//sGWTbIqdTvDR/AapGULL/CSk0lhn1lcanpJQ47ZV3t3L7REPg0z
	uyf77jCNvCF4sI9iXVGBoz1VuXUQRlKb/Xj09AEUDSmFYmI/tfAbq2/F4voFtc0s/MRdnBkD5Tk
	ae1isSinyU+9MTt1fW1/fsir/FtSlOIVT/sxRy0+Vgc7iNFETK1unIjtU0QUCC98J/NGfK21jiw
	Y0quZd4tQ5ntx5xNwNPULnolA50XrEL/rmzSlqTKoyxO+vb7BfMwxRQbekor+OqRZmWesryZr8S
	oU0IPyeghBjaK5PSSAzqFFz+/nYIwViMU8+e9swpLB+AwIDt/Cl2+AnJsuwNFjE+ajh2xX5usyp
	X3pm5+4LwmzX723dE7d9pfIVew/61Z9WhKQ1goRfI7f2V4
X-Received: by 2002:a05:600c:a399:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-4801e345c96mr162137445e9.27.1768935979456;
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:05 +0400
Subject: [PATCH v4 3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC
 codec
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=1645;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=fackHrxNCrfa3xgCHjTAFP66CR9dRJ4J/Fkm/B2DbIE=;
 b=MItEiN4e0HSpxL80NDn0eZTclssaZrsUM/KZNeFCT959G1OEcAPzPf8NwEb3wNWTi6MTxuqRD
 tECwH9+NBH0B6ZgBODGPQ8GWqs2kcND9D1gq1HJzvYB+JCItPqdJMhA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

Document the internal ADC and DAC audio codecs integrated
in the Sophgo CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-codecs.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
new file mode 100644
index 000000000000..7293a98e98c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-codecs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC/DAC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description:
+  Internal ADC and DAC audio codecs integrated in the Sophgo CV1800B SoC.
+  Codecs expose a single DAI and are intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-sound-adc
+      - sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
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

