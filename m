Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B039EF0B
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302895; cv=none; b=X0HVSoWJDc50c5tH33RCcvQIxRqDZKquGru6xRm3duglm/KL1FcJ3n8Ag10gDD/8E1gwzRP0mgrnOzaMgScLjDtSeCO6GWyWY49VXAkwoCAJo0VOOMHrvBT12JCT+rKEqTZEfXPG9fgObytjE8gLe6f+t1hrAnR9kGLh4SBtAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302895; c=relaxed/simple;
	bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V94GHNutNOL/u15X4WxbxVv6bkTtq87r3JXze68/wTqNi29XRvcabpvWemzCIFZU6bGMyP+a/CcHt2lgcXaNMo2tAGQ0a8Dt400nreSG/AGgqxDtJmRQODimBpOG6W1/sjxmqzTJugZ3kD9DBAycnRj/KvYnPph9niK1TXEURAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sneIZi1X; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sneIZi1X"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso621774a91.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302891; x=1792907691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=sneIZi1XLP0BZyNRCFuhpdzruf0kyXZoVJoHbRBhA/wicwUobh2FH/7DbMS/KaCoNw
         IUiwYtMQSkMhbQFAlDrPfiXjeFl3Yjui+0dhRBiKvWL6JXOYip/Rmtae5YUnlbmtMTaC
         EOfSpUgmt6ufIetLb3lVdEDvHvkj9uLyn6k9RZH90I9DjNClC+iJVrbRZ/ocKd3eH/PM
         t59/56wmDtdfHeoRtljKQTzl+yFtTzGFeSiLmreWMQrcW6eEAlLLWkdYTbjRn2RViVmy
         hBKah6kFnAqhrPsDjioH23f7LHRgtBE5GjUNg9jT/CZ0yILvZ6kXRe5GsTsIA+bmWo9k
         MJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302891; x=1792907691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=CmSGO0imGMEEF27B1Rle4WectUaPzKDdvh1+yU7YXGAvF9bFr4jlpArJamTz0lnen4
         ik3WV8OSQDrtuLGa1ht/QET6upPK5NkFw9l1bJJFNZQ0waLNgcH+aS/y3pNv6Vguh8vm
         X9+477LhPHOk7p86jGWRYzFqGKsA68zrtH5fp+X0YRQ4R+cBHLiDgdnSEmy3zta6ip5O
         i8SyceTq8u3G5i7lMWea9hRHXI/wyEYOxBaWxkmEb32Mlrgx2Wv25VpTdcCYdVKr6ZEF
         AUH9Nd2WVMegKTQSGAI6IZq5WIPQQF1DBHKn5q9G7L4Lrv0WZ9XiB8t3dXkuFUioyg3k
         XRVw==
X-Forwarded-Encrypted: i=1; AKwUvBwUm+LC5Xa0heWFkn+CAqzlZHd2mmFjUxZ2YSpQbAaLPLZGiU3zN+OUVJmW2yRaCLBw5nOcN6k65SI42Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDVFXjzf/3xcUdPVaHXqEQ66tNjwgm2yC38an3qZohR160VVEi
	BaotuLM/Je8k7B0Dn3C8QcBclJOAzRf3i6XFX1KkbJgVDJztfyJiotMb
X-Gm-Gg: AYBFou3+HrJQr6WJYDumP1CJK7Qn1VdjSC431BD0ohyl0b0c3pyhgIAmUKmAlKs10Or
	yNqAN0Dt5nCLLqzXuefDUHNmpFQOeG0Y9+07TQLvBjd9ck2kaEVaZrnAl/mKVdA84+8jdPN7W+G
	aAfS7rHV7wL9G/iPCtSIafkF5MfJiFMLWFVHvyX0rkc16LtW3KYoveKL1az7EJau98cvCuxPK2h
	B/qX0q69zWLFl4MNW8DnKl81Td3EdAfHJHjchFgHEd63QnejIdS0HmOnx3IFkOntcEOJYwHsCiR
	Wu0Vv8AUv8BL62pr4yUXIRf5qv5kEJQpw8baOokfxun9M8FzDgnF241z1IPC5bqVJeQPbS+h99I
	V/2VQ/i/zN0lgxDyKOL8uDQDu/1vvcdwzWyVz0U9WEPf20Y1PTGCpd6kL5EVQIFfjuEiq2PctdU
	pW73jX74n8e9sXzJlHLFfIOBkC8mxqjfLKdHd8xp5nQZDSKeHHKLribEOm412CGvz6wXwIx0vBC
	oEFPCptEP3GSDk0WwsfJCh4U4gCML9Ps13WtuA5Ooj93liamG8FlRxvb1Q4eqYT9kvrH2oQwx/z
	cEJ+sRCATfoX1FBsvgN56UmWo8Uos5NXD5TxM+hFP4lOjw==
X-Received: by 2002:a17:90b:58d0:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3acef4fecf6mr3732599a91.44.1792302891525;
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:56 +1000
Subject: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rlTeKpVfv6wUL6uLDBT3M/t/rxVmzZdc+bY0etwM
 WGyWP2BjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvjGFkOC4T3xDivMi+Xp+N9cutX7f53geaWFz59lmMK0t9j0zUWoZ/Ju+z2xn
 DitQ87ulqlx/71RBsrtutrMOfZxNj/tP5rzQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Document them with
reference to dai-common to keep the style checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..aba2121ac64a 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -26,6 +29,10 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells': true
+
+  sound-name-prefix: true
+
   VP-supply:
     description:
       VP power supply.

-- 
2.56.0

