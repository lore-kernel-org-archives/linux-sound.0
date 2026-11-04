Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795589;
	b=fE6xpU7/+tQybv+zCQ6S1XmMV15mSb2S0H20wxf0ABbxDlN06dGWX5VKGHlhIc7DZS7o
	 TcVEbwtKaaByZUYS2a7Gv+3rissZnUyFOU81VuL+Mb+vHIbzxyjM1BmjbLAha10L49AsQ
	 eoKkG9rX+nKgj+RMA+Gp87xxA3LuKiC8IqTm8u9muscNcQyTtJczr7yIBeOX10pi5bYfx
	 ay9iNvf2CY9XowVxWUPsmY6Pc2RwkBn/opMZLOc2V7pvwDDi9FJ6dQBhh3X/G5HCeGTDU
	 b/hNoXQYgr7wz/31hkyXvHd+a+D4mWJYybBGv1RK+QCt6cygGpAymydJXm5O654VmYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=sUUOps7KUx33hdwHGiitzBzKBOPhWGGdkwyRFX+5R3T2ImLVjSc9lNnt1WBqczPm5GyJ
	 jZ5ZU4/JUbpwqB1XTbfBcYTS4TsYhIXAZO+wVvUZZSEIeDQ9g8qVgVSni10KUSU3fz49c
	 BD4IWjEvCinzNDf6VhouZw4Mgk679BRPJ9Hb5E7k5rpYovpuz7GjSikcJqcu+lRMLR9+m
	 E3U7y9Cw57wz5wQIbanX1v/BTUQ6bDMrCcEKMCyceLD2i+6ucrSusUO1GL60JckQnd+5i
	 GmUUpfrnZfWzNs3Z9pxaXResCCI2kd3E/0oLKH1MnDokzvqys9dqiww474iW/BQWn0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE69606A33C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE69606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yog3OyDb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso4689635e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795587; x=1794400387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=Yog3OyDb1q2TKjdtPXm6WYUczAoOFpStIyM/2ceCytih0faqgI4mpLtu+KHaw0el5I
         O++3e+47REx92CLnuYhbQEEFcpMlwYhBO2g9nbVvkwJaQb3wOnAyjzPp9kPBgMGjYoXT
         i98KwkG7pgyAGIhne6+M2opCERjb9gZ1kT6gseCX1ky4YWz4E9golN1JpyRbK7kw9tM/
         Irs31lfJYnMG4qIgm9aAohf+/gF7sUd2+WzM4T9X3Fz9tAs8BDAxuDGW8KV4/FWaOUBZ
         C5jepseInrn3lNT/LcqJ33u3HckdUtsPs4ZcHjTBY2yjCrD53zafkTliwXTrTQeX3c+x
         Q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795587; x=1794400387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=fzm56y58Y77FOF62mj/v/1MYVt/Z4kYsLXWDu/zeiPL/oiw3/59rcKF0rt1O7MQZQ+
         0IXVa3EHY7gAFN2laVcJ7l47v3uUh+kHSkdKO9tO0ZVuHgGkafJFEYSQBmFxyink/Cm0
         pdvEvHxiKMe8ZKuTMOrzJ/i1bci5UBEVqbNZ+wBxJSfClhPL8zrqH/QdhntnynzN5o35
         t3SbO8vlTFHWXqdDGp62VWRz2jUcMgy8hMRCbRm32BQep2GXOJyjUNlARyVg61tbZjs9
         IgwA1H0471f6OPVtjS11Fuvq7MrrTdMrEazEcALVsV+TtaL5xxgwBXMXl1o69Bg/LXBm
         CCBw==
X-Gm-Message-State: APuU4Z9BcFeNNCH+ZRBqhoxLsvZP8e8ROCenyfkYhq3KCM84d1CFHJ7x
	EtyYCbuRZI20sC23vQIgqbuplQRuaeyuKbFWPD4BddFkRnYjM+2+q0js
X-Gm-Gg: AYBFou368iYSXTVQYjFh6nUgBblJmAnD/P0sZMs5ToI3cexC5R/IW1o2jX5APxTOq0I
	h1Tw06OWhSWP2LAaf/IULb6J1NnuF/AWVpSV9bCj2gugBHD+TR+7/phMlk5soP7zQKLjmpmKHKk
	uHB7p0rIQodeExvOHENKV+/T3HxyotJwfBEbwRD4aRNksQQyVEnpFte1bLWsDZVWb5OoBZttuxc
	IHv6PERAvqoCsFZ7v7dUxqWRqgKc53h5f7gtDq6+1DX08bMCPZ5lSPvZCWYWYQBcZfIfMilViLF
	fjAUm9/RO87ADaUZ1DTAjejkmdNOmdlPfF/5kFQpLkiF9kBl8nwJUmxFS9+j6jNi/BJ1WlEhfzb
	xmtk+Orox9DX4hiJ24/ilUiWvu4clrD6xI5Dcr3mQ0u3k65vNyBTvcNCpL8FTVa76f1kPB8FFst
	8je//M/tdrpRLIijf7B+XFAZqbA+NpoI796UMrOWcTti3DrplwISOyldAEot++2Lu8AQArfo9XP
	QmL/eDOq0KwnQ4sHwXWL0ee7KXPYxSu0jdMxS1LzQxFlptUvAWeOU87otYGzyFjWxfNvpPcR0SQ
	NWh/9uEkoCQE/Ts7ytolBRE6hIFqt+hYnqm4VPCQTp8rDHG7548=
X-Received: by 2002:a05:600c:5397:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ac15584cd0mr357132435e9.4.1793795586634;
        Wed, 04 Nov 2026 04:33:06 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm3509380f8f.17.2026.11.04.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:33:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Wed,  4 Nov 2026 14:32:46 +0200
Message-ID: <20261104123249.227920-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123249.227920-1-clamor95@gmail.com>
References: <20261104123249.227920-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..8b39089c99a9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsp@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fm34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

