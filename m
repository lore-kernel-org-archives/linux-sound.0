Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937280;
	b=dAYsDt1Y77gQ5qyN6umEy16vUerpBHxY1G/MvFpTCijMLRzL002TuQnqi2C1bn53KAm5
	 3KPjJOg2Ad+lBulsdRs9JaAC2KtSs9ZYumV9VdrP2opXaZ8dSnPlV54WlvzJJR7x1T3Ak
	 8cvZhdy12NkL2aFKitth/qOonJmBstwMpOd6XAk5oA4TGdQ9SB4PfGVPlqj2CkhsRHM74
	 NZ5WTi5FSyJdkrSEVRszqh6eXFM2afP/GVoLwlUrwcivzr+ltYgjuQ6FCbCN8BuA/kaqt
	 sBXyek2b/cH7MA/4hDpnlsspZbygRzOHdY0kErflDKkTd99BAQqEceuf2EVvps2OcPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937280;
	h=DMARC-Filter:Received:Subject:From:To:Cc:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=VBUHk0eb1Jrp0GTokwo7e24MRl3AF5esG7weZxCQEkY=;
	b=aHQMwd1JHpb6ZqZZ/SklNyfYZU/7du7+cQ3iZaL3Sfi6eLSx4ta0uXI5zzh1lyg1ykNM
	 D61OH2bwO7rRc0YlIbSgJ2uT0+cCVltWW2Btuk1ar8/53cAIC65S9iQdFtdSW63nqRx+N
	 yn9xWxJ0VH4L8iPrxruhM2Cb+k5ezScIyFwj7ufeZrHypDa3kuAUsHKgXDf+xAgpCPISX
	 1587bM1maOZloLIR0yQkFIbFJJ7fZhzc4J8+3ZlLpDdbyA2d9y8vpuV9FPLvlBd4jelXI
	 AZJTNllf6hf7RXXBrcJexlnbUtRI3GvTMCHCmyzX5Ys+8p7wdA4whH6L2Dq4zw1WBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9538606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 03:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9538606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnVf9yT+1q4vxeAA--.15002S2;
	Fri, 06 Nov 2026 11:54:26 +0800 (CST)
Subject: [PATCH v2] ASoC: stm32: spdifrx: keep the control DMA channel on
 config failure
From: Wentao Liang <vulab@iscas.ac.cn>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 06 Nov 2026 03:54:34 -0000
Message-ID: <179393727482.2060666.9057920361892304525@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:qwCowABnVf9yT+1q4vxeAA--.15002S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF43ZF17Jr4xKw1ktFyfCrg_yoW8Cw4Upr
	48GFWDt3yYqa15XF42g340ka4v9r93Ar4DKws8Ww1Ivr13Ary0vFZ8Gw4qgr4jyFZ3G3W2
	9rZ3tFy5u3s5AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07befHbUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAADA2rtTzUAtwAAsG

When dmaengine_slave_config() fails, stm32_spdifrx_dma_ctrl_register()
sets ctrl_chan to NULL and returns the error. The channel obtained from
dma_request_chan() is thus lost, and stm32_spdifrx_probe() calls
stm32_spdifrx_remove() on the error path, which then passes NULL to
dma_release_channel().

Leave ctrl_chan untouched so that the remove path releases the channel.
Its IS_ERR() check already handles the case where dma_request_chan()
failed.

Fixes: 98c8dc2fd59f ("ASoC: stm32: spdifrx: fix control DMA error management")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Point the Fixes tag at 98c8dc2fd59f ("ASoC: stm32: spdifrx: fix
  control DMA error management") rather than at 03e4d5d56fa5
  ("ASoC: stm32: Add SPDIFRX support"). 03e4d5d56fa5 released the
  channel inside stm32_spdifrx_dma_ctrl_register() before clearing
  ctrl_chan; 98c8dc2fd59f dropped that release and left the cleanup to
  the probe error path, which is where the channel leak on
  dmaengine_slave_config() failure was introduced. Noticed by Olivier
  Moysan.
- Link to v1: https://lore.kernel.org/all/20261104024051.1508703-1-vulab@iscas.ac.cn/

 sound/soc/stm/stm32_spdifrx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 88863dbd05d9..ce75929daf73 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -425,10 +425,8 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 
 	ret = dmaengine_slave_config(spdifrx->ctrl_chan,
 				     &spdifrx->slave_config);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "dmaengine_slave_config returned error %d\n", ret);
-		spdifrx->ctrl_chan = NULL;
-	}
 
 	return ret;
 };
-- 
2.34.1

