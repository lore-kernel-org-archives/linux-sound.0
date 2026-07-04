Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83737266D;
	Sat,  4 Jul 2026 04:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137776; cv=none; b=kAbnxNGF44AmZjxbiCIk8xbtvUFIqCles3CmVumAnYYngrVK20PD8kuq/yuEZZqy975J86ajmPdQ2NqMJyUzROsF+QUKyFYdovV0w/APVXpPdE9ZgjhwwY3voq1cuA3pP19uBXfuWCJdqI4uH2ToryO8lYrWel7/uo0TQZrNDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137776; c=relaxed/simple;
	bh=vWoDRidD98CIPLP2lbXqHph1ynw0F9K5I46TSiTfWFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sU4UgwSgKohfuPrZPPBcrvvUCuoZ6n1rBgwHgBRRti016nfQAV8taD6J7F8fn3hktGggsCkbUwuD0C+L4AR/mVFibY2KOchH3UOK7o2Fs17laFCC+FqezJNHr19uxtXCoNEhclny7IMFKATjBsm6af4g5ys5cPrA321+2/+pCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3RMjNhUhqY0nJFg--.59036S2;
	Sat, 04 Jul 2026 12:02:21 +0800 (CST)
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
Subject: [PATCH 14/19] ASoC: codecs: wm8962: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 12:02:20 +0800
Message-ID: <20260704040220.12045-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAD3RMjNhUhqY0nJFg--.59036S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7AF17Kw45Cry8Gw4UArb_yoW8GFyrpr
	Z5WFWxJ3yIqw1fZrZYyr1UJa4rKrWfJFWfGwn8t3s2krnIyw12gF1rAr4jgF4DtrZ8GFnr
	ZFy2yayUCF1avaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

regcache_sync() can fail while replaying cached register state during
runtime resume. wm8962_runtime_resume() currently ignores that failure
and continues programming the device.

Propagate the error, restore cache-only/dirty state, and unwind the
supplies and clock acquired by runtime resume.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8962.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..2db822fc1de7 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3937,7 +3937,9 @@ static int wm8962_runtime_resume(struct device *dev)
 			   WM8962_OSC_ENA | WM8962_PLL2_ENA | WM8962_PLL3_ENA,
 			   0);
 
-	regcache_sync(wm8962->regmap);
+	ret = regcache_sync(wm8962->regmap);
+	if (ret)
+		goto cache_sync_err;
 
 	regmap_update_bits(wm8962->regmap, WM8962_ANTI_POP,
 			   WM8962_STARTUP_BIAS_ENA | WM8962_VMID_BUF_ENA,
@@ -3955,6 +3957,11 @@ static int wm8962_runtime_resume(struct device *dev)
 
 	return 0;
 
+cache_sync_err:
+	regcache_cache_only(wm8962->regmap, true);
+	regcache_mark_dirty(wm8962->regmap);
+	regulator_bulk_disable(ARRAY_SIZE(wm8962->supplies),
+			       wm8962->supplies);
 disable_clock:
 	clk_disable_unprepare(wm8962->pdata.mclk);
 	return ret;
-- 
2.43.0

