Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C1D1DFFD
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 03:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222167; cv=none; b=rc4MztTsBh+It3/B2yT8euSkkGGscw94bjXS/kcQMtF8yDtJZ6Kky4jqwbPgvPrDynWa5HrXjOkIpfs2Q89AJJ30xpTSyrlSDwZFD/8ik4xT2BRQjVY780+avtVP82vb5ENbPCcMJg3Ly1BGm53cryOAfca+iwPMpz9WFEY+hus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222167; c=relaxed/simple;
	bh=16CQ1Mh0DhEUBR4ezVHgPRUR8laHAGjR2xPoxaTsCMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r+23AwHhgXYFcGyXE0vqY8pQqPUtU8bMVtmKMgWUsJRJmS1eNzalg4/IJKaCFLHu0mXDe870XTWYXlF8QP8KvhDv6FNzQVcgT6CrKX1PfoNh4BEktP40BKNP4/NzbxLI/V7Vb0Jw9ggDmj02Mz1J3gIZAlkJ3rs2yh8R9ajBSkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERybQigR; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERybQigR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76ffd06593so4220582a12.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 20:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776222165; x=1776826965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FlnizE/zY91jI9Ekiz1Mjyi0v5U+n8G2qu32Mx5iRQ=;
        b=ERybQigRrTnorIRwe6aC3ke/iYcSCVdeW4KjOmMH9u/ZwS0K35/wvJVEs7qguvzQcv
         ebtzC7Ow5/HvvZtYMXbnGM4oWK+XTmOXjWu/vrZRGGKT+1ZKLIcEKe2Dpl5woFH9HH+F
         +0eA0KPCVu3J8aJRLs72K44xGBsToNipaLGhNrYROvwNROJCw7Xrb7xK/O2hgAKoXcK/
         vCb9qo7VDVtpD9meYBT4WNmA6BcuUdVoTdhctrstAAU931B445NxwHtV1f7DmRess3Aq
         dQGH/5fQ3miMgM3KCEcxodoPrVU/dMdpPGthZybvto+m/3ARR9OL4TTPnl3fO3FuNlkN
         rgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222165; x=1776826965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FlnizE/zY91jI9Ekiz1Mjyi0v5U+n8G2qu32Mx5iRQ=;
        b=bwTMFjhvybKlBNh0vQCtZZZLFJDDh7cnhgWna7z7tKos+01q3xehuLy6+/hAaWca16
         GHsem0crxw51C4McXhlxJSdVc//lgvlNTvstxb/x5gz6+Cccf7n/HguvOKnTKvhxNjbR
         5D9RBW2Eoepm2vOmxifo0T/uE2a+ZgGJL2EeWtnYoF8aSs6M9F1BjHfRrWobsvBe1xiQ
         3UMwdaRUM7fHpmWonoigSDkNNMjkq9yX5k9YIIqRiaOmmVGZXuEwqmEEk8gAR+0DFqHl
         QQJwIQmJ1GdY+K4JgkkiaAKXQCAO/nWBW75uI+damemO2vxQE/APAGEHOrvkY98X5QWQ
         fzCQ==
X-Gm-Message-State: AOJu0Yy4spEx8AOIv3GMl3WmYRZ2GtqHiwOsCQTKULfLMT5C4lCo2Zh0
	+N8YJ53myBa1Qx8rjSs7kFUQx7ikEGufsbcCnMZkjJnSQbNKc7yfalU7
X-Gm-Gg: AeBDietI8wFFXTXJTRQAecxTSrhUvFMWazoTBvT8QFO+HplPl0iquIatYg/7lV0YMYM
	5fPF44RBmf91D1xmwLmkAjCu7fGlc4ECBP9WZytKxtrsImgyuwU1AbM9WppNMKBvhWm8mpc0NkJ
	U9WucPZoAIuvAwNOpjkckJa0l/41YbM5qaV7yztqwjivZ7QDZVew3L/i9WK3tnrLE4jCdIRmIYc
	/4pKQ4ilxhapTZTzIF5Nh4hteiD6jxgXlKGNtqVOBcORtD2K2OMchS5rJ4XsN4qUuaczBS9X1yd
	UZV6QGvWiH+0xyR1GWgsk02MzMKbuyseqHfSH+zq5m4vLfLRIS3reNSATZUkeL9fBLqTZo6759m
	LENtwOe8RruArIBj3GmhArTceS2CbNLqMT3wZsliDXVIwWyPzIYeeRFTvyW8NF13gwvFWtFQCA9
	vu0S6iW//xlHAMw/HUaabw+zx+yccbIsMs9XxV+nnln99UNNl1snI4woBK1VFiQACnS83XM79Bf
	57FfIj+iq9gMZ0=
X-Received: by 2002:a17:903:acf:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2b2d59393fcmr204565005ad.5.1776222165310;
        Tue, 14 Apr 2026 20:02:45 -0700 (PDT)
Received: from rd-tomhsieh.jhtgroup.com (211-22-143-102.hinet-ip.hinet.net. [211.22.143.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478142565sm3954205ad.37.2026.04.14.20.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 20:02:45 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	matteomartelli3@gmail.com,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v1 1/2] ASoC: es8311: Check regcache_sync() error in resume
Date: Wed, 15 Apr 2026 11:02:51 +0800
Message-Id: <20260415030252.5547-2-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415030252.5547-1-hungen3108@gmail.com>
References: <20260415030252.5547-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The es8311_resume() function currently ignores the return value of
regcache_sync(). If syncing the cache fails, the function still returns
0, leaving the codec in a potentially incorrect state.

Check the return value and propagate it to the ASoC core to ensure
resume failures are properly handled.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8311.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 0b07a53cc792..9e371e2d6eae 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -862,13 +862,18 @@ static int es8311_suspend(struct snd_soc_component *component)
 static int es8311_resume(struct snd_soc_component *component)
 {
 	struct es8311_priv *es8311;
+	int ret;
 
 	es8311 = snd_soc_component_get_drvdata(component);
 
 	es8311_reset(component, false);
 
 	regcache_cache_only(es8311->regmap, false);
-	regcache_sync(es8311->regmap);
+	ret = regcache_sync(es8311->regmap);
+	if (ret) {
+		dev_err(component->dev, "unable to sync regcache\n");
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

