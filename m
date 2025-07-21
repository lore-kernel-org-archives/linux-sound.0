Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B4299930
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097059; cv=none; b=WgGgOrfZ04TfdPSobY24qWUWlDzzfSSsvsLeSpI0OlpUfsh0RbwlALDVt0oOYnhdsdnMqNChcbnmc0qr0DC7kziLkgpq/KHI+9QJO4gssgA+UodywoW8l9qTUPf8h36m+D7J8icxQTq+dt54rRkRaKGtZTMCSIEFM8TRMvnyRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097059; c=relaxed/simple;
	bh=TKLHWCRMy7zmndJZWooCYIsn0nE/6lNcSASsRvkBDgY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eJphrgAzf0KoKq2VGhO6sd7cpM6jQJ19lXemZ6yxqt+r4UVf1Ro5lIk4NbrbgEgcP4uJY7c/thn8Yt4AXjKloyMUZj5QcGDfPY1DgHu1wU6Q4x/rBCmE4i9Rdsp76yDV3sD7rMUvq6XMqt2nHJRilKIT0+7kGZkFslxWOoGoeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=eon2Y1Ke; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="eon2Y1Ke"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 56LBNp4vA2663513, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1753097031; bh=s1fSJG5FQqRutD9iUC1vFzk1MGdyl94WzLczf5D9qZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=eon2Y1KeTA7anBj2TqtJhbytaaN5KWmmg7HJ/odalvqONhbl59rJxY2CJPZQ0ERnU
	 yKLwk0MmOEGjkhljOKGti5z1PIJ3FX9lhge8BkqMTXP3nHhCvdoI58RdEOOVv+YFnW
	 EZl8SLsPRtfJgcSOlsDJklYiWlhoZq+mPVABHH0xsZzX2N7bOHSvguZ1eG4A84aXv9
	 xatoxqmG78jt4QYvku3rpaoycf/RRLmlPqcq+UUXXQB7u+zy8/sNsJkZnf/ve6HMvh
	 PAd8Cb63D4Hdd14KWgBp2NSlGcVBChrv/d4aaRE/k/XclcjbjvNV9q1Jw0Smv/rMhz
	 8W1UngS3Hv5bg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 56LBNp4vA2663513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 19:23:51 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Jul 2025 19:23:51 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 21 Jul 2025 19:23:50 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/2] ASoC: SDCA: add route by the number of input pins in MU entity
Date: Mon, 21 Jul 2025 19:23:46 +0800
Message-ID: <20250721112346.388542-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch removed the code where num_sources should be the same as cn_list.
For better resilience, it would be preferable to explicitly add the route
mapping the input pins to this MU entity.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_asoc.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 1482869a7ad5..c493ec530cc5 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -594,7 +594,6 @@ static int entity_parse_mu(struct device *dev,
 {
 	struct sdca_control *control;
 	struct snd_kcontrol_new *kctl;
-	int cn;
 	int i;
 
 	if (!entity->num_sources) {
@@ -611,18 +610,11 @@ static int entity_parse_mu(struct device *dev,
 		dev_warn(dev, "%s: unexpected access layer: %x\n",
 			 entity->label, control->layers);
 
-	if (entity->num_sources != hweight64(control->cn_list)) {
-		dev_err(dev, "%s: mismatched control and sources\n", entity->label);
-		return -EINVAL;
-	}
-
 	kctl = devm_kcalloc(dev, entity->num_sources, sizeof(*kctl), GFP_KERNEL);
 	if (!kctl)
 		return -ENOMEM;
 
-	i = 0;
-	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
-			 BITS_PER_TYPE(control->cn_list)) {
+	for (i = 0; i < entity->num_sources; i++) {
 		const char *control_name;
 		struct soc_mixer_control *mc;
 
@@ -647,7 +639,6 @@ static int entity_parse_mu(struct device *dev,
 		kctl[i].info = snd_soc_info_volsw;
 		kctl[i].get = snd_soc_dapm_get_volsw;
 		kctl[i].put = snd_soc_dapm_put_volsw;
-		i++;
 	}
 
 	(*widget)->id = snd_soc_dapm_mixer;
-- 
2.34.1

