Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98A737DAD0;
	Sat,  4 Jul 2026 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137954; cv=none; b=fe4XkR9886rsmaJNxsYN5i8YosLO9PaGUqWq9H/Z8/AAQDSpTcRLn+8VvdEKH8DVTiE5RtllDF8GA/UF1a0D7qFU3wa2CYn7EiU427u2Z9gWY+wy+SbTFGN7xjrz3LSsQGwiKF+1Kj47rlTZBs2dsNyMyf8G4vozOuUaNuG97/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137954; c=relaxed/simple;
	bh=iwNn5hUzwrwUzyUJG3mMdOwkqS05JrWXLhKu68o3R3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNmfylcY5wSCbAuU0f04aGH537c+r6DMh4fL1YdoDOmghom0Kd1ztS+3KYjwUqNi/nx6TVn6ZKfiXh7dfRrPz+R2eUwzd186CiOdQaz2N+FbGkbOuiIQsizzLRf1NorcFsaA5WGn4ErwOu0y6rCAIAIY11ISW4O/0kc/M/cVm+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHkcSLhkhqyV_JFg--.55815S2;
	Sat, 04 Jul 2026 12:05:32 +0800 (CST)
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
Subject: [PATCH 17/19] ASoC: codecs: rt5682-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 12:05:30 +0800
Message-ID: <20260704040530.40047-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABHkcSLhkhqyV_JFg--.55815S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF13uFykZFWDWw47ury3Arb_yoW8Kw17pr
	ZxCFWDtrW8XrsrAF1avr4UJF4rKrZ7K3Way34rt3W0kwn8Cw12gF13JF4UZFy0qrWDKF47
	ur4Uta4DWF4UWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

rt5682_io_init() and rt5682_dev_resume() both leave cache-only mode
before replaying cached register state with regcache_sync(). Both paths
ignore the sync result, which can hide a failed hardware restore.

Propagate regcache_sync() failures from both paths. The first hardware
init path now has a dedicated sync-failure cleanup that restores cache
bypass, cache-only, and dirty-cache state before balancing the runtime
PM reference. The resume path restores both regmaps to cache-only mode
and marks the main cache dirty before returning the error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt5682-sdw.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index dec8c2147d68..e49ec28b6103 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -410,7 +410,9 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt5682->first_hw_init) {
 		regcache_cache_bypass(rt5682->regmap, false);
 		regcache_mark_dirty(rt5682->regmap);
-		regcache_sync(rt5682->regmap);
+		ret = regcache_sync(rt5682->regmap);
+		if (ret)
+			goto err_sync;
 
 		/* volatile registers */
 		regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
@@ -472,8 +474,16 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	/* Mark Slave initialization complete */
 	rt5682->hw_init = true;
 	rt5682->first_hw_init = true;
+	goto out;
+
+err_sync:
+	regcache_cache_bypass(rt5682->regmap, false);
+	regcache_cache_only(rt5682->sdw_regmap, true);
+	regcache_cache_only(rt5682->regmap, true);
+	regcache_mark_dirty(rt5682->regmap);
 
 err_nodev:
+out:
 	pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete: %d\n", __func__, ret);
@@ -776,7 +786,13 @@ static int rt5682_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
-	regcache_sync(rt5682->regmap);
+	ret = regcache_sync(rt5682->regmap);
+	if (ret) {
+		regcache_cache_only(rt5682->sdw_regmap, true);
+		regcache_cache_only(rt5682->regmap, true);
+		regcache_mark_dirty(rt5682->regmap);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

