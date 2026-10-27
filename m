Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101184;
	b=JZ9TjhMqjpQgr7TiNfWgY1BpK4mfl4YIsiMij+IN+Ic4jyGrs/qCgpP+Net6rxGQXHcW
	 6wrtsMNN4YP/5hgvk4OqydAFWZojovpzAPMETF1XYaWUgA4nCopPpQzJn43a/kb8qK1/w
	 GsGYOhIHLNrPqPpC+GOgePk9AliGTxg9Hcuo9qNG+xxXOlu0IHktm2aCEq5557iNy6NHh
	 2xFYkC7pnL3DCyGXt1snultquFp0+we6RpZ70RGkiZK7gU10h3GXHrEpdW4iuMngzHv75
	 mT3RWB8e4dS+bFIVDVnDF/ex0gVmIJ4xSTXNl/NBB7/SqYbdV5pnyEqSxIWVBz7QVLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=eAzUMbpAzY5G8iC6AK7yPT3CiST+hFN5lk3O9kWqzwtRzwgXdUgpyQvAWFQylnJ/4pyY
	 ZNGAac9RmJUzErEC+bJnEKd+A1rFCMw5nNWiZu1zj5T8sPIrqQbMfZ2yVXIaVFLq0YP1G
	 3Ba9uPWNywuszDdG1foD3tB+ikD5J7KbS9sUGgBj9Omhr56rZUyrinCNyBkCyuEj60WKI
	 usH8kPbA3YfuR5KQBMMd0PB6dbRjLbCz1YPonhIe1DvGaPF/WE+cpizZOHNqp6YQUVreU
	 zzD01gITNYdJBEQ1Xa4c8YDFi9MG3nwSNpW8KT6raMhDdAkIFt2W7jbGMj5D8gAMfEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB8606AED1
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFB8606AED1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c498e2d623bso248012666b.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101181; x=1793705981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=jKHD8slxvdEgGMIPpyIp1f3/cw5FGjJQx2IA3ge/1E6WkyBl1FZShR1uzjyX8h99zd
         d5o+Jk3wO4AzB67PRZ1SIEFznVW8CmRVa6w9VgjbRZ4xG0xWrtoxGUMf+58b51/wKAvu
         nRuyAbPHkMnS4v6kTNDBV8ps7DHjBXgvvcEOAGEtAPbeuzD5ZmX3B7pC7U0GO7hE6i5P
         kWEMTog2wx51xwicF1ifAEJu5PkDeKhpcgvHNBieLqWVjXpEptC8GScCyClnXjHzyr/t
         suP7Npfl4hrOA6om3v6lJ08lc1C2R1tZeJbWJLFo3ez5eyeQkEcZ6LLjgegDgA1uXl9I
         6BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101181; x=1793705981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=vLDBmWQbHKQzH1zGkEM/ASYifF2Su34+Daray6F7cMna7r+vIezXyKFh/V46tLGhRf
         kKm3a+kOUMBmKxIomVeqXUf5YFyCq8oJvcZBohAzAPT6AjVLQHep35P8StgxD2QuEuRY
         eZpgHCRH+N2dK2s2OAdZ79FIoXdwq5YfiwSJK8wumwwJlLFfGl0sqLM+UwfUG5rUUQC+
         v8+1AHWfXxubrouR0ZUxK3tjaqX1vPvZLab0mkwWEm/MERzHh2616N1Sqr28HUbtBAPA
         ueXw9oh4au4K1VbuxAg15bTBHma46TcjYYmwYSMjyf/6sKnjI6j+yHPdCET9KNFRLF0Z
         mQig==
X-Gm-Message-State: AFq9FYI2gaYWI1Qio1CWEzi5GVrPBfvBR79A1iHy0z1Rus06EYl0x5P/
	1i1xOD7WWZjVmQoC9scjYgyncZgGQw4MNmMk/6zTGxWJVsnlGejjePaf
X-Gm-Gg: AYBFou3CBthPjpB/TI1BkJt8P4ld0ZHH7p+j2Hs9KWtGrEG/Rj6fuKTbv1FJu+U8ZJn
	QGrbQKqI9623tStJuGgbODuTMYi01yUyz8bvLIJTcY8crCU5JRLxxVhtYLxXi9SUA/o0r3noQT5
	7DxvHe/sqp3+ZyrbpPXfCK8WNe0OSFN+GLNiPoafdEdC/R6uhFrEZV3gKd7EWuNoiUl5cL8ThuE
	5//oOhRPirec2YA+0y3coIR90vlUaISlFBgb5s5wWJgfE96dAPmUemOYAsKgl9v6639GEPa6FNY
	39pofE4CDl5BYuWL3lgOQbJp+1U0GYJzBVtWk1xByORF0adUQpI+ffh9ZTus+Abov5nmhYGqaL0
	6YCq/QblqQD8Jcf1BH86M6/+pHJiN/fFYfSk/c2odZ5DbkYKaWI8IMWpdUQexniabvONjXNhaUZ
	tmgAwiJL25ScteEAUtfpDscOaoiXJSj3dxFjEr4fqMDL8Xd2ipn+wFbZ3/r/LsrG6iiqzxzCyvz
	M7VtrxspIxvNoV1SIkEUDElxT4M0LFzjAroFGw4SvdD+i7LWM5MBiRWNSKESrQxe8GEe4GglhOh
	/Q==
X-Received: by 2002:a17:906:f585:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c46bdac306bmr909348466b.1.1793101181423;
        Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
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
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:27 +0200
Message-ID: <20261027113929.65102-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113929.65102-1-clamor95@gmail.com>
References: <20261027113929.65102-1-clamor95@gmail.com>
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

