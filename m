Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1D3939A3;
	Sat,  4 Jul 2026 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149589; cv=none; b=H0YNxCAls7+AFwblmBV+phE2piUlrwAPhck/BUSnrPxSXlFaDIVPuvfR1ca0yVT+bvohv/ItHPvMk6ISDfU9JkONXOP5QrDlLF93mkgmr84JX5Kbk0f1K6SpVSalFaKHIL4QIkOyzr0VlNJgjPnLO2ltAPEtFC//tR/rO0/g2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149589; c=relaxed/simple;
	bh=2kkNQD5cauKtEYj0euij4YV6kFqTGups6Sxh84ZHtkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kpMVMQSRFZvXZoJSm9RpvhR2lQ24mtbuqA+86/TLXGWuk8BCA+NxXARvmktlf4HAA+tzEwHPq8em362geWNM4rRul302OcobV9cj3Fw6G3CfXMHTqTk4UO0DCRHyDkalDD3JQ3nHSgydLi/OsKqROFlrp0L0nFJbQlAjnPRnvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABX9c0GtEhqW7WgBA--.11642S2;
	Sat, 04 Jul 2026 15:19:35 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: pm4125-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:19:33 +0800
Message-ID: <20260704071933.52450-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABX9c0GtEhqW7WgBA--.11642S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1rZFy8Ww4DGF1xXF48tFb_yoWkZrbEg3
	yxuw48Wrs8Cr1xG34DJF1FyFZ7ZFs7CFy3tr1kKF43ta4qqr4qvrW7ZFnxZwn8Ww4kuFyj
	9r1q9ry8CryvkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUbo5l5
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

pm4125_sdw_runtime_resume() leaves cache-only mode and replays cached
register state when a regmap is present. It currently ignores
regcache_sync() failures and returns success.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/pm4125-sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pm4125-sdw.c b/sound/soc/codecs/pm4125-sdw.c
index 1c612ae4a4b2..307b66025426 100644
--- a/sound/soc/codecs/pm4125-sdw.c
+++ b/sound/soc/codecs/pm4125-sdw.c
@@ -464,10 +464,16 @@ static int __maybe_unused pm4125_sdw_runtime_suspend(struct device *dev)
 static int __maybe_unused pm4125_sdw_runtime_resume(struct device *dev)
 {
 	struct pm4125_sdw_priv *priv = dev_get_drvdata(dev);
+	int ret;
 
 	if (priv->regmap) {
 		regcache_cache_only(priv->regmap, false);
-		regcache_sync(priv->regmap);
+		ret = regcache_sync(priv->regmap);
+		if (ret) {
+			regcache_cache_only(priv->regmap, true);
+			regcache_mark_dirty(priv->regmap);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.43.0

