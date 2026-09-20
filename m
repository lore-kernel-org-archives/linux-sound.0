Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D63CDBAA
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880167; cv=none; b=GIOy2o6h8kfvNeK9GwBXtd1n3IGldp9KZbb2yR04Yv/jHvEFtOamBfKW2nMQzfbtwciZRY7TvmCpoN/WewoUDbpU1TQ6rF0Gpdfz4+v7pZpLtgwC92FpPw+NdsfrFU82lMp3HH5h36vbrcQ5zL7fj68z8Gp1gUq2vdaAHZLDMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880167; c=relaxed/simple;
	bh=o6Mmzyd7BRwU9H5C74qoe+G2Tq+aI/IRIDM1u7th/B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBpbvfLCu0WdoObof+h2+9L41F+36q6Y9reYXMuQZYga+XtuLyH3hP4uUDx6ndsoxKCnc6nhYqxYmZXoEbRkZsWw2G6glimPgC42bQ4e37Re4NkLYhZQP95fC8HabBTveFSDScJwymWGHhcjg9FjBDk4Q301VfcqrvWt35Yfzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpw+OhY/; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpw+OhY/"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df36461d63so4077185ad.3
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880165; x=1790484965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=Hpw+OhY/r9qvfCb/v6ZNx2vv7z/yuQFjsE2BS4T1tHtgfPZvUs14GJb+sdbYRrSRnT
         RrlcgQBZNSYqMuVZvSZMin1wDbW1vS9Kg/WHL8SmBXbXPSbBKNuCN26cX3r7R0besBB9
         +cSqmZ0XOswAcUPuyU889PYF/GGNi1//waRVmmxOBnHqEaAC89oCIvpsvn/UzYdInEJK
         Q8ZILiMZKRFgx1OeGeddk2RYiVoTVoJ4V6iZ7veXo9xISPii8pbyr0CACWhJ3RZL0T0P
         wwOI/tYJ7vR/jnT8E23DAvSQZ6+dyE0CMKwCjg/GVcJJOwxIKVpO4OgsMtmCtGbAOfAX
         +fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880165; x=1790484965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=s4lWQRLIwxJ9hK7fi7XnKa5jJiXnTOpZy8tW/mSmU33t2K23mTuttn5JplbKE5eCV+
         /WHVOpevNmmi/noJ6nWmP7h/NEhh1XvJupzJVOGO6LWIYF8y4y8Pex4ER21Y87laGxWQ
         eV0eZP3G4wI5qQNOc3vazer3uQZNtbvXJxd2XyrgEPIyl93cz72Bav+B7fFSJtk9SJ2K
         jqfExgirYrXz9acB27mzDwfNJrXSqW7cePeFEgfLJcA6iR3K07vI43c7wFPtHuh72XxH
         TW1ecOYlcdmExx1lt+turPm9IAVZ0xo1mgrn+971E9hRk/Cic03LqSC63lKS8kMhAZnN
         rPJw==
X-Forwarded-Encrypted: i=1; AKwUvBzc9RgUwh7+UQFU4gC0NE931l5AnYejJrdaA+bMMW7du4FQI6WqEeYYWZ3tEBG6tS+6jlXhL13PgQXUHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m9CqPm8yqGgvsKP71U9PwP4KzPKz8jR6asUkurWsOESMikDjTJ
	hqb462Vodd5UQYlOeBMUlb03RPWHxrrGrMNO03N+nVjBaYmw9xJ/AmWi
X-Gm-Gg: AYBFou3Id3Lo/Dvj5OgSDQyxU2Mme67FXO1MFT/pF/W06Br9YhuifkkbjyHVQmn4fJc
	1ep2AVmqrOWQHcG3/ODjSh+fTolqjc1F4YKhSrM4a+XdfQnp55z8HQrk+Qyi/QRPBFdGpbVzN47
	QJ/2VtfgRjpJOcrzcEeCeC5CEuMixmoVO526ktNoujJjSOhNrIuUzErRKVnjOnqjoox5+4MCywt
	ui9EIYIC/dHObmG8GyRBuCronNqE9p5ed8C8ZQLQg+yERGUvevNRuDHKVkw7GTKfo/uauNJxqvi
	Gv5y1cMlL+9yfXa+10H+G4nwcvGoJtz282N6INZuMdfZGgsolJmj/BNWxi7XNJ6523Ci8ky77AE
	z739kSYxVz1EPN5aBcHPr155TkSHhLOuerCwpZSR6mGtnfHer3xcnZZ7867Ys7qWNviLkvbFo5n
	sUXMylNahax2gUokmtmpU3jJ7TYR8ilwE+F8/iXWuh5a1xwwp6NUSKo0jSzFO4glIktLIFbLmA2
	9Qy7/5XWPGiHTRGLI9nElquFI837jSXw3Aws24reehhNTkRN07YoMyzSPcW5cGE8XF6HG/MdxV4
	2Yt98wfB9VAhVkOa+jz2Zg9aB5lpiwwLNs1UIedDHXpo1kM=
X-Received: by 2002:a17:903:fa5:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2ddc053841bmr56459515ad.40.1789880164957;
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:45 +1000
Subject: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM is
 closed
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zGb+++j8iUZe/cn0Z0nFJK8T6VZ7UceNkKMJL+0HzLM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UNCs+tnF8jm/Fr9rnD+qaz/5/MlJvafvnEpdXpu
 SeWZM6J65jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kxJGhmuLz9eF5142Xp283+/t0Rc/gw80iqvZZe94zfXn23/Xh9UM/2yWb2j
 yPuE6S9JqBqt0gZDlkrU7xeS3e7Hc+lrDvndKKxsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When a PCM is suspended, we pause the DMA. If the PCM is then closed
while in this state, it does not receive the STOP trigger (as it is not
running). In this case, we fail to properly terminate the DMA, calling
dmaengine_synchronize() nonetheless, which is undefined behavior.

Make sure we always call dmaengine_terminate_async() on PCM close,
regardless of whether it has been called previously or not in the
trigger callbacks.

Fixes: bc0e7345168c ("ALSA: pcm_dmaengine: Properly synchronize DMA on shutdown")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..e59b561b849d 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	if (status == DMA_PAUSED)
 		dmaengine_terminate_async(prtd->dma_chan);
 
+	/*
+	 * The PCM might have been closed while suspended, which would
+	 * skip the STOP trigger. Make sure we terminate.
+	 */
+	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);

-- 
2.55.0

