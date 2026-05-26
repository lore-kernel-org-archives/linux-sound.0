Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91F13F7AA8
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796601; cv=none; b=KZFe2DtBtDEC0pypSUYIXE0uTAurkT1A9J0e5wpQ5WHDl2ngxsScCMO+CU9ZC2EJeLfb9QtsYZvTsQMl1DQw0EKU0mFxONRHO04Vg0dXI8/AW6czw6q9dvYsjpz55kPZ5p9cL5JkE5APdpzWeGP06BvHWl94h81K/WzUu7jRiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796601; c=relaxed/simple;
	bh=26baxojEQUES+iGTE+rTRbPSPsC97B/hRpT8D4AwdqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE/gXkYQZ4IEr+wwspBLTWomeOh84ZfJq3svTJ0/R8RmcuMKL8FNmI5ldRSun0CTZR2HSL52/iySnG4GVmOlkwpCy2L6HD88TX1+CG97+drofJVZhVPumKMKzcGv/AUlbPcOQ1YPe1j0PHjCWU5xQJ5q3oVy572acpNjH3rsZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8Dx13h0ihVqyWMNAA--.13586S3;
	Tue, 26 May 2026 19:56:36 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBwihVq6I+RAA--.13381S3;
	Tue, 26 May 2026 19:56:35 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 5/5] ASoC: codecs: es8323: Adjust the initialization of certain registers
Date: Tue, 26 May 2026 19:56:26 +0800
Message-ID: <738268f7409fafdb65cd25214114fbde4d7e25c5.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779796354.git.zhoubinbin@loongson.cn>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBwihVq6I+RAA--.13381S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgETCGoVNiwIsAAAsF
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4rXryrAw4kZFWrGFWUKFX_yoW5Gr4kpF
	Z0va98tF1UuF4rXry5AFWrZr1xJryF9FW7C342g39xJr13Zr9293WFqFy0vryrZFsxtr4D
	Zr1j93yUJ3WfG3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Wrv_ZF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j6VbgUUUUU=

A few additional register initializations are required for proper
operation.

- During hw_params, write ES8323_DACPOWER (0x3c) to ensure DAC power
  is correctly configured for the selected sample rate.
- In the probe function, initialize DACCONTROL17, DACCONTROL20,
  ADCCONTROL10, LOUT1_VOL, and ROUT1_VOL to improve analog output
  stability and volume level.
- In set_bias_level, set CHIPPOWER to 0x00 when powering up and
  to 0xff when powering off, fully controlling the chip's power
  state.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 sound/soc/codecs/es8323.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index d067f7bda03a..be5d9a2dea11 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -613,6 +613,8 @@ static int es8323_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_write_field(component, ES8323_DACCONTROL1,
 				      ES8323_DACCONTROL1_DACWL, wl_mode);
 
+	snd_soc_component_write(component, ES8323_DACPOWER, 0x3c);
+
 	return 0;
 }
 
@@ -675,7 +677,12 @@ static int es8323_probe(struct snd_soc_component *component)
 	}
 
 	snd_soc_component_write(component, ES8323_CONTROL2, 0x60);
+	snd_soc_component_write(component, ES8323_DACCONTROL17, 0xb8);
+	snd_soc_component_write(component, ES8323_DACCONTROL20, 0xb8);
 	snd_soc_component_write(component, ES8323_DACCONTROL21, 0x80);
+	snd_soc_component_write(component, ES8323_ADCCONTROL10, 0xea);
+	snd_soc_component_write(component, ES8323_LOUT1_VOL, 0x1b);
+	snd_soc_component_write(component, ES8323_ROUT1_VOL, 0x1b);
 
 	return 0;
 }
@@ -694,6 +701,7 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 		if (ret)
 			return ret;
 
+		snd_soc_component_write(component, ES8323_CHIPPOWER, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0x00);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0x00);
 		snd_soc_component_update_bits(component, ES8323_ADCPOWER,
@@ -702,6 +710,7 @@ static int es8323_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_STANDBY:
 		break;
 	case SND_SOC_BIAS_OFF:
+		snd_soc_component_write(component, ES8323_CHIPPOWER, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW1, 0xff);
 		snd_soc_component_write(component, ES8323_CHIPLOPOW2, 0xff);
 		clk_disable_unprepare(es8323->mclk);
-- 
2.52.0

