Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8286427F754
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309797; cv=none; b=RmZN11b01St2KH1lWqyE8krCmxchlvPCyDwboJyc9vW7PsxCeXW8i70Iqnv7V3n77+0dbIoTTI+fE+hhWThXzH4tFyxMk4hqneMqI96u4SFmkawyBm+Q83bzcTzCqwKuSCDEQun6sDMcdjV40EJSwwfCxFl/0q6ASt3bVxlUOeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309797; c=relaxed/simple;
	bh=wLNKDK1Ksa8IvBF9PuBpNgl2cqbJ5Zaav5WKCmNUHgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxDtWADPwTsPny/HhGSFl1qYAex32V1L87V8aXSzqQFcRKbqpjDwuJNkr4ZMPfjNi8yDDvYqW1l+KFzzzKu8i3ibFgVNNZByxDH4G9oRJVBADRmLaNczRl1B6tjFkQWu4EFfBDP544P7hTB10EIjU4b0Q3umR7k7Dh4nzwpo3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPO4igy3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPO4igy3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso33254725ad.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309795; x=1766914595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=KPO4igy3MwzF8i/DFjYB1wELeJRD8s3RWklK1wZqCuZWu/ufdJiH4sKPKlGl3Snzok
         zPQ2RJ/WJkD//q2XnSQ2iM077axjlNM6ArGQxrQ3Dcpmpy4lRkW/jv1+uEF0HDtna70r
         bNEqkS86Covw06wvkcE6gnx+3ooAejyVUe4qh5uWHyo4eYPQIPNUX8T48UM5J4NrjZTP
         HKF0R6S98YllSb8T7Z/RxjGwqmK7J5XlEfBaYr1NrK7vT+gZoFiN8TLbWThUgHfzBFdC
         BWuUGZsPim3rkF7cMZQDlFSypJljyvCn9NphqRFRK9v9PmKBl7zcpjDeh6k580jNXSQs
         dhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309795; x=1766914595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=EoQeGVE0c5IJBPgCjH8Tq42C/S9LBHvTkLKU3PhnZDbgzGb4LkdoYNPnLpCC6t5VvQ
         hQJraHVLRbTEEEai4tpKB0Vd8zYh2Dd7Hv/KSWO7vP/8VNeNYtVH2IcDBbnXGT6moaS+
         XqIfDp97XudUBQSEgXYjkoAJyn0BEXXsEeKAJSBNzGKcThQ2ROr99kJQK3WHnsIFg67v
         OJejQirl5UO1a+re/BVVlED3w6Ei5JBAzSuAd6nzDMB4gMxmYRnF4jscIveRzHXqgEur
         GTLg9lp/EPLvvZoMozlk8DwNd7wTx4E/Aj8eoixQieXM77J9f2LoIIcPycbn2PlDrAhr
         TYEw==
X-Gm-Message-State: AOJu0YzLvm7GVq46OYejz1/vDcIQAZaLkwOs1Q2P3t+/zfEGfvarSOxD
	1MiOyT4YRd14Rq7ignEEUzfUOYYVt5jwfc5XiWBGYfPCDyfqn10Sfdx9
X-Gm-Gg: AY/fxX5NS7NimZxFqbYYxI+T8+MT3viJ66i/kmhHCV7Q6qnSJrVl4h/VA3htR0ecro5
	Bd7b0KtJkURumH57M3QBjk2mRn3kK3nxxXIDFDMxkXhowbEPY0rszLBtRhedjEgzwALAy+9C+7P
	k/BDsph53ByqYqdMVTav1u/jjfLRgXDTleorNI20ybh0eU6nv6l/pMppDJIquwMMhz/aOOTO63u
	FGmBMeDo/4ZySoFYGsR6/B1DJ0fqjravLAcpxFl+1LTVWXR0al0wH1FG4b7lO+ibMbuHvy5l6UB
	F1ZkoyWBtCMerw8uQmQqxYgSFYP+WScpF6+1deF8Cs5MltVG9VmJz6+BRzfSTppxuFWpsjmmy8L
	hY/+WEpyX3Mj8xUv0MlQSI41RePdr47aJlA9UT3xl3bFYmjktsWb/HJ1hJ5k/7uzrFZVcgexj0g
	u1TsFS18mixWghZnNmgiFafqtaGqTW4H7n6ijgo482UbhqAsQ5PH0AdrUHXDcIy+FCTFozR6vtr
	SNN1ZC5uqWgrR4E66AW4+S8HVhslvHW1d6dfM3InWt+cHu6rviKzQr9PsESfctSFjCpZiTdJIh8
	lZotxb76MMhiB3d0cOZKQkVOSq1b2VgeY0bAgfBS5IIKKWmALOw=
X-Google-Smtp-Source: AGHT+IFs8ZLMfIE3d3XHgVfBBRp9N/Xz/7Q3Yciu4Zx1KzdlptYhBCkrmMcDSDnGkifXqXR+tynCEQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a2f1f789ffmr84830365ad.0.1766309794882;
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:57 +1000
Subject: [PATCH v2 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-1-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wLNKDK1Ksa8IvBF9PuBpNgl2cqbJ5Zaav5WKCmNUHgQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+ycZpng++NQindbr/C9KSs30ZOAJX/aXPs5dTfV8S
 bnH2e91TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApjqiieEn4xTv9YWv4p0dmxtFL/Bt7eC45cV1atOedhmG6OuVur9jGBlO7/aRtj8
 5tYbbamVp7TlGR8O5y6pl6xu5+yY5LPznK8MHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ---------------
 .../bindings/sound/tdm-slot.yaml         | 49 +++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..5bc46048d689
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+$defs:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+  dai-tdm-slot-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Transmit direction slot mask. Optional. Drivers may specify an
+      .xlate_tdm_slot_mask() to generate a slot mask dynamically. If neither
+      this property nor a driver-specific function are specified, the default
+      snd_soc_xlate_tdm_slot_mask() function will be used to generate a mask.
+      The first element of the array is slot 0 (LSB). Any nonzero value will be
+      treated as 1.
+
+  dai-tdm-slot-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Receive direction slot mask. Optional. Identical to TX mask.
+
+properties:
+  dai-tdm-slot-num:
+    $ref: "#/$defs/dai-tdm-slot-num"
+
+  dai-tdm-slot-width:
+    $ref: "#/$defs/dai-tdm-slot-width"
+
+  dai-tdm-slot-tx-mask:
+    $ref: "#/$defs/dai-tdm-slot-tx-mask"
+
+  dai-tdm-slot-rx-mask:
+    $ref: "#/$defs/dai-tdm-slot-rx-mask"
+
+additionalProperties: true

-- 
2.52.0

