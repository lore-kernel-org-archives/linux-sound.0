Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A61922F5
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333806; cv=none; b=lXqOkfRIUalmUSWhr/XuVsGALmMSD/uSiuibeFWzWg3HRvaQ7cj7wSGiHoKtytsbnumyshLFTW9kzHT82LjSSY3wQw66B9LdBKyvWC+USrDdO+NoSSlTh4Relog0dCVFStzwHb43rmwi1hiRrZYW8GQC/VXt+dniAjd8Bvksl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333806; c=relaxed/simple;
	bh=uRJjPVg73olYviXpVAJ9kMh5UuL8cXbBxj87rt2WTGk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VfbrgwvPLp+V/8fmSnGIyQzjymqaJ4UzTeIMmg3HsylFz7m/v8uag8MkUYKdYhs82dcbFZp61T/1vEmAP/CCJ0PJvYVEtnyCrrrBVtaHoXjfsk+BKQkfXwVA4NtpC1y2j5L50hf6/WNKcPSRXNLSMcbsoOmcDtR9rQfk9Lfdj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZIavJOKg; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZIavJOKg"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5A599KKo8867431, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1762333760; bh=AzULePKrtlyGPmuZsdbsMT6qU3Nb9s6W4C20gNJWs2A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ZIavJOKgrG95/Z2V4f2E4B62EZQFoWGR/1TURT9H+S5Lp4CV4/Cs+WmJlq4LYo3QI
	 sy+yUzvumH3vmwwZ3q6/buXC549PuAF7KVLA/ygER/J1CuIyExucShyOjUD+mwIWx3
	 J0t4ZlM4Mke2QlgUNxl/qUCjiali/A5Aofgyw32pCikvVtvf+eDJ/iD1K78saElbb0
	 EmXvDc62Otmu1XRGWgJWVxBoB+n18HxnFZ/63dJyg5D0k6bQlN7QZWHA2Q4piMWmiW
	 +Q7/dZk/3fnF3eLc7qDp8B881ow++8YDSeQklqt7veh16pS67bIzYPzP/yqWczd8oG
	 fL4bYEGxVT03A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5A599KKo8867431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 17:09:20 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 5 Nov 2025 17:09:20 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 5 Nov 2025 17:09:20 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Wed, 5 Nov 2025 17:09:20 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: SDCA: support Q7.8 volume format
Date: Wed, 5 Nov 2025 17:11:22 +0800
Message-ID: <20251105091122.495561-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The SDCA specification uses Q7.8 volume format.
This patch adds a field to indicate whether it is SDCA volume control
and supports the volume settings.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/soc.h        |  1 +
 sound/soc/sdca/sdca_asoc.c | 34 ++++++---------------
 sound/soc/soc-ops.c        | 62 +++++++++++++++++++++++++++++++-------
 3 files changed, 61 insertions(+), 36 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1aebf14fcf80..53b4129ee97a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1225,6 +1225,7 @@ struct soc_mixer_control {
 	unsigned int sign_bit;
 	unsigned int invert:1;
 	unsigned int autodisable:1;
+	unsigned int sdca_q78:1;
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj;
 #endif
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index c493ec530cc5..892b7c028fae 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -795,7 +795,6 @@ static int control_limit_kctl(struct device *dev,
 	struct sdca_control_range *range;
 	int min, max, step;
 	unsigned int *tlv;
-	int shift;
 
 	if (control->type != SDCA_CTL_DATATYPE_Q7P8DB)
 		return 0;
@@ -814,37 +813,22 @@ static int control_limit_kctl(struct device *dev,
 	min = sign_extend32(min, control->nbits - 1);
 	max = sign_extend32(max, control->nbits - 1);
 
-	/*
-	 * FIXME: Only support power of 2 step sizes as this can be supported
-	 * by a simple shift.
-	 */
-	if (hweight32(step) != 1) {
-		dev_err(dev, "%s: %s: currently unsupported step size\n",
-			entity->label, control->label);
-		return -EINVAL;
-	}
-
-	/*
-	 * The SDCA volumes are in steps of 1/256th of a dB, a step down of
-	 * 64 (shift of 6) gives 1/4dB. 1/4dB is the smallest unit that is also
-	 * representable in the ALSA TLVs which are in 1/100ths of a dB.
-	 */
-	shift = max(ffs(step) - 1, 6);
-
 	tlv = devm_kcalloc(dev, 4, sizeof(*tlv), GFP_KERNEL);
 	if (!tlv)
 		return -ENOMEM;
 
-	tlv[0] = SNDRV_CTL_TLVT_DB_SCALE;
+	tlv[0] = SNDRV_CTL_TLVT_DB_MINMAX;
 	tlv[1] = 2 * sizeof(*tlv);
 	tlv[2] = (min * 100) >> 8;
-	tlv[3] = ((1 << shift) * 100) >> 8;
+	tlv[3] = (max * 100) >> 8;
+
+	step = (step * 100) >> 8;
 
-	mc->min = min >> shift;
-	mc->max = max >> shift;
-	mc->shift = shift;
-	mc->rshift = shift;
-	mc->sign_bit = 15 - shift;
+	mc->min = ((int)tlv[2] / step);
+	mc->max = ((int)tlv[3] / step);
+	mc->shift = step;
+	mc->sign_bit = 15;
+	mc->sdca_q78 = 1;
 
 	kctl->tlv.p = tlv;
 	kctl->access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index d2b6fb8e0b6c..6dc961253947 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -110,6 +110,36 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
+static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
+				unsigned int mask, unsigned int shift, int max)
+{
+	int val = reg_val;
+
+	if (WARN_ON(!mc->shift))
+		return -EINVAL;
+
+	val = sign_extend32(val, mc->sign_bit);
+	val = (((val * 100) >> 8) / (int)mc->shift);
+	val -= mc->min;
+
+	return val & mask;
+}
+
+static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
+					 unsigned int mask, unsigned int shift, int max)
+{
+	unsigned int ret_val;
+	int reg_val;
+
+	if (WARN_ON(!mc->shift))
+		return -EINVAL;
+
+	reg_val = val + mc->min;
+	ret_val = (int)((reg_val * mc->shift) << 8) / 100;
+
+	return ret_val & mask;
+}
+
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
 				unsigned int mask, unsigned int shift, int max)
 {
@@ -202,14 +232,22 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val2 = 0;
 	bool double_r = false;
 	int ret;
+	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);
+
+	if (mc->sdca_q78) {
+		ctl_to_reg = sdca_soc_q78_ctl_to_reg;
+		val_mask = mask;
+	} else {
+		ctl_to_reg = soc_mixer_ctl_to_reg;
+		val_mask = mask << mc->shift;
+	}
 
 	ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[0], max);
 	if (ret)
 		return ret;
 
-	val1 = soc_mixer_ctl_to_reg(mc, ucontrol->value.integer.value[0],
+	val1 = ctl_to_reg(mc, ucontrol->value.integer.value[0],
 				    mask, mc->shift, max);
-	val_mask = mask << mc->shift;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		ret = soc_mixer_valid_ctl(mc, ucontrol->value.integer.value[1], max);
@@ -217,14 +255,10 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 			return ret;
 
 		if (mc->reg == mc->rreg) {
-			val1 |= soc_mixer_ctl_to_reg(mc,
-						     ucontrol->value.integer.value[1],
-						     mask, mc->rshift, max);
+			val1 |= ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->rshift, max);
 			val_mask |= mask << mc->rshift;
 		} else {
-			val2 = soc_mixer_ctl_to_reg(mc,
-						    ucontrol->value.integer.value[1],
-						    mask, mc->shift, max);
+			val2 = ctl_to_reg(mc, ucontrol->value.integer.value[1], mask, mc->shift, max);
 			double_r = true;
 		}
 	}
@@ -251,18 +285,24 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
 	int val;
+	int (*reg_to_ctl)(struct soc_mixer_control *, unsigned int, unsigned int, unsigned int, int);
+
+	if (mc->sdca_q78)
+		reg_to_ctl = sdca_soc_q78_reg_to_ctl;
+	else
+		reg_to_ctl = soc_mixer_reg_to_ctl;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+	val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
+			val = reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+			val = reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 		}
 
 		ucontrol->value.integer.value[1] = val;
-- 
2.51.1

