Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3E10A00
	for <linux-sound@vger.kernel.org>; Fri, 29 Dec 2023 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3BT9TVuV42562275, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3BT9TVuV42562275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Dec 2023 17:29:31 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Fri, 29 Dec 2023 17:29:32 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 17:29:31 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <yuhsuan@google.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2] ASoC: rt5663: cancel the work when system suspends
Date: Fri, 29 Dec 2023 17:29:22 +0800
Message-ID: <20231229092922.853-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch makes sure that the workqueue is completed before the system suspends.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5663.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 77246f84de29..9550492605ac 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -74,6 +74,7 @@ struct rt5663_priv {
 	int pll_out;
 
 	int jack_type;
+	unsigned int irq;
 };
 
 static const struct reg_sequence rt5663_patch_list[] = {
@@ -3186,6 +3187,12 @@ static int rt5663_suspend(struct snd_soc_component *component)
 {
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
 
+	if (rt5663->irq)
+		disable_irq(rt5663->irq);
+
+	cancel_delayed_work_sync(&rt5663->jack_detect_work);
+	cancel_delayed_work_sync(&rt5663->jd_unplug_work);
+
 	regcache_cache_only(rt5663->regmap, true);
 	regcache_mark_dirty(rt5663->regmap);
 
@@ -3201,6 +3208,9 @@ static int rt5663_resume(struct snd_soc_component *component)
 
 	rt5663_irq(0, rt5663);
 
+	if (rt5663->irq)
+		enable_irq(rt5663->irq);
+
 	return 0;
 }
 #else
@@ -3686,6 +3696,7 @@ static int rt5663_i2c_probe(struct i2c_client *i2c)
 				__func__, ret);
 			goto err_enable;
 		}
+		rt5663->irq = i2c->irq;
 	}
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
-- 
2.34.1

