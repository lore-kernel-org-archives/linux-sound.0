Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241883812F0;
	Sat,  4 Jul 2026 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137450; cv=none; b=tzbB7+ZhQyiJGrX8cv+5AjXITJ34Q+0ohtn0UewUrwPALM9/uQ0Q66XdqS7BW4J42wsgSYtXTxtHQRBtL/njPHaO9RfPHPNUWaiGilnXMSndc4RHqH/h4VlRsIbUHbIC1r0BVms7aTG91UMnFBKB+BNFsejl/JuAZ+vRfsg1nFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137450; c=relaxed/simple;
	bh=4/FdsrbigADLVfuX7yU5em0zotg3DAZ0945lxwvUqVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpsKQUOoQZFoo2SE24ck0eiEfaMQPth3WtfIkUJgY5pdeSpBQLaCvuEv+ux0LSz1ZJ18uGC2nWcrhwiERqZlDU0lUU0qTsiKk+JLt1NShxG3JSwFkH15tDxNeLhgS1XcZyJDmWt36iZM70YWhntNrAQtQhrvM0CKPuLZs164EKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3RQmThEhqMiLJFg--.13229S2;
	Sat, 04 Jul 2026 11:57:07 +0800 (CST)
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
Subject: [PATCH 08/19] ASoC: codecs: tas2552: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:57:05 +0800
Message-ID: <20260704035705.77946-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAC3RQmThEhqMiLJFg--.13229S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7JrWkZrWrGr13CrW8tFb_yoW8Jw4Dp3
	95WFWkJrWfXw17Ar4UXry8XF1rKry0kF43CwnYgws5Cr4DGr1xKrW3Ar129F4UWryDKFs7
	Zrsxtay7uFn5CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjTRABMKDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state after
runtime resume. tas2552_runtime_resume() currently ignores that failure
and returns success.

Propagate the error, restore cache-only/dirty state, and put the
amplifier back into shutdown on sync failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/tas2552.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 1a7650b9b2a7..22f93e29454f 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -495,13 +495,21 @@ static int tas2552_runtime_suspend(struct device *dev)
 static int tas2552_runtime_resume(struct device *dev)
 {
 	struct tas2552_data *tas2552 = dev_get_drvdata(dev);
+	int ret;
 
 	gpiod_set_value_cansleep(tas2552->enable_gpio, 1);
 
 	tas2552_sw_shutdown(tas2552, 0);
 
 	regcache_cache_only(tas2552->regmap, false);
-	regcache_sync(tas2552->regmap);
+	ret = regcache_sync(tas2552->regmap);
+	if (ret) {
+		regcache_cache_only(tas2552->regmap, true);
+		regcache_mark_dirty(tas2552->regmap);
+		tas2552_sw_shutdown(tas2552, 1);
+		gpiod_set_value_cansleep(tas2552->enable_gpio, 0);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

