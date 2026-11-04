Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760044;
	b=TbXjS9El4pBrLB0OZUVk2X/OjuGvitaz2c+G8IW5saEXxr94gGyXmniqa8ja34gpQgSX
	 3Vcm9dw/gGWqpJvN9G8YGfNUi79hREN9DrgxuS6/sFSXVGR9ISRejVfIbPz82+IGAswf2
	 74LqWeq1RBBUwsoTx38rOREBq0RynHMEOiwSJ1xdNUxVB+6/JT61kwl5ypm12LojGvorV
	 NRIqhMXiPSOcIMRqXt424nkwJFWTi8KoWflkXnbG9W75SZ7MB32TyKLuoVZwLK6ouRvLS
	 qRbXMrPqBJD/RlGXeD93ihzmRgppnrpvjZwQ3ih7oLNHIgGxDcUrZW8TPIIGfpaW6Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760044;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mSFLW4vQystCHrRI4U2kQ/9vGU1vHtRsLrLCF6xYFj0=;
	b=iItM4C32v9hBttgOvVxwU+7UQ7qUf/6Wv0MYZAjb5nY6s7dZKeUCK0BAdPBdm8aKGpMt
	 eew5id94IhjBaiG+RJzOFaoCXtSu2a4eDRuTdlT/1kwb8nUa+51lO+6VDSO2fvIUq6KZv
	 Jx+oeeCKOcuAnozouqWjZVGH+9hEIWsccoV6b50mEYdFE4UHQIv8wV9SltNtFBb4pdy/I
	 UCUDmLc31r5R5ungEC4VJdK2P+s0FwCRvmFL6L/qhNTph/Tz0QkG+iUQQHqQp9AetvT5g
	 WS5eb2TPqTooMwlQPG7CofYtYDkxef1YrgowLZZbkO6ZbAAWQVNuZPmHjczw/edSW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CB606A330
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXhP4mm+pqQ7k+AA--.4864S2;
	Wed, 04 Nov 2026 10:40:38 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ASoC: fsl-asoc-card: drop the ASRC device reference on probe exit
Date: Wed,  4 Nov 2026 02:40:47 +0000
Message-Id: <20261104024047.1508601-1-vulab@iscas.ac.cn>
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
X-CM-TRANSID:qwCowABXhP4mm+pqQ7k+AA--.4864S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF47KF1ktrWkXr4UZrW8Zwb_yoWkJrb_K3
	48u3s5ZFy8Grn7CFW5Wr42kF4kXFnrWF47GwsrKF48J34YvFWfAa9Iyr93uF90qws7Jw1D
	Jw1DXrWYvrW2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5SXd5UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAABA2rqY+TXGwAEsB

of_find_device_by_node() takes a reference to the embedded struct device,
but fsl_asoc_card_probe() never drops it. The reference is leaked on the
successful path as well as on every error path taken after the lookup.

Release the reference at the asrc_fail label, which is reached on both
success and failure.

Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 310ee4c282a1..d361bb58fdb1 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1378,6 +1378,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 asrc_fail:
+	if (asrc_pdev)
+		put_device(&asrc_pdev->dev);
 	of_node_put(asrc_np);
 	of_node_put(codec_np[0]);
 	of_node_put(codec_np[1]);
-- 
2.34.1

