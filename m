Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009457;
	b=dPwHnZZRQgRJI4H+iIj0A5+bJOLJGipLnrXRQgHiccYmzR+PBRJW+cHJVgX2PHxOUKll
	 kKJgyNM8QTSxizaAj908dJLhn5rnFsmPG2s5hE6IoqJKpqNgezpusUfOeZCaFmokLpe3M
	 p3d3/mqcyj7V2fjV1lv9Ill8HM1DDSPxBvHBCqSIwb90yBpk67gSNycJC++2t1CVHmm6Q
	 lkwaV0aJ6cXdTLQjZ4yyXpjEIrjdY4Kpc/7aLqnTv99638MKvfk6oc2ZHRUFSgffFFZyu
	 iaP1xxnv/n/E5yEIZmRGkGZ2qESW24mZcOCZKO/TKWf3n7ZZDzPBoNyHvZ3n4gnZsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
	b=tcb4I7xODAM9IVuh/Nt17pMX8kF33NqXJB+ZdozZiT2vHXb8Rp83Hjy5oCx+NoxvxJwh
	 vFUu2YkV2NuknoOgeUYKLywWbNJ0A2iyuHkD3l7/3Qi/OaozEhCOd4RMEyK8q3X6rKoVi
	 fzuyEafuRK9jC6O3fy0jef+uoOcfkxPoTiHqgQYmF93RmClYdq+ypN5XHhWTxv8QyPveB
	 ijJRmVy7/LDbifpvIxMU8o4ag5byPi994JdKtqjMGjKbHWImcoHeCSg90tPY+aCgZyNHH
	 u6uJa2fdV/IDlsCIR9WkaLdk/w064Rrk1kcl1iy7nQn6XJTVHSdQoE4L24G3ovx4JMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AE960A262A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4AE960A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OxUnodPm
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so22175295e9.2
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009455; x=1793614255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=OxUnodPmUTC4nxwmk8+lndH5TemiJmiV/MXQqlMZCjaKj1XrhtOrSC9MmLLlE+NNDU
         J1l5saJAI5m1GsVwLNVrCh+YcQ3kXp3supWzimXI578zbtFu4r9LyvZFwVJwzuZcI2Lv
         AP0DN0ecaNEUt+ZAxW4rlkZH/3h7YfXQNwdugf1uAO8pkCIriAEa0Vt2PxQVJRdg9T5p
         sOkMYrAQnD1pqMIevWia6fRTPaYkR1lNnNFqOjw1rtyXEXUr3PNoWSaPj8cEtD7JpTXw
         3jB3wap54H4voKpkcaLXWIw0uWY7nxruzjZOcUd5DUkg7qw7eISUg/KbSTpNMLVdCX30
         SOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009455; x=1793614255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdjU0nN66CDCTthyEdcRG7z/U4R3M5sRZM1oMXC3PyA=;
        b=2bXO84UhTIRw8yhft1/wk/0dQPd+wbjZYtFylS9+T1AypAaTkk9zZROYXBnxPrXlNq
         g2HBiFJkcdi9d9w7ot/Eyft9uLIEYHbGt+UE3Nd2KVgDwKbxOCPkwN4eiAMa9t4zkBUe
         AzjBkvFNviC0gx6l6+t1wB9GZgtsP/iHQ8gAogYc5HQeok/X3Z81Q9lLGbjCtF9T/rpH
         QXN6z65HfuFI3TfL+revmQbPEaCYFEWIO29SeqvuY3bfqDL8NROgC0kih1u7OAw/kZVx
         R7zjLFK0BLejb8s/SCJzf0hnMebwa1rbeyFeNU4xsJZfXaOcCAd6DKwd+KFpEFRF5YQq
         5++w==
X-Forwarded-Encrypted: i=1; AKwUvBxFhW6FFuby6LzZNnJVBPQ8WvgMfGuBLQO9l1/5+xz51Lqj+FvQjkh5s+DVk2c34vYxUiimhU8zZjDoTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9krF1FzhntPfKHfeUiJ7lwG9bfslRahhDTGpfIleb+j8MKEgT
	Vqug9+0A41oCXmU8X/x09+rfTMDCjt9vmi8LWJFFuGJvGAW6WQiifqX8
X-Gm-Gg: AYBFou3013DJcrhb17Xs5njW4CQ066xh/HT6r3QZL6PWcBhJmrjX6Xz8OHjfSYbyAh4
	5c+0AGpRbHWJxS2uN2Mz87RL39JVQkBIqzyYgDR0RPd+st33sQXI2T8OtPWvyK1BnKzUGdZ79Tt
	nfnSI1/Id+bvfroo8I6uQhn9co7RGkcCoFyqTvg9opKj02MecwtnVf9UoAnBaGcbN0CqkwIpy22
	rPNls/CMtqBRtSIxYXBsD2LRRjNWgbiF5l8sQtauf6+fIMssZN8saK6ODNh+VSi0ejIOlaP/bC5
	xZn6IiVpwLJGMmI9gXBIQH1wFSWII6nP5zfzSukRyHu6clmcb2B3af+9dihIubqrOm3zLI/LX89
	Z+Pfo5EAcE4ryBI9NOtDwMoZ5+DZznlNXRUNZwlBFY2XYrMBalYQQieZEw0qezK+wKbNWSLJTlo
	gRJ4pDsigAjzuG6YdQTi3cLSmMQUpPjCCj67WXZ8XAdYUlRLLiJXWSGQ73L5skMnn/XusJLKrWN
	SWM4a17sFwyDMtyR3eaQ9sJY8tTdDcNYaBIfKUeiClQ6hE0SVrDvQrpyd9ibM0tXctc/Xv03LYR
	wQpzZEK2ar4KC3iUwb8GvwspE4NSJChmpUiYUZr3J5e7Zl/CB94PkKk+UXiF
X-Received: by 2002:a05:600c:5253:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a35acafddcmr120739425e9.19.1793009455114;
        Mon, 26 Oct 2026 03:10:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm15773487f8f.46.2026.10.26.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: an7581-afe: add support for reset and secondary IRQ conf
Date: Mon, 26 Oct 2026 11:10:24 +0100
Message-ID: <20261026101026.34318-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Driver got support for configuring the secondary IRQ configuration to
support full-duplex mode (playback and capture at the same time) and also
to reset via the dedicated SoC reset line.

Add the property to support it and make update the example accordingly for
a more specific register mapping.

Also add the missing #sound-dai-cells property required for the generic
sound node structure.

Previous register node definition doesn't prevent normal execution of the
AFE driver as the additional IRQ register is placed at the end of all the
previous AFE configurations.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
index 80d9e87f1470..86d006559436 100644
--- a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -14,15 +14,25 @@ properties:
     const: airoha,an7581-afe
 
   reg:
-    maxItems: 1
+    items:
+      - description: base AFE register
+      - description: secondary IRQ option register
 
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - interrupts
+  - resets
+  - '#sound-dai-cells'
 
 additionalProperties: false
 
@@ -30,12 +40,17 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
 
     afe@1fbe2200 {
         compatible = "airoha,an7581-afe";
-        reg = <0x1fbe2200 0x9000>;
+        reg = <0x1fbe2200 0x100>,
+              <0x1fbe2f00 0x100>;
 
         interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_I2S_RST>;
+
+        #sound-dai-cells = <0>;
     };
 
 ...
-- 
2.55.0

