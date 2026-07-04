Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFA380FD3;
	Sat,  4 Jul 2026 03:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137563; cv=none; b=EHQDm+6nI10V9r/DEkf+2x6bcdCHW32UUBa3aG1EqFWwA5xJRX2vrItSClApja/9iEd3THMKuuby7wXo6+TG7gUChZT+Nm/Bk/zJFbZrajLRncQtJM+X5Z8JqoTXieBwBMtoqBl/Mtp8dGf9AqaE+y+uhbeX3RBNOsfIPRH9Z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137563; c=relaxed/simple;
	bh=4X4RqkourheZOfT4cB7y83SxRC3iJVxpVwoarSo0kFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FACgbxIKT7vOr8ExQvY7GgoltosqMG8zEj2XdIr3ziTvVysA3WQjhj9jwDKWwgzYtM24x9pP0VhST3unQap+Uz3bpV24b5o8kpijG1pdVwswSmK4UGLlT6bt73Dgd5/wUi6pPPApnLapeDjrw3cSB+vGeSQfa968lfd3Qth03kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAA3xgkChUhqyy7JFg--.55504S2;
	Sat, 04 Jul 2026 11:58:59 +0800 (CST)
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
Subject: [PATCH 10/19] ASoC: codecs: wcd938x-sdw: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:58:57 +0800
Message-ID: <20260704035857.90264-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAA3xgkChUhqyy7JFg--.55504S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFy8AF43XF4rGFy7Ar1DWrg_yoWkWrXEga
	4UuFsagrsYqFsrGayUJF1YvaykWFWkCFyxtw1DtF47t348tr1qyrW3trn8Cw15ur1kCF13
	Zryq9w1xArykCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JV
	W5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0pRc6p9UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state during
runtime resume. wcd938x_sdw_runtime_resume() currently ignores that
failure.

Propagate the error and restore cache-only/dirty state on failure.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wcd938x-sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 0f0cc0ac3056..e5ad368418a2 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1245,10 +1245,16 @@ static int wcd938x_sdw_runtime_suspend(struct device *dev)
 static int wcd938x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dev);
+	int ret;
 
 	if (wcd->regmap) {
 		regcache_cache_only(wcd->regmap, false);
-		regcache_sync(wcd->regmap);
+		ret = regcache_sync(wcd->regmap);
+		if (ret) {
+			regcache_cache_only(wcd->regmap, true);
+			regcache_mark_dirty(wcd->regmap);
+			return ret;
+		}
 	}
 
 	pm_runtime_mark_last_busy(dev);
-- 
2.43.0

