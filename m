Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9C258EF9
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666227; cv=none; b=SSrtzaYb5ELTwmsmA0hU9zFDkU+Og8OefkIogorSzwom/bvAgEV/4dkVmmf7AmAd0h20QT8yCl0VnjC5f0sYwRw6EuQ2ZgSGWnn8TeDZZJGynblusQZGlnfchup5qHQDUEan5riWra1pI8Pf/zNc9+ih3xQHDfgE5kETrbxsrdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666227; c=relaxed/simple;
	bh=MhhH9LXJGN4R7Y0FqgVQgQuW98T4GJNZ7YMlyeibkLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IOD+gyJ7Hn1+jdJhxTG3UZ1Dudj7WiBPbwQVa9Hr4qrrEg+IU6JTl2Xyy0LcPV0y0GV2fpPIXPIa8mIpQG4XQDa1+DzggKgY2mNAfibD/xH05OK4EIYDFmdImBr3LiM6mqUCI1jyrWw+/q3nfxTkl4mnKYET/DFsGRW9KzenXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CwGgNa0P; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CwGgNa0P"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C8amE7482229;
	Fri, 12 Sep 2025 03:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757666208;
	bh=9nkN+NI9wrmL/iDvR/+6HKvHtpQGMFSVKg9nB/1kBMA=;
	h=From:To:CC:Subject:Date;
	b=CwGgNa0PSxevp/BewGSp+WT+cY5EAAWrBccQhCXtj+h/jomkBQ30kavdVd+cjkedh
	 +9ZhpwCBpPPMKTMIC8c8vE92dweZcY99h/s5Quky4q2jJNkiFTWe+qVQbjhyxjEnHX
	 XtXL3ZtABkvAfPc/b0nyYCd01pCDptJnK1IL044U=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C8amEi1849751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 03:36:48 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 03:36:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 03:36:47 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C8afm93320658;
	Fri, 12 Sep 2025 03:36:42 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v5 1/5] ASoC: ops: improve snd_soc_get_volsw
Date: Fri, 12 Sep 2025 14:06:20 +0530
Message-ID: <20250912083624.804-1-niranjan.hy@ti.com>
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
* clamp the values if the register value read is
  out of range

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
--
v5:
 - remove clamp parameter
 - move the boundary check after sign-bit extension
---
 sound/soc/soc-ops.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a629e0eac..03f74c32d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -118,6 +118,7 @@ static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_v
 	if (mc->sign_bit)
 		val = sign_extend32(val, mc->sign_bit);
 
+	val = clamp(val, mc->min, mc->max);
 	val -= mc->min;
 
 	if (mc->invert)
@@ -249,9 +250,15 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg_val;
-	int val;
+	int val, ret = 0;
 
 	reg_val = snd_soc_component_read(component, mc->reg);
+	val = reg_val;
+	if (val < 0) {
+		ret = val;
+		goto get_volsw_done;
+	}
+
 	val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 
 	ucontrol->value.integer.value[0] = val;
@@ -261,13 +268,19 @@ static int soc_get_volsw(struct snd_kcontrol *kcontrol,
 			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->rshift, max);
 		} else {
 			reg_val = snd_soc_component_read(component, mc->rreg);
+			val = reg_val;
+			if (val < 0) {
+				ret = val;
+				goto get_volsw_done;
+			}
 			val = soc_mixer_reg_to_ctl(mc, reg_val, mask, mc->shift, max);
 		}
 
 		ucontrol->value.integer.value[1] = val;
 	}
 
-	return 0;
+get_volsw_done:
+	return ret;
 }
 
 /**
-- 
2.45.2

