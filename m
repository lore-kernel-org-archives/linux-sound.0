Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BBA37F8DC
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401053; cv=none; b=PbWOm83+KG6xd1RB+HJ5lFFZpvXjwX1SC+/R4ghNcGO0/LdltMr3HjIxq6VylK/GpwPx//ee3p1xsuPrmaa/Da19UcMUH+ibhX+GjzIeDKYQT38Y//dmJNrXCbeoShooRqxj3qzniE6nKJKocor1/rie8VAO2HuCB6AHUa7XjBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401053; c=relaxed/simple;
	bh=09+uHExlisne1jIooukG5gRoEn/YSMdFeZBQ6FKI5q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R1W4YhZe0lVqp7269qdXPX7BPblXXfAtlxSw3V2soqeAmdbd+UJhTApHWy1YdiOnpYNwodGoZ0XmGJxtdV08EDk+22DzFHBil04ZJn03Sz6YXmI8yD0WUCSkulL/qN7skgVuo8HZODGh3tg49Xwz8L7cTYsxVXUbn4YBULDZtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAG+A2KN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAG+A2KN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847e6f03df8so4558233b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401050; x=1784005850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=GAG+A2KNb/gmf9ICd3JvC0q67uHzZY2uSx6bT6I7VVVpFD94hgKH7BW734MsmRIg0U
         hIMItljSk3ysoc32DR6LpypfXi1wX+dGsdTQxXoV0bjLQ8r8stco1cKQ/ICEgSsy976H
         b8PTRSndI7NzzD2WVbIn+JNnLXTkSdSv8FUqiUqTFtoMs6t/ACY65y93clQEzy+ZUR/Q
         Hd9agl6J7dVdkCimKvdjeE6XaeEqs25wXX8vYHwmtvuvlFgoRXd/ro97JhA3DdClTLUU
         EWTXQkf/WNqC5kJmlHKkJ7WWTBnOB80BgSUjYbYuFcDPiEhlTNM02FFds4JCcADhzm6E
         K8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401050; x=1784005850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=pgq5lGftNXSWzv8nSuYx+XiUbRC6ifmAv5UKJZNICnJ/TfimLp82ub4FkcbKhOwedO
         wnIbJXAbuXZThn7Krh2/7w0nzY0ZtRQY7wnzxDe+//IXQ2VZfuKd/t/5sZlusmRI4iEs
         7wkU+3k5+QS7n4+WnEQGmsoN47v8SUQo3/2VxeSSAQLMfeepLUX/mOMb4Th9mV6ZO8W3
         YaXK1evD22m2fLzYZIo9N0H1TV7oEa6fOdgjEa50CM/KAiiu07kj2rqJDqaHoRgVgnP0
         XSfmabJGDIR2bQehxjgN5wNQ2SaNmwN0JVf7zYepwjbU5gi6JzxXVeNfyRUG4nsmgn9s
         3KqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpcmtrn/BPmH1q3Ul/UvA/94giEbkWkQXm3UcmihHV07Zb+8WtQT1C9/LfQdZ/rCK0EccNnOQagGtxaJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vE4CXtqK1i5xelZxaG9Z8ymQrD7/Wo0eaxGFxd0p9PJJAWp+
	X2LKvIYNZFtY5IJNRCMjfMXds4cnABYVYX/N7RfjFvDYIu93kH7hZvGi
X-Gm-Gg: AfdE7clMweH88mZUOMRHkqB+tF7+uzEHzIKlsXtePEmk9iv/xZxILZNdp6Bn35qfF+v
	+IAsoMdSf3gupVtQOvLwKaYDmxZHZiJV7tUFhzjDXu1Vz9EGgXTuebz556wcZAtPDih/769rd2m
	CpODFWNDjgj0UhYWG8+OZc7ggY3tmC7sc+Abt1sRXXyLoQ/Z5y7OcXoSBPGQVBt1qSJi7f7K1pN
	XLVGtOcYloGEI6UaFM7goneB54bVBwYeiUGHGxGWZTm2mMCzz0b0JXx3jtKx47YuGZ7IzomYWgH
	kjRqYYG/jx22ohNG8x4LefFA5XCk5Vw3UGnDot8H9lAlAWjybkHTHQ7Em6orJxrk/aBp4BplcZU
	t5MhGmU+y0KEQh84M1RY8GX+yTxE7x/ljXSml8Jt3JkQKbsgtxjv4/ov42d0qESvqaJeZ43EK/J
	L2HPKAwXLsMqrhAeoAvVC/o27FwzpbxSHwZI6DBw5ETTWQEJM=
X-Received: by 2002:a05:6a00:2e87:b0:845:4928:8645 with SMTP id d2e1a72fcca58-84826c1ebfamr3415918b3a.7.1783401050517;
        Mon, 06 Jul 2026 22:10:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:50 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:44 +0700
Message-ID: <20260707051006.20058-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/ak4613.c | 83 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..be5306d07d40 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -95,6 +95,7 @@
  * see
  *	AK4613_ENABLE_TDM_TEST
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -384,7 +385,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +393,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +507,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,45 +598,47 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if (iface->fmt == fmt && iface->width == width) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
-	if (ret < 0)
-		goto hw_params_end;
+	if (ret < 0) {
+		dev_warn(dev, "unsupported data width/format combination\n");
+		return ret;
+	}
 
 	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, priv->ctrl1);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
@@ -645,10 +646,6 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
 	snd_soc_component_update_bits(component, OCTRL, OCTRL_MASK, priv->oc);
 
-hw_params_end:
-	if (ret < 0)
-		dev_warn(dev, "unsupported data width/format combination\n");
-
 	return ret;
 }
 
-- 
2.43.0

