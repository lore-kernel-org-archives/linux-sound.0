Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691638;
	b=v2mH1eqr2dPOJBfg4KihudTcy7mZ0kyyXCTY6O07DPXiNWDS81hARd60LEWOlK7RddNi
	 vG6GeTxhIr0Y+Jdj5q+uYgBwaiZZsm58/qQ3dGJO9HDVJTajsi18vZBBtWdNYydyZrOsq
	 ffxpL5JFHrh5Pzzm/uZQWbVtq9oSkJlxgh+EBPhNhvscdaASJc5EUezEKOA7rpwBJIp2M
	 /oLU7jM+SE5RhR1Mdt8ExHVxllysCt5D9PLq+tEZbbPWwCNGx8Z//2XV1JDbcBnrRvPBB
	 Aw6TFUEBupc3qMHEqUdpb2ZAmQNg52/aPAvRPR648+L6JMmZUfHLGi//bwSpkFA9T8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
	b=ehvc6D8mNYh2pZ8BRSBSeTpoeatW7Tau7few7KsFAMcsZX7+wuStMluOkSJ7W4Gm0x1U
	 X99Phq3/sRIP6hOoTiX0caIhmB0ECpnCfGA9aKSeDDilyxNHZKlP/J8dqPbHmfI1iWKaK
	 LQ4my8uqJ7AVJ7icRWNykjIs89FJY6m5SDuOjL6XwJ5vpC/IrF9UcUg9PHRk7flLc3pIX
	 8Y9y3XVMN4AgHxB7F3wSiwuepZpSfvjMXeFi9svhCMnjNfgH9LzcVTt/rwgkehd0fMTso
	 2jvLAX7kHAGpJtbhEAWoYv17QpGiGK26F6nZVcG2z8SHNhm5H2oAdSllWecKe3wN5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEf6Y4y4;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99325606D801
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99325606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEf6Y4y4
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1833827a91.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691637; x=1794296437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=cEf6Y4y4ovjEezVUnGTVgsiAPTaG6ZSWD89W1BEoU5gMCMeGBjh8+XHfmjZU2HkKt+
         VKzdV9bNqT3k8SsnZtwtYFcLjVyioZADWBE9rZ8WWzF67Dxd3Hu7Uk9/AD2uqtKNjb+d
         0bxueSygFt9/jQx1lijCEmNtBI5y5oCOS2cra9lnADd9cPQtEIFzVfYWoxeHLP19KVLI
         XQ8FVzWr6eBzfRrcFIfW9zt8+eBfoKkTqsyymJO6hGzuWxwMehuJrmtYTVTfmujZ+w2N
         3cCNIoXH/5KRjQItSOznjDaKWF7wzt+iX6Ttzsx2JWVVZRQ1ANYCwuhpeuJYShLBReHe
         Mwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691637; x=1794296437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=gQeIjES565f0687/KcQ0BBzRi+wXn5U7orAmI+fUA6Mo2n05Kewsz6trxFg68jZ9p+
         V/5OILsxWPB0UxIaONeV2vdu8bhBRr1bYxR8KCSkSmO2aVrJ8AJXVT2P7dK4PW+OCeVU
         rSIosUKx537JAgSGLec+YG7/2uPCoMgVo8MeXWiY1YsbW98t3d6ptT/PE2QlUPc0qW8q
         o4o44UeTrSWrz2ECAUQfDspnBSNRzVyOEj6Flf9TxmGTS2N+jPFWVYdcKk8fWpN5EnlI
         hUWMlSJUfyRLPK8CxUDQMdTdraTpdj/2u+qOCOZsiRYbkxvF/G8RT3s9ZOARGqv/s+in
         bE4A==
X-Forwarded-Encrypted: i=1; AKwUvBy5fpf+7K0yGBKUNfa3Ms9mo93FH5xz6YHURio4+48suyt9F6RVIx4S5rr4rOnTRw2cHRGGxgB5LXHOFg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OmivbPKaG3KQaumMt5kNgQh37Zyh9ls5Roi76er2caV4kWTAA
	w/hdcXDnK+dZoNGImF8mAwnUmzpM0YJqo8ig8YIuPJFbLhYQ0ahVHvsv
X-Gm-Gg: AYBFou29RnuKMr+m1GmKXN8FIeV2KchhrIF0MH/pDsf75LZqmwW/6OocVS4s/sC+6A5
	9nUzh1J2B/LIlRBqMR9bPtPc3gCiu/fJk5k20s5eGzFyBuDB/63EDk19i2JBJ8WQzJzqaQY7QZ6
	XA95D2/d91XvoA7cTIjyNGan7WprOcRkI2IXmH4C6NLW7m6HD6eac5TQl+OzXjL75RPSBDXmFvy
	0SKqf2qWhusIqAGrbDu1O9ZCAxDtdmmV5/tvQ5PsiL337ajIadm8ZRbY8bqlmMeaimQU4F3juuA
	w/ncWH4PaoQIzJcAFDHlOCh+I16EEkKgE4uEUCDa9z3SUYTO5xW+VOsQc/VGvGD5h+ltmvp3exY
	DoN7jtXQJWuWhUeO0FXF+3OCVCCCk1sRQWnlzBydaeGSeucu+8lH9H6TKrekf/twwCPZasVOXo/
	DjbM/Lyd1/devRJRTZ5PVepq1haGLYd/LeNVQTpXE5+S0pyRTo6Z0SFN49XtEwQEFlvLUkqo0Ub
	4ilIUxbX4gjUdDQowFDTZkOWZ4f/r+7PzyPILFI8/aoCN1qC/YHyQl9W965l8boZy6kvZ0ZG7Ip
	umV9Vgjmn/0EK377CKdX+ObwfdWvsYGC/HhUFNcpZFP5pof4+N5w9j8oIQ2WTYNigVoa8QLTRXP
	XaYeArG7JF0XBaVrwaCw1xOHkE5IpRle4rMkZBDbpo8TGHvq99P+SDgj608fTuEhLa9FWswwzaj
	ac3M/ApJy/+klfA9VNpLYM7sDZ
X-Received: by 2002:a17:90b:4f8e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ae897dfcdemr8833525a91.35.1793691636036;
        Mon, 02 Nov 2026 23:40:36 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:35 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:51 +1000
Subject: [PATCH v4 03/22] ASoC: dt-bindings: tdm-slot: Allow indexed TDM
 idle properties
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-3-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lpUwLsyqda9INXeRL6PY6VLEX817T5qBt0mzKx25Jk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+882p0/bfXvzvcc3vMICv64vqJBaIVJ45PaMIOl+0
 aK7r7k7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP99h3D/9DvUYsCT528siPA3/Og83/xD+uzqmR/8m9/EH6Lp3dqyFyG3+ybZb5
 ebCpyWXD+8WpvzoYfbbyaIawF84VcgxrqJ9+TYgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to configure a codec's TDM idle properties
at runtime based on specific dai-link-level conditions. This could
be achieved by doing something like

dai-link@0 {
    dai-tdm-idle-mode = "pulldown";
    dai-tdm-slot-tx-idle-mask = <0xf0f0>;

    cpu {
        sound-dai = <&some_cpu>;
    };
    codec {
        sound-dai = <&some_codec>;
    };
};

But what if we have a dai-link with multiple codecs across multiple
CPUs? What if the machine driver parsing the dai-link only expects
idle properties for specific codecs? We can extend the idle properties
with an index, allowing unique idle configurations for specific
components in the dai-link:

dai-link@1 {
    dai-tdm-idle-mode-0 = "zero";
    dai-tdm-idle-mode-2 = "zero";
    dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
    dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;

    cpu {
        sound-dai = <&some_cpu0>, <&some_cpu2>;
    };
    codec {
        sound-dai = <&some_codec0>, <&some_codec1>,
                    <&some_codec2>, <&some_codec3>;
    };
};

Extend the TDM idle properties to optionally allow this indexing.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../devicetree/bindings/sound/tdm-slot.yaml        | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index 457a899e8872..dafa5fa77006 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,20 +20,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
-  dai-tdm-idle-mode:
-    $ref: /schemas/types.yaml#/definitions/string
-    enum:
-      - none
-      - off
-      - zero
-      - pulldown
-      - hiz
-      - pullup
-      - drivehigh
-    description: Drive mode for inactive/idle TDM slots. For hardware that
-      implements .set_tdm_idle(). Optional. "None" represents undefined
-      behaviour and is the same as not setting this property.
-
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -44,9 +30,25 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
-  '^dai-tdm-slot-[rt]x-idle-mask$':
+  '^dai-tdm-slot-[rt]x-idle-mask(-[0-9]+)?$':
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Idle slot mask. Optional. A bit being set to 1 indicates
-      that the corresponding TDM slot is inactive/idle.
+      that the corresponding TDM slot is inactive/idle. Can be defined on
+      a per-component basis.
+
+  '^dai-tdm-idle-mode(-[0-9]+)?$':
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property. Can be defined
+      on a per-component basis.
 
 additionalProperties: true

-- 
2.56.0

