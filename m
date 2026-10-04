Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAEA360EF0
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093910; cv=none; b=DolUq0Du3cZaXmC1N2RBepOnOJRiAnERyKF9wz88Tq9pQAuk7l4d/a76uXTePph3u/wDTHrH525hi2HVuI9tHQ32vipeZiECzAWGQbwNyGc2MAZFJqzrOSatnq71sgPvchGIL2LYy88cgyDHkM8l4FgkT+hXUicTntiXKYlOgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093910; c=relaxed/simple;
	bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf7iz12U9aag7IR8bYTdU0jHcnK2zbH9GJwpu+iwx/FQ8yzn/4jKlRSele9z5QivIQkrXckD4NWYL9qUiJTE9V7JxPQwp5oky1R9qzogOzpNP+/Yp3vKiK0r3/bsy5hXJMgBCpIkQ7LuPW7hksz+D0sBAqhJem9xUs5K+6ySLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiT7M80P; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiT7M80P"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c9c2df74so169195a12.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093908; x=1791698708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=AiT7M80PNNH9YQXHJtz0g+oVjrbI2mjk3t+DilWIvLVeifmB1kmfCUKlrWEHyhYK8N
         AtHhPfswoXJGUtRrQft5e8VuClgrYgdpeRsU0PO3Golxgk1rgMIJXgCrkZaRFIWTsm1V
         ktpFOjj3dvEbJL6zaRCvHyxSJNUjBQBpwUBLCDo5vMqlhZd8RvAjSOQeCwJZAb4sFs9c
         uc6vlEtvKZx9B4jiVH7eVSbSKcNmRJBEuLrgYVNDLftMKQzjv1yhZCKwzhO/4ViIKfLJ
         yNamEPPBZckbfiHwwAkXPavT7H17eAnwRtqa+hRUF/QI5EZD+3v91YmAVIRwmkUWEpar
         ZutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093908; x=1791698708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=fD+8hUPCb7+jgEaRS5MSPmV3e5Po6G27JOeFT0NQ8KsPvr/SwX/li+JOEW4BfxI50m
         BwOiPtBP86igHeGIuozgXA+m4SWdxYKCNbBnyfugCS3ZXCSS/o3A+ABB9zQUTxDu1kGI
         /oamyjI31b6ZznZs2E6p5mLJ34yfIE+BIjNarfi0kAARG90OKz8CtjoqJGaund9C7kpS
         LGEXD1R24+w4nLmvQBLwq8vjLbTtPn+tsOqRTq6a6DceaYuCIyqEGZ0qnfHEKC3xmLy3
         hKj1cvb7fO2puLOEGsPFqgwH2Xfu7kTA/X+U7AvuiXFKLa6rNGEhjTSkS5swCouC20mn
         RAgg==
X-Forwarded-Encrypted: i=1; AKwUvByvZEVA1w6pUJXe86JERRJLCBxh9YY5jyEUWWMHiqKIxExlAc3c9U4upPFNwfntTSqiS1/S9/7Wtk0U/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLYJ+XiMPkeEgyb220bGTBAeBjzfg/fh30WlxmZY4UVrChRo5T
	BwxJidbQoLP1XI6BBdzlc4RMZIlfbWBl+dIEd/juld7dt1EF/FHzycYK
X-Gm-Gg: AYBFou1h8swYlxW1A7FWdCzWlj2htwNn+hpBHQ1VNU9E6DzC5HghBZKwQm7Z99i+lYP
	yp0DOc0Sz240mONBCgps4zLZ9ylNgsXgTxgPkQVUO0ZXBoedHHM67pmyzVyfhzJQ9MXYkDPyQgK
	oTo/xR8/smA+OrIZB6E3Jlr0896GmmUe1ToHPvsDZPYE/rl3GrCpBIat1rsqPVyxKYpriM+QU7C
	wKKUdQQrYsVnUg15Lxj6EyO7JooXCs+v5PFtWVu5ABHmZOkATT4/DtY+SvVoUrhTDKZf+CrBlDz
	sDjb0O4ec94Yh1BNKnn9j/7Zu11E6lNrYnSLen8/gLpE9R48X/mBI53QB1eV+UI/1C0jXWSCNbs
	CIztDV9yc/1Tjk6qyTsMSQqXdik5GrGAhDVDe9cLlNYEb9kpcZYTshgT2X8OWYsPxPQwvP943dh
	cPyfIAOw27DHn0s864BLssEaD6THr99idJYfU+GnC6epTKa1lD+5RVINHG39W1l1W3KHx586CZY
	koUXljK6XhFSSxaOGvLP7v6ee1McDN6xW1YuV1/KEkwtbCCFiy8r/Xwt4lrIU6nTNqkWh//zbwk
	w6IFe/qnVmChMIAYUeftO0JFhkHJceaPZO+7ZZc+XymRGQc=
X-Received: by 2002:a17:90a:1117:b0:3a6:e9bf:f244 with SMTP id 98e67ed59e1d1-3a6e9bff6c1mr2758728a91.1.1791093908591;
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:31 +1000
Subject: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TMa63lNI19lscfXLmmJedDuMK8VtmvCllnZKIn9
 T9vunipYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUb7zL8U0p1EZI4bPTtEkvLYlWLwllT1wbqXbuteH7xl8+7ontLkxn+B5/2/bb
 vj4KDQUOSipjXKZlle7gEz9leeFF4cCXrY4eXTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index bc759eaadeca..035463be1456 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -29,6 +29,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

