Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A93331EBF
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514644; cv=none; b=ZEw6/6af3RPGtqZ6C3mvGy6DEHcG6I1OkPmhl4gNdjrXZp2nfrD4ZXJz8ADxiynXsB+sXNP2XgpWT4gQd4dyFjaOr4CkGjSPhVGL7W0g6hZ5R9gptm2DzYqVv5t/ER5TrbmLvwr50vP98K30NX6+92CMItV1xnj/zsVlPYb5APw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514644; c=relaxed/simple;
	bh=xkz5zSmusl1hfiOCDvZ2FIvJ3KvHB9R/qrp/IFN+qaA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u41PiLNkCz6EIxpoxVbAjBwst28uF9guiGwX2q3HHcw4iVKEy5qn8X76tXVaI4U5cuNYu09SsZ84aXrJZ4LnnX4LM9lk38tO6UZ60WwU10VdJNDSoLpPBsP7gnPnIkXgKeO9T8+ZovsP+nS4nhB/8ewO8QJkiVty+hFZRHHFIdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=hD3bwkX/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="hD3bwkX/"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65F9ANXE0612444, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781514623; bh=g1auE5qnNeWx0BtGW8X3tvtpa5QfmE7OdnBxzF50Rek=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=hD3bwkX/7EaxRhfYY+B68EpnG/OrS4DHDj9cpnOIh/GOC2jtzJAPUU5YWyb3Qjz5b
	 CUbGRdW7JMuc97zPKtoCHRoo4IKsr/gZe/fdtazIZmrhTmCc0eN5TPC2jg6SLjUOlA
	 t46wkf5lZMU2p0IV0MZodE4Xk71gqRgBrYaJdDxm29xnLDVk9+LY0NEc6C9NdCPd8+
	 lRuZ94qG5ucPBCJUi0CNSFGLWihXwqALJezDT0cIS+yubIju17MLmzgoI0hl51eIMl
	 T3ELjlPZsOvNRJfzffscT/ZSFgXdfgFkwqyYtoOCcgA6nnZWQd16671lYmMlOqXKTq
	 e2kHVNNwkenKQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65F9ANXE0612444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2026 17:10:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Jun 2026 17:10:23 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Mon, 15 Jun 2026 17:10:22 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<albertchen@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt5650: enhance spk protection function
Date: Mon, 15 Jun 2026 17:10:12 +0800
Message-ID: <20260615091012.718168-1-shumingf@realtek.com>
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

This patch adjusts several default settings to ensure
the speaker protection function can be enabled safely.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5645.c | 6 ++----
 sound/soc/codecs/rt5645.h | 1 +
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 8a9af260e5f7..e9819653b30d 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -83,6 +83,8 @@ static const struct reg_sequence rt5650_init_list[] = {
 	{RT5645_PWR_ANLG1, 0x02},
 	{RT5645_IL_CMD3, 0x6728},
 	{RT5645_PR_BASE + 0x3a,	0x0000},
+	{RT5645_CLSD_OUT_CTRL1, 0x4059},
+	{RT5645_GEN_CTRL3, 0x0200},
 };
 
 static const struct reg_default rt5645_reg[] = {
@@ -1855,13 +1857,9 @@ static int rt5645_spk_event(struct snd_soc_dapm_widget *w,
 			RT5645_PWR_CLS_D_L,
 			RT5645_PWR_CLS_D | RT5645_PWR_CLS_D_R |
 			RT5645_PWR_CLS_D_L);
-		snd_soc_component_update_bits(component, RT5645_GEN_CTRL3,
-			RT5645_DET_CLK_MASK, RT5645_DET_CLK_MODE1);
 		break;
 
 	case SND_SOC_DAPM_PRE_PMD:
-		snd_soc_component_update_bits(component, RT5645_GEN_CTRL3,
-			RT5645_DET_CLK_MASK, RT5645_DET_CLK_DIS);
 		snd_soc_component_write(component, RT5645_EQ_CTRL2, 0);
 		snd_soc_component_update_bits(component, RT5645_PWR_DIG1,
 			RT5645_PWR_CLS_D | RT5645_PWR_CLS_D_R |
diff --git a/sound/soc/codecs/rt5645.h b/sound/soc/codecs/rt5645.h
index bef74b29fd54..a5bfe9861b8b 100644
--- a/sound/soc/codecs/rt5645.h
+++ b/sound/soc/codecs/rt5645.h
@@ -118,6 +118,7 @@
 #define RT5645_A_JD_CTRL1			0x94
 #define RT5645_VAD_CTRL4			0x9d
 #define RT5645_CLSD_OUT_CTRL			0xa0
+#define RT5645_CLSD_OUT_CTRL1			0xa1
 /* Function - Digital */
 #define RT5645_ADC_EQ_CTRL1			0xae
 #define RT5645_ADC_EQ_CTRL2			0xaf
-- 
2.54.0

