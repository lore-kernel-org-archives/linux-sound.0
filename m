Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80725DB1A;
	Wed, 17 Dec 2025 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939878; cv=none; b=Iev7nE23V+gjo8pz1FuwRIvuqVMVfldTcc67DQwFfc7TMmAe+TqRUrEtIrVpmltWIM3F1MFXtMl8y2ifr01BG8D49kD4mEHTyQ/kE9EKGM6FiLJYFlBBU41R38F7aFoJ04tR/o9okju3Cj22QPWjR6ART2/5Ik5PMx7bA8KwgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939878; c=relaxed/simple;
	bh=BtfxVgxopCckE+bhj1BD+TtawXdNg/P3B/Rt+ewYDcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+rdkfAKOTuS/cv9HDjobT2vaYcV1VR6zhz4pz0BQv66LLDvxQRBczwNp9b/tJbKYYEWzo005TphthInnpTxM+JqehP6l8ahXdv7OA4BkVS+iz+TzmdeM5q5zzR2uqTIxOqWIEvFssOxgtwb9/kTJ1Z3NAfte1hBTV5aHHYpX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAD3GOCcGkJpFTr1AA--.5791S2;
	Wed, 17 Dec 2025 10:51:08 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ASoC: tlv320aic32x4: Fix missing error check for devm_clk_register()
Date: Wed, 17 Dec 2025 10:50:51 +0800
Message-ID: <20251217025051.2196-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3GOCcGkJpFTr1AA--.5791S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW3CFWxWr4DtF17Cw4UJwb_yoW8Wryrpr
	n5C395t3y5XrWUur4Yy3WkJFyI9FW2kF48Aw10kw12y3Z8ArW8GF47XFy5ZFsaya4akw12
	qr15Zay8C3W7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JULVysUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8TA2lB-9Vt2wAAsi

aic32x4_register_clocks() ignores the return value of
aic32x4_register_clk(), which returns the result of
devm_clk_register(). This causes the driver to ignore
clock registration errors and return success even if
devm_clk_register() fails.

Check the return value of aic32x4_register_clk() and
return the error code if registration fails. The
aic32x4_probe() has already implemented the check for the
return value of aic32x4_register_clocks().

Fixes: 514b044cba66 ("ASoC: tlv320aic32x4: Model PLL in CCF")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 5c0a76a4a106..8f04df2a25d1 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -479,6 +479,7 @@ static struct clk *aic32x4_register_clk(struct device *dev,
 int aic32x4_register_clocks(struct device *dev, const char *mclk_name)
 {
 	int i;
+	struct clk *clk;
 
 	/*
 	 * These lines are here to preserve the current functionality of
@@ -492,7 +493,9 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name)
 			(const char *[]) { mclk_name, "bclk", "gpio", "pll" };
 
 	for (i = 0; i < ARRAY_SIZE(aic32x4_clkdesc_array); ++i)
-		aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
+		clk = aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
 	return 0;
 }
-- 
2.43.0

