Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE827FB0E
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309805; cv=none; b=dglUG6LtmE87u7KrTq7jFma9is8Y+23CWrX6q30ewR9tc8yq/jiUCZl+FJpYxhrzUWX9lMRXeoHUJnGkgSfmDlFK0F6twip3UEto3cu4bJya1AZ1NO9i2E6dR9sg2yWciU+yqcllLZKpUsyFlCR8fC5eRux+/WQjdrwFdbAb7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309805; c=relaxed/simple;
	bh=J/JGbSI46p8HTL2RHYE+qUnCr5BQESuhvOilzbTTq48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+l1cd7BzZslWci+L5L9lTqh4+QCLv4zAA8MPSmRmLEE+KBIRvjjh05xszhOLylDT75cYklkGUxkibfLmM7wuFE4TPO9Yss/sFkpA1Yxw9SOMDZdTim66ZkOh8YygP3mk9WlViVkAKVeQddiM6haEdQ9q92DIKUSDV5x4M9XaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0w3cdoR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0w3cdoR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0f3f74587so43318555ad.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309802; x=1766914602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=L0w3cdoRq8SShIxxbw9BZiYw6wRLnHfbkBwZfQ+pOJl0rkbK9tZP+dLXNPr6A46aH7
         xz898AU3KuRe9ZrP7hKCWionxZbqKUX3txLZvsWBDP6EzVWCjFJA+IcqShsb/+8y5dhM
         ntUkYlKHnRcJWivFyJMy5EROLbv0FMJrMLm7uBVsV34XdsVe3mednQg7IaGkRFFam0+E
         CbTxo3QqWP3q7qy8rZGsDKrbk5Gr0s++jkLfBSoipn+k7E9MlloRKsnmlcx9FsEcmjZD
         WHWmTYpyGdzTboRleCrDEU/fM+nHgLQOkMnL/5/97wMbIRsrJLoyJX8yygxVMzoyXFPe
         dvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309802; x=1766914602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeZmpsDdG1RUrBzKUX3sBiMLnau+8z4mBhxLnyXrfgM=;
        b=GZshu1Kw7TKNsgXBlaLfnBjse5qkRpl1yPKmWyBX2cLRfTg7cob+739fzV7OH54sLi
         6bUpNft0GkF+C1qXuyRNrLI3mHHS6gLTJcFD9iSB3kcKrHTOQSGE6dsuCBFHbu1hExBj
         qj4U1vWMmdlnYr19jTEmnX9cztzTh0KTFqRXimTpc5B6dRx0SYZmGR8Pq87QsZim9rXi
         M4Yi50Olv9O7mjsmRlR6GerYbpw9mt607hBBotW26rx1PVYFOuQa0akJRVHVGXZAZmAU
         Uo8gz6WByA0XzDeh6k/9N8ECNOMBUrHusNdO/Q1NsBhdzpo4ADiN7C1FLek74DCvIu1r
         dIiw==
X-Gm-Message-State: AOJu0YxapBIQFtGpv1cYSgUDER7PvM1nPB86Mj7sw17AnjnedKOSkDce
	ywAbUSbomphpQX1KJEg4QfXjRwfrkrGSj8G99TC4CK44AAj67w1Z4L8J
X-Gm-Gg: AY/fxX6c4bVvhacN7iHPKv9kh+9gp2YOVbQYSNGdlFJivsAO5jyxCEfhA5jx9TWuKxn
	W4ZBB9Hlf2eHXi0NwpW7yaKTO9E/ZBSEnzm6QPFL4JaJzZHFvksbEqz75yheZYqbUSZ0B2iCAnB
	7iPWt5y2x/6X9W4XQDXr6VizkuXSTIaeXVwPdKThBgM9bDMA1MnbPz6IDbY/XK7V3IZicA4ewV+
	rmfpU7aAi9lUMnM6Q7SDDVvo14C5q3Lbnif/PDeePM7hAclLE2XfQ2ryOB6OX+pmuRl0VlyCes4
	CO/Yjzv6JRaYsaJVItrmGIZTTTFv0fEqAh8v/6vpztWOMlx+qVS5BA0w8eeeerVTaekzJrPcqC7
	43MVo4fOFfvSgIuP/a69efEwCIg09+ojHH9q34Q8jSbuYHMSkPm/etu4QtlGEGu54t3TZglFszj
	sn4VQ3BCPAzzkeUQh74dRuN4I9hLFTMesuz4VinliGXvbyYyUeF+jGrb9Hr27etGkyDFJWkZKEE
	B5pZpMmMzUH64dWWnshCDTbjb3zO7w34Sy9NeU8694AvN032FWlLt3EmFwJ45s3jLRC0PE1hC0D
	BQF8TWioXJXEwX9dsNvb+iHhwzq2fmN0PZVSGiNTgrj8xRYGfOAqS+otsTz34Q==
X-Google-Smtp-Source: AGHT+IGmGZRoabrxlFiBda/1xG97X0TAK54HY5FazNa28CSCbtrIjPg0PALs67RO4ic8ZL4omZOAvQ==
X-Received: by 2002:a17:903:4b0c:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a2f293d04cmr67609985ad.42.1766309802436;
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:42 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:58 +1000
Subject: [PATCH v2 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-2-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=J/JGbSI46p8HTL2RHYE+qUnCr5BQESuhvOilzbTTq48=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfNENmnr37sueAd3tzaNTZ3sqsW8Jh0uRewa79W3
 JQxpSG0YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNWvexj+6XktOBa64faCSAYXoROlpwQKz4VnvXmq/fORfa2E2mnVGoZ/2jEv/Bt
 3CZ3bYaGv51FbZajFc+0Y/6Ez7lb3yl9FvvvOAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 14 ++++++--------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..eb702f48d694 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -31,6 +31,12 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         maxItems: 1
 
+      dai-tdm-slot-num:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-num
+
+      dai-tdm-slot-width:
+        $ref: tdm-slot.yaml#/$defs/dai-tdm-slot-width
+
       format:
         description: audio format.
         items:
@@ -38,14 +44,6 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
       playback-only:
         description: link is used only for playback
         $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.52.0

