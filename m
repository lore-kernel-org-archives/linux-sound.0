Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8983030EF95
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737789; cv=none; b=CyQczw1uvmxoa4YyW8Z3vw8VlZlfANTI/SoRDjRJrFGd82NINl1+IRz/7LNSRPYeWATXag7EIEHhm+mxS/H4i75h0odnRQNqUhJwjHj1JTAWmGBUKmHA0l+uLcLSQXymHJXJr/n0GmTL8VspzVhY3gWKq5Sd/F/aRxPETUeaYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737789; c=relaxed/simple;
	bh=Eqkb0R/oIqXhkbE+UObfC6eqxJaNV4/C/YFAkbFv3A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXVTlbinh/PFoakZTSmLKXzbm7/JtmIMqJCNDsIhz3Z2fr1JlYpH5GVTJjkyjoB6yMj0U7/CPEVCItXCuTniWScjonhBUvCOoy9tiGL+oVU2SBD25nVjYaCfcJ3PwvCzF2BYxQ5FInp0af2S2+vaiDEsRWczmg8hD2MpL3OHPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKXO+FkR; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKXO+FkR"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so3014550a91.3
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 23:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785737788; x=1786342588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MC5IkkkPZlTOt+vmXT4WDxhQwZYfZLHq19UwWIDKxFc=;
        b=DKXO+FkRnSUhcPuKbfREY5ymCZGuYv2jD2Ym+MJL8t70ipr7+btof2tJNpf5f5PbyR
         8LannA7vaY+VIu3lTfqFI+Nnv8L+gAlzPRxcQrnlHZr9r5UIGXuqg0PQiKNdx3ZTlT+x
         8k2eXhqVUclqDpE2nhhFQWUbrHcgMmoHbX3jCt7EBDwScHaohSLt8V3upQkhyNYvLmI2
         QVVk5NzoLk1Gmvv2XdhSTOlxxUuZamXutPjwBn4GdHsXqc2EIjauknOoCEIjyoZcN2J3
         01mp8BrH36mRUf0t9b/5beh0HOOMAQ9KjuX4j2/plIsnucaDCoyMfg/O+1nk4m8Rhmt1
         3oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737788; x=1786342588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MC5IkkkPZlTOt+vmXT4WDxhQwZYfZLHq19UwWIDKxFc=;
        b=HU6Y6ADcIDFWJzLDuX//GmOoxXkUYo7cF48ZM0BCjLQaTeuzjF/aP40ux5TBsjOKek
         BZFWo+eHa0Lw97t9paUhava9kUP7wXuRYW8uZgFzAjJjYSYH9lWP1bXtc0jIIoG/vATo
         Gprwx46VXunAWnPNpngtquU+d6O/H0VEA3tNQwPq24vlZZBgql79tjmhI3fMJkB0FNyX
         cXDmCfgNLZVap1g9bCP9Qt5YZ42zTGTa56JXocPZ92WtzKZwtFsbtE+EQ/7CmCS2o73W
         5p2vLcZPsR2tZ3L4ruJLtfvS5u7hrx/gS2b2/lYE9YyGiy53S99vVzPlYocV+0qU8XT9
         c0mg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+IiqPpevGIsEW0yBi/164xDtgPLzL34+lU6oYU3d+YVj3pe3idzOnsqXdPjUBz6HX3mbGnWRZCw64ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9pEzIJ/k3qt6noaj0qHHV0NwwN4m4JbuvaOsadkG1bZixrhg
	4iqHQzAPPHPPQIrVThTbLmFZ0AQwVOlb5hMMw0fXiNGIlfIEV98g789j
X-Gm-Gg: AR+sD12UdMFJa42/dAyYdtk/xtJw7InBs0HT8T2TWXm8hWqsp9Wuhz3IkuA/KepHAg+
	BG5+BMz6zSI1v1JhoieuAIcXuKGmcFjMcDfeQpHTx8MgN4jeB2T45ym/Uzssy+DgbaaDXt07zkg
	Nku/mkrM9zzSSIaxLPsdPfCp97f9XZt5HZtld2Dk77zWxkQqoJag68G5mYzNbKuNyqBNmJ8/RTO
	CTzbrHUVWWpsRjCZQWe5aXfdhVOG7g+LxN72FCEVhMJxgg/Od9GZRoMb6WvDuGS00w0LlmPccs/
	NoskohcchWttcr+xb1JprfeTBw+9Q4IUTC8wY4e1oU+fsn5yOPrLm4et6/V6YRyaa/hDWLzGvTl
	1DqNRp1aR8lH30tr8KlOekdG/36bzDYfxjHe2g33ysYXkj3srN5gAAPvw+CWDlXrSQq50zbA3OE
	PMUoeOkn3V6kmSlAqyLO6M2sxs2shVamQ6JzVoaHXQn17MIQXKrlkCacuC+17kFj9/7vg10ohME
	Mj7TIBU6yW0jX/EZqIwFfAcSe92gZXsnpWm0Wa5DVw7IdrYTvpZk/td6nf87PV3esDxVGhlEw8e
	jO7ghA==
X-Received: by 2002:a17:90b:48c9:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38fbc516011mr7192879a91.30.1785737787901;
        Sun, 02 Aug 2026 23:16:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2f6539fsm3469002a91.5.2026.08.02.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:16:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen Wang <chen.wang@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	stavinsky@gmail.com,
	sophgo@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: sophgo: remove unneeded devm_kmemdup() for DAI driver
Date: Mon,  3 Aug 2026 13:16:05 +0700
Message-ID: <20260803061605.35485-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803061605.35485-1-phucduc.bui@gmail.com>
References: <20260803061605.35485-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

cv1800b_i2s_dai_template is never modified on a per-instance basis, so
there is no need to duplicate it before registering the component.

Pass the template directly to devm_snd_soc_register_component(), remove
the now-unused local dai pointer, and drop the template's const qualifier
to match the current ASoC API.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sophgo/cv1800b-tdm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sophgo/cv1800b-tdm.c b/sound/soc/sophgo/cv1800b-tdm.c
index a97f775aeddc..4badb6e3e08b 100644
--- a/sound/soc/sophgo/cv1800b-tdm.c
+++ b/sound/soc/sophgo/cv1800b-tdm.c
@@ -558,7 +558,7 @@ static const struct snd_soc_dai_ops cv1800b_i2s_dai_ops = {
 	.set_sysclk = cv1800b_i2s_dai_set_sysclk,
 };
 
-static const struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
+static struct snd_soc_dai_driver cv1800b_i2s_dai_template = {
 	.name = "cv1800b-i2s",
 	.playback = {
 		.stream_name = "Playback",
@@ -636,7 +636,6 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 	struct cv1800b_i2s *i2s;
 	struct resource *res;
 	void __iomem *regs;
-	struct snd_soc_dai_driver *dai;
 	int ret;
 
 	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
@@ -666,13 +665,8 @@ static int cv1800b_i2s_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2s);
 	cv1800b_i2s_setup_tdm(i2s);
 
-	dai = devm_kmemdup(dev, &cv1800b_i2s_dai_template, sizeof(*dai),
-			   GFP_KERNEL);
-	if (!dai)
-		return -ENOMEM;
-
-	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component, dai,
-					      1);
+	ret = devm_snd_soc_register_component(dev, &cv1800b_i2s_component,
+					      &cv1800b_i2s_dai_template, 1);
 	if (ret)
 		return ret;
 
-- 
2.43.0

