Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB08488;
	Mon,  1 Dec 2025 03:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764558384; cv=none; b=vC88QdFg1M0JbqiGZWVouKv5nkOeoIs4ZwLla7uQQezdvoh9qhe3v+VtttC9vx+nUDD5us4YHWL2MlF57Y3V8E2eU28P+/sohG4XTLW1Kx3Cfv8mdZxLskAU4frPEueksv5q+HxiYSfhTVVzB9r9KboUEjJK49E5rJa4bGEmitU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764558384; c=relaxed/simple;
	bh=FVNCpRNKjh/nArxYMk8gRMACPGsOrAAwYQCZGXfFy6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Va6WkYUPQYgtQwYNLnETo9cLnmkq0gTO7h4DVFCoH5O+iyEZwrBrUf4/FtGYe/0nIBUdrPt/+0cL9rhL3i0aUuKJ4v5T9SxyybCcp2Hzs/3YjXXgBax+FLuvnFt2I3wZyeyA5Yo1ASh3gdxJuAeWVFFpNnk1DHM2NGTGw1JNsIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAA3i90mBi1p3CHBAg--.22867S2;
	Mon, 01 Dec 2025 11:06:14 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ASoC: cpcap: Fix event generation for mux controls
Date: Mon,  1 Dec 2025 11:03:54 +0800
Message-ID: <20251201030354.961-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3i90mBi1p3CHBAg--.22867S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW5ur1xCF4ktrWUXw4xJFb_yoW5tFWxpF
	WYkw4q9w47ta13ZF1avr18ZF1a9FWIkwnak39rA342vFnIyw18WFyfKFW8CFy7Jry7ZF1D
	Aw42v3y8GF4UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjfUeGYpUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsDA2ks7HtnpwAAsf

The mux put callbacks unconditionally return 0, failing to
notify the ALSA core when control values change. This prevents
userspace applications from receiving events.

Use regmap_update_bits_check() instead of regmap_update_bits()
to detect actual register changes, and return 1 when the mux value
has changed to generate proper events for userspace applications.

Fixes: f6cdf2d3445d ("ASoC: cpcap: new codec")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/cpcap.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 3eb862643b53..40b33a0acc52 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -432,6 +432,7 @@ static int cpcap_output_mux_put_enum(struct snd_kcontrol *kcontrol,
 	unsigned int mask = BIT(e->shift_l);
 	u16 reg_voice = 0x00, reg_hifi = 0x00, reg_ext = 0x00;
 	int err;
+	bool change = false;
 
 	switch (muxval) {
 	case 1:
@@ -447,22 +448,22 @@ static int cpcap_output_mux_put_enum(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXCOA,
-				 mask, reg_voice);
+	err = regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXCOA,
+				 mask, reg_voice, &change);
 	if (err)
 		return err;
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXSDOA,
-				 mask, reg_hifi);
+	err = regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXSDOA,
+				 mask, reg_hifi, &change);
 	if (err)
 		return err;
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXEPOA,
-				 mask, reg_ext);
+	err = regmap_update_bits_check(cpcap->regmap, CPCAP_REG_RXEPOA,
+				 mask, reg_ext, &change);
 	if (err)
 		return err;
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
 
-	return 0;
+	return change ? 1 : 0;
 }
 
 static int cpcap_input_right_mux_get_enum(struct snd_kcontrol *kcontrol,
@@ -515,6 +516,7 @@ static int cpcap_input_right_mux_put_enum(struct snd_kcontrol *kcontrol,
 	unsigned int muxval = ucontrol->value.enumerated.item[0];
 	int regval = 0, mask;
 	int err;
+	bool change = false;
 
 	mask = 0;
 	mask |= BIT(CPCAP_BIT_MIC1_MUX);
@@ -539,14 +541,14 @@ static int cpcap_input_right_mux_put_enum(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
-				 mask, regval);
+	err = regmap_update_bits_check(cpcap->regmap, CPCAP_REG_TXI,
+				 mask, regval, &change);
 	if (err)
 		return err;
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
 
-	return 0;
+	return change ? 1 : 0;
 }
 
 static int cpcap_input_left_mux_get_enum(struct snd_kcontrol *kcontrol,
@@ -591,6 +593,7 @@ static int cpcap_input_left_mux_put_enum(struct snd_kcontrol *kcontrol,
 	unsigned int muxval = ucontrol->value.enumerated.item[0];
 	int regval = 0, mask;
 	int err;
+	bool change = false;
 
 	mask = 0;
 	mask |= BIT(CPCAP_BIT_MIC2_MUX);
@@ -607,14 +610,14 @@ static int cpcap_input_left_mux_put_enum(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
-				 mask, regval);
+	err = regmap_update_bits_check(cpcap->regmap, CPCAP_REG_TXI,
+				 mask, regval, &change);
 	if (err)
 		return err;
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, muxval, e, NULL);
 
-	return 0;
+	return change ? 1 : 0;
 }
 
 static const struct snd_kcontrol_new cpcap_input_left_mux =
-- 
2.50.1.windows.1

