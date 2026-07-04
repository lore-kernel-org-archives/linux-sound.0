Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF03815DB;
	Sat,  4 Jul 2026 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137898; cv=none; b=RgRivEi9iz1oscavHJjqfOUgsaj7ZJnpWGgHyub3BzvhisQ8bQJRSvURrZfBDtIhsUXZqW6P81drJrD6/siAD1CdGu/ARmeUqQq1htBRyP8qrx75aCF+ONa/Y98kcvXCiop09eGz/IdKrtBIjsR6A/IE4tNoFSrasHnCtF+ME10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137898; c=relaxed/simple;
	bh=R76cSiyn8M6Wqa6cnBG0PzAz5tesi2ulW3T+rCaQYnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBdWVrb4Kkriy/eSyEhcMyJtFPihJ3gcYsr4DjtKGvauaTAK/MpMNV79JKaGx2NnOsNXDsjizHikCRpu0vh8b+yx0Bn/PR7nxBb6of2CvJpafrCtMmo7RLLI2IsTmYgHStf4UsHLBXohLaIXao/BYD+DI1vIjfCkagr+8OoW7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3bfFDhkhqMFbJFg--.13151S2;
	Sat, 04 Jul 2026 12:04:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 16/19] ASoC: codecs: rt1320-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 12:04:18 +0800
Message-ID: <20260704040418.28181-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3bfFDhkhqMFbJFg--.13151S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW5CF4UWFyxJFyfuF4UArb_yoW8Wrykpr
	ZxCFyDKF4xWr13uF43Xr17J3Z5Kr93Ka1fZw1Yywsa93Z8Ww12vF15AFWUZF90gry7GFsr
	Zr4jyayUuF15XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr
	0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjTRABMKDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

rt1320_dev_resume() clears cache-only mode for both regmaps and
replays cached register state into the device. Both regcache_sync()
calls currently ignore their return values, so resume can report
success even if either replay failed.

Check both sync operations and return the first error. On failure,
restore both regmaps to cache-only mode and mark both caches dirty,
so a later successful resume attempt starts from a coherent suspended
cache state instead of a partially live pair of regmaps.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt1320-sdw.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 1e930b27c67a..b7e2d44ae2fb 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3062,10 +3062,23 @@ static int rt1320_dev_resume(struct device *dev)
 		return ret;
 
 	regcache_cache_only(rt1320->regmap, false);
-	regcache_sync(rt1320->regmap);
+	ret = regcache_sync(rt1320->regmap);
+	if (ret)
+		goto err_sync;
+
 	regcache_cache_only(rt1320->mbq_regmap, false);
-	regcache_sync(rt1320->mbq_regmap);
+	ret = regcache_sync(rt1320->mbq_regmap);
+	if (ret)
+		goto err_sync;
+
 	return 0;
+
+err_sync:
+	regcache_cache_only(rt1320->regmap, true);
+	regcache_cache_only(rt1320->mbq_regmap, true);
+	regcache_mark_dirty(rt1320->regmap);
+	regcache_mark_dirty(rt1320->mbq_regmap);
+	return ret;
 }
 
 static const struct dev_pm_ops rt1320_pm = {
-- 
2.43.0

