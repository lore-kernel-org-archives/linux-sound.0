Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D8337C0E6;
	Sat,  4 Jul 2026 03:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137078; cv=none; b=U6zVUQQevEC+S055KbBIvyxhlQuEVKMRfrGW2mtCPOik3796GpofmS9WHGZGRODK7pu8dT2lKO4652MvRBMaMMXv90DLkfRI7OVhwKexIkFMXj8GTXez7cxy6Lmem0np1t4goVy7e3JYzaSrBDV9pSy2djRWJ0ZZIqtCj3AXYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137078; c=relaxed/simple;
	bh=McW78nulidYn1IpCab94cz8lQAromi+0kcePx2z+A+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sH8g5TEQYLPYyacUCB+R29uTHAz2Izy8vKFmSruC6C9dFzFmyvfMqT/Ew1V9Ydjg7Uv3InbYx5FkdLjPwrFSR1Tk1mJYxbZNsG5XS/6uJqQVz53hWw5zveR54uFuUgBSWXp/ngtP18cfO5MZVUwwIBECuSJ+G402B9RjGM/IIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABnw9Yeg0hqTfLIFg--.55336S2;
	Sat, 04 Jul 2026 11:50:55 +0800 (CST)
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
Subject: [PATCH 02/19] ASoC: codecs: lpass-tx-macro: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:50:52 +0800
Message-ID: <20260704035052.29804-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABnw9Yeg0hqTfLIFg--.55336S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7XryrXrWkWrW8JrW3GFg_yoW8Kw43pF
	95KrWIkFWxXryxCFsIyr1UtF1rKrW8tay5XwsxC3sY9w1UJw10vFWrAF4jqFyv9r97Ga9r
	Cr4jya45Cr15XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
	UvcSsGvfC2KfnxnUUI43ZEXa7sREPrc3UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state. The TX
macro MCLK helper and runtime resume path currently ignore that failure
and report success.

Propagate the error from the MCLK helper users and from runtime resume.
If runtime resume fails after enabling clocks, restore cache-only/dirty
state and unwind the clocks acquired by the resume path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/lpass-tx-macro.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..b6b5ef802035 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -614,6 +614,7 @@ static int tx_macro_mclk_enable(struct tx_macro *tx,
 				bool mclk_enable)
 {
 	struct regmap *regmap = tx->regmap;
+	int ret;
 
 	if (mclk_enable) {
 		if (tx->tx_mclk_users == 0) {
@@ -626,7 +627,9 @@ static int tx_macro_mclk_enable(struct tx_macro *tx,
 					   CDC_TX_FS_CNT_EN_MASK,
 					   CDC_TX_FS_CNT_ENABLE);
 			regcache_mark_dirty(regmap);
-			regcache_sync(regmap);
+			ret = regcache_sync(regmap);
+			if (ret)
+				return ret;
 		}
 		tx->tx_mclk_users++;
 	} else {
@@ -739,11 +742,9 @@ static int tx_macro_mclk_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		tx_macro_mclk_enable(tx, true);
-		break;
+		return tx_macro_mclk_enable(tx, true);
 	case SND_SOC_DAPM_POST_PMD:
-		tx_macro_mclk_enable(tx, false);
-		break;
+		return tx_macro_mclk_enable(tx, false);
 	default:
 		break;
 	}
@@ -2155,7 +2156,11 @@ static int swclk_gate_enable(struct clk_hw *hw)
 		return ret;
 	}
 
-	tx_macro_mclk_enable(tx, true);
+	ret = tx_macro_mclk_enable(tx, true);
+	if (ret) {
+		clk_disable_unprepare(tx->mclk);
+		return ret;
+	}
 
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
@@ -2437,9 +2442,15 @@ static int tx_macro_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(tx->regmap, false);
-	regcache_sync(tx->regmap);
+	ret = regcache_sync(tx->regmap);
+	if (ret)
+		goto err_sync;
 
 	return 0;
+err_sync:
+	regcache_cache_only(tx->regmap, true);
+	regcache_mark_dirty(tx->regmap);
+	clk_disable_unprepare(tx->fsgen);
 err_fsgen:
 	clk_disable_unprepare(tx->npl);
 err_npl:
-- 
2.43.0

