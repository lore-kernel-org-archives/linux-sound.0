Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265311EA7CE
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769396; cv=none; b=gedCV8k8ttOn4mdXEPNP7Z09ZetSycKS9BBwjy2a8YSJaiFhkKT+wJjYodYOGOozguwbqp2U+2NskGFA5xR4zmTQ3nvlYoScBLHo7deZkvUugzJFRxpedbRNeBgDQbTOP4RV7BXcJz6j+aX8LpQ08WYoi0NG2aLCqy4gVWF2SpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769396; c=relaxed/simple;
	bh=6GouDCeGhRlesOa/JrR3x2EVWyI0PhWbqxzkNKLHecY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DP/PIZPu5W4fG038ZrxA7DdnxuityS2R2WvgjXasVI6eU8VNkCKAikHzvvu1SZXTx06Hl/y1b1CUJspSeyd5XlbzCEWO7aSzfHqrUMZheJZHf3joOJeguR9GfSR/tDl7ZbqZsu1DMlQpvA4LyV7+Tehk7dv8F8B0DhMWBF1RKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgaQdZ6L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgaQdZ6L"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b86ed375d37so159857366b.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769393; x=1771374193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZqYqbBmYw54DfD4zgbHE0Hm+/r+cRAa+Oql2wKcZL0=;
        b=QgaQdZ6Lhg2FnSAKAA3Ahb0XoxSCfsN/G6elFcgvpYOU46kdLZqtZwVWnS1Rlo8Jdj
         NLGDrBBT9+omFyPWpM/U/hyXyIeaaS0PDRx8LjWMcV5MRuxcwCUfzZU4+Cp2DemcW7RZ
         O2BsSjc2avFmXdPDgQcEkyJajTfz9XYPG8iV1Nq9y9We57azsfj0AidLOZPv5HesX90j
         EjHjsz+/G+0IIGwaj8KT1AypNA73mpMO/Hi/621SAylXNzbEw+IlE8aT7WAlGIaCKNvx
         BSm++vVBqJ57Cjc5E+9C2shNLQco/GS+xF/XxfxPAf+K3AMFsFTc03/glu5jKxRw6dkG
         v+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769393; x=1771374193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZqYqbBmYw54DfD4zgbHE0Hm+/r+cRAa+Oql2wKcZL0=;
        b=wrYbMGYYpiLp5F0EIn5X9ZvlHnuTc6dO2jPsMbJAtu6WThD/hU7pk7nYw0wTFU8FAB
         MO2oA2Bqx1gn43iicH2grTJQFVX1+HR4ncWdydqnwxYX3aeZId2H7+ILTBousgbl8A4T
         ABqLn9QZZ9PAD4dm5hgkGI9JpROGpBjshv6qDdcvo84Ct978PoUL9qiL7Hr04JE1JDRj
         RO84Gs6IT8XohNuW5EiLQLlfGbaGxGowUaDaZ223SfHiYLPGeFobKGlTzB4hz0pkob/V
         7qnsmBYHmkwJLo/rP1hQG4Tv+OKUsDiyOq0uZDDrcos/ym4LNk4R059cxLQrM/neImY3
         IFhw==
X-Forwarded-Encrypted: i=1; AJvYcCWptGswVTIslP/+4IYcDeLVpIInPzNP+EFdlxzQYcNEup2kRiSKhs1uS8N0ZcdndfkzzXLJpI+XKXdpyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPUcqLDoBdcHx0ofxYo3IDmzjisZKxTQy45OKlC70LI+3Fvpav
	nYrAEezCxmkM/nbl9a8q1NPkf5Cbti/+txB3HBLuQpkyG152Q4GTSpbu
X-Gm-Gg: AZuq6aLROdVkh4uDqKx2wEVrcBq4YWFD3eIutFgmHQhNvV2vzWUDYI0n5rFECeOc7tQ
	2omMRLViLLV1ZDch3pMElqqYL1V0ylN/gqfxknEfnBTsQn96309u/7mMklr74Y/Jz+uuviNOVGC
	Jos4NgVHlmY+txD67MxT9Yuft5KRqMCgeE83qjYKFhV17DEuSKsyZzqLrDQgrey3gmNGnA3PvmL
	dM7F8OwC+s63SNKhJmKr1mAbXxfWbNitRPfpOAiPrT+0bHc0o8JL+ngxALUogD2KQTqcWWVi1Ky
	Oh/lT1WbaLbYhYQBpzOTrg+aqZL07IGB1wp16FbQQ3jnDuHh8JrJ2zy2dhiwfEyCCleMQIDeiQz
	o+Gm3h8oVH5nfIyY7BtjMHv/0iO9Um4hasDLiKlVnAIrcIa0Abxky34/dvjrEksKNO/L4t0rjE5
	ZtQXq7184NdLIg1g==
X-Received: by 2002:a17:907:9413:b0:b7a:2ba7:197e with SMTP id a640c23a62f3a-b8edf25c528mr919717066b.29.1770769393405;
        Tue, 10 Feb 2026 16:23:13 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:13 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 2/7] ASoC: rt5677: Allow it to be defined as an I2C board
Date: Wed, 11 Feb 2026 02:18:34 +0200
Message-ID: <20260211002255.4090440-3-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices (e.g., Lenovo Yoga Book YB1-X90) define the codec as
i2c_board, so add an I2C ID table to support this.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ccbd32cf8298..6628c7ca5a8a 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5209,6 +5209,12 @@ static const struct acpi_device_id rt5677_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_acpi_match);
 
+static const struct i2c_device_id rt5677_i2c_id[] = {
+	{ "rt5677", RT5677 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rt5677_i2c_id);
+
 static void rt5677_read_device_properties(struct rt5677_priv *rt5677,
 		struct device *dev)
 {
@@ -5532,7 +5538,6 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 
 static int rt5677_i2c_probe(struct i2c_client *i2c)
 {
-	struct device *dev = &i2c->dev;
 	struct rt5677_priv *rt5677;
 	int ret;
 	unsigned int val;
@@ -5547,7 +5552,7 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 	INIT_DELAYED_WORK(&rt5677->dsp_work, rt5677_dsp_work);
 	i2c_set_clientdata(i2c, rt5677);
 
-	rt5677->type = (enum rt5677_type)(uintptr_t)device_get_match_data(dev);
+	rt5677->type = (enum rt5677_type)(uintptr_t)i2c_get_match_data(i2c);
 	if (rt5677->type == 0)
 		return -EINVAL;
 
@@ -5666,6 +5671,7 @@ static struct i2c_driver rt5677_i2c_driver = {
 		.of_match_table = rt5677_of_match,
 		.acpi_match_table = rt5677_acpi_match,
 	},
+	.id_table = rt5677_i2c_id,
 	.probe    = rt5677_i2c_probe,
 	.remove   = rt5677_i2c_remove,
 };
-- 
2.51.0

