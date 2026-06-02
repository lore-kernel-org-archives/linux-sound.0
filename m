Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742A63D6CAA
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395419; cv=none; b=AHy8sD2MdZO+oBMVfXqZNCtyT64hGWKvwAaownFRu0SJGgDUIWtkEXHUoYVOwatpc/pPPnObWrkdI+SprgDCFr9dMVf1YDbTnwCgTSJ9NouCiIDcShEzucI46e96YGbpHM+D87NJWzi80VkbtVeakU7znkODx5suPwgkyXcJ6R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395419; c=relaxed/simple;
	bh=QA4yfPP1XxGkqqeUczCeaNMxgcEitZq5JbfLWgt6jZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UATR9xvRf/pdNAuAntRqygOlg/uXGwHRa1NCYGTKm0/E+4TBkLJHY8CITCzEGxJRY+3T7K8XFbO2aNVR9VFSMF2EXI++Fo2BGfSbmgsKHj5Ldldqb1zq+EETFUUp9X/kNzIPD0Lva2/Wdqdx0RHyqAS6AlyAHL3FMS71wW1Q6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEUjRwTQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEUjRwTQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2a68d01so14705535ad.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395418; x=1781000218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPHRLle9I7Nd/qZunsQNy1JsrfMY8rVkIYFRWvNrhY8=;
        b=FEUjRwTQ6cGEhrfF5peAmdh4DaasOBOvZfy8GSJgr+l3a9UPta7MbAO7+1yjShXv+h
         RR/2Eqd4LGyZWYyCYdU5mMusj67V9/L2m6OO5IUKfHlSsdkjN3KRFUy9akrcM1/WNr5U
         uyYFo7A+rbTWi9kjIBz5pdCfyg8erSC8E8z9EnVak/UAYcPCpdrUU7Rfp7Z7OpWznI6p
         ZF8sEVLlSY95KpVmuXh3NE0RT7hqR+v47k4PKGM9TFWkZelJ/8UCTWlGPxpAtbj/3O8Y
         63irI1YOK3Rlg3/GmZUeCHGGUcH7SVQVkGsRYqTB8zvMp5xQMds9Li5/HHQgNh6PPbHa
         9HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395418; x=1781000218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GPHRLle9I7Nd/qZunsQNy1JsrfMY8rVkIYFRWvNrhY8=;
        b=XYJwVGcSMTUpGoSiyaSq+A8WyngNHaMZ5ro5MqXEAZbVfgFRsHELuBSk3xhmqprszF
         x/avODQXnSagylvXOp2D087jQIkfe0Va+YAOyHWbGy8N3eZpvYRFRnLcIx80aR9GqvA9
         BZzLxnGF4tm5VumSizT7MvtUh+Pn6ppiw8rOeu5eV+oGETEAeH5meMUmimBsjtPtGvUA
         bE+MdGG5klBO6RQRs0FeoMf9GLjHnNV3cKrMr/jPl7scCObSNz4WnnNKe8OLgLPn/O/H
         rHQuhadW5da4zdgUIWv+ICA1Y2XTTEH63mzifYHvGsUyY7wAfcaMWTV5nYiViTL1ZlM+
         BzZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dDLzILFZ30Ki3osUOqibkzAQwIukS/coKN0oAH3cCuD0PiQo5ookkNrCcQorhtZNzsJWAgjPYKW4jNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWGbWSqvUJi/S5zKm1keog8PHNbv0gNtsuUtmgscFty3dlYFU
	AwgodUxs/bIvspfNnXsEbvEKBLlWDTdn7vbYk4fn+9/rCvDJ7uXzQysk
X-Gm-Gg: Acq92OEiH2rgRn/dFBth/NArQiLUzojKOzNV8YRbijBZv09EZoTP+x0OQD7FtFrV/4q
	p4fojhhJuDMxiRCuWiX4lBoCo1iMt1bRUo6JikLvxr+142n/9H0JjyJx0x6izGGm03Glr1FeAnx
	Pe/iQPCR44K2Q1SadNk7h/fkdnLiBiy0t969TJK0C7lPO5fC/bdlo4kf9xZun3/C5H8EgO1Ig+d
	Kz8Dp+klP8lxAGWlREJZveYoslZEndEqu5qRP9QK5TEH5VramGAJpito2M0i/UVzzVsCSa54B+U
	7Jm0Iq8QZ7u4NJ7pVFB+Cz3hyBCGIsohn2bHb4H8qvAY17+AKyZTOM1RYC57MTZEmcIynOU38T7
	eTaXnX1YhMGn0HOMlIi5I+uSTJ+QrOW+KyFDSqGlXDpcgLsVBGL9wlxlCiwhfYorW2NMtqImYAV
	TlFuJxapLCkqKBx+LHH03ilAuHZq43k2kenSv8Bf9EjHKAmlK5TRkbVlwdnXjdMdz02tPh
X-Received: by 2002:a17:903:1905:b0:2bf:23c3:34b2 with SMTP id d9443c01a7336-2bf36867d31mr173447395ad.32.1780395417737;
        Tue, 02 Jun 2026 03:16:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v2 4/5] ASoC: rockchip: spdif: Restore regcache cache-only mode on sync failure
Date: Tue,  2 Jun 2026 17:16:07 +0700
Message-ID: <20260602101608.45137-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If regcache_sync() fails during runtime resume, the driver disables the
clocks and returns an error. However, the regmap cache-only mode is left
disabled.
Restore cache-only mode in the error path so subsequent register accesses
continue to use the cache while the device is inactive.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260522103713.6C09D1F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.

 sound/soc/rockchip/rockchip_spdif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 8de5b76cfe79..7f15bc7f8f35 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -94,6 +94,7 @@ static int rk_spdif_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(spdif->regmap);
 	if (ret) {
+		regcache_cache_only(spdif->regmap, true);
 		clk_disable_unprepare(spdif->mclk);
 		clk_disable_unprepare(spdif->hclk);
 	}
-- 
2.43.0

