Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BCC3655D7
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915969; cv=none; b=kcqmZWiSFbpdu0PESXgVyIAys8UL+8w3EhRLnSSFBr40kZUSDbg4jtEY+4ENhNksilF8x7Q/t2GiwiNhWvSiwwJB073n1ZlfrmR2oFqjzMsgDgZlHBg58e/a28BUcXu+eRFER9zZ3DYg0zfIY0xg3JY8u0akk0ySpmlBSDXMz2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915969; c=relaxed/simple;
	bh=cgl3PKF9zE87V0n/hFfoQ5EuOvHz5Rt1aQJR3Bk0Obg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfRo2Xq1jQ6XFRdO2qVubWsKi1vvNNTvG5QHMTQH0sSveCusQHrniZjq0fj2wc0/KUjYy7EMm1/06pg8p8+g5nUeKm8rCgsW+QF3+VzEdRkwbFxVU5HuwFDAtKks5azVSC9UeGAXG0EybM6ZW3fQZos0WJ6OKbieyZt/gGrSyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl/oHG98; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl/oHG98"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2db9f927cso17214165ad.1
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915967; x=1791520767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=rl/oHG98bhqJuzaS2Q1hNKIrxfwQh4ro4o4fq0XwsFEajG8zhkkm1PRAgJXbo23iho
         KYeR72x37L1ifx8bTSvUoITLQ0zNc4S/YLsRKBo3ZlepXhcIGeXZ/9TxKKU9pK7NFSSP
         WIVf5jWkUzIw/8Cw3XW+8zkBg+e1RvGRGELfWSX/8NthVkjE6bsXjNzQlPqsKeaUH/Ja
         Wfndb0PTu3XNqZALbdIwkfkD+uAh7rR7FdcPv/9h361FAHqj1+oGg/YwgzH7m8Yn+pPN
         DoQpB+m9cDmVOurksHamX98BqDmp81BqFRCCG3h0IHEPdC3AAYZfD+yVfvTVJITSFQES
         pZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915967; x=1791520767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTeu9HyQ7QnjlcIIK3OqakZx+SHSODb4TDDJ1zx8l2A=;
        b=ywhXg43tTvw+c3H5X1Cl6m8pl+Fo8NnZRkBMeXm4TBW72kKTmeCkTUSno37yJdJobr
         dvCJk1rfYcB3Ta1BrlatEnrKz0v/kx0hYm21nnTE3JwXchcXReV02LvS64PZn9yKdQX8
         5CDVwKON2iQjsjTPmS2FzhSB0QtxrKfLAEb5xZm7YFHXjPixrtlxQ0SXlfFc6GiYN9hW
         g8ckCUi+zxmAyx9sQT2KYRQKISX/2DjTf43n8h0IBbqDYdf5mOq6EkJBimeIKwTm4stQ
         MdjBE/Zf+W9wdol2Y1drl+tJbRy6FcwqxEtgVuhpm3urjCFHWjscjt/6p0nXvKHGRSdg
         ibeA==
X-Forwarded-Encrypted: i=1; AKwUvByiWoIBesEUp3lxiIWN2la7aKRi916pCaxDFjev4g4u8TbqAd5nRsRBVajDPAd1of10/W/UGB8LeFK8kQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKw0g1yLnY8DmBpKOOPB5M8mnKYYnf/mvK9R8zgc/wlmtCpB34M
	TUX5Q2vClVr8wi6btse2EPMDBf1idW7h94ignqZb1Fwc2lBf/SoO/enW
X-Gm-Gg: AYBFou0blVcJfRp7mx2nYx2G6UU1PyoKuSTIYegK7xP8VEa++XoS+WC9kHlAfAuhW4g
	BYZFER7BhEy2Tm9/xGQGx1d2oG4RykuPRwSBvueLwQf1LHBuA0d/S1aRcgHMZvZWNupRg9Dxjn3
	Rjc1sUb8UCg73Dn8t6pTFhQz3T/dQ/HffLDcUnaooJbrS5qpD4OrfBFWNRwkz364HQ4F3Ul0mgg
	+U2WafSB9O9Lc8sW1N4iW1dVFYi0T93WR6St1Cdt9zk+fDFf20QwexhrQ6UsSXeGgjnEPIEw0Nt
	kMRjZdWYR/zvTjVDm9W+l4SKEy9AwrqGqHfiecZv/y2JVLUJh4bBoJ1lJJd8bgl2s2w46xkbJDq
	FqSQmWPMlFooATnOoeLUGtps610f7uPQFBavCsjKKP/Ib4JmDww82jCe13j72C710IOCC3YIX/3
	kuUD6cj2/f0xHy2/KgjDYZXP+huTanuTpzJ3L/G6JB5lV65Zy0OZF4YQLGSEBbZhT6OSLwZJIGa
	cIpunlZ0iHIhEzfBnu6Fdvlo9B2Xc+iULBBVaxC1GPNcK0ihAo7dtHKAf+uvIcf9bqIENmW7bM6
	343k9I5YpkX2Sg==
X-Received: by 2002:a17:903:181:b0:2dd:c053:d73f with SMTP id d9443c01a7336-2e49b681d7dmr15081205ad.38.1790915966639;
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: atmel-i2s: fix MCK generator error handling
Date: Fri,  2 Oct 2026 11:38:52 +0700
Message-ID: <20261002043856.97295-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Disable the gclk and reset the MCK configuration when an error occurs
while enabling the MCK generator.

This prevents the gclk from remaining enabled after a failed clock
configuration.

Fixes: 73ad0df57290 ("ASoC: atmel-i2s: Remove unnecessary audio PLL clock (aclk)")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index d9ad262ec44d..f28808d980ce 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -466,11 +466,21 @@ static int atmel_i2s_switch_mck_generator(struct atmel_i2s_dev *dev,
 	mr |= ATMEL_I2SC_MR_IMCKMODE_I2SMCK;
 	ret = regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, mr);
 	if (ret)
-		return ret;
+		goto err_disable_gclk;
 
 	/* Finally enable the I2S Master Clock generator. */
-	return regmap_write(dev->regmap, ATMEL_I2SC_CR,
-			    ATMEL_I2SC_CR_CKEN);
+	ret = regmap_write(dev->regmap, ATMEL_I2SC_CR, ATMEL_I2SC_CR_CKEN);
+	if (ret)
+		goto err_reset_mr;
+
+	return 0;
+
+err_reset_mr:
+	regmap_update_bits(dev->regmap, ATMEL_I2SC_MR, mr_mask, 0);
+err_disable_gclk:
+	clk_disable_unprepare(dev->gclk);
+
+	return ret;
 }
 
 static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.43.0

