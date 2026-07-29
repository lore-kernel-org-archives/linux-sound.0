Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58277209F43
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295384; cv=none; b=EdYB+jQBeB5XoNbrhdNBWiFqneV6rIXwCmobmgoYMQP7oa4mPGmD6GyIqOXCXdmff4p7piUGLS4s7qKTLW1tNqlRRPOIA9FJxIWsXsbsqjs0XTWr9WRHaO8DJAjCCoUzArfa4fSzwJjMaGvM31CFaXegtpuAo0Dq4jpo/nZKxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295384; c=relaxed/simple;
	bh=uUYuGtIC21i4yOgJ0wE/tIYrcooI3ARYJg0t/JpVgkg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=htQ3OsVqrqbW2/pcTMiggDf0fjhZbGBb2e+WX7JRfVFfZDTgD7fLzgAyqIHzp5+3p60Lsh5dUQQ8BzM8WVjGTVCfYBM5fj0aMTy+Sd4IfnqMw3OAaXZwQNwoSGnv9Ryu2EXqnEm2QJwNNCatUgumvdRXR9AEQuzfvR5MiuM13hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=TNbkdUgM; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="TNbkdUgM"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66T3MdtH6168466, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785295359; bh=WwVYNFwKqeazAM+jUGXkO6RZX+thwqPoRvrVwIHBEmk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=TNbkdUgMhrVHEJavzexFlnkZbc42ULbRZGXXPfPA/uSehBxnJoodoc6DzPEq6MD3I
	 3gt3Nasg1b6eQF0pszf+IBZ7fFdoxWJNJWH51Lqx76QCzNlBPah0EAkLmHnHdhNhad
	 qxMvac7kIx3TPUYvfwy+b+9dDQ2bDQL8XPDIBx2PTIFxyzU2s+QrChwd4VKvkPq2W+
	 dTa6gy8o3TtcF30zGVFVmAqj4B8tbQOE7Qve+CoJTKZOvwavyDqh559AtsbStbcQCS
	 pg2LSpgbt1NOSj/XVlKqnPvS8KY1+d+fChY12zgr/VV153iBy4w7n2XcKw6bLXX8Ki
	 ucb4LwtMfgwag==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66T3MdtH6168466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 11:22:39 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 29 Jul 2026 11:22:39 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Wed, 29 Jul 2026 11:22:39 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 2/3] ASoC: SDCA: export sdca_asoc_populate_rate_format() helper
Date: Wed, 29 Jul 2026 11:22:37 +0800
Message-ID: <20260729032237.3750805-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

Export populate_rate_format() as sdca_asoc_populate_rate_format() so that
it can be used by codec drivers.
The codec driver could get rate and format information for the IT/OT entity.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/sdca_asoc.h  | 7 +++++++
 sound/soc/sdca/sdca_asoc.c | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index ca35d5a44370..d3024c3b38b9 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -25,6 +25,8 @@ struct snd_soc_dai_driver;
 struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
+struct snd_soc_pcm_stream;
+struct sdca_entity;
 
 /* convenient macro to handle the mono volume in 7.8 fixed format representation */
 #define SDCA_SINGLE_Q78_TLV(xname, xreg, xmin, xmax, xstep, tlv_array) \
@@ -82,6 +84,11 @@ int sdca_asoc_populate_component(struct device *dev,
 				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
 				 const struct snd_soc_dai_ops *ops);
 
+int sdca_asoc_populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream);
+
 int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b4dedba719dc..9a6c0036b7be 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1231,7 +1231,7 @@ static u64 width_find_mask(unsigned int bits)
 	}
 }
 
-static int populate_rate_format(struct device *dev,
+int sdca_asoc_populate_rate_format(struct device *dev,
 				struct sdca_function_data *function,
 				struct sdca_entity *entity,
 				struct snd_soc_pcm_stream *stream)
@@ -1292,6 +1292,7 @@ static int populate_rate_format(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(sdca_asoc_populate_rate_format, "SND_SOC_SDCA");
 
 /**
  * sdca_asoc_populate_dais - fill in an array of DAI drivers for a Function
@@ -1344,7 +1345,7 @@ int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *funct
 		stream->channels_min = 1;
 		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
 
-		ret = populate_rate_format(dev, function, entity, stream);
+		ret = sdca_asoc_populate_rate_format(dev, function, entity, stream);
 		if (ret)
 			return ret;
 
-- 
2.54.0

