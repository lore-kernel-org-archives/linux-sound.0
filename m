Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00A35337E
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606268; cv=none; b=gLazMOFacTzKfnb5RR6bDCW+7pJYQ0ONoLGM3HhBZQqTf2AfhCirSAVkA5LaUWcIhu+TlPPIhrZgcZVBK74h+Jsx9jZzShYCPsgn9qtCuf462grVGEVeTcZtMoIaMGlo8scEleZqZcxrFcgoTTx7eJI6d4Y/wRquYkTUGfXV6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606268; c=relaxed/simple;
	bh=gA8tlc/rn9u5avxIE4PtESQM2VD/ueReL6UEiKGVi+E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u1Z4DCYZqOUbujKz+QR7uR/VUTsKAfiuIn7CQols76nw/W8gTNbAKqsCCg4IzjYNSJpPnIeoJZ358Ew6y8k83KxyHYH4edN4DjNyLaM7l9vIWu6XqmXMtCPa4It3LvFvoMDgIoiMkMJN5C0hGjgr3sD4AvY2yoga9MnzkRFx+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vKJsgbbn; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vKJsgbbn"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BFvMPu840583;
	Thu, 11 Sep 2025 10:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757606242;
	bh=U2Z3uzxnVD/Yd6/VdzBbXZxCNeXvX4xYQxQr49hd0NI=;
	h=From:To:CC:Subject:Date;
	b=vKJsgbbna167p4X3MFbVznf5ai8Gcqy+yQkuRSZ7Wus0VVPb29ZGur/6sT/OyuYAz
	 F4HEs3fsMPgM9a14A0+t8dyi77DWCylatkDgM+6n96Oqdebrmf3mwqe+0Z7rKpE8Ud
	 kLQ68eoIk+nHCSmB7mIzjRaDRcGt3DcOl8370dms=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BFvLDW605280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 10:57:22 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 10:57:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 10:57:21 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BFvFFI2366393;
	Thu, 11 Sep 2025 10:57:16 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v4 1/6] ASoC: ops: improve snd_soc_get_volsw
Date: Thu, 11 Sep 2025 21:26:58 +0530
Message-ID: <20250911155704.2236-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

* add error handling in case register read fails
* add support for clamping the values if the register
  value read is greater than max value

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/soc-ops.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a629e0eac..59e91741b 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -111,10 +111,14 @@ int snd_soc_put_enum_double(struct snd_kcontrol *kcontrol,
 EXPORT_SYMBOL_GPL(snd_soc_put_enum_double);
 
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-				unsigned int mask, unsigned int shift, int max)
+				unsigned int mask, unsigned int shift, int max,
+				bool clamp)
 {
 	int val = (reg_val >> shift) & mask;
 
+	if (clamp)
+		val = clamp(val, 0, mc->max);
+
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
@@ -245,29 +249,44 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
 
 static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol,
-			 struct soc_mixer_control *mc, int mask, int max)
+			 struct soc_mixer_control *mc, int mask, int max,
+			 bool clamp)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
-	int val;
+	int val, ret = 0;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
-	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+	val = reg_val;
+	if (val < 0) {
+		ret = val;
+		goto get_volsw_done;
+	}
+
+	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max, clamp);
 
 	ucontrol->value.integer.value[0] = val;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (mc->reg == mc->rreg) {
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift,
+						   max, clamp);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
-			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
+			val = reg_val;
+			if (val < 0) {
+				ret = val;
+				goto get_volsw_done;
+			}
+			val = soc_mixer_reg_to_ctl(mc, reg_val, mask,
+						   mc->shift, max, clamp);
 		}
 
 		ucontrol->value.integer.value[1] = val;
 	}
 
-	return 0;
+get_volsw_done:
+	return ret;
 }
 
 /**
@@ -330,7 +349,8 @@ int snd_soc_get_volsw(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max - mc->min);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask,
+			     mc->max - mc->min, false);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw);
 
@@ -372,7 +392,7 @@ int snd_soc_get_volsw_sx(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = soc_mixer_sx_mask(mc);
 
-	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max);
+	return soc_get_volsw(kcontrol, ucontrol, mc, mask, mc->max, false);
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_volsw_sx);
 
-- 
2.45.2

