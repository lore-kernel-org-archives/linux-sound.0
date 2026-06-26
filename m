Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F5A3009E1;
	Fri, 26 Jun 2026 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782440883; cv=none; b=b1ywRFwhOQ7/bzA9B3GxP6JFwPi26f7jL9E3VL+d0vszoJp53/CH0ect0XsjBMX/RMVPANC3tkMYJGS/Vzcfr6mMwRIccS2j4+NlTrMIsyZVvqd6t7YZn3RvFHtA3TnYQ3WgN1b4WwCEX1PGKkyvLl/n+H6DycNi5/jmUrUnkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782440883; c=relaxed/simple;
	bh=AkvTLSpf8tNX3O3zxFlSCiZyBI46jiN6mQBAhF7Ah6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WiOa1qXaVZd8q8dffHijY5jv6aBRvIWWejpNzm76Bz5MWgJVSPOuMndVAGKruvjYNk+e2l7xMDdN3i3JlErKY5bso3Iho7kyJfF2fiATW/Z29I+e1bf4jhEXP1V8AAB4uSMY5y336xHXyox4CD0II4O4blzom4cEa2s9GtXbMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.155])
	by gateway (Coremail) with SMTP id _____8Ax_umv4z1qNTEYAA--.61668S3;
	Fri, 26 Jun 2026 10:27:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.155])
	by front1 (Coremail) with SMTP id qMiowJBx68Gs4z1q0m2zAA--.10481S3;
	Fri, 26 Jun 2026 10:27:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Keguang Zhang <keguang.zhang@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 9/9] ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias
Date: Fri, 26 Jun 2026 10:27:49 +0800
Message-ID: <dcf1f8ae4f1f192a1d63e9fe7044b0218119b5eb.1782439646.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1782439646.git.zhoubinbin@loongson.cn>
References: <cover.1782439646.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx68Gs4z1q0m2zAA--.10481S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGo8w2QargAAsH
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW7WrWfZr1kuFy5AFW3CFX_yoW8GrWkpF
	4rKrs3tF97J3WfAw1vkw13XF13GFy7uFWfGFWUK3yDKrn8JF4vqr1Fyr129Fs7JrZYgan7
	X3s7t3yrCa43ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUx_HUUUUUU

The ES8328 codec has differential/single-ended microphone inputs
(LINPUT1/RINPUT1, LINPUT2/RINPUT2) that require connection to the
internal Mic Bias generator for proper operation. Currently, these
routes are missing, which can cause microphone recording to fail.

Add the missing DAPM routes to link the input pins to the Mic Bias
supply, ensuring the microphone bias voltage is correctly applied.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
PS:
I'm not sure if this patch is also required for other platforms using
the ES8328. If not, I'll drop the patch and add this DAPM route to the
`audio-routing` property of the Loongson ASoC machine driver.

 sound/soc/codecs/es8328.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 9838fe42cb6f..aaa6646ad4c5 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -405,6 +405,11 @@ static const struct snd_soc_dapm_route es8328_dapm_routes[] = {
 
 	{ "Mic Bias", NULL, "Mic Bias Gen" },
 
+	{ "LINPUT1", NULL, "Mic Bias" },
+	{ "RINPUT1", NULL, "Mic Bias" },
+	{ "LINPUT2", NULL, "Mic Bias" },
+	{ "RINPUT2", NULL, "Mic Bias" },
+
 	{ "Left Mixer", NULL, "Left DAC" },
 	{ "Left Mixer", "Left Bypass Switch", "Left Line Mux" },
 	{ "Left Mixer", "Right Playback Switch", "Right DAC" },
-- 
2.52.0

