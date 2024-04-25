Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E56BFCC
	for <linux-sound@vger.kernel.org>; Thu, 25 Apr 2024 07:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714030208; cv=none; b=uAEO0sPtw5Zo6yayFTLU3fqao6I/XdQBywGYcUFMvgeFUqYn7qPFqFxCbgXlmmDQoWEFqh8tH7qRQuY4v8i1SHPO43BZ/92Nt3bht1YKWh5UbrLHJWPu2nWO/oLE1qgULPQaKWNWm6tilM5NI5m4RGSQhGg43p2a10B29pglsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714030208; c=relaxed/simple;
	bh=65cWIqqFlMmIyMOsBipC9dRn0tASPdwax90byUebSto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQ+DsUB3v22c4gp3NRBpZ6e3U+SqyQ19aeNgG2rzzkdT38UmfLXiqVbvwy/i1gpvBSL4VoPcMXR7rmnj882qXYPoUbHCMTbntCb+PgY/HVP7L7gCJXrxS1066mzbQ5YTZA1flv5wWAGYSCX+wjn+fvspY0KXx8Xi0Ixbi/0RUCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZUIcpL1U; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZUIcpL1U"
Received: from localhost.localdomain (unknown [222.129.33.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 55FAC3F6D2;
	Thu, 25 Apr 2024 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714029620;
	bh=S6WlPjrzv7yv//Pb94QcMjZ/iQsiWsVrpMWt6N4gcAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ZUIcpL1UTSjuH+uCURCsADWzjhSXK+gJA1Gu8a173QIW45Yotp4d2KSBYnjp7wCPq
	 x42spTsd9BNvPyHiFCxn6e1jUcstBPa/dU1CnkF9EyuuUeTUJ815thpQ7ZCSRJGXC1
	 6qvecQsRVASM+13ZAYb3hB53uobtGzOoBh8VQjHZILfPZ4M8o7pvnMwEHOHVL/k/yG
	 RssVApKcNa1o3fNrvQoje7/v/0RuTXlwmQXFzxCSs/7MjQlz3IpeGochyvvqw13Li8
	 h22jlPCdpscvQnNvrr9fCLZyZlIi3i3LHExD/aonUgjicRhspkRHEralrokoa6rifA
	 0Yy7LrF3rfoZg==
From: Aaron Ma <aaron.ma@canonical.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
Date: Thu, 25 Apr 2024 15:20:00 +0800
Message-ID: <20240425072000.22284-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TI upstream the files in ti/tas2781 for linux-firmware.
Make the driver find the correct files.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 include/sound/tas2781.h           | 1 +
 sound/pci/hda/tas2781_hda_i2c.c   | 2 +-
 sound/soc/codecs/tas2781-comlib.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 99ca3e401fd1..72119cc32c0f 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -21,6 +21,7 @@
 /* version number */
 #define TAS2781_DRV_VER			1
 #define SMARTAMP_MODULE_NAME		"tas2781"
+#define TAS2781_FIRMWARE_ROOT		"ti/tas2781/"
 #define TAS2781_GLOBAL_ADDR	0x40
 #define TAS2563_GLOBAL_ADDR	0x48
 #define TASDEVICE_RATES			(SNDRV_PCM_RATE_44100 |\
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 75f7674c66ee..72dc1469655f 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -649,7 +649,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	tasdevice_dsp_remove(tas_priv);
 
 	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
-	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
+	scnprintf(tas_priv->coef_binaryname, 64, "%sTAS2XXX%04X.bin", TAS2781_FIRMWARE_ROOT,
 		codec->core.subsystem_id & 0xffff);
 	ret = tasdevice_dsp_parser(tas_priv);
 	if (ret) {
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 3aa81514dad7..96fe1b855ec9 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -277,7 +277,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	 */
 	mutex_lock(&tas_priv->codec_lock);
 
-	scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
+	scnprintf(tas_priv->rca_binaryname, 64, "%s%sRCA%d.bin", TAS2781_FIRMWARE_ROOT,
 		tas_priv->dev_name, tas_priv->ndev);
 	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
 	tas_priv->codec = codec;
-- 
2.34.1

