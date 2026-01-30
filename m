Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA3311967
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788839; cv=none; b=uSD2ihb2HQYJEOCwr8AC/8JTgbahLOErSu/Mjk2sIpnaN/YJIEG4jhZSMaJWsVoGwpUHA/4Aslhza2PLgfLrjxnxQksGPVsXzID4Zm7l93PnBQIwzpjzXhZLE8X51Knycq6vudfbtT3mtrE1z/088Osi//ydFu5WfbD7NdZM5IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788839; c=relaxed/simple;
	bh=PZs1K40MoZksQ8iQr+3NQT63syvDc5XMqaKID2ns+jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pam4zbum+ZcSC6iVWxTNu6gVkNTl+j9IzMy/jk/6I+8E6I8s2NOirtv+WL3jjtWoflOuxtFubSF5Y+I5oLQxY7fTe7E3A/gyfBG++s3mxAhgzD/KEmF775NHzlUqWR8/MPTZ9o9KVFoou2jYHMbsEsuN5lJJyJ/dH4zGSL2glZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJ6jc4Tj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJ6jc4Tj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so16035155ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788837; x=1770393637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/n7Y2y8+5lfZTGKq6ZDVs4ISbps9fdC74Vs+wpB6aBk=;
        b=IJ6jc4Tj3QrLfd16qLYAvp1gwA50HspqqDLE+cq227+sLxvc1lj1Kkrd7XtO6uU4ks
         adRODfq+wl4ipCLTS9Vrf+I+QoF2EzVuB237SaSY3XGNcAO08wxTQ0TXRtLDHHkapyyn
         Kkfg4K65iHHAkctPg0P9zDLoFeYtnzmQ/HqHGGsZz3/MPkoIHp8kHBZiDGbcX1M1B4Tb
         l++Cc68JL6wEKS0wdceiJbJf712n4Mw6KzZLmz9M330iu2P8ItPX6vjk9CEHjTCQ4Lbh
         ruCybiTjYcWYSVMlQje2wAw1k5dmk9EodqVstUCDSuvsBJT/rViu/suQTqxYVoVcbt90
         rXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788837; x=1770393637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/n7Y2y8+5lfZTGKq6ZDVs4ISbps9fdC74Vs+wpB6aBk=;
        b=tcLnZ4anvfLvKkyaPTs+NUxlnap25q9a4OGb6w1Ik2o/vo9qnMk+sjByUyDcT5vTJS
         Cv/1aS+MmV4heRiGh7l/3Slb1gTYhT7lMagKgO8jpyY6kIl6zJE/vtk0EVXCyXXc4XlR
         ueLPDppSYjsSHOGbe+g+2F2bn5J2Gd5s0ncVZ2b53D1cICV4Eu3wrVDr7UKeKrq4oqpV
         1CPXHsxuhQzflCrjBF5Q/wAIZ1nTZC4jqOvkziBbK1J+I9rmnoWyaZ3ID9lODON5Cz+W
         /ZkQwKK191Ift4oZKh9ayM9rSF2PC95dE8VNLORuGcBW0MmPPmiGc39DzBg9XskVaBS6
         03uA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+6zvNbmcztNogUvFVTzDjFznus0NqRQCwefORfwsQzvnDdNmoosf1ONk1Pm6RS9ahsSe9Im8XFLHrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpaeZdcpUJhjryae6dIIABnw0pe3HpDTyev2SKBKRx3IOxCl8
	z3reuw/SLFtfWxmWVI7puZPdYb42RiqhxfnRXxSgo88Kgsa8JGX+6wl/
X-Gm-Gg: AZuq6aKbdI0e8qs0Wyc0X35DC+DqLmYnS0jGWx2fDtkyOlmgDYxEj700Jv9w3a3EqRR
	nl28QBzXG2ysNng/VUUbfdjlUEkTTqAvJ51jhk9tJ4mxXbFNAhm18NUPL1xzabdRv5Bdy9cZbOT
	/Lp5DwcB3wL59l6Wzhy58znlPUphRDI2qYqngOKAT/Md12Ch4jfChqWsl5+68DFtmjT8MPcqR+W
	ZpV3HcIq/fLDWiDeOE69NApK5LhVZwKvWhCy0frsd9SBu6wec+2DTDoD3zh32pt/Y0DTack0feE
	fdjglgGFlNxNfDyGa91vWpvTIXCxmZhD0w81k5K3wkHInUgealPCOIB0poOfxktmvghp9zWLswg
	0ucAvEV3visBkISZhcNJB8kBeMc/UWbqrO5vMDNHJpeax7DEFStIW3qfe+MQ5v6jo6TRlzenXF/
	jj7ttstFuZq6sGPxIpb8OeKbS/nuIRH8JCDRc1rf8Q2yW3Nx5z1kP0GDl/D1ugbTCwQABpyK8=
X-Received: by 2002:a17:903:4b27:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2a8d959c4a6mr27741785ad.12.1769788837448;
        Fri, 30 Jan 2026 08:00:37 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:37 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 4/5] ASoC: es8328: Use cached regmap on resume
Date: Sat, 31 Jan 2026 00:00:16 +0800
Message-Id: <20260130160017.2630-5-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260130160017.2630-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the regmap stored in the driver private data when restoring the
register cache on resume, instead of looking it up from the device.

This keeps the resume path consistent with the regmap instance used by
the driver and avoids relying on a separate dev_get_regmap() lookup.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index a18c3fe22da5..7afc97c62587 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -771,12 +771,9 @@ static int es8328_suspend(struct snd_soc_component *component)
 
 static int es8328_resume(struct snd_soc_component *component)
 {
-	struct regmap *regmap = dev_get_regmap(component->dev, NULL);
-	struct es8328_priv *es8328;
+	struct es8328_priv *es8328 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	es8328 = snd_soc_component_get_drvdata(component);
-
 	ret = clk_prepare_enable(es8328->clk);
 	if (ret) {
 		dev_err(component->dev, "unable to enable clock\n");
@@ -790,8 +787,8 @@ static int es8328_resume(struct snd_soc_component *component)
 		return ret;
 	}
 
-	regcache_mark_dirty(regmap);
-	ret = regcache_sync(regmap);
+	regcache_mark_dirty(es8328->regmap);
+	ret = regcache_sync(es8328->regmap);
 	if (ret) {
 		dev_err(component->dev, "unable to sync regcache\n");
 		return ret;
-- 
2.34.1

