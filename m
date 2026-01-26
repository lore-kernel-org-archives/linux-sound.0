Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9B2356BE;
	Mon, 26 Jan 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769412988; cv=none; b=LLk4HCR5nYRHjpcfsfPONU7PRAVQHTGKQ4k9HSlX95ld8SNursAijnYJ92YVugxyGqCxVFRItG89/32+hPZNli1nShz19Iy4aJGrUoxbKNcZGB00wohuFDskQq5BVW+FBnJB4HDjFo9e/fWaaSvIKYii4vZk3Sbuq3m8Y/OoZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769412988; c=relaxed/simple;
	bh=M/EC4ap6WheyoGfcuE7aDdE+tmuF84Z063dKJqTViZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l9i0ZV6xwA77UCwwV2yr8rAS5oV2CSkKKUvXUxTlogv6Zj3AqMSXdyn9ioh1jrSn6BDsIXLt5haRfCUpASw+42pHnBotjqnWR6HabTNu+hzu9y+gjo5TKOrgcKfD1tHg1f1yLlw+Ysh5giMNgPKgN0xMy0kEeKP3myB56Jsnzt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACHpt1tGXdpxcbJBg--.44441S2;
	Mon, 26 Jan 2026 15:36:13 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: wm8731: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
Date: Mon, 26 Jan 2026 15:35:28 +0800
Message-Id: <20260126073528.1826406-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHpt1tGXdpxcbJBg--.44441S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWDur1xXr48Zw1xXF4UCFg_yoW8JFWkpr
	s3KrZYyrWrXFWruFn0yrWkX3WxtrWjkFyxJa47Ka47Wr13AFn7ur18tr1I9FWFgF95Grsr
	ZF12gr4UAF45Ja7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_XcC_AcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNVyxDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

clk_prepare_enable() and clk_disable_unprepare() already checked NULL
clock parameter.
Remove unneeded NULL check for wm8731->mclk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/wm8731.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a03bbde5d852..a2f0e2f5c407 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -471,11 +471,9 @@ static int wm8731_set_bias_level(struct snd_soc_component *component,
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		if (wm8731->mclk) {
-			ret = clk_prepare_enable(wm8731->mclk);
-			if (ret)
-				return ret;
-		}
+		ret = clk_prepare_enable(wm8731->mclk);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		break;
@@ -494,8 +492,7 @@ static int wm8731_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, WM8731_PWR, reg | 0x0040);
 		break;
 	case SND_SOC_BIAS_OFF:
-		if (wm8731->mclk)
-			clk_disable_unprepare(wm8731->mclk);
+		clk_disable_unprepare(wm8731->mclk);
 		snd_soc_component_write(component, WM8731_PWR, 0xffff);
 		regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies),
 				       wm8731->supplies);
-- 
2.25.1

