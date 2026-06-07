Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC8282F2C
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780824643; cv=none; b=oGe76bKdvmQOpxXMj2Q99awQbsookXi1EAHHwi6xcw+4+9LaRdNMlFnDlNA87ZnbL8y9yvsqCFpkpCgo6VpteezQhSuYR2YOKnESZp96UcScc3uWByBZze+XSDL7+8n14Qs8t6skvCjj1cBMB7R0mpjyEsphI2PvTkN659yPkDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780824643; c=relaxed/simple;
	bh=+mvW7uXSXb+7n9JpAKdJIpv+KlzXW0NXNvUV490/q/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8lMrLnHu/Gt31Tq2GYSo1cH+PRxA5oDMfA8+1dZW1XUaUXewjstm2YTOWJxJtCXcWP6zvJhF0R8FUUD62fD4beK48rwdbGzMR7S5JpE5cLd+6RH57QFCLYmKXp0baHUZ0MSt2VOOYjALal+Wpo4Xb9AHRibjDV50RodvNpymeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwGEi96g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwGEi96g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so23878425e9.1
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780824640; x=1781429440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/KqJm/1uevdryicvlm2SbjfdBXlxEmq9Z6UjHBhip0=;
        b=SwGEi96g9P7fa1NtJtZDo+KqF9SpODeU6flV5qrPVfOBAksd2tp6QoaNxndT5caerF
         mPcxTxo4bnfE6W49YWXpn9aWXxr0k2E1K+WLyS29qZWRWuImIBkfMkHuQV15u/0Oemun
         vs5q01gPKozcAvgLxl+TZK3G99fYZDXtj17lBE8i5fRSxcGBk5bkSCupQwv4/CuptUzo
         1qAnQgJWyi+wEnRD/mMbB7WMMD8aEzypfeGqOiVypHl6qWf3Z+5EFmsUIxIp6K+E8o7Q
         ZU/SetvR9CZZi3YSDv0afnHJgH9umETU4xsHovecBzWTI1Ses0hGLEtM3dsuU7MUbNR8
         wnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780824640; x=1781429440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a/KqJm/1uevdryicvlm2SbjfdBXlxEmq9Z6UjHBhip0=;
        b=aj3SpZREMK+zUkigEYneKMwybPPWdxsTBCLL5PlqhUu/OcRN7CD52Pq7pNT4EUiSci
         FHeHzFr+ZR8Mtn2uz498bvChBR4Zy14fFod2JP+x8jYGaxydVdcidYJctAxIf97faj63
         mZN8w3hIAAglvCph5UbSzueMLqhWEBdfnhUjF6r/nSoEItj7UKpPum4hr2k+XpvrykvB
         ejy/pneIaajyq90ZYvRwaGon4aW/fZeLnciVTP9Qyq1XcPyw64IYvhyruy6/Zu2XoJ58
         ZsUGF8nxjai76r2LxXsFunzFEXsLvkgmRnJ+PRlntkRTb46cc7fXX5yxl8VkzX3lBRfC
         DaPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ENZKJRLTshs8hrLUUjOXTFWXtA9vajitqpGlkh8YHAaLrcllcdi6nCR8WGO1LPA5VqCWb3fHLTVUT/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaZmPvO6tampMbXBzbrPuMM0CIqB2+G0hMhnnA654/7rVyTiV
	2yAi+/WDqnfG2HoLJXxg3K825vir2BI3cytspezEDTLsqq0Rf+HyvPFd
X-Gm-Gg: Acq92OH4HNCDzj6c9ziRW5p9fXYto5C8lSKKU/igABaha65eLL2qCd5raRBqm9M1hto
	xn+xh+ueS7uiUtn6nr2ObqWipRB5aB09T0BkZ5jJYB6cCCGyMZngR6dgFta+QHe8AIikPHxwHjX
	9u2wG6VNC0uAQRQ4CTyxL589JzvseHCQ2ufq+I7G6iWLp/6rqinIj2bydCekZNffAyiDF10M3q2
	SMJ46EYAJBkvoU6YmdJnF1upMJ/JY5e72jzsMoKaLxPlrMbBpXD45AiD2Y6LMTNcyn56MaHgb1X
	H3Upn65GMDLlAJX3lQmDK+kSdrfl6U+cQhKE3fobSkOblf0+5+1R8BEvx/xG0Ug371v5TCVD2+J
	RlKVBwMjZClOefGLfCKxeD2tGA3GHIphCSpx70/gJ9RD0MSpNeTMIKkZLostyrCztJlAiYCePOg
	FaRmcrK6KIS9grNOZdj2aNolYrm9GkOJg0pAX5aZ1gvSvMQeuEmIp4KVQ8dO5vbKWt6UADkkQS0
	KXwSRX27fSaSfF2+dSnfcIngZCvv8iK/7n44NLvMmqVVhaheA==
X-Received: by 2002:a05:600c:8712:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-490c25f17dfmr191462155e9.17.1780824639851;
        Sun, 07 Jun 2026 02:30:39 -0700 (PDT)
Received: from fedora (89-67-127-240.dynamic.play.pl. [89.67.127.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d6c65sm287509315e9.12.2026.06.07.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:30:39 -0700 (PDT)
From: Bartosz Juraszewski <bjuraszewski@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Juraszewski <bjuraszewski@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519
Date: Sun,  7 Jun 2026 11:30:23 +0200
Message-ID: <20260607093023.42070-1-bjuraszewski@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <15efa76a-aab8-4a21-ac91-ed6698cb958a@sirena.org.uk>
References: <15efa76a-aab8-4a21-ac91-ed6698cb958a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In linux-firmware commit from 2026-05-19 `2f90f4fe5c67f51a8410907a...`
`ASoC: tas2783: Add Firmware files for tas2783A projects` by Baojun Xu
138 new firmware files for tas2783 were added, none of which are loaded
by the kernel. Kernel expects files to be named with the following
convention: "%04X-%1X-%1X.bin". However the added firmware files follow
"-0x%1X.bin" naming instead with `0x` hex prefix, which fails to load
resulting in following dmesg log:

  slave-tas2783 sdw:0:1:0102:0000:01:8: Direct firmware load for 1714-1-8.bin failed with error -2
  slave-tas2783 sdw:0:1:0102:0000:01:8: Failed to read fw binary 1714-1-8.bin
  slave-tas2783 sdw:0:1:0102:0000:01:b: Direct firmware load for 1714-1-B.bin failed with error -2
  slave-tas2783 sdw:0:1:0102:0000:01:b: Failed to read fw binary 1714-1-B.bin
  slave-tas2783 sdw:0:1:0102:0000:01:8: error playback without fw download
  slave-tas2783 sdw:0:1:0102:0000:01:8: ASoC error (-22): at snd_soc_dai_hw_params() on tas2783-codec

This same commit removes all 22 symlinks from WHENCE, that used naming
without the '0x' prefix to only 6 prevoiusly existing .bin files.

This patch adds `0x` prefix explicitly to the generated firmware name
allowing file to successfully load. In case prefixed firmware is missing
due to out of date linux-firmware, we set the fallback flag and attempt
to load firmware again based on the old file names.

This prefix change results in functioning firmware loading on ASUS
ProArt PX13 HN7306EAC, which uses 1714-1-0x8.bin and 1714-1-0xB.bin
firmware files.

Tested on top of 7.1.0-rc6, but no changes exist in newest linux-next.

Signed-off-by: Bartosz Juraszewski <bjuraszewski@gmail.com>
---
Hi Mark,

> This will only use the new name, meaning that an existing working
> install will be broken when upgrading the kernel unless linux-firmware
> is also updated.  We should try both names, assuming the change in name
> stays, so that existing installs continue to work.

You're right, I've added a fallback to try old name if new one fails.

v2:
 - new fw_using_fallback device flag; set when new format fw not present
 - if !fw_using_fallback and load fails, set flag and try reloading
 - when fw_using_fallback - generate fw name with old format string

 sound/soc/codecs/tas2783-sdw.c | 36 ++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 90008d2d06e2..8c64af82b094 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -100,6 +100,8 @@ struct tas2783_prv {
 	wait_queue_head_t fw_wait;
 	bool fw_dl_task_done;
 	bool fw_dl_success;
+	/* use fallback fw name */
+	bool fw_using_fallback;
 };
 
 static const struct reg_default tas2783_reg_default[] = {
@@ -725,6 +727,8 @@ static s32 tas_fw_get_next_file(const u8 *data, struct tas_fw_file *file)
 	return file->length + sizeof(u32) * 5;
 }
 
+static s32 tas_io_init(struct device *dev, struct sdw_slave *slave);
+
 static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 {
 	struct tas2783_prv *tas_dev =
@@ -732,6 +736,7 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 	const u8 *buf = NULL;
 	s32  img_sz, ret = 0, cur_file = 0;
 	s32 offset = 0;
+	bool try_load_fallback = false;
 
 	struct tas_fw_hdr *hdr __free(kfree) = kzalloc_obj(*hdr);
 	struct tas_fw_file *file __free(kfree) = kzalloc_obj(*file);
@@ -740,11 +745,21 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
+	/* firmware binary not found*/
 	if (!fmw || !fmw->data) {
-		/* firmware binary not found*/
-		dev_err(tas_dev->dev,
-			"Failed to read fw binary %s\n",
-			tas_dev->rca_binaryname);
+		if (!tas_dev->fw_using_fallback) {
+			tas_dev->fw_using_fallback = true;
+			try_load_fallback = true;
+
+			dev_info(tas_dev->dev,
+				"Failed to read preferred fw binary: %s\n",
+				tas_dev->rca_binaryname);
+		} else {
+			dev_err(tas_dev->dev,
+				"Failed to read fallback fw binary %s\n",
+				tas_dev->rca_binaryname);
+		}
+
 		ret = -EINVAL;
 		goto out;
 	}
@@ -800,6 +815,11 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 	wake_up(&tas_dev->fw_wait);
 	if (fmw)
 		release_firmware(fmw);
+
+	if (try_load_fallback) {
+		dev_info(tas_dev->dev, "Attempting fallback fw load\n");
+		tas_io_init(tas_dev->dev, tas_dev->sdw_peripheral);
+	}
 }
 
 static inline s32 tas_clear_latch(struct tas2783_prv *priv)
@@ -1115,13 +1135,16 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 	bool pci_found = false;
 #if IS_ENABLED(CONFIG_PCI)
 	struct device *dev = &slave->dev;
+	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct pci_dev *pci = NULL;
+	const char *fw_uid_prefix = tas_dev->fw_using_fallback ? "" : "0x";
 
 	for (; dev; dev = dev->parent) {
 		if (dev->bus == &pci_bus_type) {
 			pci = to_pci_dev(dev);
-			scnprintf(name, size, "%04X-%1X-%1X.bin",
-				  pci->subsystem_device, bus->link_id, unique_id);
+			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
+				  pci->subsystem_device, bus->link_id,
+				  fw_uid_prefix, unique_id);
 			pci_found = true;
 			break;
 		}
@@ -1326,6 +1349,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	mutex_init(&tas_dev->calib_lock);
 	mutex_init(&tas_dev->pde_lock);
 
+	tas_dev->fw_using_fallback = false;
 	init_waitqueue_head(&tas_dev->fw_wait);
 	dev_set_drvdata(dev, tas_dev);
 	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev,
-- 
2.54.0

