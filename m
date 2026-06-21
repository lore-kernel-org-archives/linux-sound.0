Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9849A36606B
	for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050485; cv=none; b=CkbJJpkTxVfaDzzKjERJ1R4nTvKWW3OFQj3TmpM9p+HK46nQ/4Nvo64H1/wsCDfbQn3LxOGJeVxTF4RPRMXKPsijrxXeVMhZzNcCGmSkqcxuUrNk/VqX81GWPeLkiqXNsrikDcPj4+z2yYBEzzybjgpBGH3gfft5N1+PB7W2tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050485; c=relaxed/simple;
	bh=xlZirQ4QOP+p5wkpPE0egRjJTMCI6kAov4Fn+Uffh7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb89JKnYjDTrs8PhEfBUF9j4BZCEghnqOkkQe4a7wmc+vfY3b1veOQjf6Yf2OkYidxpKeCzpKCIXuZsagjsBz/O0aGX0F9lGqXD+aA8y9/mf0l676iYRmJn7CcMQtQlXTN4sezVuy/gN/4WmbjBEoHQtVSUED61iVOi9VUfEetM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPheB/bV; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPheB/bV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39677aed4d3so29893811fa.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Jun 2026 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782050481; x=1782655281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NA9ii+SGdlbSDO988cDFeqlR6CO7fgWdFpNu3PHV/i0=;
        b=BPheB/bVGffsNCRQqbAHZkoZxBhvCf1/ibWJuOp/yOFJg0Tx1z3I1iXUt5VMze2RcM
         mfKV3gWaDxZIZGrRS93S8KggW7C2W4xpmSEelziE2WDloG+DRDVtnfER9HFtZ3TEhhL+
         BAHEYs0lv48EHFJVDgt9r+OQ4JYZQ2YMesITv6m7KCXIIq2Oc8thldQQdZ5Hp5TFmt+A
         PnARBGkyE2BEyhQlfQlOPlkSFZcwQX7MvcJGT86ycs1QutF5K0Gk6TO7wnVMmygBdvxO
         Vd9++sbTJ03cU6RcGV84qRHvH2Q8Sqgv+r5fW2FgiecTXsm6+cReqkhDESMfETkX0F6y
         dPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782050481; x=1782655281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NA9ii+SGdlbSDO988cDFeqlR6CO7fgWdFpNu3PHV/i0=;
        b=mk9MN+Kup2+3HzukTXoTbTPXwzJsa6xb1Io2SySopY4Hm3ATm63Tpfdq8BFBpw2vd1
         HYjU4sSNu5qvLTmfrOa38E+nwk32BlpUTi/aqod0aCDTX6OR5aCniezPeYxbkDrb5ZBq
         YrIHOX9sjCQKxtwxO2Uxb3+ZHCry5u99s+GsPxUwuhTE+ZKKoSIY4T2Kc9jcmXSthr58
         t4H5orrz5Qx6SGpv6/9YFvCOJAxbl5up4xOrURdUlt1UrizBgSE4Fd1ixmqZnoYwH6g8
         97Yd8irvUiRyE3owAr+neMI5CvprpnwGxUMEmv7BJ5e5NSRSPDbtBCE6JmH/1ALcaCNI
         lpEA==
X-Forwarded-Encrypted: i=1; AFNElJ/AG5TVnV64EeMPlGvKqTdw7IYes703e7Zjna3U8BiafJrR4qu9gzPTcZjL2lW4YnrbkkZGvc0VGNd9MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOuvaXlXjO0zfF2c+cv2syLwXuQlnLrEA/FcOFbj+jF+2szHUw
	DKM7TitTQ+7d0ARVkwgOmyY9M89wDDytz9YmDlTvBkMs5K4oI8aQ4X9A
X-Gm-Gg: AfdE7clcZsNHWFc2uz4wLAer7WBhzA6NbhKFVdI9Ut/PF7GFpgNR94ZiI5dJtlihil6
	bzgUZVlhNkK5VB7kD/nlptrxU3Boh+QgkvEzjd/jAb8vucRqeKPvL/DiHbGs+4KPURegNECdYwS
	HZLwnxI4wCiicQtMjE7lHJRHCPodOcfE/WmvCHTWvR6q5dGExZTOAKTp3zHQLuDP+c4kwrSp5RN
	Ty6cLMdhjofVo8CXKKrLatFOZ26AdHmhwnEC7gTXOC8qVw52RKCgEV1eJnjVZpgHQUdIEfOPdEE
	YkeP8jdncF5s1dxZOZaa0xOmJBmB1sQwI/os1H91jPhbe0hiv1mbuhjANQpYNKg6ihZzRhGPCjV
	6SYZUSTXH+SjoRn+e9NpmcrOYHL0YhRTnnntbZC6eSgaKi/MR1cAHo9BgNrtyjYuyNouoA29Hv5
	pOkbzKyW8h5L4rlGX6uk8Kh9nnkxjUcwUxd9GvqeEjRvMLCIxCVqPwvxQf4i9xEW/gRVL63YY9F
	MR9Zl6PZ0GN7i/0v7ZcTXU1uPOb
X-Received: by 2002:a05:651c:2104:b0:38a:27b1:4e60 with SMTP id 38308e7fff4ca-3998e552861mr23014611fa.27.1782050480665;
        Sun, 21 Jun 2026 07:01:20 -0700 (PDT)
Received: from fedora (89-67-127-240.dynamic.play.pl. [89.67.127.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999ae80c49sm11674171fa.0.2026.06.21.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:01:19 -0700 (PDT)
From: Bartosz Juraszewski <bjuraszewski@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Juraszewski <bjuraszewski@gmail.com>
Subject: [PATCH v3] ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519
Date: Sun, 21 Jun 2026 16:00:01 +0200
Message-ID: <20260621140001.63829-1-bjuraszewski@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <d2558567-67b9-4fca-b170-c6ece9f8cf23@sirena.org.uk>
References: <d2558567-67b9-4fca-b170-c6ece9f8cf23@sirena.org.uk>
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

Tested on top of 7.1 and next-20260619 with SND_SOC_AMD_ACP7X set to no.

Signed-off-by: Bartosz Juraszewski <bjuraszewski@gmail.com>
---
Hi Mark,

> > @@ -800,6 +815,11 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
> >  	wake_up(&tas_dev->fw_wait);
> >  	if (fmw)
> >  		release_firmware(fmw);
> > +
> > +	if (try_load_fallback) {
> > +		dev_info(tas_dev->dev, "Attempting fallback fw load\n");
> > +		tas_io_init(tas_dev->dev, tas_dev->sdw_peripheral);
> > +	}
> >  }
> >  
> 
> This will unconditionally wake fw_wait even if we've gone for the
> fallback, meaning that the rest of the driver will think the firmware
> is ready when it isn't.

Changed the way we load fallback fw to prevent the race condition of
driver init proceeding before all loads are finished.

v3:
 - tas2783_fw_ready callback no longer calls tas_io_init, only sets flag
 - tas_io_init orchestrates both loads using fw_wait and flag check
 - tas_io_init proceeds with init only after all loads finish
 - new tas_fw_load helper for repeating fw loading and waiting logic
 - renamed fw_using_fallback to fw_use_fallback
 - fw_use_fallback resets on every init now to try both bins again
v2:
 - new fw_using_fallback device flag; set when new format fw not present
 - if !fw_using_fallback and load fails, set flag and try reloading
 - when fw_using_fallback - generate fw name with old format string

 sound/soc/codecs/tas2783-sdw.c | 75 +++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f..bbaeac5837c7 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -100,6 +100,8 @@ struct tas2783_prv {
 	wait_queue_head_t fw_wait;
 	bool fw_dl_task_done;
 	bool fw_dl_success;
+	/* use fallback fw name */
+	bool fw_use_fallback;
 };
 
 static const struct reg_default tas2783_reg_default[] = {
@@ -740,11 +742,19 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
+	/* firmware binary not found*/
 	if (!fmw || !fmw->data) {
-		/* firmware binary not found*/
-		dev_err(tas_dev->dev,
-			"Failed to read fw binary %s\n",
-			tas_dev->rca_binaryname);
+		if (!tas_dev->fw_use_fallback) {
+			tas_dev->fw_use_fallback = true;
+			dev_info(tas_dev->dev,
+				"Failed to read preferred fw binary: %s, attempting fallback binary load\n",
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
@@ -1103,13 +1113,16 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 	bool pci_found = false;
 #if IS_ENABLED(CONFIG_PCI)
 	struct device *dev = &slave->dev;
+	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct pci_dev *pci = NULL;
+	const char *fw_uid_prefix = tas_dev->fw_use_fallback ? "" : "0x";
 
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
@@ -1121,17 +1134,45 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 			  bus->link_id, unique_id);
 }
 
+static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
+{
+	s32 ret;
+	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
+
+	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
+			     sizeof(tas_dev->rca_binaryname));
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+				      tas_dev->rca_binaryname, tas_dev->dev,
+				      GFP_KERNEL, tas_dev, tas2783_fw_ready);
+	if (ret) {
+		dev_err(tas_dev->dev,
+			"firmware request failed for uid=%d, ret=%d\n",
+			unique_id, ret);
+		return ret;
+	}
+
+	ret = wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done,
+				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));
+	if (!ret) {
+		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
 static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	s32 ret;
-	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
 
 	if (tas_dev->hw_init)
 		return 0;
 
 	tas_dev->fw_dl_task_done = false;
 	tas_dev->fw_dl_success = false;
+	tas_dev->fw_use_fallback = false;
 
 	ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
 	if (ret) {
@@ -1140,25 +1181,11 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 	usleep_range(2000, 2200);
 
-	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
-			     sizeof(tas_dev->rca_binaryname));
+	ret = tas_fw_load(tas_dev, slave);
+	if (!ret && tas_dev->fw_use_fallback)
+		ret = tas_fw_load(tas_dev, slave);
 
-	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
-				      tas_dev->rca_binaryname, tas_dev->dev,
-				      GFP_KERNEL, tas_dev, tas2783_fw_ready);
-	if (ret) {
-		dev_err(tas_dev->dev,
-			"firmware request failed for uid=%d, ret=%d\n",
-			unique_id, ret);
-		return ret;
-	}
-
-	ret = wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done,
-				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));
 	if (!ret) {
-		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
-		ret = -EAGAIN;
-	} else {
 		if (tas_dev->sa_func_data)
 			ret = sdca_regmap_write_init(dev, tas_dev->regmap,
 						     tas_dev->sa_func_data);
-- 
2.54.0

