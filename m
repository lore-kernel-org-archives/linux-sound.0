Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB013C6BA
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730801202; cv=none; b=T8NOl1MElhat0AG8eZdALAmfvtyPho4dGhIhoQAJwvBa0xW16j95j6BvKmvKRvuYf5EFfgKtLTSH0uu1LdRMsFVWfAp6pwud/KNNjqDhOk5FuaGP72Sx2r+SHJ4Dq/HC/mdN3WcKNLjtHI5cLeReNp98I9hYDlglw0Jhmyurt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730801202; c=relaxed/simple;
	bh=9Vv/gv2aZ/QoEI79A6AY9fqJircxjwzUWfsclQ2cziE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XGkufQT0zZDdXaoizGftLGBTFZsi+IjVYlRSJ63jF1s2IPjEbWv21udqgn2DfVoJ3KyMvkANom0vXMMJSH+mo/T/fK7LNoqiNs952IYSLICfu51646cEIF/4kALj+e5P4db1DShqkr30KLQVC3j9u3zkWJcpQsF8yKRhmn5K08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=nrJL+V8j; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="nrJL+V8j"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4A5A63zdC910492, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1730801163; bh=9Vv/gv2aZ/QoEI79A6AY9fqJircxjwzUWfsclQ2cziE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=nrJL+V8jFequFj3H7po8c+Yl0EZL9CdHQow72ilpWWqo3a/BKbnB+qm2lnJIO/JFO
	 6RI10C8jEQgaQprdZXxVJduhPuvQ0oujphRg2hLeFLP159dS4WalrlqwPgEkqCYiN5
	 xVIdR7B1ce5fsSowuRsXLcAU0dA8B9pgIQFrPveHoEjOgR0R6v5hdVqlbrFOc1lUEs
	 bQ9CuswcnRjUICth7DLBKl3EDqp5pXlxw59xtKmrjKEqRNEgr4/P1mp17Dn4UzwdQJ
	 scoDq81WuSxSKJqrBnm2fr3I/XwswGl4p5HrjfZgxliCa556NJrgP7YrUcKJGJ6OEC
	 oJvAOausV1Xcw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4A5A63zdC910492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Nov 2024 18:06:03 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 18:06:04 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Nov 2024 18:06:03 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: change the interrupt mask for jack type detection
Date: Tue, 5 Nov 2024 18:05:57 +0800
Message-ID: <20241105100557.1987917-1-shumingf@realtek.com>
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

This patch changed the interrupt mask from XU to GE.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 12 ++++--------
 sound/soc/codecs/rt722-sdca.c     |  7 ++++---
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index d5c985ff5ac5..25fc13687bc8 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -177,7 +177,7 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 		 * This also could sync with the cache value as the rt722_sdca_jack_init set.
 		 */
 			sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_6);
+				SDW_SCP_SDCA_INTMASK_SDCA_0);
 			sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK2,
 				SDW_SCP_SDCA_INTMASK_SDCA_8);
 		}
@@ -308,12 +308,8 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 				SDW_SCP_SDCA_INT_SDCA_0, SDW_SCP_SDCA_INT_SDCA_0);
 			if (ret < 0)
 				goto io_error;
-		} else if (ret & SDW_SCP_SDCA_INTMASK_SDCA_6) {
-			ret = sdw_update_no_pm(rt722->slave, SDW_SCP_SDCA_INT1,
-				SDW_SCP_SDCA_INT_SDCA_6, SDW_SCP_SDCA_INT_SDCA_6);
-			if (ret < 0)
-				goto io_error;
 		}
+
 		ret = sdw_read_no_pm(rt722->slave, SDW_SCP_SDCA_INT2);
 		if (ret < 0)
 			goto io_error;
@@ -444,7 +440,7 @@ static int __maybe_unused rt722_sdca_dev_system_suspend(struct device *dev)
 	mutex_lock(&rt722_sdca->disable_irq_lock);
 	rt722_sdca->disable_irq = true;
 	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0 | SDW_SCP_SDCA_INTMASK_SDCA_6, 0);
+				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
 	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
 				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
 	mutex_unlock(&rt722_sdca->disable_irq_lock);
@@ -471,7 +467,7 @@ static int __maybe_unused rt722_sdca_dev_resume(struct device *dev)
 	if (!slave->unattach_request) {
 		mutex_lock(&rt722->disable_irq_lock);
 		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_6);
+			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
 			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
 			rt722->disable_irq = false;
 		}
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index f9f7512ca360..908846e994df 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -190,8 +190,8 @@ static void rt722_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt722->component->card || !rt722->component->card->instantiated)
 		return;
 
-	/* SDW_SCP_SDCA_INT_SDCA_6 is used for jack detection */
-	if (rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_6) {
+	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
+	if (rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
 		ret = rt722_sdca_headset_detect(rt722);
 		if (ret < 0)
 			return;
@@ -294,7 +294,7 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
-			SDW_SCP_SDCA_INTMASK_SDCA_0 | SDW_SCP_SDCA_INTMASK_SDCA_6);
+			SDW_SCP_SDCA_INTMASK_SDCA_0);
 		/* set SCP_SDCA_IntMask2[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK2,
 			SDW_SCP_SDCA_INTMASK_SDCA_8);
@@ -308,6 +308,7 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_XU0D,
 				RT722_SDCA_CTL_SELECTED_MODE, 0), 0);
+		rt722_sdca_index_write(rt722, RT722_VENDOR_HDA_CTL, RT722_GE_RELATED_CTL1, 0x0000);
 		/* trigger GE interrupt */
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
-- 
2.34.1

