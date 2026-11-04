Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760046;
	b=rGIB2+Lxoz3l5G/tTOW312yL66iNqi21K7Nw4mFQfCgZalYq6wWDi1z3Lwk9yvUG9rKO
	 I/qt/TDef5Qjf169OQT38ugEoDbmrIj6Jd8jaRLHXQUZTICVovGItdjZBpliLLtmmo7BF
	 bqKZsql1+7k3WV8CQBfPh8MMuzdNeav5bgDM12WDfVnX4lZLAywnYFSaSB2dcUGWAF9F4
	 JDhUvvOZqaQdBewqD/CjObaPSSA5x6cGQMNMqQiu0mAoldpWkvoNk7JoNrt++2r7nW9pn
	 8Igg7VSAndMtZogsGB8H9A3xzYXmgHIQxA009GC0Mc3foVhkEjnt11XKbF5XwYC1MLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760046;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=bZm4oOzoXvGR8xRLoz8oaLjg/05ZsjQjNRrXjaWk2vQ=;
	b=S170+xGoJmvTyjJsSyF8tnhD//b50cTS0BhL4SxqHaBVxZvPVFJRA6V3KN7tEcJS8UXp
	 P6zj6RiRNW8neim/EmdAz9PxYLmoGGj6EC3AOz6FjwlFLfAAeMoqHZWd7Rgo5PdewAir3
	 TQZ6iR2C6TwB/XfM5VmFoUsUEuus7mlpN6jML3uxeRQR+1Zf6TskFJk/e17uMFNZyDS0u
	 sokLrodygEgKK9tXS6CMdh4/ylCse/q4EZPIDsjSY8euLhfoJO8eHqqYUYIfLU7R7l0us
	 HoLOTHUMGyojD/to06ErcIaNPRkZ/JVlUnR5Uf6RvrzxbTFGBS0lO9w925Pe6zvadQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908D606D808;
	Wed,  4 Nov 2026 02:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B908D606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABHb_knm+pqYbk+AA--.29246S2;
	Wed, 04 Nov 2026 10:40:39 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6usb: put the AFE port after sending the USB parameters
Date: Wed,  4 Nov 2026 02:40:48 +0000
Message-Id: <20261104024048.1508635-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABHb_knm+pqYbk+AA--.29246S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZF45trW7Zr4fKryxtrWkWFg_yoW8JryUpw
	sYgrZ0kr9xJF1rAa4UGr1xuFWxCwnrAFZ3Wryvy3yxXrn3twnYkFy2gw1q9rWIkry8GrW5
	Zr42qrs5C3sxC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b7pBhUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcBA2rqY4LY5AAAse

q6afe_port_get_from_id() returns a port with a reference held, either
because q6afe_find_port() took a kref on an existing port or because a new
port was created with an initial kref. q6usb_hw_params() sends the USB
device parameters and then returns without dropping that reference, so
each hw_params call leaks a port reference.

Drop the reference once the parameters have been sent.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/qcom/qdsp6/q6usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c55c..046204bdd006 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -82,6 +82,7 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
 					  sdev->ppcm_idx[sdev->num_playback - 1]);
+	q6afe_port_put(q6usb_afe);
 
 out:
 	mutex_unlock(&data->mutex);
-- 
2.34.1

