Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C93396598
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774389053; cv=none; b=W0k6Nxvdu06ZPstSj3Go2+XT4ogBaPzx8UnpOWNSl67qcGyHT6AKU2tEBhpd/dMhb+8VjQYOv+N3ZQoo3V2BKiBOUPPa8HpHbkUZCSygoecOBnWG0uFV5H6nFGFOSyvZkYZG6fGNWaVcQ4xGMMHB2ul8dgf4juJ4U582gcIq1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774389053; c=relaxed/simple;
	bh=+Tm2AoPsoup/dlHhdNnCR28YS1uYbey2BdUtvZuJMJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PimhBpY0a9//vZIjXUO4I5PhYNbBNsidbRQ2t8vNtBeyFQ3s+bgqRh7LIrhe/lsqiz4yR1T7tUMleKtfw44J6ir0rDvX06DT3vJm1SQFJagzAiUQHqAAUleDad81j4IJu14TC3WpWQXWZA6nCm5NEKcofZwBE9ahLxAp+r+YmyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVMxk04c; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVMxk04c"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso1560255e9.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 14:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774389050; x=1774993850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bY7TPhTgdVdSysEEOXCpDcY9hDNHUS/0Jj5e0ZT0zI=;
        b=EVMxk04cpVo1XWK+q7C+zqjdqhfViL1V0BzD7VZC3vEqXQyBluUpEfkqO3fxrNUYIW
         g64gJlPWCrfEBJ9xX2SQxpshCozkcz863g2wTZX8CHhNuCE9a0kXU+/vXlbAy+I3yQ2h
         RFoyjXY8gs/EcifOb13uPTzC4i4gzpUsBS0AdbKbyMwaobDnc5SV3qPPn5uXz0eIGF+t
         K4LRRYCfZFzzDHtWXKP3cvSUnx7Dvqhm2tVUaFPkW4s0cmbE1OVKc7wtRbgLYs05iK5k
         j4mcVFs2xZh12dQhaNa5Nq0QeZTiDFfk4Fog9U8bWn2VlrEB7rg107ebxhIPQwWm+Txb
         7/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774389050; x=1774993850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bY7TPhTgdVdSysEEOXCpDcY9hDNHUS/0Jj5e0ZT0zI=;
        b=fjJ06g0V5pVKKVkPijuNCyNFVfE50Kz1LpsFRiHVdqwlSBVQrFqerlrwyrSXz7TbVD
         KolMLUmZ4Upr9TkqRrBz7SWtIcCuVERCWD5aTzpWCR5N+aOAv482UJMS21eP1YtTl15Q
         JIxhMa9PZUPgSrBzKA7yl0cThI7jjrmYRplHZg2wp+4SN2a9bqX1s9RcVzp4viGiPYaf
         TPyieUY/SxLWv9e6fkghRk4KWP0opdkoAZMKata0an3NRWypp2avpVp+nYXwlChfJY6Z
         C5eZE99ukmjqONmYsDJlvvlPxiuSbywUBvbevkk7L0VsYidTtGHo7Mif42nmz/CIEeqs
         zW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXgc3+yMo4Kf4vEGAhAkF0KlVqsMw18Tm5F41UYQoRt1Y+CdxXwIyeZbyadbFmlxKQ2gIIx9O519hZUNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00QNW5Ejwlu+y/wALR39aRoMwxgGK86V5EIvrxliDLEdrDkxo
	KOgXJ1po/OaBlM58AexvwqG/MoXWT/JG+W7/0eV9dFvAc1vB8n8uT5Q=
X-Gm-Gg: ATEYQzxl5o8qZ6C7lvZt3ylxVlz/fYxK5XbkoweB9Cg06JsKoP7HmIUV3cwVKRk9idN
	bfuPMvQrrusNARQMSNHC25lNrXdXZIm8JKnDJRzpwUyWYPtH+s8C18DXN23n12cAsMd0al3AiQy
	+GGspEEhQc65JqlXiB4D6bmMXAbAzUCliRfqBWeL+U2qDIQqxPTeRCVL8iFt2U7DECCKBj3Nxmy
	vnbj+KdQ+2HV3H7m6UDPj6oSp2JBbbm+7hHKyS19BnVZPLKoGib7Tg/ldZpp13ZOAHR75ZkYkdH
	mFvjxzfCOcfFm3WzG4ueJMAX50ouKH6FPqFtPZKnwT5/uW3Rj2LlUm25IQOCNFKoyYSJ8cUhG+2
	hfBxREXf/NFHkRSBVSyY7Ul9l5txFvfb2n7H3iH6HfhvbZm5vJ5PmyZOuAujR4IeMVr8r+DM1Or
	PUGnnyPVkpAmcxAkLcqTpRlSrXYNMjXROiCFh3/AgghkTSt24nuXol
X-Received: by 2002:a05:600c:1e88:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4871603a058mr16825615e9.8.1774389049975;
        Tue, 24 Mar 2026 14:50:49 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c0c13sm159316465e9.7.2026.03.24.14.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:50:49 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 2/2] ASoC: adau1372: Fix clock leak on PLL lock failure
Date: Tue, 24 Mar 2026 22:50:15 +0100
Message-ID: <20260324215016.66347-3-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
References: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_enable_pll() was a void function that logged a dev_err() on
PLL lock timeout but did not propagate the error. As a result,
adau1372_set_power() would continue with adau1372->enabled set to true
despite the PLL being unlocked, and the mclk left enabled with no
corresponding disable on the error path.

Convert adau1372_enable_pll() to return int, using -ETIMEDOUT on lock
timeout and propagating regmap errors directly. In adau1372_set_power(),
check the return value and call clk_disable_unprepare() to unwind the
already-enabled mclk before returning the error.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/codecs/adau1372.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 6345342218d6..e3eba241bdf6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -762,7 +762,7 @@ static int adau1372_startup(struct snd_pcm_substream *substream, struct snd_soc_
 	return 0;
 }
 
-static void adau1372_enable_pll(struct adau1372 *adau1372)
+static int adau1372_enable_pll(struct adau1372 *adau1372)
 {
 	unsigned int val, timeout = 0;
 	int ret;
@@ -778,8 +778,12 @@ static void adau1372_enable_pll(struct adau1372 *adau1372)
 		timeout++;
 	} while (!(val & 1) && timeout < 3);
 
-	if (ret < 0 || !(val & 1))
+	if (ret < 0 || !(val & 1)) {
 		dev_err(adau1372->dev, "Failed to lock PLL\n");
+		return ret < 0 ? ret : -ETIMEDOUT;
+	}
+
+	return 0;
 }
 
 static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
@@ -807,7 +811,11 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 		 * accessed.
 		 */
 		if (adau1372->use_pll) {
-			adau1372_enable_pll(adau1372);
+			ret = adau1372_enable_pll(adau1372);
+			if (ret) {
+				clk_disable_unprepare(adau1372->mclk);
+				return ret;
+			}
 			clk_ctrl |= ADAU1372_CLK_CTRL_CLKSRC;
 		}
 
-- 
2.47.3

