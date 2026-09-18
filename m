Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CE7515893
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738843; cv=none; b=b7VBNsFUcoVErsPTMz76D/ufSmZddGWG/0er47awdHCnwKkPZzO4avHrpD3F6SKfCcAXbeFxa7zGUBt4CMyFpg0oEn0PsIA2WIHOi/ozKDo/Y7nwOnkNeIEhNvlaUf9qdC7T9D3eZTx6+OjCycemxjCvsHigRVSaXyQaHVBjGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738843; c=relaxed/simple;
	bh=GObvMR34S+suMBhhF9UYVJy/XM+sIoJ+XQeVtyhccSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR83zLTz0femLgj5EtrhgBJY+FGpSWGfcpLaX67hj6zjtwgDcRTMgpl8D0MNSbIT58ZWq7NOvv2qdf3XAtBOOGgy04loZLj9YWbXFSrgdbrs58XJntcRzVSvP8OyafFifkgFFI5p7AnWhFkxGtVWFdtd//2Ztq2+Bb4nsflei94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROpP1MaL; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROpP1MaL"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso767283a91.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738841; x=1790343641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=ROpP1MaLRl4+XASKwxXWp4GM/YwcWusLOFYCSK1t96rMMPH5ZlR+aH7jKBAweqVupM
         JOyHecmYIqW6dc0ZqSouX0+uTWxTE5rUM3Zoe/yP2jUmECoBx8rbw4I6csaw/Hlw8/Xa
         22+dFu+jPCWwLlX/sTw0a5QwaQPJQQ1ZINmzCeYA9kUdLvP/1tjVkPI9zM+KgA/LB14a
         E5A39ujijP5ETGFIa8PdfGowfRWuaqDSfKDK31q8lLa5ngMRLvNDeRJ2NOQapR1KZ84s
         jHDnP7owzL+IPc9Oi+/Vw+XVpY646BB37dFECmxDkRXtN/Y5RILZ8sVCAQ/tBwHW3iiA
         Tf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738841; x=1790343641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=MfDcQPe0ehAn6oPzANFp0SIQagyCKO9MURwF5xYA2xTDQ/+OLrx/Iu9OchVISFlG3B
         OpcOH0Qjwg8YykxCrYM4xu4XLyXllGwd6Ngsc/rDd4Dry66DrsHltN9lsGCPfQDZlzSD
         BUOFuloDS1MihcWaSEsLsNr9ziZw1twyndgUy89T6Qps1s1hnP1pMubsun77MFEyc1t2
         sIBOTyHzAbjpuJAV0gmljByrgjV1ljq1WXsRgrDjYO1nw9eXTEOVeQQAf/l91B/A1Pdn
         56fhJuePpORZYgO65+vF/KeGmmIjAQCcDojBBE4dlIQc6epK9sIGIfY0V2wohx1/13tF
         avMw==
X-Forwarded-Encrypted: i=1; AKwUvBw3J2sNkmxd3IeJpQPakEMKe9qSKBnuVqgfFhqcBW6hGiH6H984gE6yLode6KnPFG3ZoMjUNI5AmOWvFw==@vger.kernel.org
X-Gm-Message-State: AFuF++npHqhEd2Y86uEYJ4TqzMyBXHSgcVXQFqvVntdcSXhBj7qJ6drr
	/s5jDkk3CuprNFMSyV4YJ1Q8zXggni/3JBcUSuNUJQ1TBRFVulW498cZ
X-Gm-Gg: AYBFou12c75wyYatozmlVFuCRh8P81eBqcBD5TtLVCjLtbqH3aR2osolqWLdH7/d8hC
	I6l2z3T7e/2EMEUp8Q+bk+FJLWkptaeYq080On0Gas3HWqS8LN6pkHa3n+Ry/Brmvjf0+m1XOce
	Oj3z+B7v7z8/6FTtT3dGlp++jcURamWiYiYwf4MIWbxelq3zjJzeRfC6lsgRw4dgKee5brMtJ82
	lYUkvMQLcvroVH78hOXQeepaXqt7qbBPJhlGolkqNiDRoiwIWUIXqmpgT6nbTbKvcalsQkZgmXC
	hXJTi9EL0kAp7ONGyBspnuqRbgdLHsAkc9PpQY84uFbXhP/ufu9v7/XtzYIq90CJvSeKMJAvhj5
	qkS4jEAE5uZDunteNBH0NW59lioDQV4Lrvs0Wf3IP0B6qcZrqPgSXjwmnPSXM5sMxeMhCPuIF0y
	odEOVNlv5n/PWsmSf/hjiaBNC/yjr4sPxlJj2FI+pGwiE5jq2NAyHsO8Epwzu7CkdwI71i4+W9u
	0UtWE+1RTlRfJU3KK9VYdbrz7tUcWN6p+MKTinbSvFtOk/fRkooI1zBiFmcfJacbKYWaWumLY5Q
	i0ll2SKsCGqHNA==
X-Received: by 2002:a17:90b:48d0:b0:39d:ec24:5ffe with SMTP id 98e67ed59e1d1-39e54d1115amr6173759a91.9.1789738840001;
        Fri, 18 Sep 2026 06:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/15] ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
Date: Fri, 18 Sep 2026 20:39:08 +0700
Message-ID: <20260918133912.133799-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-adda.c ignore the return
value of mt8192_afe_gpio_request(). If GPIO configuration fails during
PRE_PMU or POST_PMD events, the error is silently ignored.

Fix this by checking and propagating error codes from
mt8192_afe_gpio_request() in all ADDA DAPM event handlers.

Fixes: 607ac4859564 ("ASoC: mediatek: mt8192: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f8cb84621d38..c5c726a6e423 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -218,10 +218,13 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -239,7 +242,9 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -257,11 +262,14 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic_ch34;
 	int mtkaif_adda6_only = afe_priv->mtkaif_adda6_only;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -291,8 +299,10 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* reset dmic */
 		afe_priv->mtkaif_dmic_ch34 = 0;
@@ -446,15 +456,20 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -469,17 +484,22 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
-- 
2.43.0

