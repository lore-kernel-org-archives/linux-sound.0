Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8C32BF55
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767851100; cv=none; b=ZkL49ybRhdF6ZOO8H1tunaKAsfVnuwDncVcXudKTVexJJvPSoHZzRwPh7e07i/Q1WjbGJ3J+miS0XTr6XfYxmhTJWtlWPksDDlsHbkqT/67pC7W9gAL2dXijXu/SxiQQuQzvEHRba0DutBQC5j/YW01vA7frqKY+dqPFq6GsUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767851100; c=relaxed/simple;
	bh=83hMrfD4Fq+rbllC/UgUpAibyMdmCI4nkIk8uf15amY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NfhevXTky+qpzZ30QWxT5EjdgWS2XPie7paANx3NFO76rlk+UQYIJPOfDQ0pQF7Et+x627TlEC3A4BIQZISDRkBsjhOJ+tFdZ57+cWqXG0LVXYogrVFQe9+Dgs6WsEKWolHOPVRrv0HwZsomDwnrM/7pDO+YXmOs4NlSlIZ3NBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L40ygFMK; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L40ygFMK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767851094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ihOiMefa8nZKz5PB3yBRxWRObBZpFoE38eiFZWgVW/Y=;
	b=L40ygFMKu57l6l59NOUteBE/PFftAGbVzgTcviXCA/MXx58ovDauTapCSD8PjNho5XDOaX
	fYb05R7EK06rBw1qZeZbi4zVVCdSMX9QtJSATc6WyqjsTcWA+NV2BaN8t9Vm9NDPMed+K0
	8tKQ06xloVfzztDdl0xHBBVhFYs3qgc=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: Skip UEFI calibration on ASUS ROG Xbox Ally X
Date: Wed,  7 Jan 2026 21:40:36 -0800
Message-ID: <20260108054036.11229-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

According to TI, there is an issue with the UEFI calibration result on
some devices where the calibration can cause audio dropouts and other
quality issues. The ASUS ROG Xbox Ally X (RC73XA) is one such device.

Skipping the UEFI calibration result and using the fallback in the DSP
firmware fixes the audio issues.

Fixes: 945865a0ddf3 ("ALSA: hda/tas2781: fix speaker id retrieval for multiple probes")
Cc: stable@vger.kernel.org # 6.18
Link: https://lore.kernel.org/all/160aef32646c4d5498cbfd624fd683cc@ti.com/
Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev/
Suggested-by: Baojun Xu <baojun.xu@ti.com>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index c8619995b1d7..ec3761050cab 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -60,6 +60,7 @@ struct tas2781_hda_i2c_priv {
 	int (*save_calibration)(struct tas2781_hda *h);
 
 	int hda_chip_id;
+	bool skip_calibration;
 };
 
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
@@ -489,7 +490,8 @@ static void tasdevice_dspfw_init(void *context)
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
-	hda_priv->save_calibration(tas_hda);
+	if (!hda_priv->skip_calibration)
+		hda_priv->save_calibration(tas_hda);
 }
 
 static void tasdev_fw_ready(const struct firmware *fmw, void *context)
@@ -546,6 +548,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 	void *master_data)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
+	struct tas2781_hda_i2c_priv *hda_priv = tas_hda->hda_priv;
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
 	struct hda_codec *codec;
@@ -571,6 +574,14 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 		break;
 	}
 
+	/*
+	 * ASUS ROG Xbox Ally X (RC73XA) UEFI calibration data
+	 * causes audio dropouts during playback, use fallback data
+	 * from DSP firmware instead.
+	 */
+	if (codec->core.subsystem_id == 0x10431384)
+		hda_priv->skip_calibration = true;
+
 	pm_runtime_get_sync(dev);
 
 	comp->dev = dev;
-- 
2.52.0

