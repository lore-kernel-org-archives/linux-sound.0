Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07037756C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 04:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774584720; cv=none; b=B+KkpaOwQ4Gb0MbZRN2CNy/vw4S6a03N774cmUjW7H1UtXAGhuCrRy38YOQ1UZtx7uSA5udHS1zS1NwnfzM+5/rIZNhEVE4C7jEeOBpjjVtguaJ6C/LNb7r2VMAIO4h0POzeQvmio2J5Rs4Yug1dpno0nbttnlDuyIOvemGq1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774584720; c=relaxed/simple;
	bh=fVut7ZRl6PRwhwI9Vhro3OvLty6J1aPjeQYTG0bUIMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TkF0NMMc3KLaIm+zlfumEuYVAFxWJAgPgTS8SSrxdn07myOE2kiKxObbyyfPhkNAUuyf7syU4Ryra2wH7KHejDFOf4eOyHZJISkdEHvp5ewjZAv4KaE9383qcpuyR66NTEAHmLsSfeC0oohv9bZLtt/7lAR4MtQ103mfnQXWiNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWplghcm; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWplghcm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1970830eec.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774584716; x=1775189516; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLACIITfsa0ne8RnNWTx9rXivqy5OP3/hll1LkZF748=;
        b=eWplghcmSK7Dux1h8OMjvvutJoDkhFl0hRxFC7tB9nx2iYOdlWedfbjJpitHAoctyX
         5PP4BlZ9wSjV9mnM2D3d0KwxUK9rkol8BQLDQMDV9VBq8Yk3CskEKScCU2D0Sm0LdlZA
         Xp4hOmF70P5flxzkhciCpQUqzJCkRjyOdfRoAWRteub7Qcygt1K+EqvGg3I6jl+hK149
         VE89FCUieNhr9Q+wSzwUXUrhkfUkb69nfBoelWEarI1riLfNotee/YSkWfiDSeJuhrxA
         zXn26u42AxHcOLowusqtnO4sv3bF/SO8jKOw9wcwj1GJMiFcYKo3lZelo1SbpVXiQMvN
         Ippg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774584716; x=1775189516;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLACIITfsa0ne8RnNWTx9rXivqy5OP3/hll1LkZF748=;
        b=aWGi46MACCrQTnXn/312m7JlatYcAGeIPyR1XX8PSyZseNkSVWs8JIBIwt2Hqada7J
         uXqOkMbwmyUcswfQHjvo5MJoHWBrpzE49U/jOtwcnO9+e8sx248o/czHyU5C/EZq35vC
         3cfavcZOQk5Jdh+bnhpMCQ/SX8vkToVyc8I5/85RH93QEz62b1si9u9TYiy4/1wEUxH6
         KYqnx90BP6u2QaqORt6baVXXk8qN87kkjjJ+Znb19XcIhTvDAV0ai1j4Ur9IzEWGl6bv
         e3gE7toeTcfRy+/0wZyb2WSr8XCzt01HaXHn3CxsMjxoXoLGo356y7ZN1Zr5QGOpLRRO
         BpMg==
X-Gm-Message-State: AOJu0Yx5WCm/fe6Dduk15q4jxY0PeQqp882OdenFCEVKhPV8udydxc+k
	zPxxw+MC14ZkYo8SjPM6tgDn9i56g8lqEIEtALLzj3BNI1esa6HJwqhd
X-Gm-Gg: ATEYQzw+F3fULR+OOa2yPVz7l6hkHTq/SQTCFhp5JKY3XirVunN+D9dAwCcuvVur+uO
	e4e86BZzWGAlyWAExsukTB4MlGf6IXfy1NyjwiTnxiOe1D1FLn1+3eitoAMTeabzxIuDwY5Lr4v
	HNVBvqphOTRY/Ej/cPAD4R+S2gvp45KgYDtJVqT2bbuxMN+n/fKzftXJxwzCgxlYY3f4aMedns8
	DQA1a4/j1ywZ4KtU8Wrz13iWLCAylxhkhXJwmRuSJFx8zoNhc0u6uo5ciQgwDMo6M7CV0BO50z4
	hWYw06fxI5RVEwDbyVgz0p28IxklFmRmjoyOxK2oXEtXHzyVBas2Wf1HHk0mnDm2Hr3DReOGAHw
	erA6xtpZK7OV7Yzb2a4hCAvcDhLL2YfD4JbmbzR/K+hIHYC6cc6/iMa+Ym8AVyojNm9ct+SXmuV
	A5vAdQYWV48m5NkDqCozUIES/BjT4RUTIKmnsFEjoMgM1ccldkFGNwnliPfLjRpwurWD5rZxHRu
	w==
X-Received: by 2002:a05:7300:a584:b0:2be:7885:31df with SMTP id 5a478bee46e88-2c185eb55e9mr583061eec.17.1774584716103;
        Thu, 26 Mar 2026 21:11:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec26651sm4413276eec.2.2026.03.26.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 21:11:55 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 27 Mar 2026 01:11:45 -0300
Subject: [PATCH v2] ASoC: generic: keep fallback dai_name stable across
 rebind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-asoc-generic-fallback-dai-name-rebind-v2-1-1368c57c4a0d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dgyFpKIr72FYTKcDjEIxLRIN4
 e4WPIHLl/z//l9U5CAc1SVbVOBZoow+QXHIFHXoWwZxiVWRFyYvCwMYR4KWfaoRNNj3FukBDgU
 8DgyBrXgHpqw0aqryU+NUcj0DN/Led271j+PL3pmmTb4lOonTGD77kVlvuX83Zw0akM4OS7LO5
 ObaDij9kcZB1eu6fgEAXhnq7AAAAA==
X-Change-ID: 20260326-asoc-generic-fallback-dai-name-rebind-6381a1c807fd
To: Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6324;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=fVut7ZRl6PRwhwI9Vhro3OvLty6J1aPjeQYTG0bUIMI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnHmDuX619XXTFR88/aFu5Pp1/pt/92q+Q35JSv+vr9o
 Xd+uOfbjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIT3VGhh69ZDPVJMd5e37k
 VNwPYbx1Luv3zF0yNqVX77memHt3LQMjw9WHjQJ/t++brLFzWWvU+j08dw988lxoNUmX0UPRVPX
 GGw4A
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
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
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

