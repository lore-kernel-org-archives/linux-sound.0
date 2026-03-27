Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657F34107A
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631805; cv=none; b=lAj8rQlzsDO/hAU4FnqMKPKyWWwuLfh3Uvvan0f/00+tiI1FfVC9j7Bqw5hqKiGBxUPkck3Q2O6h885/SrrupsOQy0ScIF+U+je38vx0/Z5b0wc1DgIATmz5C6ARqAkzsSl8Xe4h4SSp0fAHuxyE2mEJkfckuSwpd1+dp688aPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631805; c=relaxed/simple;
	bh=/SykNSI47zNqLpYIqKSmqbedZuy0lIpaVsgRQ/cxV8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HjrGJ7wqiiakN47o/W1QHKnOlysgJiXiOde0idQuCKgOHGSt3d3xDGRH/mtFD3x5BrKisg/JpkBsE/3GQUEf8VAkpyFtKb3S8Pwv/Owc4q0RkVlV3YJbGwJKYj3hACDhoyTzXH/XDamLcIqw7C25XtSEqqTdH52X07JUokPuoo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEBe1Bhj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEBe1Bhj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso3617688c88.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774631803; x=1775236603; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/yUqbJr6CRtj4We34TBkFmWwvqhhU++Fms724gbhZA=;
        b=PEBe1Bhjnps+qS3b/zcEJ++iIVk+KDyzpSwPksI7oGeRtr5iCgK9MnhvHPlkkIb4P9
         AlQazMNtglGRk9mtim2IEFbC8gO/h2NEAOY8dPJGf05qdAfTA87gQvCXQRQdqtJchmde
         e0AWpceB3m/ByOeMCvqxqvZBwtLmvoG8lZjhTrzy/qDzCW4h3i5Xt+SQD9FCSHD7TR45
         zK+ZRpdANKr4ibRPUdWJSSwEuV9UbZLyXebChMc7fWraCZ+OjMcQqC7C09EvC8ALFGHZ
         gdHhdRqxSU/rW7RedATLyyoNQ7qeM2wlLat33ZlNs6A5VUTD+LPpKcOmMkASV6SQkJ9q
         UjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774631803; x=1775236603;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/yUqbJr6CRtj4We34TBkFmWwvqhhU++Fms724gbhZA=;
        b=X3nBSUfbh9CeeV+mhiZUluA39gdkR8drAJOTS0uZxFPae08JjQgO0r3up3NhhGbaLr
         jhTJpeAEP8jWZmQYtP09ct//en4YfDLHfK14R3pvHqD3wBzIl47YVG/Z94WtrnPMFOif
         Yt/befkx19v0erXU7sHC32n10wkkJUcWxl+awiexGfYWwP4ooE6rFgdWeQeWX/KY+oWM
         zEelxt+f48kCA/y1mVjAeYBFPUtXlNyg8y8o8V1BMwLi1Ya5zc8JaFgUozT8ftox6uvV
         cghIdw/YszcZOhsB2LgiHfWII6NL+eXmLyt57POZB8VbB9TBOCGhI9D278jiAl6YY6ef
         s9ug==
X-Gm-Message-State: AOJu0Yyr0kyDZqoJm5J0nLO9Bl2qiiCH7wsXsu4MjgRh06NjeNFsktpZ
	XtMehdlXpELfY82EDrU+jrAJaT5kjStVKerkDqlWoSFFsZfOoXp9tUiLVTbZm7e5
X-Gm-Gg: ATEYQzy4r6kx3vcqf7F/sHPbsDhy7fZb94q/IMQkncXp6i16zbK3StZ3sT3JfyFymjj
	Ef0jOUbNEFQJePqMN3bq/Ll+QBPbaTr1KHSelldReMXImXyHamqqbXhikscuLOcq0pz7VC++/7J
	TllWHX+OIE8xROYoHUy1PyE4OBh3EMxOl7ZZy76iv1hR8tq9a/C9Pay+e3KZ7T6M7p4+XLtZtZx
	szQoOzqjyp2SUzvkRblLx1f1v7b+hfSYha3mzR0T19YocNlumNFImJ8EYpytbmyEkh4SbauB3O/
	ZnlU2UNrjJLNwfQIaJyJ5wLlMILDvnHsFleRGyXX5iHoTGvXdDaILEAq9WJu9cTk9Mu8zzJFxjt
	Vx43N3/DmU3O0rCEPjdNpCDO1VydKhIcLOy8yO1VfPj6jUTz3iIawdbvbxf+mpLNo8CGJeLB7Fu
	pS+U55OyAQOm6+dGVbK3UIGgO6N7K1fMqqrDP07OqNtDgLWUlcIzqA3Hn4Z+8Ib7wKqZxROFL7
X-Received: by 2002:a05:7022:684:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12ab286bc34mr2063661c88.14.1774631802474;
        Fri, 27 Mar 2026 10:16:42 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa78462fesm8591213c88.15.2026.03.27.10.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:16:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 27 Mar 2026 14:16:27 -0300
Subject: [PATCH v3] ASoC: generic: keep fallback dai_name stable across
 rebind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-asoc-generic-fallback-dai-name-rebind-v3-1-c206e44f40c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOzY7CMAwGXwXljFF+IC2ceI/VHlzHLYY2RQlbL
 UJ9d1K4cNw9jvR5xg+VOQlndVg9VOJJsoyxgFuvFJ0wdgwSCiurrdfOesA8EnQcyxlBi33fIF0
 goEDEgSFxIzGAd7VBQ7Wu2qCK65q4ld9X5+v7zfmnOTPdFvmyOEm+jen+emQyy+6/zcmAAaR9Q
 EdN8NofuwGl39A4qKU52U9r9VerLVbjfE27iraow6d1nucn4BHV70IBAAA=
X-Change-ID: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd
To: Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6570;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=/SykNSI47zNqLpYIqKSmqbedZuy0lIpaVsgRQ/cxV8o=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnHdpefOZCxr5VRkTN/kcjmI0fyk+JXBq7SfiZVac/wv
 a5yadKkjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjI+22MDNMYnCef9LdWPPRw
 LmdB+nmL+MRrEsYrHOw39yQ8trVVucrI8Md8uown79epL2tlfecvnzPj5FtXxo2nsiqbeWbrWOw
 NZgAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

simple_parse_dai() and graph_util_parse_dai() first try to identify a
DAI via dai_args. When that works the card can rebind without relying on
dlc->dai_name.

The fallback path still calls snd_soc_get_dlc(), which returns a
borrowed dai_name pointer. If the CPU or codec component is unbound
while the sound card stays registered, the generic card keeps that
pointer and the next rebind may compare stale memory while matching the
DAI.

Stage the fallback result in a temporary dai_link_component and move
only a card-owned copy of dai_name into the live link component. Use
devm_kstrdup_const() so static names are reused and dynamic ones remain
valid for the lifetime of the card device.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v3:
- Add Suggested-by tag.
- No code changes.
- Link to v2: https://patch.msgid.link/20260327-asoc-generic-fallback-dai-name-rebind-v2-1-1368c57c4a0d@gmail.com

Changes in v2:
- Rework simple_parse_dai() and graph_util_parse_dai() to use if/else
  instead of a non-error goto.
- Move the fallback snd_soc_get_dlc() handling into the else branch.
- Link to v1: https://patch.msgid.link/20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com
---
 sound/soc/generic/simple-card-utils.c | 52 ++++++++++++++++-------------------
 sound/soc/generic/simple-card.c       | 46 ++++++++++++++-----------------
 2 files changed, 44 insertions(+), 54 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index da6353594d61..e5cb602fd248 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1128,7 +1128,9 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node;
 	struct of_phandle_args args = {};
+	struct snd_soc_dai_link_component resolved_dlc = {};
 	struct snd_soc_dai *dai;
+	const char *fallback_dai_name;
 	int ret;
 
 	if (!ep)
@@ -1152,39 +1154,31 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 		dlc->of_node  = node;
 		dlc->dai_name = dai_name;
 		dlc->dai_args = dai_args;
+	} else {
+		/* Get dai->name */
+		args.np		= node;
+		args.args[0]	= graph_get_dai_id(ep);
+		args.args_count	= (of_graph_get_endpoint_count(node) > 1);
 
-		goto parse_dai_end;
-	}
+		ret = snd_soc_get_dlc(&args, &resolved_dlc);
+		if (ret < 0)
+			goto err;
 
-	/* Get dai->name */
-	args.np		= node;
-	args.args[0]	= graph_get_dai_id(ep);
-	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
+		/* Keep fallback dai_name valid across component rebind */
+		fallback_dai_name = resolved_dlc.dai_name;
+		if (fallback_dai_name) {
+			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
+							       GFP_KERNEL);
+			ret = -ENOMEM;
+			if (!fallback_dai_name)
+				goto err;
+		}
 
-	/*
-	 * FIXME
-	 *
-	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
-	 * If user unbinded CPU or Codec driver, but not for Sound Card,
-	 * dlc->dai_name is keeping unbinded CPU or Codec
-	 * driver's pointer.
-	 *
-	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
-	 * to rebind Card via snd_soc_try_rebind_card(), but because of
-	 * above reason, it might can't bind Sound Card.
-	 * Because Sound Card is pointing to released dai_name pointer.
-	 *
-	 * To avoid this rebind Card issue,
-	 * 1) It needs to alloc memory to keep dai_name eventhough
-	 *    CPU or Codec driver was unbinded, or
-	 * 2) user need to rebind Sound Card everytime
-	 *    if he unbinded CPU or Codec.
-	 */
-	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0)
-		goto err;
+		dlc->of_node = resolved_dlc.of_node;
+		dlc->dai_name = fallback_dai_name;
+		dlc->dai_args = resolved_dlc.dai_args;
+	}
 
-parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 	ret = 0;
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9937a991846e..b24ba1330896 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -69,7 +69,9 @@ static int simple_parse_dai(struct simple_util_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args;
+	struct snd_soc_dai_link_component resolved_dlc = {};
 	struct snd_soc_dai *dai;
+	const char *fallback_dai_name;
 	int ret;
 
 	if (!node)
@@ -94,34 +96,28 @@ static int simple_parse_dai(struct simple_util_priv *priv,
 		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
 		if (!dlc->dai_args)
 			goto end;
+	} else {
+		ret = snd_soc_get_dlc(&args, &resolved_dlc);
+		if (ret < 0)
+			goto end;
 
-		goto parse_dai_end;
-	}
+		/* Keep fallback dai_name valid across component rebind */
+		fallback_dai_name = resolved_dlc.dai_name;
+		if (fallback_dai_name) {
+			fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
+							       GFP_KERNEL);
+			ret = -ENOMEM;
+			if (!fallback_dai_name) {
+				of_node_put(resolved_dlc.of_node);
+				goto end;
+			}
+		}
 
-	/*
-	 * FIXME
-	 *
-	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
-	 * If user unbinded CPU or Codec driver, but not for Sound Card,
-	 * dlc->dai_name is keeping unbinded CPU or Codec
-	 * driver's pointer.
-	 *
-	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
-	 * to rebind Card via snd_soc_try_rebind_card(), but because of
-	 * above reason, it might can't bind Sound Card.
-	 * Because Sound Card is pointing to released dai_name pointer.
-	 *
-	 * To avoid this rebind Card issue,
-	 * 1) It needs to alloc memory to keep dai_name eventhough
-	 *    CPU or Codec driver was unbinded, or
-	 * 2) user need to rebind Sound Card everytime
-	 *    if he unbinded CPU or Codec.
-	 */
-	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0)
-		goto end;
+		dlc->of_node = resolved_dlc.of_node;
+		dlc->dai_name = fallback_dai_name;
+		dlc->dai_args = resolved_dlc.dai_args;
+	}
 
-parse_dai_end:
 	if (is_single_link)
 		*is_single_link = !args.args_count;
 	ret = 0;

---
base-commit: d084fd53a2fd5748d4317635b1c1a7dba7edf583
change-id: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

