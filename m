Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760048;
	b=GwMqo/wlzJHo8HUEt9vc61eJ05BoGjUbzrl0ggsZwXNdrXPqfEcy3U2VXauKAquUAIGZ
	 uqVCuAuYBKEgmsJ5QB70e7RPIjLmLbbq9MkLjoNDDUQD4CftoDrr6Z1Va0CTv8LyTd9+J
	 F13gt4iEfIcPzlGRAXt2esrB6h3DdxaxBUSb57ZKLpCf2bYT/2TDinaECpHERFg4qVAft
	 LS+ZX46R7E8/XGLiXgpYDwx/7Nsubkey7jAp8ORjwXNDUqkFdJqrRAWUNuGINc1Kta3r3
	 1yTF8+btCmKVwqRp7lz1G/XwBw2cfoB2FOomSID7ZJ967fwuStaJUSnfrW/DORJs7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760048;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=uWMqfjCvdPhP79zAiQUWclRPU5qjtyJKcI1FyDecoWs=;
	b=R9f1lL3YB+SMwXuh/HbR08wyI+Q2HYLe4z32u8pIN+Nqgwe069Tfiaap4NuZbLbjNKoW
	 PvVU3gpoFkLv4QoNIjvM/fZUTfkDdcbG4sCx7yw6Oi3NF5byWFS43mwHbyMjz2bct9n3x
	 FwgLmoRBs+K8pbjHR9N1lOElSC+M0qpaZ6XCm7+yjCrVmYS4x5Fw102GX6KClRx3pnU2/
	 RXd+NyJeHpVOlOM0/TJA6KUxl/R1jG2gSODm8wqZA5oj3xwBPMTxgCNZF99yQelNEg61U
	 DyhSuqT7jmpWocSDEmuweTJ0aExPQ/nyQkKRWbAgnUbkFqy1HkwfhJzinq5Xkrcdcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793B606A33D
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6793B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvwpm+pqf7k+AA--.5349S2;
	Wed, 04 Nov 2026 10:40:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: samsung: i2s: unregister the secondary device when attach fails
Date: Wed,  4 Nov 2026 02:40:50 +0000
Message-Id: <20261104024050.1508686-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACHsvwpm+pqf7k+AA--.5349S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kKFW5JFW3KF15CF4rZrb_yoW8JF4fpw
	n5Ga98tFWYgr429a15ZF18Ga4UC3y7Cr45uF1UA345K3s3GryI934FkFWUJFsrJFZ5ua1r
	XFyUJa18uF4UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUBA2rqY-nVbQAAs8

After platform_device_add() succeeds, i2s_create_secondary_device() calls
device_attach() and, when that fails, tries to unregister the device
through priv->pdev_sec. That field is only assigned on the success path
below, so the call receives NULL and the registered platform device is
never unregistered.

Unregister the local pdev_sec instead, and report the failure before
dropping the last reference to the device.

Fixes: c6bebefa2f06 ("ASoC: samsung: i2s: Fix multiple "IIS multi" devices initialization")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/samsung/i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index d2060c3ff6e8..e3112afea0f0 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1373,8 +1373,8 @@ static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
 
 	ret = device_attach(&pdev_sec->dev);
 	if (ret <= 0) {
-		platform_device_unregister(priv->pdev_sec);
 		dev_info(&pdev_sec->dev, "device_attach() failed\n");
+		platform_device_unregister(pdev_sec);
 		return ret;
 	}
 
-- 
2.34.1

