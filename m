Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B727F3242B2;
	Sat,  4 Jul 2026 07:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149649; cv=none; b=TZyHfekspZ9spePIWTvVu9PFYvLVh88VkUdLYgbxvhBRzV0u+VCRHCQ3HRSBrgl38PQS/YWb8DZsCZPCiCDHp5QBschoZSPb4zSiZ8k8WcrDGmj7G3ylGr1oOkpxzV7N3m41cnfi/x3SgL9LoUbiMI68/k6t5i8tbwIvj57kdL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149649; c=relaxed/simple;
	bh=YKaj46WWHsbttUkM2hHytfhcBYD2zdwbASHNSw0HAT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZx1sMnwB+4u95cmpaXmik2StFDvdVeRCutxLXH6RLnu7LtMu5aCNxnohnhQD1lytD7cJboyD1z//9jhGcms+8EsmZnYzwSLZ5IbTT4bRATQ5HB2tL1gUYAiQlXOA/Xd8swEO0AWQoM/xKSkSR2Fl4BXofYJUslqOH9KDBn5yt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAB3FM1AtEhqabqgBA--.11769S2;
	Sat, 04 Jul 2026 15:20:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: rt5645: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 15:20:31 +0800
Message-ID: <20260704072031.60768-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3FM1AtEhqabqgBA--.11769S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw17AF4Dtw4UZr4DAr13Arb_yoW8WFWrpF
	W3CFZ8G3y0grWxCFW5tw4UWFn5KrWIvF43A34Ut3yIywn8JFy3uFy5GF4xuFyvqrWDWFs7
	Ar4qya4xGF1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JUSLv
	NUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Both rt5645_resume() and rt5645_sys_resume() leave cache-only mode and
replay cached register state, but both paths ignore regcache_sync()
failures and can report success.

Check both sync operations, return the error, and restore cache-
only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt5645.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e9819653b30d..93a4148ccccd 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3518,9 +3518,15 @@ static int rt5645_suspend(struct snd_soc_component *component)
 static int rt5645_resume(struct snd_soc_component *component)
 {
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(rt5645->regmap, false);
-	regcache_sync(rt5645->regmap);
+	ret = regcache_sync(rt5645->regmap);
+	if (ret) {
+		regcache_cache_only(rt5645->regmap, true);
+		regcache_mark_dirty(rt5645->regmap);
+		return ret;
+	}
 
 	return 0;
 }
@@ -4331,9 +4337,15 @@ static int rt5645_sys_suspend(struct device *dev)
 static int rt5645_sys_resume(struct device *dev)
 {
 	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(rt5645->regmap, false);
-	regcache_sync(rt5645->regmap);
+	ret = regcache_sync(rt5645->regmap);
+	if (ret) {
+		regcache_cache_only(rt5645->regmap, true);
+		regcache_mark_dirty(rt5645->regmap);
+		return ret;
+	}
 
 	if (rt5645->hp_jack) {
 		rt5645->jack_type = 0;
-- 
2.43.0

