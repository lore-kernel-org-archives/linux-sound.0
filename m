Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452265;
	b=m4Guv/dX3ZMaabPHHhtsVYaBVH7FzyY84OLsLM5CB5ago3sPGR5abA6IECJMnWKF7Tw5
	 im9vzH4hI2xf2D9BicLG0I+WhUBumI+/sj0AzA+hkx3AEvYC8x/My9LWdPQxR0MmxjQxp
	 iHZ/jn+tFox92WPjSe8OWVhtAdvDBAUOIFzrpFY1aq0XHKUdXnwGZfk4kqchi5fDfL5JB
	 APveXdClYfHdZRCtsL3yyUgYkxMuO2ou/yRUWMh3cCZlgmmRQrypjyvhgIsH1HloshLpQ
	 tI2aRMCP5GjdVQRU9uwImMQ5ufF4+DWGyHl3HJ8+Iw129sZmdzVaqkZQ0N8SUlNg8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=p0xUuxL1IFu77Fkt583Yt/20HPCu/k8JuVwXzVEG9xWcy9tiVisiVs2E1bKjL4l+vbai
	 1tjYnRJFjZ83PJqFFRBxUjIN42J4ekyufLoZFE6zJ2y2DmgoZlRqMb9frNl8pchQ5fQTl
	 HrbFR76kKAx95gOCWO4+Zpq5+xVWTxfOy/qow43nBHSWXkjfDo9B+HI7pAMP3HO2T+0LI
	 HHH0wgChl4V8A5d4ck9KzjpXpK4L45kT7tvE0KUH7d5DEgSkCizijgckOywjqqf5qp8ti
	 5yKr7co4B3j6k3Yd94sfzbquyrSZRq7vC+WXh+fhqwiSWPY1zjiZ4Q/3ES0z2q3WtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B4606A32C
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 23:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A65B4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so12801225e9.2
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452263; x=1793057063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=qlIWEzYZWTpLVZ87fQOhoefZgH871KE0r26083GLDjuoH/SAIxZVs7eYsZjYy9sOXe
         AFiP7hq1HhBBm3mU2mA0DWk+XbxilAYbQL/TRSrZG9v9291VXlIvGLr+S4RLbkXgB9Z8
         jZ2jsX+M3IN+ahxLBrzONvjRmfLvP1lHuuokE4mo1xZQC1+BYiKFULyD1TcH/EB+D0kW
         1k9/7zqpRcgWiee4DFOKWpS+A5RIO3Yt7HxMfFK+uvLX6ikTXuLDC1U1cTnknkUytawk
         TdZ9rgtQ0uT1dJgd13knkx+MhFw21J5p1B7T4k0WhsOr4XO4a9cA52OoPaYGxyYKBU7b
         JEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452263; x=1793057063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=e19tuepTlvLwzqTQ2fKhi1pjF4XthJhQfv0SzUwGE/0bwlmBdFKTWKC0MA33zwIb7C
         O5s6qgCRHsbIMfnlglJPAOePX5P1aZpshVCICwHxOvEK664MTBdAYlyAsdjQTMbSELT/
         /TSSfDPk6mqQ7fHMF7GeYDa6urBKYHOAiMAVH9D38PDsY/skA9ERAYs7eYsctARszcH6
         mUzmC4jeJ8RrL67KxKKeFFf9LTTCUV/ZaSwzy+QoJ1xvbCFfdjY8DuNf3Aa+3fdNph8d
         6HKFJRit/e3mHIQIm26XJxRj8pGxpWeCVvLa92IYl0ftoon1jR9p8gs3/OINWTJ3Mavo
         Sd9A==
X-Forwarded-Encrypted: i=1; AKwUvBwlY5lBmeaRN3HgWcvVEoeqeC1VvTflp7gzJiB55Mhn4Qvzas/KqilLYIQyVqOR7LZbbLVY5YPzfSLA1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLOxJVMCs4ZbH2B+QiLcJh20ebYd90TNGNdLUD9rxc9xzM2m/CF
	mcDvFh0YbrL0Dz+ylnyNo6VfsqzgubV5ZyIo80S/ruVdXqIS0VdEub8l
X-Gm-Gg: AYBFou1WiDlYX9G1RBrDt3JdOhe5XnA7dAIo1xcwPZufoXzxPLVO0HDRJ0lZmjQVzps
	paKKJNY8Sk4VLZWzt5XO00rk5gFrGgwuiiMwcxfyGTDRjLoXIag+jmfGbUu6TR8zwEXjY8aQ2E6
	HE07A2MRfdAlyGN3asLQTbMA7+k+2E1KOfdtUMBR3GS0vK+apbAVUrigiyKla8BEgN+Mu5sX6I0
	VZLMEn7i7kpehZN16NAOxm+gbn3uSO8zH/v/IMh/ufcAhFhXh2yPFu1awJcCk/0ug/tyajQXq8X
	8TJclUHT4FmKcnqqN8SolCEKUohHLhcXwIKEGcyMNauIaAaN+La1x3EuL5Q9ksljSK963xw8DZ5
	TXHt08QR36kTeCobwM9Uv/7EhyWSd8i582ieXvV2/d769ew3+Bo5hY8ItIHP9umi/EZCawZRrV1
	qGl/8h7QfYHa7GyHJK4oN+lh8pW5umhipNaN465Eq21qwvxJutej1cPCHOUjxj+9Zq+9tHhav1/
	eI9cDdEkzaj5cwOUwxctZKS4BD2MUOZR1s6B9b/VJ9ow8wq/yGCNFhkaqlwOj7gZuTb1F5/au1B
	y2w=
X-Received: by 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1d75ac25cmr214576945e9.1.1792452263000;
        Mon, 19 Oct 2026 16:24:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
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
Subject: [PATCH v5 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 20 Oct 2026 01:24:10 +0200
Message-ID: <20261019232412.516028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019232412.516028-1-ansuelsmth@gmail.com>
References: <20261019232412.516028-1-ansuelsmth@gmail.com>
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

