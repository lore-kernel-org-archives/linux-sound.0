Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76404344025
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 23:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568339; cv=none; b=CZx2jdaIMVhwvOBxuacSMMTScIGMsy9o6Xvqx9le2VT0EKjvqIKctgdKbsp3GQxMKlXDXhzP93pUJ6TnXqVjdF4Q853uqY0qR/Ek/Xh7Xi1LWwsNXlGBh5F6gEf34KL09oneWpx2JnnxxmgPg0GVQpgKdbJEo9p1WxT+d0H6kvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568339; c=relaxed/simple;
	bh=NsyTf+Lz4jLInqeFQxOcGvLPzSh8qjZB0tzhBSzB18A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tn1xadSbDNSGXBlLsgaqHIVAg2jNSnWhwGXmQ1/r4CFzywJII1KjE8saf9toEvUUmt+ou38UFdvdwbc0EwCpI3fMtku72lBBs5ttuLgRtF5706ynftl3ZhZRF2z0pemCSo99LzMUBY9tj9UqSjQcb+K5+I8OaF8E6Djj6merBZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1uEOcil; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1uEOcil"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12a693cdf29so2232945c88.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774568337; x=1775173137; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKUqFmKtt8SiUUkwvcZuhZb+tpxs1zLnXQL3Vp/gXdI=;
        b=o1uEOcil2ye9Wcn/Q8JelKjtytgDHOOljZ+OTnDhjH5q2I52lTRLgDzIDxbVCHznfG
         3J+FsTNX6Jn8cmQlxKeEHbdgNBtHZ0mIZGzuizfwSGiOmWgjZY0DBWJ+0o54QsprWoan
         5ARh9Txl6aAMNyog7lOoGTbxyBPqWm5lU1X2cZ0bc7tdS2o0zF1QkR/XfcahHwZ5Vti6
         BAiMjcnJNS+m60rYVD9MznkVHwyVpwEWrZ3FUqeCkr98cd5x+TKW//LTPTl/P+rTiQXo
         O4Rdd/T8t6jjH4V7DTumsFboXSzE5zHHVUtnYnqs0qpCI6BxBixHdBVwRHYw3287fcQ/
         EWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568337; x=1775173137;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKUqFmKtt8SiUUkwvcZuhZb+tpxs1zLnXQL3Vp/gXdI=;
        b=BmhC46upEUnAoSeAqF/wdOj0wW9mImHYJ7lIXgN/DWJ6hcmHRp0JJ/37hLDUVAvbJn
         CNb+pdNCSFVhzZg5WKeI7tZK7fpaQxO8osbE7TT1SLNOIqPqSEO9NDQroNAnmBVmpwJr
         oQIjU5rgIFWhvX50GvvSbkes25091STN3E/06EXC2wzhWfb0Vgkx0+rJJjOWvwmX/nnh
         sZ8G51UZXc1+QtMCShae7ujKMkmik8D233DwfcKJEHUqUjGysfXPh5fLJMOZrja5NvVZ
         T2ki38c5wmmx1loxzoRQS6exHz7klzM886mjHF3Q3MFiGHQdKjbSNqoDgZ+hfRtKJEdq
         Jfrg==
X-Gm-Message-State: AOJu0YyjN6QM3IG5dUC5USRi6KQhOqa1tyk/cGnshnkIUuMY5IQB8Sc2
	b3DkHNJfPxh9/yNfxD9eqT0zGPrQebCGirX5YRFVucIrmPnWni4TRBTGeobgYOUC
X-Gm-Gg: ATEYQzw2TV0M6CkQBh2uOhaTwVUtiQYVu0LeuHYy5ir858qF1bnvlMumuIcmdDx/e6/
	vF9l4IS7zw2M9nSFjku8a+Xdm9cGOEB2A49DtXOx5/vc38tFXDwfn3kUKvms3OhbxxzG8wdVj+v
	juLc4Zghq5FZzbZVVsa/baeoSPF/wKaBqEpolsCIzEbr3uGoP4K0ChVQRdwARx6pbQs/6Rz/lYr
	Ef5FvxjRlmxKqIQkWsPC3wQ4NbsuzDufaAP4hl4SmMDMGpOJEggKgv/DEU1tWkREcVxz9cQBBey
	g4DJyQs36UIz0iwvdIYUIsQs+YTVYKxaDUWlJio96iSa1VIy4qkLCpgCtKwddNec80tDAfmspq5
	0MDYf/IHtLu1cT9TXrLVuj/Azv1Z1D32ynZu/xHWH//XLtKrmvOcdaDVkdQfXV8Ay/3swFImDOd
	f7ILTPh/iUWb2gEtj/l5OxbTYghAq5y5sKG/0qs+2S1aR3eNLTLKEks8ms1mEQn8mztwAyq2Cr
X-Received: by 2002:a05:7022:1b08:b0:119:e569:f873 with SMTP id a92af1059eb24-12ab3040862mr97087c88.16.1774568337177;
        Thu, 26 Mar 2026 16:38:57 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa725108csm3840880c88.6.2026.03.26.16.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:38:56 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 26 Mar 2026 20:38:49 -0300
Subject: [PATCH] ASoC: generic: keep fallback dai_name stable across rebind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260326-asoc-generic-fallback-dai-name-rebind-v1-1-ac9da3cbd606@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQpBCLVxEXk8mkjtZUEhWh9
 O5Ndfkt3v8WqFJUKpy6BYp8tOqcG+yhA75SHgU1NoMzzpveeaQ6M46S24wx0TQF4jtGUsz0ECw
 SNEf0/WDJ8mCOKUJrPYsk/f5+zpe/6zvchF97HNZ1A/QuOlKJAAAA
X-Change-ID: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd
To: Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5406;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NsyTf+Lz4jLInqeFQxOcGvLPzSh8qjZB0tzhBSzB18A=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlHD/dZ2/rqlU49OnsdQ9nRUvfJCzj9Fj9pZudaaZ01+
 VXt1JP1HaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRK4wM/wusVsq/7gt9bF27
 5NcMhXMv52bclzbfu2txzKJZ02xsj9xk+B/3KjuJ36uTc+mUwMuRgffvrjxc8+eU2/Pli/qfOHS
 qxPACAA==
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

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/generic/simple-card-utils.c | 37 +++++++++++++++------------------
 sound/soc/generic/simple-card.c       | 39 +++++++++++++++++------------------
 2 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index da6353594d61..5997bb57e661 100644
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
@@ -1161,29 +1163,24 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	args.args[0]	= graph_get_dai_id(ep);
 	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
 
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
+	ret = snd_soc_get_dlc(&args, &resolved_dlc);
 	if (ret < 0)
 		goto err;
 
+	/* Keep fallback dai_name valid across component rebind */
+	fallback_dai_name = resolved_dlc.dai_name;
+	if (fallback_dai_name) {
+		fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
+						       GFP_KERNEL);
+		ret = -ENOMEM;
+		if (!fallback_dai_name)
+			goto err;
+	}
+
+	dlc->of_node = resolved_dlc.of_node;
+	dlc->dai_name = fallback_dai_name;
+	dlc->dai_args = resolved_dlc.dai_args;
+
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9937a991846e..7c399a9713ca 100644
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
@@ -98,29 +100,26 @@ static int simple_parse_dai(struct simple_util_priv *priv,
 		goto parse_dai_end;
 	}
 
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
+	ret = snd_soc_get_dlc(&args, &resolved_dlc);
 	if (ret < 0)
 		goto end;
 
+	/* Keep fallback dai_name valid across component rebind */
+	fallback_dai_name = resolved_dlc.dai_name;
+	if (fallback_dai_name) {
+		fallback_dai_name = devm_kstrdup_const(dev, fallback_dai_name,
+						       GFP_KERNEL);
+		ret = -ENOMEM;
+		if (!fallback_dai_name) {
+			of_node_put(resolved_dlc.of_node);
+			goto end;
+		}
+	}
+
+	dlc->of_node = resolved_dlc.of_node;
+	dlc->dai_name = fallback_dai_name;
+	dlc->dai_args = resolved_dlc.dai_args;
+
 parse_dai_end:
 	if (is_single_link)
 		*is_single_link = !args.args_count;

---
base-commit: d084fd53a2fd5748d4317635b1c1a7dba7edf583
change-id: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

