Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020244102B
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692605; cv=none; b=Qi4Ld3a1lMlEMA0vGmTWWNneghyhlPHdY5xlYbvR23UPL/EJTQ7UAnl8HzquEbbNEivu9SZDvNCkCAUWX86k0DxKUBv0zouYigYfgHxVHHJ/PopGG98UtCPlkY3wqhPSDVAury+90VQWJ+zRMdjfvhJt6CBnaaMq/B0ivAIQxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692605; c=relaxed/simple;
	bh=aVdb6b0m2JyHDBBXnuACsuL9yrvdbLrDAn8rXRP7U1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDuowEgdt8WCkbewPUKic18vOX8huzPZF8myvkjbDdwrxTvSTQTw8cs7Gb9TfCzsAH72OFUD8VLV2Qp7eVZh0K7kS7zy+rijVr4zbwxmft0+VQeJyRHkTIb74NkjmwlvmXycPlLArr7XZEoWtTp8keGsNwwy9HCPKA4mE4cjkeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEN/Iyd8; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEN/Iyd8"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1196273eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692601; x=1782297401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=AEN/Iyd8WRo3yq14ID4ONzPiTUFyunwUAPi45oQJg2rWpxluqzD3vvkKjIB+Ftfbx/
         ozQKg99We7dE4GS5TNkww2JcNtEK9TezxgMG+S647uk7ip07obdo86fGHD3ubUtUGxOA
         84LixiwptTlFvWCh0fnFTa9ir2Xlq+RXKdJEqCCOmRYfGAt9yO+JEVsQOR49XEdz78bx
         GB+Ji5fmW0+EeKy1/30NJ+8bZoNwzD//Ft6ILHFqw8982yqX6EE7pmXJNNKWjKs7PRIn
         e3gONKqTZtFLDgQXFHSp5S3l5dNW/MyifOrT3qX9DhLorxBhHIKhMY0a1Kvhosj9Uddr
         RBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692601; x=1782297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=Mz7U8zFGOQ4eGGxl2WBoBoyktNZDSnqRuEyhL/MG2AqKSywrARLuHb64WjRX8dQpNL
         6D4aHzeRRY6q8V2b4vnA+PY+vUaq/uYKmKVHE8Jh0d54FpgVYkjvwJiW6kLguT52HLwC
         k5yGCUt8DfKr0kTN33Ux7BJ/maFDMU43i5a+kke7SSICPfJsFjKTjHlZEN38pWrXOE9O
         rFaXhIwruQvjdp7D3qB712TjQ5oujZIsM5yrhBBg56a+BRr30q/oZLxsJpCBzg6k3Fs9
         h7/MIEbHo6+mevaZo0+tiwaoqTlnhbS5eUDRIONKIbXoLhGVNWNREyJG13w0QHp+WdW4
         MYRA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZKz6UEl346OgMmcev2kpISjsdZetivYpu0de1EkZQTBs18a8fvUbpLSttPGEXB8mLo8iw4Bh7s3HRZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE50LEoK9wdsMXquHejBZdm2v/W8N0loEmU9Ba2xpOT8kGo6MO
	QKKJW4oA38l9AHU3NS9gwQF+G/+Gh9a1uEvmT30r/PPLRaJuvdsFkNt5
X-Gm-Gg: AfdE7cnNlNeLjUPj6aj+H31XlX51kG2gF/1+Nqt27p0t8QsxaXcHAr/3IL1/xqN2H0+
	ZPJ+bwofkbPfJeS5zyxczzCQRgDM8WFO79qk6weP6CZkv2UzQVtTvRI4lom0P4uRWU5E04mHGyM
	iCZUquLtl5pKt8VucfyKcuDRPLM4/T9/Zn17s5jDNz5keVK9iZC6bgaF5MGDJ5gGxvfLF7vR1+O
	+AX8rufxu6kceQbTlYuuI++y3e06lXKmkIOFHPBw3VIClilR5wnxj2P2+mVY3Vlyj/5bpOzO7AV
	SlTKKkscQuolMfRbSgPfWyVyFsaJyvrk9kzfYjCv2oWRIsYya9aRFVL3Cs36/bBh8dUGLq1qUEW
	9hxfi4UTa3ZH19LSrXl7vC97KvLHVOHrv+cd93quwqN/SnHz2ttISOtDNX6D4O6Qr64jUMUyxUm
	4NLav4zm6zItw2ULbpMaLp2qtvgXqkAF6djsj8Fjcb8eX2/20=
X-Received: by 2002:a05:7300:72d5:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-30bc992dbe8mr1692072eec.3.1781692601209;
        Wed, 17 Jun 2026 03:36:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 24/78] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:41 +0700
Message-ID: <20260617103235.449609-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cx2072x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..93fbd21dc51c 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1408,7 +1408,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1434,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

