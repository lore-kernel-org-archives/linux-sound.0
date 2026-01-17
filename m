Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0759B640
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641535; cv=none; b=OqrptUOLPFjBaPsATANqckZQ4NB9QhCwq7i4HT+oEHWs7zcZfHf2dvlnCPPfJMrjkFWyQxjxtk/e7RYtKgTLoNggexAl/3+mfuIMuMCMReGnMPU0yULEmAjeFl7X52cPWlDRYc+cGaFLGt99V3jDI7l3qY/dcRh90/ko4Gc91KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641535; c=relaxed/simple;
	bh=8hxR+CE2xQ2Y/NoN2mY3vmqC8rIBy23T9cZyc2Eul5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L80Ui5vcizs03IlFf6LnBzsNF+9AB03rbS4L4xldw8Be5WRbDsRXpRirfusOzmrTMLiGYzxcjFJIUUyn4EtgmWFpiLwEmKxu85hrwxltKtFMuq4SEgdB/kMUIXhqDgJoEp3bVc7ZvXWBMTovkNLouVciJZnOUByRZ52iRKy3AV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8Dx98H6U2tpVNQJAA--.19712S3;
	Sat, 17 Jan 2026 17:18:50 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJAx28HzU2tpHh8hAA--.130S4;
	Sat, 17 Jan 2026 17:18:50 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/4] ASoC: codecs: es8323: remove DAC enablement write from es8323_set_bias_level
Date: Sat, 17 Jan 2026 17:18:35 +0800
Message-ID: <d2823ad7ae226a83d49bcb860240c0ddc4080f14.1768641428.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768641428.git.zhoubinbin@loongson.cn>
References: <cover.1768641428.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28HzU2tpHh8hAA--.130S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEKCGlrJLcBxAAAsW
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1rJw1UGF1kKF15Cw4UAwc_yoW8CrW5pF
	Z0va98KF1jvF4rXry5AFWrZF17JryFkFW7G342939xJr17Zr9a9Fn5tFy0vFyrZFZIvrs8
	ur1jv3yUJ3WfG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07j5GYJUUUUU=

Since commit daf855f76a12 ("ASoC: es8323: enable DAPM power widgets for
playback DAC"), the DAC is handled by the DAPM subsystem.

Remove initialization of the DAC enablement bits from the
es8323_set_bias_level routine

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 8647ddc1c285..4a589949cc7e 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -576,8 +576,6 @@ static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_write_field(component, ES8323_DACCONTROL1,
 				      ES8323_DACCONTROL1_DACWL, wl_mode);
 
-	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
-
 	return 0;
 }
 
@@ -659,7 +657,6 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 
 		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xf0);
 		usleep_range(18000, 20000);
-		snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
 		snd_soc_component_write(component, ES8323_ANAVOLMANAG, 0x7c);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
@@ -679,7 +676,6 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_OFF:
 		clk_disable_unprepare(es8323->mclk);
 		snd_soc_component_write(component, ES8323_ADCPOWER, 0xff);
-		snd_soc_component_write(component, ES8323_DACPOWER, 0xC0);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xff);
-- 
2.47.3

