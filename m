Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBE192D66
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223651; cv=none; b=q+/27JgD6+Am0XALqfkLpnyRRAcfwdzLK+qzzg0EFN2CQNZvIQY+qTqWGa/EzH+of3vBf1WOHBmYTV6jjG9mVkXtIDguxaQIAvtz6/dq/8Z1xnbaO6uwgSeKmo8lnZVPFuKyCjC6P+wmMDE3bThmssIi13JK6JvrjwIcK4IogZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223651; c=relaxed/simple;
	bh=SQkqoBKvU+aRtrqUw/uCMiX+22wVRYDVIAcM73b2/sQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paJ4d7PqePIST3oOZA7XWDhMgyNA1LfRyn77bAzjIZBf3cgh1d/87aUnDRXBYBL5zjQnI0RsrdG6r2SGo78hzMVM+YtyQeem2cbxrN3NvmI9XuNS0MMkvp4Xk7tGrWrkgrRuKbWzeHNknYmgCOkFkhwfqBqnB6ITVqBkLBLvxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WpcYd2jgfz5y94;
	Wed, 21 Aug 2024 14:56:05 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D5CB18006C;
	Wed, 21 Aug 2024 15:00:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:47 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 1/5] sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
Date: Wed, 21 Aug 2024 15:08:11 +0800
Message-ID: <20240821070815.2326534-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)

The @mask is not used in TWL4030_OUTPUT_PGA, so we can remove
it and simplify its usage.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/codecs/twl4030.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9c50ac356c89..e3782762139f 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -555,7 +555,7 @@ static const struct snd_kcontrol_new twl4030_dapm_dbypassv_control =
  * On unmute: restore the register content from the reg_cache
  * Outputs handled in this way:  Earpiece, PreDrivL/R, CarkitL/R
  */
-#define TWL4030_OUTPUT_PGA(pin_name, reg, mask)				\
+#define TWL4030_OUTPUT_PGA(pin_name, reg)				\
 static int pin_name##pga_event(struct snd_soc_dapm_widget *w,		\
 			       struct snd_kcontrol *kcontrol, int event) \
 {									\
@@ -575,11 +575,11 @@ static int pin_name##pga_event(struct snd_soc_dapm_widget *w,		\
 	return 0;							\
 }
 
-TWL4030_OUTPUT_PGA(earpiece, TWL4030_REG_EAR_CTL, TWL4030_EAR_GAIN);
-TWL4030_OUTPUT_PGA(predrivel, TWL4030_REG_PREDL_CTL, TWL4030_PREDL_GAIN);
-TWL4030_OUTPUT_PGA(predriver, TWL4030_REG_PREDR_CTL, TWL4030_PREDR_GAIN);
-TWL4030_OUTPUT_PGA(carkitl, TWL4030_REG_PRECKL_CTL, TWL4030_PRECKL_GAIN);
-TWL4030_OUTPUT_PGA(carkitr, TWL4030_REG_PRECKR_CTL, TWL4030_PRECKR_GAIN);
+TWL4030_OUTPUT_PGA(earpiece, TWL4030_REG_EAR_CTL);
+TWL4030_OUTPUT_PGA(predrivel, TWL4030_REG_PREDL_CTL);
+TWL4030_OUTPUT_PGA(predriver, TWL4030_REG_PREDR_CTL);
+TWL4030_OUTPUT_PGA(carkitl, TWL4030_REG_PRECKL_CTL);
+TWL4030_OUTPUT_PGA(carkitr, TWL4030_REG_PRECKR_CTL);
 
 static void handsfree_ramp(struct snd_soc_component *component, int reg, int ramp)
 {
-- 
2.34.1

