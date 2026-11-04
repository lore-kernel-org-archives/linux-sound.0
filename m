Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760047;
	b=x58o2FGEnorO99/L+AJ0fBT4TSH9L3+CPVfUfUT2J8xYWarOSJNTKWyRPXw0kgNCty1Z
	 /RH+qlCsP09WdB8x8PTOF13aF6V1AzWcfb3GJubX8GIwsAKEhQdmXaQXUvszi5XF7lse2
	 roOzL1XT64FXVt15LS0AOPD2fmUUkJF+GHXFLqJgYJ4V0anrbU3Hcktjo//QOI0zCI14E
	 q3+bb7Jlj4ONSCJgg99cZYrP9y+aKA/f8fL7TpbKB5EGQlNp+cAcmQHm40bZEyrtZnpeJ
	 /3FgF8vilQk6/9VjxBxc7zR0xSqEdK1/g4y2r+l6A+TIOKMP8PN5ipBluLDCJUCpkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760047;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=95Mbzq34kLdr6uMOCvVpyg0yTvXAJtNbJWCZ7Bc63uM=;
	b=TolYLLkIu6nff2+ddpBELZtEq+NAOLDiFuG9LQljUY+JN1KnBouywDDnXBPMUgWSgYs6
	 ixO+Ih7x9bQLqvtVLpnTzmy5mRVwJFykWLZvO36g9Aaoy17XvjYFUp0CWQmhkz0ShcshE
	 /t4hzMcuNylk69Q/SRDBAVB5XbyNQPcVcbxrqKpKY2oTRaaLSNR9dOwja4r878/fasZHc
	 UahtHdRiifOOkkDJXB7iWD7SjzlbC4XT9oyK2ZSsRUz2Jsn49GCpGqzZLTKZ3JGllWGTt
	 Cs2k9UpNkroPZQmbkxKjG+W8T40Ee4XetYVGm5CwTsRU2CFLackxvocl817tJQO90KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641AA606A331
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXQfspm+pqdLk+AA--.27707S2;
	Wed, 04 Nov 2026 10:40:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: samsung: i2s: release the runtime PM reference if config_setup fails
Date: Wed,  4 Nov 2026 02:40:50 +0000
Message-Id: <20261104024050.1508669-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAAXQfspm+pqdLk+AA--.27707S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJry7Wr1fXrykWr4fKF45Jrb_yoW8Cr4kpr
	4vg3yIqFy3JF1Iqr4rJw1kZF13ArWfKrs5Ka12qw1Fv3yrZFyagF18W34xuFn3Aay8Xa9x
	X3ykAFy5ZF4kAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgIBA2rqY4LY6gAAsV

i2s_trigger() takes a runtime PM reference before calling config_setup().
config_setup() can fail with -EINVAL or -EAGAIN, and the error path
currently returns with that reference still held. A failed START does not
guarantee a matching STOP, so the runtime PM usage count stays elevated.

Drop the reference before returning the error.

Fixes: dc938ddb5628 ("ASoC: samsung: i2s: Ensure proper runtime PM state of I2S device")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/samsung/i2s.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 442e70b107da..d2060c3ff6e8 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -924,6 +924,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
+	bool failed = false;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -935,8 +936,10 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 			priv->fixup_early(substream, dai);
 
 		scoped_guard(spinlock_irqsave, &priv->lock) {
-			if (config_setup(i2s))
-				return -EINVAL;
+			if (config_setup(i2s)) {
+				failed = true;
+				break;
+			}
 
 			if (priv->fixup_late)
 				priv->fixup_late(substream, dai);
@@ -946,6 +949,11 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 			else
 				i2s_txctrl(i2s, 1);
 		}
+
+		if (failed) {
+			pm_runtime_put(dai->dev);
+			return -EINVAL;
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.34.1

