Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534537882B
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956523; cv=none; b=ViEYXaISBlHuraPU4RAw3haTKVTtc429LLE/6QB53s3Wi2OQy7tII8M6uF8p08HtGV8Pqzk+K0Ht1vtPfvB6HeKFZc1OLAXMKRR3zEve5ABDgopkyAFLncUfpTBIrV7F14YdxwIKRL77oNyRYuZ8XeGUzXOGmvbcDWqbm2gVy+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956523; c=relaxed/simple;
	bh=tMlVnv3Uy19bG/0AHjUIqwe3ZzVat/FDbzFrTjl+D4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VELjmIxy5bZEyTtQsCjOFC6hWzGJ8JqovtQJQc5AjrDeAvl5Ccxyvlw0lP59euWVQVlpX5Fj9MonhgiIqCzIrukLkrlug8ON04YuPch+6ShmtjIqBKoLg5sE5/jkJaEXuQItyA8u8+5Vo4Mj3vvLlAJLD9K1v3p8MkhlVlieoPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lsIRyI9h; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lsIRyI9h"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B2BFF3F9B1
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779956511;
	bh=ABJGuulrA8nUHwEQn+jZIDmSNh6kAiqySDUWEGzSLYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=lsIRyI9h/qWeii/gXdkVJ8EzMp/AV2CFtKln+NGgXBS+91K+to08V6rYLt+mJ5vJo
	 R0iuufQ149cAXyWVQCw9vojCVH3Q3ttjGZg7R3tKPjssMASuxeGKiiJX6/ufEncjeS
	 YSk9e6LcREl9n1WmqZRjhVTli81qng01/wNBCczHA5BFIg2rhSj0N34Ht97/+sqTxd
	 PHw7GaTSKwsYvDsaWC1SAiAWgNv5gKm4F4yUW27/hEXGnvlF9hT6MTb41AUW6r2JCd
	 OSh6+xRpdu6waUe3M2hQ85fxRxQWDGzcEKLw3ugRQv9jq6CT3d5F+WhfszcCc77+CV
	 jJtj0mrkTc63Yg4to31vKQroKRZNCiIME/MgwDagv1zdpkuXRA0dq6dD1I+faCPnO1
	 uza3D+eBN8cwru6+i1fwkurA1zJOGyGwBDTvdokPufDJMcIRybUZHKmAFpdwduaxWK
	 cemvDqbJWGA7WYc7LSFItyd12P8Vc6ZGscToyFBodFJMXdQHZBDmxcLR59XKMdLJ7E
	 RQwjDDpk+IrsFpOeceqyS8OqTNkEPTg57+uyc/TdMHP2kjeeJr+fjBt1aRVkcXMYEX
	 Sk9DVF5d9q0U5iEhq2xriO1eXjneJKB82nSRsUwf5et/akJcxIYb8C1+raL24e7Xge
	 Hj3lk9DgjASenjM7e6Z5B7So=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48e79219704so86248985e9.1
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 01:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779956511; x=1780561311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABJGuulrA8nUHwEQn+jZIDmSNh6kAiqySDUWEGzSLYE=;
        b=ski9ypnreTikfumodT8Bkva/IuEXXJfDbn5wOk+EHjzZQnE1sQ2IyR/TRx3F5P0ejT
         ly/DCcCBrJpbVdjDdVu4w6racU9aYcFewTF0lKRuQIDtFImhvd0avtNgohXpqUOIcnwc
         5uILL6zy5hSMMnQQepoKW0C9mGGoCfY9y2Z1rTkj2eEyrAcvzCwSsGrO8BHxDYf0vji9
         nwbJF8kN1epzoSDEUkR90O/KtAAaGlhuWoRisJv3hZanplpXqZgQg+aNfuSJkcq3m7cY
         /A+6W1awU1a3px37JR3gTU0SDOzCbZiWpU889DJ0WPEC7RbbG/2L/TEuAD39n8mXJQ3h
         g8Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/boBLi6YtstN/KSutJ+wEiiSjOELpons+zUepuSg4/gskqfiRY2NW8IXs7cHzz+ERMqCOGTbwQv4fL0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iyM0S+HnUUTeboqp/I/WQaHsosqvfxNbilLSbQTSr29TrdOk
	E2bmq1rT1oHdiR8fG5gYbn482ZaFwaItia5c5UwjGOEp80LDO1/zHc0swB34MaJcJcIOvthlRVS
	DCLcqvWnHZNncOIwgBzw1mTuTO1i2q0j3/uVaoMyyDlh7iz6dbynYDHnaxXEBdad4ZffIUmye7P
	Pt1PXn
X-Gm-Gg: Acq92OGxmq0xE3PR8240RqSkWgrKk7diHnZoHzv9sBPYflFFi1/UWnEWB7vADtibVVN
	GrI+XhkDvDXfL8+QuIzY2avyJXM87ztl9oLucr1rBdohMe/LIC5yeDEFbaDzAy2VcrKTZzm2X4p
	4Si5O5RLqeUfnFWm0gUFA6mC+kO2heYyqlcSNdAqGTfagZo/e4QLuhnxcR/us8xM+5qNNLrfzUo
	OdAGZgFgzdWP2sHCDumunkqwCO3seeF42UUF6ohc42YyFe9lgXmb+momgf72/5pG94DQxOYIXTU
	3LKwuxQvn7l1AmQe2clopClMrpqJaIVNo1pMK8ZTsStFBY3iGv2NfIb0rOaJBMcy0E8gU1469Mf
	fiZo6thkHhWjthVpY48eOUceFfOEnYDKmv5099z+YRgTFOGCXn5+mjYRHW1/W0b5N238lDtvZnp
	thsYtdDxSgWSjg5Jbc60nO1Vbqtekj8g==
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id 5b1f17b1804b1-4905c60ef29mr292847485e9.30.1779956511314;
        Thu, 28 May 2026 01:21:51 -0700 (PDT)
X-Received: by 2002:a05:600c:818e:b0:490:58f4:ba23 with SMTP id 5b1f17b1804b1-4905c60ef29mr292847195e9.30.1779956510902;
        Thu, 28 May 2026 01:21:50 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a902bfsm42284605e9.12.2026.05.28.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:21:50 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Li Qiang <liqiang01@kylinos.cn>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/2] ASoC: amd: acp-sdw-legacy: Bound DAI link iteration
Date: Thu, 28 May 2026 16:21:09 +0800
Message-ID: <20260528082110.915549-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

create_sdw_dailinks() walks soc_dais until it finds an entry with
initialised cleared, but soc_dais is allocated with exactly num_ends
entries. If all entries are initialised, the loop reads past the end of
the array.

This was reported by KASAN:

  BUG: KASAN: slab-out-of-bounds in mc_probe+0x26b3/0x2774 [snd_acp_sdw_legacy_mach]
  Read of size 1

Pass the allocated entry count to create_sdw_dailinks() and stop before
reading past the array.

Fixes: 2981d9b0789c ("ASoC: amd: acp: add soundwire machine driver for legacy stack")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 09b475c83c496..e8b6819cc4b45 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -303,13 +303,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct snd_soc_dai_link **dai_links, int *be_id,
-			       struct asoc_sdw_dailink *soc_dais,
+			       struct asoc_sdw_dailink *soc_dais, int num_dais,
 			       struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
 	struct snd_soc_dai_link_component *sdw_platform_component;
+	int i;
 	int ret;
 
 	sdw_platform_component = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
@@ -329,7 +330,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 	}
 
 	/* generate DAI links by each sdw link */
-	while (soc_dais->initialised) {
+	for (i = 0; i < num_dais && soc_dais->initialised; i++) {
 		int current_be_id = 0;
 
 		ret = create_sdw_dailink(card, soc_dais, dai_links,
@@ -463,7 +464,7 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 	/* SDW */
 	if (sdw_be_num) {
 		ret = create_sdw_dailinks(card, &dai_links, &be_id,
-					  soc_dais, &codec_conf);
+					  soc_dais, num_ends, &codec_conf);
 		if (ret)
 			return ret;
 	}
-- 
2.43.0

