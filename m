Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D3516160
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738847; cv=none; b=NomK86bmEycFzncS7CcVMiwsjHaxCTYcrDcawJfjBzOH+P1biDoGNlaRXQ/56yCaqFhSxK3o5hdEYP94CUcejCl5Twb5iDdEZEzhz1bh4iJpeHRci2gcUb5p9OPy+px/hlHfjsQc1Gm7WQh0TJs7xbW+7RpfSXFuHrM4kMgHi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738847; c=relaxed/simple;
	bh=8g4WrDy90/pF7rQXXIw1GlF7pmzu/PdyF1rB5UGBrnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4kZMne9EFha4ZC3q537deFSEy4P//XWR3Lb+ORF5ThZavVMz611b6S4oLLgQlDFIit3knGxcnfR/rGfTwSRCIp1pxV/4mL9D/4P77o58URwgQzf0gDbWYFlglZli3mzTqhyiyWXzKcgyraDIDehf5AyoR7p0GG6bPpus/7nOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvi7H5mf; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvi7H5mf"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso536614a12.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738845; x=1790343645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=Wvi7H5mfckiZiWPMA5VRcRS3X2KOoq4sZLRDX81RW3/V724++LY2EWZf9DQIm47LXd
         5kZT0MPnMlj7BEjzYfQX5Yg033RLyzTC8fCJVnLuJq1g7yQiP/oeBjs9zhvzMGk/GnWO
         IWeLeyb35lflQr7YagMVwusa0qWbZSeb2XQeIrA2i3+0mBdtYUUJKpCUmKa+/hufPwLl
         zLqNTRp2KHflDGyIkf+qmWJZSJTzu7QnVIL8qGZFDKIzmAr3PK7f3YxHKExpiDOVHp6A
         xTsDT/4ge2mtOG1/NrLIWvHgqKtHFI1Oewo+dRqYmJ2MxCRiym6BteDrDF3n/bmQxJ2h
         dCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738845; x=1790343645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=v+APEi4m7ao6zxil1nuaqoEMVCW25gEVmx3HH7i+G47TbTQ2NEZ9nfVZVXDz8wEwsM
         lSX7r9filuXCT4TTgOmuXYYMXS5H2QCciLgw9ZMXoRKMjY+OZjmtyPo4J4KSJ5Vt1Qm/
         8au5aLDoXM6atdpDjodUzwfadQLlb6WmIQkBRpZ9wqhz7/HoBGRlklNLYagD4OtpLknF
         gvfXDluj0fowJ2+R881Yyg59eH9JLssHQ0kOYpSJoymvurz7s6+CPl9k01fNUWm/Hsmn
         lErk/7YOCZkGW0fEhR/tFcyz88+2ovOJ2RuaafWVF/rYbHUnMElIGof+Fn0Igpp1OmNR
         fkAg==
X-Forwarded-Encrypted: i=1; AKwUvBzKaVWfJuOrKlamq07W8AsOZrG+X/JGvEvQTBzyIT+gxIz81gvdIEh2LSyh01o7ngB9khx8DLANIIlhHg==@vger.kernel.org
X-Gm-Message-State: AFuF++kjkubbBAxXbLeC2tP2jTVSdjD5paaBoBvslH3A1Do+V5sZw2uL
	XUQAP/mSCXbUFwWhUl24VlzGIk1SNpDBfCkhlKzj//7naJFmQPAC8M2CBgC++w==
X-Gm-Gg: AYBFou23dyVaV+0WZgvZPV7m1IAH+rbpKExjNOIb8odbJPJjqrO6orkz1zsgkvxSDIu
	Y4rBstNxWfoxiokfojm0lCeuP9wjYpHrh8J7k+hKTGPwufAGlUjVMFx54yTc3OC4Y3cdyg46TBC
	+SHvOHY7a9QScHqFxuVn2ZvcRX99vLTRhtqvcmYcK77Ae8w9kqj9e5QKJ1sz29ijYVJDRsGSNSe
	HUDmgTw+nAenH4alsCBI9nYdNbx1SREQ54yUbXPmj0/ht3o/zTgjca6ISOZTG9uRADZpxOZUZp0
	Qa/aJgjMWjEx+ODLtuxn2DMHhf6EG3XjZg2KujjvfchJYH2qCz2/HlXgzXOciAe92IG94LatnZN
	e/r05M/0GVdrUyX6zRRfgDYYYeWmMX5RMXIeeEC5w0zGej1wpzH3p82qerLVvu76HyjJFjtCcC5
	wioWy1a0/CZ1hewgZNjICePu2LJ54sFt3IaM+Urw1CO+DIzQCatWyq36NlPENfJe+2VJvP871/J
	gfnHmM8dSfGg6pSTCvp859tC8uj81TnsYX4BhWbXu6rK3Sy8zBppa1LDfRXw4F4zX5NB02Qkhyn
	tyeYEQ1Gtunmcz+KTNwP4Whu
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr6454551a91.1.1789738844971;
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
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
Subject: [PATCH 13/15] ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:09 +0700
Message-ID: <20260918133912.133799-14-phucduc.bui@gmail.com>
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

Currently, DAPM event handlers in mt8192-dai-tdm.c ignore return values
from mt8192_afe_gpio_request() and mt8192_mck_enable().
If GPIO configuration or master clock setup fails during DAPM events,
the error is silently ignored.

Fix this by checking and propagating error codes properly in all
TDM DAI DAPM event handlers.

Fixes: 52fcd65414ab ("ASoC: mediatek: mt8192: support tdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af..36fa0f32ed1c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -250,6 +250,7 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -261,16 +262,17 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
@@ -282,6 +284,7 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -293,7 +296,9 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		mt8192_mck_disable(afe, tdm_priv->bck_id);
@@ -314,6 +319,7 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -325,7 +331,9 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-- 
2.43.0

