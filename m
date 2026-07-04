Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47F377EB9;
	Sat,  4 Jul 2026 03:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137007; cv=none; b=sxNnMRknU3XuXsYUxAo1Xv8CpD4Et/YJ4Ogr5nUeIWyT/lt62F2yDswGgaU4907UW5MUYgM9LKhH9NalfK+81Cm0/8I47CIgg+JsCoiwJ7PxQy8s+0qCTJKTzkw9Iu4y7PWdocAHuSec4sU0iyIDUiZIqUdDkv7exRHdJ5WczVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137007; c=relaxed/simple;
	bh=kig0O9QK6rK+zoVflHLJDg7KG8zbKR4KriEaWTxGUTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1bLbl8I4q+1KSSMXzDWyAXlAIXb4mMp/g+x11PAZjoQDc8S6DPucY+dk11AudtMauzJq5va0mZkvTGBS3AbnwCw2ekLYttwwWvAJk4xOEfUh8+Tdur4TRetIXVVYTzSN72ofrcA5uH5VKytE7QYvB357S+XWV9rTjxFsUyUOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHntHcgkhqcOnIFg--.12955S2;
	Sat, 04 Jul 2026 11:49:48 +0800 (CST)
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
Subject: [PATCH 01/19] ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:49:46 +0800
Message-ID: <20260704034946.20369-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABHntHcgkhqcOnIFg--.12955S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry3Jw45CF47ZF43GF48JFb_yoW5Cw48pF
	n5urWFkF4xXryxCFsavr4DtF1rtrW8tFy5XwsxG39293WUJr10qFW8CF4jqFyvvr97Ganr
	CF4jkFyrGF15XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjTRKE_MDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

regcache_sync() can fail while replaying cached register state. The RX
macro MCLK helper and runtime resume path currently ignore that failure
and report success.

Propagate the error from the MCLK helper users and from runtime resume.
If runtime resume fails after enabling clocks, restore cache-only/dirty
state and unwind the clocks acquired by the resume path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/lpass-rx-macro.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..550fc76109c6 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2030,9 +2030,10 @@ static struct snd_soc_dai_driver rx_macro_dai[] = {
 	},
 };
 
-static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
+static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 {
 	struct regmap *regmap = rx->regmap;
+	int ret;
 
 	if (mclk_enable) {
 		if (rx->rx_mclk_users == 0) {
@@ -2047,14 +2048,16 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
 			regcache_mark_dirty(regmap);
-			regcache_sync(regmap);
+			ret = regcache_sync(regmap);
+			if (ret)
+				return ret;
 		}
 		rx->rx_mclk_users++;
 	} else {
 		if (rx->rx_mclk_users <= 0) {
 			dev_err(rx->dev, "%s: clock already disabled\n", __func__);
 			rx->rx_mclk_users = 0;
-			return;
+			return 0;
 		}
 		rx->rx_mclk_users--;
 		if (rx->rx_mclk_users == 0) {
@@ -2068,6 +2071,8 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_EN_MASK, 0x0);
 		}
 	}
+
+	return 0;
 }
 
 static int rx_macro_mclk_event(struct snd_soc_dapm_widget *w,
@@ -2079,11 +2084,9 @@ static int rx_macro_mclk_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		rx_macro_mclk_enable(rx, true);
-		break;
+		return rx_macro_mclk_enable(rx, true);
 	case SND_SOC_DAPM_POST_PMD:
-		rx_macro_mclk_enable(rx, false);
-		break;
+		return rx_macro_mclk_enable(rx, false);
 	default:
 		dev_err(component->dev, "%s: invalid DAPM event %d\n", __func__, event);
 		ret = -EINVAL;
@@ -3677,7 +3680,11 @@ static int swclk_gate_enable(struct clk_hw *hw)
 		return ret;
 	}
 
-	rx_macro_mclk_enable(rx, true);
+	ret = rx_macro_mclk_enable(rx, true);
+	if (ret) {
+		clk_disable_unprepare(rx->mclk);
+		return ret;
+	}
 
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_RX_SWR_CLK_EN_MASK, 1);
@@ -4003,9 +4010,15 @@ static int rx_macro_runtime_resume(struct device *dev)
 		goto err_fsgen;
 	}
 	regcache_cache_only(rx->regmap, false);
-	regcache_sync(rx->regmap);
+	ret = regcache_sync(rx->regmap);
+	if (ret)
+		goto err_sync;
 
 	return 0;
+err_sync:
+	regcache_cache_only(rx->regmap, true);
+	regcache_mark_dirty(rx->regmap);
+	clk_disable_unprepare(rx->fsgen);
 err_fsgen:
 	clk_disable_unprepare(rx->npl);
 err_npl:
-- 
2.43.0

