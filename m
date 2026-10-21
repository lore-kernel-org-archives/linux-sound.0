Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586783;
	b=Ndd4ffuJ9L6xrz+cxKLfiGtS2nObEZw/9Lk+ty5slcMaoSXK/o4SVL1wBNxyEcwZqdX8
	 wKc/FEyE1ZSYK3JOEK217wtT6/kwlXiiW0y37JhHPrjKZTU1pBrKc1YKrsqloMUV/qLyp
	 5CHuCpPSEbA7jA1fk7dlAXxkWAY26Eb+MKk3AZfvAhJSWOZgszjqWiidzgc3IDa5g7Du9
	 hZOq3Ulp2E5TI3B8hsflwPZ/oBx3dT7PwXlDNALuHMeoYJUtBb+UKLIKOfnww3hRlWDnF
	 o35BdSoS51kqI98Bre2ylsJuqiw5N1Kxl/QLtizGtE/iIHmlzhkGqRllqh1SF3OB1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
	b=uUFyJyMBbgGyTTVaHKFO+9kAbF37mxLZBwbUVOeGm+z4PRU29OR3862hXWPc+tEoqlrE
	 osjr+J/sJFouNqHzOimqyJKJXTB4q5DI97JmM6MhnYonL8HWAIWYNkO1Vd51nw4lxwIX0
	 +wRSOcmTZxzYyugH8OvGHQQDIRdwsim13HH6A3zjRFgs917udjWYxBPaqWl40YL/soIiQ
	 Of+EeENc96+yfLzzvmEkydCT+5lfkj+OmWNfpxM4jrL/KiN5ZYtHUTtc9EK3xqgvVWunW
	 VtOl2IEXNAykjKgqNgTcX65gMjJRoAG65f+n5YpMWVldND+IChO+nCUcSr1zrwt2Dvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056C606A327
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 12:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0056C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFq6P6r4
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a01cac8733so406598b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586782; x=1793191582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=TFq6P6r439sMoTmALZIeItkoFlfJeoKAlxxoA82luquzE5l+j6g3th/bVRROMHmjtm
         881PAPylfPqjNr+I6KrFgKKDNbxNGmXAqWGhvMDNcVDPOJMur3DVR26mqVqdfYYFZ/Gi
         KnOiGWIBK93oHGKOopJPlU2SUCuxspDu1ibqqMK/n3Rw9bJGaNWQY2Lpl1LYfHBfmFDN
         E/5BE7aw9noyNxFU7kFOKcUDZAoJ+C1zG1ErrzhV/NIvgVFZHhvgK3odMUSdpSzyLUXN
         1MRD13U2M94QtKe9pp/d+4sVEh471wHPXhdCV5SxGqoOiMstjaTzoMf1W7j09QeqU66l
         y9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586782; x=1793191582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwZtUrdYtW8MtDYG2yC3ydbDQlF/r6XHSO1vV5BkgeA=;
        b=pQ+E0S5SLUlk0DXSyk0XfDKD6Zb6xCCloL/rP1Lv97yyxT2mqhMTNwhOi6yq1Njvm5
         DNyob3urFG9A3cqGBGun9ujNj9iri1ORUU7HlGxFjOqpNlHeVPnDB4oTXpK/3YzroaCN
         wCwRlPseztMb6PfDgoGA4H4Qnf1wdet8UlwvmjQkPJh42sFVDnmqYoVvo4cdz77GAfgE
         qj+GpyCfpKPkA0d/kWQW22jVyu3PcWjKUGMF0Sa1smwnxiAuWLoo8npPoWH0W4BhsS+u
         9gxMAYYX+6reAdzXAYN9LwB41bXuYB9wlDMuA0Q0wNBTKxzX+M//qnPs34OmOA0kF/xs
         JokA==
X-Gm-Message-State: AFq9FYKYwrdyeDi3EjYUwXXu2NLXaIsYP75a7qr32PpKq+KqczLfN2tS
	YqNPfIMCeCIpV8EjWWsCFULkQO1NTyWeAVxrofvDLOlbXzaPIs+HviHj
X-Gm-Gg: AYBFou3LZdF0TMMMFf4uZtIIxn7tVovO4ev6buftVjJYZsx3ph6QPkX+BLHbDqB8k8n
	Yp8d+4jltyR3/jftSKkR/q2p6rZMf29/X3kVskgriYB+NluUutEcEHL6PZvoly41LEFNbyq78y8
	wyyn1TuugPNAX5LJWzdnVpa/B66ELYA10No4MjUOClPPaasyPr7coAt7HNOFJVane1GGuraW5fl
	TYWJ15AtV0uJOsPYEHsMEzJJy7r1eyF6jfhD1laTBw2xcdV2m+MiO+0hBMq5JV/KewOqz/H2+A6
	EgD7e6rHNNLvPMRo5PkUKWod3I/E2r+S2AL1kiCrlY2IHJXXaEE/jAwoquNDHpWYWPz7DUqvTbX
	ZW3gbTuVAjq/T4U0xFfB8qHXt/+/HrqqBDx1KW0Y95PJfsrIncPIrsEDT2AW9qyENNC8tOph6Ul
	mGqxrkHC2QMRXY+3oUOHhUqp73ATdISi4m1vzh13oAVY9Ihjo/HQRDTEap4Eqi9PO+Q8G8bbyUZ
	kcdh4jb/1/1cNCYjbOs+rHFsBoKEoPzdFbMpKbh1sP+gsIN10rWs0NTrOrihlgaK0ohlsU0F4NW
	UZa08IYlai6QiOQ0
X-Received: by 2002:a05:6a00:420a:b0:89e:f8e9:205f with SMTP id d2e1a72fcca58-8a089df2652mr1470227b3a.32.1792586782100;
        Wed, 21 Oct 2026 05:46:22 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:21 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: sound: add Everest ES7202
Date: Wed, 21 Oct 2026 20:45:47 +0800
Message-ID: <20261021124552.767218-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021124552.767218-1-jerrysteve1101@gmail.com>
References: <20261021124552.767218-1-jerrysteve1101@gmail.com>
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

Add the device-tree bindings for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/sound/everest,es7202.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es7202.yaml b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
new file mode 100644
index 000000000000..ce98d2d600d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es7202.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es7202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES7202 2 channel PDM analog to digital converter
+
+maintainers:
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - everest,es7202
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin (active low)
+
+  vdd-supply:
+    description: Main power supply, 1.8 V or 3.3 V. Optional; defaults to 3.3 V
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+allOf:
+  - $ref: dai-common.yaml#
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
+        es7202: codec@30 {
+            compatible = "everest,es7202";
+            reg = <0x30>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc3v3_sys>;
+        };
+    };
+...
-- 
2.56.0

