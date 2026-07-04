Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D82F83B5;
	Sat,  4 Jul 2026 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151173; cv=none; b=gw20phSkprQq2Lp8HLRwVBhg0aXyj25rFio2yznESxYRalLvop0R2DUQw39474syUIFHn9oDPyWuNOeG72XiJjpnj++UF56hsqMu7Q+JMJixY7oytfq7EPAvnC2bBiNxqU2T5zpGEvixlA4aRoQdef6Vs/bso+JtOKPANH2Wo5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151173; c=relaxed/simple;
	bh=r90N9I8fCUIUqBpOdhb8QYAUTzkuo5EGHvnweRoaCvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWSqGdURv4lsvZ0jItm4npaaSaOkcfOSeQ/t8+BILwT66aKK0lc9d5bizE/LEh65XvcmH2v5CSFaiY6XTjw2JsqtnLZ+LD7Z1WIWV8dBIOWnFTtIxKgfIVkTZkNvzETT7IUb5YPwggs/opDBW+bdMGQt9tvvDzDnvL7ZIz1sueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABX9c0wukhq1jqhBA--.11795S2;
	Sat, 04 Jul 2026 15:45:53 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] ASoC: codecs: rt5514: Propagate bias restore errors
Date: Sat,  4 Jul 2026 15:45:50 +0800
Message-ID: <20260704074550.57755-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABX9c0wukhq1jqhBA--.11795S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWfKr17GF18tFyfKFyUWrg_yoW8Xr4Upr
	ZxCFW3KryUXw4F9rsxtrWUJas5trW8AF4rAw45K348urn8Cry29rn5tFWjvFWxWrZ7GF9r
	Zr47XFyUCF15KaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0J
	UJuc_UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

rt5514_set_bias_level() restores normal recording settings when leaving
the DSP-enabled state, but ignores both the patch write and
regcache_sync() failures. The bias transition can therefore report
success even when the restore did not complete.

Propagate the write and sync errors from the bias-level restore path.
Only clear dsp_enabled after both restore operations succeed, so a failed
restore keeps the internal state retryable.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/rt5514.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 00a4a208d2fa..58aecd4c83a6 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1073,12 +1073,18 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 			 * settings to make sure recording properly.
 			 */
 			if (rt5514->dsp_enabled) {
-				rt5514->dsp_enabled = 0;
-				regmap_multi_reg_write(rt5514->i2c_regmap,
-					rt5514_i2c_patch,
-					ARRAY_SIZE(rt5514_i2c_patch));
+				ret = regmap_multi_reg_write(rt5514->i2c_regmap,
+							     rt5514_i2c_patch,
+							     ARRAY_SIZE(rt5514_i2c_patch));
+				if (ret)
+					return ret;
+
 				regcache_mark_dirty(rt5514->regmap);
-				regcache_sync(rt5514->regmap);
+				ret = regcache_sync(rt5514->regmap);
+				if (ret)
+					return ret;
+
+				rt5514->dsp_enabled = 0;
 			}
 		}
 		break;
-- 
2.43.0

