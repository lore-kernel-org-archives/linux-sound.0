Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D02B280324;
	Fri, 20 Feb 2026 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619027; cv=none; b=jq5bxeeyD3VN4jcS+ZjXWMo+a8ZeqyNkQLEK12exZlTFQBlvY54pc21Likc8CfwfK6SW3US6cuXO6oDcsu1GrKCKt9OSLLWTk932W84crxQlh84Y2snBB1vWacvIk3AvketdMtnDuN+SNpqq7sQP+XgGycW01OJpzx4fYRan2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619027; c=relaxed/simple;
	bh=Q1QOQdY5qTDhK+VgjTfWQm4sizeKO5DJb0BE7ldAg6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/1mcVooYxxMA+8HgXwRNpxJ5AaCq+61U/m0YufDzjHySYX+MRSBTBgz+tw5Hw18ImIt1TWNlXTe5rnQsPh7B7dHnSIUBus9YHm7+H3sn5q9L6SutwyZLFjIYfU0V70SKDHspLseKTH6FhaMV8fN/MgpHXrU/wxkmRbyZOxsLww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=UBiDilx2; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="UBiDilx2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C41C5110C6E;
	Fri, 20 Feb 2026 21:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1771619016; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Wg+YWyXU4OP82uAyjaE0SMXvUJEaLlB6fuF2ha44NS4=;
	b=UBiDilx2oxxufanAehDof9MbpV2pSNUdZJ+oOG60eHx6BTvrzUffwEUIM0ybUmFlhKYV1F
	BeVSQtsfB+L0d4Cpf/tvFy+9Ac2fAH1uIdHrUqcPqo3tLr8fK8s/RGKhWQerUfSx4JexKH
	uUzKEqtQmLO5157zTM4gpHHq8p39IoYXrwd+MunzELTJhMKx7zRAxzQ2K0vbHAz+fuJKyc
	ZmuzUNRP4gh9vsbk0CXrht8HEmGIfF55UtMe3h3npUJx72k4XK124z8SLSohXkFxeCkU66
	f68N0v8egtPSoI04Tu1+5EPRkV9Y4XkZgpX2ObZLw9UulLnDD132691+23+ZTg==
From: Marek Vasut <marex@nabladev.com>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kevin Lu <kevin-lu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2552: Allow audio enable GPIO to sleep
Date: Fri, 20 Feb 2026 21:22:19 +0100
Message-ID: <20260220202332.241035-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The audio enable GPIO is not toggled in any critical section where it
could not sleep, allow the audio enable GPIO to sleep. This allows the
driver to operate the audio enable GPIO connected to I2C GPIO expander.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/tas2552.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 43449d7c25843..80206c2e09462 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -487,7 +487,7 @@ static int tas2552_runtime_suspend(struct device *dev)
 	regcache_cache_only(tas2552->regmap, true);
 	regcache_mark_dirty(tas2552->regmap);
 
-	gpiod_set_value(tas2552->enable_gpio, 0);
+	gpiod_set_value_cansleep(tas2552->enable_gpio, 0);
 
 	return 0;
 }
@@ -496,7 +496,7 @@ static int tas2552_runtime_resume(struct device *dev)
 {
 	struct tas2552_data *tas2552 = dev_get_drvdata(dev);
 
-	gpiod_set_value(tas2552->enable_gpio, 1);
+	gpiod_set_value_cansleep(tas2552->enable_gpio, 1);
 
 	tas2552_sw_shutdown(tas2552, 0);
 
@@ -583,7 +583,7 @@ static int tas2552_component_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	gpiod_set_value(tas2552->enable_gpio, 1);
+	gpiod_set_value_cansleep(tas2552->enable_gpio, 1);
 
 	ret = pm_runtime_resume_and_get(component->dev);
 	if (ret < 0) {
@@ -608,7 +608,7 @@ static int tas2552_component_probe(struct snd_soc_component *component)
 
 probe_fail:
 	pm_runtime_put_noidle(component->dev);
-	gpiod_set_value(tas2552->enable_gpio, 0);
+	gpiod_set_value_cansleep(tas2552->enable_gpio, 0);
 
 	regulator_bulk_disable(ARRAY_SIZE(tas2552->supplies),
 					tas2552->supplies);
@@ -621,7 +621,7 @@ static void tas2552_component_remove(struct snd_soc_component *component)
 
 	pm_runtime_put(component->dev);
 
-	gpiod_set_value(tas2552->enable_gpio, 0);
+	gpiod_set_value_cansleep(tas2552->enable_gpio, 0);
 };
 
 #ifdef CONFIG_PM
-- 
2.51.0

