Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C21E4AB
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 06:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755844073; cv=none; b=sWy3F2STitqo8BNqNK1k8XxdHG9qgJJQOux23GtLhVkmR7N3e3bp012LnLiUmhJda192W0eB12nhWQ8TA1r3Bay0U6H/jAYyQnR2oTwKnQyIDRk/bc+K2DK8sN5Klj3Q7isNMFvHiZtVLULLStWldFXm/zMJKd5Tw89vANiJVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755844073; c=relaxed/simple;
	bh=9ATXq32utM4kfVagp8Kf92pg+poNWX+xRDXTF9eH0no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsWIdVb1blCWBolKMystnNddxd0l4PHHpfa4lj/7OL/e2kkCAezPtBq+WF519WM0QnRZUNMjCISN0KDpqeKxinADwmRGeBdiXmlC7BiZgNBJgFKVqXzHWVEpUrCi7nHUxsoyubBGPmqxIGhLKEkSHT7Wwf338BbU9k03sGc3kcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fjCpuQJ2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fjCpuQJ2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24646202152so2144505ad.0
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 23:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755844071; x=1756448871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a74RVsak1TLYR6bws4zrQXpjsmVG5raUd4MS/ii7fb8=;
        b=fjCpuQJ2UiPmSWsDP6Tg6H0G/9L9P0d3Ms37T/R/eAxXt41G5tDsa1jkzU+V7LImYy
         tNlbwqfaYxeTQPKBzb0IMSSECi+Zb+LDnfpjJgYxtFYk8GxvWmWhZnpK8+/G31ufn8X/
         a9m25H3eXfdiOitMoy0gn4vKD/FpNg63OYLdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844071; x=1756448871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a74RVsak1TLYR6bws4zrQXpjsmVG5raUd4MS/ii7fb8=;
        b=kJG785H/RM9Az/WOcf+DGZzgHRX69k/SIs5Gg1GSbD4Nr9xASWVyjVDgco/6LyrN7X
         WhAe+UXKPSNi+uHn7sOwy73asihneVnVgxlnGiZ5kEMO/1/hO/GMOv4fHu2jU84005hg
         jGS3Dzs9Mo4zc3bV1W4F0bApG9KiMcyJcHRRfTmcAQuGkxQzNhRaINZpctL6JSnaEFh6
         FSuETGg1gj7jEnmj2rZC3M+6G89Pl+vHcQ7FzdqL8QWh+huJWEB3h9m2QgUSomupFLqu
         TWPRFVDjxjTcRb7Ut7PCleUoXoxMK6SmU4G9SJen/zWXeDm2XaMbid/KKRXvsBfG0fcO
         Wuug==
X-Forwarded-Encrypted: i=1; AJvYcCVqLERwWRkErEiAOosW3jh9PpgvkiVeMyP57gR9kmlJVb/08BVctJWQEL2f8QHErCuNU01zeUT+6glLaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBS4zadoIEAA0Gq4NyJk0ECSFrZR3ATelOu/JWVD/X6PtPs6m
	Oge3gVU2m18qfCqvJqYF2dOrFV+K5p4rVeTIGTbUcVVuDPZ2/ciDWC+GlYN8P672Ng==
X-Gm-Gg: ASbGncv9w6K3CtdSTCA6Sm1/I7SX4JPPqVDkYYU1Bvm5/gKhzIDnsdNY7zpIbuocdim
	7HGqNueMLVOYyvYezzLXzsB1TMXS73zeUsfOat2yFzINo+JGvnLx2w/vdIOrznAwla876DX3Ud+
	hnh7LQlGS9VZLcoEV4N/qcgtIlCKSJGuEbxoen0tdFvbKCxYsS7rQAdTkuMC6wL3zWbqhX5AWWx
	Icus9aXLZC84gdbCYKX2aWmGF/UtCOEBONdFdxEM4ucvsT30h5nirFu9sUsMbds3qAXgY5B2pay
	r5hB53W7PsqzyWo2cH9DXWtkK/IPofCLXHOCWnU3N3Y586Xr0uMPwmiaGc5VVfZBtGOEiEbLMZ6
	MEbuYSQzFTyfFg4l46JGMu+ESf1vUcaXFfnQletTldoo0kZ1q8Go=
X-Google-Smtp-Source: AGHT+IF4m2GD74ARWQ90O62WKvsqVkiAGFVrRDGXDAa8grwxDZefBXzvdvCU1/9OIzJpcFb0Leq+aw==
X-Received: by 2002:a17:902:c402:b0:246:464d:118a with SMTP id d9443c01a7336-246464d12bbmr7066525ad.46.1755844071478;
        Thu, 21 Aug 2025 23:27:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8278:5411:367e:2f11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2463606470asm11813375ad.14.2025.08.21.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:27:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
Date: Fri, 22 Aug 2025 14:27:37 +0800
Message-ID: <20250822062738.2632746-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using for_each_available_child_of_node_scoped() allows us to get rid of
of_node_put() calls from early returns or breaks in the loop. It also
fixes issues with missing of_node_put() calls.

Switch to for_each_available_child_of_node_scoped() in parse_dai_link_info().
Also drop the braces around if blocks now that the inner block is just
one statement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../soc/mediatek/common/mtk-soundcard-driver.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 95a083939f3e..1e3b43fbb16f 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -95,34 +95,26 @@ int parse_dai_link_info(struct snd_soc_card *card)
 	int ret, i;
 
 	/* Loop over all the dai link sub nodes */
-	for_each_available_child_of_node(dev->of_node, sub_node) {
+	for_each_available_child_of_node_scoped(dev->of_node, sub_node) {
 		if (of_property_read_string(sub_node, "link-name",
-					    &dai_link_name)) {
-			of_node_put(sub_node);
+					    &dai_link_name))
 			return -EINVAL;
-		}
 
 		for_each_card_prelinks(card, i, dai_link) {
 			if (!strcmp(dai_link_name, dai_link->name))
 				break;
 		}
 
-		if (i >= card->num_links) {
-			of_node_put(sub_node);
+		if (i >= card->num_links)
 			return -EINVAL;
-		}
 
 		ret = set_card_codec_info(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = set_dailink_daifmt(card, sub_node, dai_link);
-		if (ret < 0) {
-			of_node_put(sub_node);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.51.0.261.g7ce5a0a67e-goog

