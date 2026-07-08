Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED8348C5E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515049; cv=none; b=cPjfEo+Z/V9nV2lG4EYO330tYalqWbbmvxaxCQQcQrNLosKkwi3UJQhxfiCMcCBGzvh/SmdWk1YmQs717/31r7gK2z97amg3z9XoUqOe6zHHYzbyzhykIQVQz4YKljiLHMl8IfkVOA4++VI0B3qriQ3NVfmZFr+CRR0VbhJPito=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515049; c=relaxed/simple;
	bh=09+uHExlisne1jIooukG5gRoEn/YSMdFeZBQ6FKI5q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJM4qq1Sgb3AxwIoRouLG5E45MNgt1o3JhO9/+Qz5OaphEDz+NRPDDdXs//Yfe0Ihy33PFFzyxKf+dTAov57f7IBYn0MiFyEDh9/NoZ7t4cWrLegPCQEnITk3nfND+23Iu2oqNUZQvfi24ABl2sDhAAMMW3JJRNyec4K8J2AT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxvHyfFz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxvHyfFz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3811e59df58so405789a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515047; x=1784119847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=RxvHyfFz2IUIfal8jXFATyIpaMIkoVqx2VbbXPm88eihYV4F9NaTRQ7QiJFRIvccN7
         4ru7dTI08xnHgBcOdCCMzk3s9DEC7xMga2971cxX1kcyuw5NgN0G/t8xJiun+89LLtGw
         ovDu2ylh1200hXZwBLCy1zXp9KAoPoyfA+fNpWQJhzk9GA/0ibq8yvrbTwpTdRpusEor
         NrTf2C90YwW0Q+MKU6vuJAxyXW6PPxnfUkVjZR07QdI9vs31D7bCc94W3nGL+wc7w4iR
         NoLJqzJWm4HZTFuF5cotYkwEL3ioo1Kn/2AgnKn/JgREEIpS29G9+66jSat9i259DqH7
         AgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515047; x=1784119847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=o1dOwiJ4FtAOlTn7/88d9SfiBMwIUcReowoixDaMhLy7d9wYvom4EDScZfWPoXqrIS
         M20ljPbZi6dV5fXljz1OZL5+GevC6Bt4JEAxvt6S/0dhSgTUAOsdhn3eWS2Uw37ujvVF
         1Jrxo+y0NtBhHRThU1K4UULGZdtBlIz+47C5/VQcMdSvmIoaFPwO4saGSborLACIirMB
         ygyVtlOoYtMmp1jXMa5MnbCL3ZaXVOTS3POlwaN5csNQbkap0nlUBzMUfOdSD1WNjcRu
         qhrlzbWT6zjj8zxvy/7IWgmRMDzkJdYAFN4uw2GrAQqY/motCPWnK7gOLYrpK/O/IKDI
         CxFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1w8SLnFBAE8WpfXxMuasG0oV7V7oSTHthhP/eF47Xw9+Hvl4iqB57qRlRAPNa4QsgePuHHfpEpxR4Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLaEJLZJ0c3diTIQhppxsBfqDof/ZRpIQQIcUpkeGd2FZfvLG
	kbyjy+kTjUCXDV3KdEo+e3Es+K9+4CVq8CRw45/jDBuZxfLffL0MFisk
X-Gm-Gg: AfdE7cnkK+wysLrVg2HZ9n+JfnNuwyWKVl3vZGChik/B08QduL1S64sgIdwc02zK0Id
	E/zOFqZ+W7fjQYBbEVeVVhVP+vxuyHlk0BYNX1Yq+3VfZgOMlvEhpllzWdqLYjPHAKBogCYiy+w
	770RWL7lSrgIhZwWPiOrNFGgWt8TGyg4QtLWeNd4mGywkH0g8AwX7Noe5K8wlBSG8ekWIgrANfg
	Sy5oeCi7gwOLPf63AZjC3EmuyHIdY0/NErav/zmbJLVBQTPWxkVndFiM212q00fVqOiwRLi9ydG
	VlJEHlo+smBEROZqwnK7tPbNqLXwffa0nzjuICa/N3Jmx2AsySFpNXF95bAnnpEaSOydjA9PfA3
	bQYVwTbxhinQrrjTacCgUGzpGxqohiE8Oo6JAx1ahPAGRjiCuJJUQVKMFmZiNKy7ugWxU2CErAN
	rFyFMydRz8qF4n8dGGdekYvxHp4jD0WQDB3t5VFWj1+rj7d+Q=
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr2917790a91.16.1783515047234;
        Wed, 08 Jul 2026 05:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:46 -0700 (PDT)
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
Subject: [PATCH v4 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:39 +0700
Message-ID: <20260708125002.202515-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

