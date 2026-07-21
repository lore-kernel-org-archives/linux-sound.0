Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004DC4D2EDE
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629780; cv=none; b=pdFPwfbPBkTXRkRfQ6VJTrjo+1WixhPNo/985s/QNflQXf5sxCYELSW9NlRNeX8VFsLQnJsTAimh7NTx5sBcma75Zj+xq5gltCdDpk06/UkSK47srdGMEAXok2NXjCmw0m54xxWbc6WwMQRRF3ZwM8iXjD8jovy+ZaMX/A7XdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629780; c=relaxed/simple;
	bh=JkKJDmoLbog9GfIGwCgHrsQ72mgnJ2mrZPApTjRRwPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar3PCK8LIvKKeWBQAxHH2LYhVzycyaKvMzAoRwQB0jHyvtE/7ylfWj+jp/5Ko/mu3DrTvGsl05FbUoGnggKCwWawzXrdIpqoPtoWvSaXB8KOTdt1rrgbwXgNvwF2JjEVBENZIzWHL8iigU3/RLbJHNRn7ykNaa1+t9hVyvsz6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE7iRgsC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE7iRgsC"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceae1ed204so91193025ad.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629778; x=1785234578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=KE7iRgsCPdQv2M4Iv7+IjZGuJh1eGNc6UGsxrXQlmgGd0ub2uNSBq6zxMaG8VckMWE
         gaZejHcXWMIa/Oik333EoOBSIh79iSW6eXJRm6kbh86g9Pfk8ET7cqz0qTZwqrRboDMG
         8+zv3ZYMZrqwrUwXWAQwvbg1VcNZg1BvJd7ZwKkJ/YIcard3GoDLg51ISGe7sVQKObQD
         hcqJcEaASX4jnJGE8elOZc0w8BkCAAQXKQ5XrD7E8SgT6XpUm4JNsNNKQnCnma8nGCsJ
         HJVDLqXT7ITseXqByPQ5W48gBGgfxpsskaFIg7PJ1HwIM5MvggRGM8PLS2CScKrbCfDk
         UQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629778; x=1785234578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=OmKjB6ymBcwSaHB2lTRDgaMZHnCawpsmv+U9kwIokSinR3f4QkIeosn69NRN8PQCz9
         o8n8S4FlyG8/Ug8o582IuPBZ7c9bEqFTtEHdppTixuOLMrXKIxj3awOh1Vi3X7GdLRfW
         B/hkXBLyuEZ1LZfkSpc2sFz7emjWrf1lXoV8CjBFziev6y4yiuGMesLSvDlPeKSuQM5E
         h+7H5/T3nSD2KmulR+H+pbPhLx897JorgNnoRp7Ud7L75/mIEGMSXgf44s7xqhA2dLan
         0+I/9NZqdaFG4HG9QSV+pRx9yFV9LO4yZE1AaRlPJoiZDFVKF+Xz83yxP6cubVJYf8Dh
         xw4g==
X-Forwarded-Encrypted: i=1; AHgh+Rr+MyaFrLUfzD7HHe0W9eIQ+pmYHmi6SbsG2HoVquWFbJKH73CG6WWd449vc+MN27DbhttONh2N4PuIbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7lOSutY6il2wFTrdTxh+9miEPmKVkvJMDG8JdtWlLlVk0xPd
	20fmyCAbhb8kr8W/2KrYm1zRam+hn40GJDzd5OffFdjtvQmGJDM9Mbcu
X-Gm-Gg: AR+sD13Pdn1UZCJqA5iXhgwCr3NUwoMGgNYPkGRy+NNNvNf8lWQWobO8J15Dp0FX6BW
	BBVUbC7JPg9zzKcnOtKUC/kweiDKrlSbiwA4P85p4/LqM3Vmhtrfv5QCkUSVeMP6Zk0Gv4nedEC
	z6fnVHOtqJtR6oPam63Wu7POKZXUwh1fiJPK8DY3+zCAWzWQPGn47ZCDIv44lGrS5LtmDNuKkTZ
	DATvk+kdzpB2MjVb9ZZbY6F2hRhDSwB08ZvGvUjvQny1/aLnxqFEaoaJcc38nNzKKDtvgJnansp
	xXB1f5jpe1tMZahxLV8D5KojLwZEZlX6j+xP3BnXrGzMTfJIP4ankeiJpHwWm8+zdV77S9tHNkd
	jFEygIxp893j/kR0RXcm2Tfat28qa9gqn74mVO48CfK3XLyCCcnIcTNkfxSMiZdhVPGomuI3VG7
	2M7er2Cr1eFwq2bo+y6X7cpl60K05d9ov8EW+R
X-Received: by 2002:a17:903:2acc:b0:2cf:7ffb:82aa with SMTP id d9443c01a7336-2cf7ffb8d74mr33781705ad.45.1784629778363;
        Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 25/29] ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:56 +0700
Message-ID: <20260721102600.523199-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Calling regcache_mark_dirty() on error is redundant as regcache_sync()
retains dirty state on failure, and any write in cache_only mode marks
the cache dirty anyway.
Restore cache_only directly on error for active regmaps and drop the
redundant regcache_mark_dirty() calls. This also removes goto labels
to prepare for guard cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ebdf7b308331..e23501ed87a7 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -473,22 +473,20 @@ static int rt712_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt712->regmap, false);
 	ret = regcache_sync(rt712->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt712->mbq_regmap, false);
 	ret = regcache_sync(rt712->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->mbq_regmap, true);
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt712->regmap, true);
-	regcache_cache_only(rt712->mbq_regmap, true);
-	regcache_mark_dirty(rt712->regmap);
-	regcache_mark_dirty(rt712->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt712_sdca_pm = {
-- 
2.43.0

