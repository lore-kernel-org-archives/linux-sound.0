Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CBA1F099C
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315399; cv=none; b=OUChuJds5FztVsVbuWptrf5gklNkll5zktTo6dCJekFUy/U8kpe3VAKpqFVIo3b1Dd5qBbOiAMBaj4vLQnesmEjvq443SpZpUwpiQCGSuMK7FOXhnt6bgpSc/BgkpqlvrNBn2UvFj5aATNYgbWJSUE7f8U9vGLnqLkdcfsdvx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315399; c=relaxed/simple;
	bh=0nndnxehF8p8gtYhNyKcqNJYzw8UX2W6RofWyaFs+6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmWGUL5+/sUGAIoclw75K2PkyBXopRpgMX7IpTAcb04aPURGoW/XD/xEmOn2w65omU+MwCJhzK66M6C6IB+q4LMv5AAdxkQ1jwGL1vWQM+lEw1B72VLS35GYlB3SIeFtWbv5DBTv2/FAi5wh/O76ghlkqh/eFRAUaDfQDV3kRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOJJh6DA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOJJh6DA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so618467b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315397; x=1787920197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=VOJJh6DAUJYMD8UNS7zwg9CL3NIRFBqeV8E5tWphL4Rw+cTYWSooiqB4fOZoz8qFJt
         2AVB77TbZUhxO0OJb3q2EdsmkBBE+6k59Vi8IAiQhxW7P0MSgTTkYB8ASxpksouIeG2S
         98Xdq+nop8brY0HDhmvn10g3sGZvfab7q0ODvaS0RuXs0irPEphIctAYUluIja29hPS5
         75oXyaUSbsJitt26OCPa8RXZeoKx2trAP7vxAkDqYBThbZ9lGzTm//i/TbbpqwGohEp9
         byYZsndpZpjFGLnXVS9FHXnGOcdZ0JLnz8CysnVX13vJCdd2OixTCWXai8t6zXQ9ujkp
         cedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315397; x=1787920197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=GjoyhHLPfFNG1JEorhcxxOcBcqmf0Do4Gd0HRzbi7EJe/wxOEo3MgyvB40S29y9QPE
         dljQhsNcdldVyGe4ZlLUThSGqadXu0Ne65FaAYxkR3aGPl6vIqi183hlQ5c7DnDkFooQ
         brla9Vd0TXRIYaXsmfD+URnwgInMrXRXZQfjR7ZSDLR2K+Zwi1OrgJMkVODJ25HVWjAd
         DT1kwX74liTjF3KOxvHx5+UenzaqCwyBxQh3+JhBDKbYicRAEgXbSg00WdY6gtrfWP9m
         WrUfkRUhxSRtIuEm0n7C9zB6aZR7LZ6XhmRY5xY+ovT4WV3304kyvrvRxng8PpUjdRXX
         yBkg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1DlEUuIHNIl9/BpYoFbsmd73SU+ysZxgUC/i3aCfZMrezxErF5IaL4f14EztA5jk1WNnrrs6ugtgVoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l+SPpuJq2f/kk2CP6k5wmNkVZj9TAuTgDw0QfbWA1sgAsNt8sg
	pJQzjizN3p7n6mwawaTo6AAKYTfGEidr11H3hDpk7kw8O+ft5Dl0kuAC
X-Gm-Gg: AR+sD13QsAeLl0XRqhYJsub6ZQKNo1YrNOpqNhYGiDXKVOg2D13FkiARytH+I9z+LGs
	zKnas/OsQvL6BycFT5twJec418OJ917KoTNW9tnyTMek+w9EWWIfj2W87JtyRdniz8vfZdad9hX
	t9J7ohfIPMzPr7Z/qE/E0VA7ZLX3ivzEeu9hsqa6GsSJhWK7etMK9vyvnDQov1pglHdFebEy04K
	JsD8wXMdQKT/gc3kjvNPgAYv76fx4jNrE4Gw92cMrfKN4VKrRFoEr9DnUvw3UGc5loxqQ/vLvEl
	zhhZAzYNne5KEghPxMc+0e4IWDTz3joh8hRAZW6N1VWfSoRsBZZnLlASRoPQVKAlHbEAlnGm0N3
	QrURvX1aWzRdD7gLVKg0MxshLIR8j8PM4KIELT0sqaEk4HSJzu7vAGyc14lI7qwZGTPx0By5RDd
	2klSKWE+bqsp+tjRcCiWls7F/YUc2dy7npsw0cZ7zEQqthlqQeh0oaw0H89uY7GjRimO7BNcldv
	m25m0jXMrcYOHsJA67eBIUru/oo3YFAsldze0rRkhT0ug/DjFSzFYK4intrsMzkkqa70tFMM3ec
	wfIZ
X-Received: by 2002:a05:6a00:ba8e:b0:848:34ad:3d6c with SMTP id d2e1a72fcca58-851f9f4a715mr9133903b3a.15.1787315397244;
        Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:29:27 +0700
Message-ID: <20260821122928.41343-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 0790d8123179..46cab62220d9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

