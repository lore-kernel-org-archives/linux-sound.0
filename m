Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691619;
	b=ezYppzLzUbQE2wdjJ2CFdcFeU8wql90c3eRMVytQVE26TNSHg6LXFz/HqIT2Np0DKCxb
	 rMgmGCBJYr0a3MnYOqxWGGH4hdWhkM+CR+ncn6ygSSk3PLbCfuPwqGHCpU3mgEIYlq7iJ
	 5KXhMIKD3Cj6T4dHAjWQCXDyneX81mrHeQk3VBhL7sou+F5Mvzjs0L2MIuu3Y8GQEhx3f
	 AvokuOxa3Bjuf1jmaASewBS0mGN8iiSFhbH8PGTWbliAomWEhUw9UPP0EVCKkL/8K5nEf
	 ZrRKBjk30WDCG04xgUJpBmId4ZqBEbXdRBNEtGGKFTpUmpxZTBDApck6RK3wKn7xSBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
	b=tEzNVv0Aftm/bzku2HgX1bLfarPVkR8i25yZW05/ZaTP+Jj3beP8OakNYOkbKciyWJ3j
	 hAGdOCs5vxGKeduSthVqco4HWSV+vLeisjYcPcEpkWeZ8AEK6V2lMtKaQaGe7KW7fEk5h
	 O5Ueu6rZ+GBq2+Vni9XEAN7ga9FtqVuziQzuTnoNKAPqM9Cph1OnV/GtY7fRF3WKW+DcZ
	 0nqwarqW6cFqAJgw+akNhTJwL0zr9LwwAFhEe2NXDv+Up77C3f+SaxMc1uxxGd671jZOL
	 8FYDWtuZxJASqLN50x4c0+7z43YjWIKDVEyg+94wVhrVZIYTm+TRQcPvLb/YzT+Ja1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fcs/g6dF";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66CA606A32C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66CA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcs/g6dF
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2311630a91.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=Fcs/g6dFSc0b11V8fn/wq7r2uXy0D38y3byPrfbxvZGznF7twrxZGCSCRURY5NAujW
         HOsD6jLAkwaH1TDt1pjOlY2U/S61MxsqgnN3o6T4YsjX4S/J+azOIsHazafqMTcMSAah
         vrsTyf3MiQUJPa8phLQ2SU5sRoFih+/ZCfM4xuNh9n1i+/L5Q3WMi/dYztiPMsMK1Y+H
         IMrv5dFGa12oXDoljzQVpc2Q9DR8ca4+mif3roiAK7aqILRF2VsBGuF0p0A7KmE4Bnaq
         cZRcH7YcrwBHYUBGhCylpkfFGxar7McVGJF4Q73D5655It1mqbUIoKN0G5fsda93ugJY
         y83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=GCLt7kEoki2+J7KHx9lWKQ/T5ryVq/m+eElh2UBYG//Ynf3Zx67C/uNu3R5dIHCVeu
         xw1SxN2OkOwtNG34HAKu1RnudKaF38KoMHj7JN9Ut2FRRzxqpvqG71XuCadfGGzDuXNy
         l1WAl2IBib/e8vCcX4AlGz9GW4N8TJNwcTxxRazKCW4zge7bLqiQZ+7p2FxPm3J8JaVp
         23XNyfD7UEDDRr8lHf+UlBrp2vhvyqltFpMNdxi9zBYOmU3mHCP0xPGnmig4z+dX+7+D
         DLF2yueCjzAfdkdVm8SYThHVxvgmXsRFUlaJxfWRGo7GIYuCLeZNGW23jB8BtXgeiduN
         nmxg==
X-Forwarded-Encrypted: i=1; AKwUvBwK30eTf5N29nvC2zGyl6xR6jMDpI4gA+rLR9nOAcGdFaFJGD3Xd64i35s7Lpp4k3Lrl+7UYgH7n3qofg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gFVAu3A8BNjaBlhjXEDYmNBBhWHBpj7NRko55+0EnlckNYtBH
	ScRPe0l8KatrwK9TytPOWgcVXYZfVXsb1mumBq+iKxf1gVejxe5grKp+
X-Gm-Gg: AYBFou0+pGhMjkKwe3QHmntv80/26dTaFjJCycFcs4bEJNWcrxec/lYky+acyVOTWUB
	pqVUY71ThNB8B2p6MpOSeha3q8zjrtPJZ/cTBbWfYk4EcEJgRkCbloHtBtzXYLhcmXMuhWZBm8h
	JP6VDqYSH8ekggU+u4aED/Jk7FCuntkZAqVqT3KvFUXfH3tR9408aTu/qMC9EIxJ/NbMikeuQJz
	myXMruoVBqo46gr9abl/S8Y/SsU0tSmHmIouoXlgH4rQkHV+zBmtyooPW7srL2QcHWxINRsFV3Y
	lWbSG3jqsxY94SZ0tNG2v2oa4QCC9DXj4dPD5o3TmerVRUoWcymiGujPbqvYlxaS+pdcUD5oSC3
	z20jaCSykCCpw8c+qC1Q6BKn1ah10LyI7325Jo2kYFd7qbzOA0YfGNrsIhljx+B8yG1wZuDc6y5
	1bGwGl68jt3RlsG43lqwbeZgP8W47cUmeXSDbJ1XSeKs429os0x5J5AiIPG1cSWzVMS79ZumU5m
	xiPQZ4D8jy3p7g3hC/sXVdj/k8RjBIzjQjuiksHNGDJDnm3U1AG0nwIkrGmNleN89uikfpR4off
	+T8YASExRb7T2KI6wuYsy+S1HvOctsI2TJoU1vhspIbDzsPshQYk/xkJVgZaZpc1+UIi6Xj64Rn
	gdIbBFFu7K2ePwn8WUtQTt7OV7Q99KJSkmD9ZF9J/vd8DDuAFWYD7nBXeYulqH0g5OFSg8wSLvn
	+b5i8=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

