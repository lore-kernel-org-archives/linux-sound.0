Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759291;
	b=10d2jdzLuJ3SAOB8GwfRG1ApWt9Dre9IyeVTTeS6aADftw7ZwQvQOUypeyy6Bt2TBCI5
	 f2RJlVkx2mofL1MXi4xpx6MJgBVqqlKQl3CedK04yIzq8uFyJPnUrrILjdSS4F/lYY+Fi
	 mLK1XQcGDs0vV9XJB40H3sIWN2+AORzn/3f5JEfRBM/Tu1FY2Yt10iwD6RFBtCrit26Y5
	 6yMZcfpGao/m6uniePMd7fcNy0EWCsfsXezr04HSVLxuHktH+kLv+lj9MBrSl+9jXToPL
	 tX6ZLmDEpHbISEqLmW9epk2NafQWhpk625gKTODm5nA8NZ8GHg5uku6f9pADoNUi2QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759291;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=pu7TWcgnV8s/LqBU3li0z2ZO6VUbOEfAFsaK5V9FRes=;
	b=xuDv3rhLuQ4lM7bU/PxrF7xZe38sPklstoGvQbbZYnMan/OAbL5aCXK5C7QBvL+H3FQU
	 NUT3ooBlTQHmyq6RGUf1LyNusizQ4d4kIFftYu31zNNaa3FH0BihLh/UBpEY+uJGtaMza
	 z52Ig8gHZNnyXXbhf3CRvF1ElnWsQ3A5lctVjB+YdOJ0QNZl8jTbv3n8yM6plS1ijyctD
	 ti9iFXVVWTn+CSlCjN1yj7w3f+ubSdGn5zIap7PKZiZhUGTiYSpRAYXDqEfq32LD1c8ie
	 HKO5FVvdhNVJJLPVUd7wwOXBg6u0mrqupjNl1ihDvmcn/Pg4RG78UxNUo+whUpYPlZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE973606D80D;
	Wed,  4 Nov 2026 02:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE973606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3H_o1mOpq1ps+AA--.29145S2;
	Wed, 04 Nov 2026 10:28:05 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd939x: fix device node leak in probe
Date: Wed,  4 Nov 2026 02:28:14 +0000
Message-Id: <20261104022814.1484303-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAD3H_o1mOpq1ps+AA--.29145S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF45Ww13XFykGF17WFyDZFb_yoWkXwcEg3
	y8uayvqryxWFs2kr4DtrsFvan7WFs3CrW0kw4ktry7Ka45KF4fX3s3tr9xua4UZ393Za4r
	ZF1UXa13X347WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_ZF0_GryDMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b7a9fUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMBA2rqY+TJlgABsU

wcd939x_populate_dt_data() fetches the remote endpoint node to check
whether the headphone lines are routed through the USBSS part, but
never drops the reference returned by of_graph_get_remote_node().
Probing a codec whose audio port has a valid remote endpoint therefore
leaks a device node reference.

Drop the reference once the result has been used.

Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/wcd939x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 2d463f062e6d..595eab8e33d9 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3214,6 +3214,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 		wcd939x->typec_analog_mux = true;
 		cfg->typec_analog_mux = true;
 		cfg->swap_gnd_mic = wcd939x_swap_gnd_mic;
+		of_node_put(np);
 	}
 #endif /* CONFIG_TYPEC */
 
-- 
2.34.1

