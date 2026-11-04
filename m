Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760044;
	b=Y4/pJla30x7ZWs2FnN7NVNMVWq7OBHdl6fQt9DTbMYoI/MXS7qe26hLquU06uinw36PZ
	 2X2rHWEftVW3xq6IaWK1CNVrIk0l44T4amujP4eigszNnDcVr6VAGO060q9P0H0P3e2KX
	 EPrtHsDNnH5P9OqjWRlYv8DmFTcu3vKAgObjuoNoElttQn9lI15ThiF1zI6yrU9vztTWe
	 qpWPRdAgkYew74IvGSatqHuU1DgwWF4Cy4MGCArTKZLdK9dA5MfEG4PZTlWo8aaIDvreI
	 jkvQD44NzDLbppCsHEu98S2GwRlC8Q/CYrB8BsC8Q7m66N82egki2s/rcW3FCrRDcBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760044;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=Opg9v+YpeyMpqKoJTHUQ4Wtp+2FW1oixCC8F3nDorwU=;
	b=AjgwGwdLp0Bfna1HJ6PNJ9xkQHAqBwqzeyg3UoRxrVVg3nDUWtY6JSBU3cmo9N/7hyx6
	 BQ8bRAZ5XGILq902/yqpxxBObIFCa8xOgb4jxbadOzntVBo/PpaEwhhj3KXT8Lg3NarBn
	 eBC7Qtz6D5DLh+v6WXmd+KDRJqVrukaRbe8TvPbwa8TJRAPk+jThsUEGvs+MDcnKCiDTF
	 nXGaRA95ejViNgiZlsmzwhpbudvchJb+//MFuvUD2vmxBLSGSuE26Ofv6zftXICcTM7K3
	 YkiDxeGgwS8wXU3BOKXASYTD6b4p90Vr78QK+IFDYEPGbiYxb3PH7z+pTjiNDLI5eJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8B606D801;
	Wed,  4 Nov 2026 02:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F8B606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADH8_0lm+pqNrk+AA--.9831S2;
	Wed, 04 Nov 2026 10:40:38 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-dai: close the graph when compress open fails
Date: Wed,  4 Nov 2026 02:40:47 +0000
Message-Id: <20261104024047.1508584-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADH8_0lm+pqNrk+AA--.9831S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrykKFyUCr45tw1DGF1rWFg_yoW8ur1fpa
	yrKFZ8try8uFyxCr9rKrn5G3WagrWkAFWDGw4Iy340y3W3Jrn3ury7tr10gF4aqFy5Gan5
	X39Fqry5Kwn3G3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b5lk3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXGwADsG

q6apm_dai_compr_open() opens the AudioReach graph before allocating the
DMA buffer and handing it to the DSP. If the allocation or the SCM
assignment fails, the function returns without closing the graph. The
compress core does not call the free callback for a stream that failed
to open, so the graph, its AudioReach reference and the private data are
all leaked.

Unwind the graph and the private data on both failure paths.

Fixes: 88b60bf047fd ("ASoC: q6dsp: q6apm-dai: Add open/free compress DAI callbacks")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 6c0245e92d3a..94af3b79c61d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -834,7 +834,7 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 	size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE * COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &prtd->dma_buffer);
 	if (ret)
-		return ret;
+		goto err_close_graph;
 
 	if (pdata->use_scm_assign && !pdata->has_reserved_mem) {
 		ret = q6apm_dai_scm_assign(pdata, prtd->dma_buffer.addr,
@@ -843,7 +843,7 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 			dev_err(dev, "SCM assign compr buffer failed: %d\n",
 				ret);
 			snd_dma_free_pages(&prtd->dma_buffer);
-			return ret;
+			goto err_close_graph;
 		}
 	}
 
@@ -857,6 +857,13 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 
 	q6apm_enable_compress_module(dev, prtd->graph, true);
 	return 0;
+
+err_close_graph:
+	runtime->private_data = NULL;
+	q6apm_graph_close(prtd->graph);
+	kfree(prtd);
+
+	return ret;
 }
 
 static int q6apm_dai_compr_free(struct snd_soc_component *component,
-- 
2.34.1

