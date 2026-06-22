Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C53446BE
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152873; cv=none; b=Yvyjge61/XOSVOODee7xhTrneZP2JQ4/g+x1W3XkEUYpY7t/j8b5ssBOxzUCLzKcvFUsLPBYOgjqDL1lJxG9m0h9fYD+rUwgtMVlOAuEpKzNnvxfs9D3GBLOcqi9G8dq2g9KdpIcCO5OX5wh5Vild3gQBOtKIdssRZZWWXwx4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152873; c=relaxed/simple;
	bh=E1Ef2fFPMW/XvPmQaXSR7EuTCtcjcEafiPPgBl/L1gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9G/Dlpn+oArZ0/08qqWEpzfRMsOss6VwdGjziiy6HQlcUNhpnQc3XgtP4xyZFAY5aPrda5+2/eZNx7OwPHNttiF9YLNHwDStUurHE4XcVcUlRF7DKKVv69dgwHKyVYoN6VGN7xENQ6VES7W336MIhqMcWsFGFfkDooS6c50ZZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUbUnPmb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUbUnPmb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so84358f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782152869; x=1782757669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfByu8gdwDv0BvdWBA40b0KLY7HOorlkxzzRkB0G/VM=;
        b=jUbUnPmbYeTMAM8O6Px5d0lo33E8lrmTc++qzVbwpkF19S2jBOoJex2sobE/W2DUTy
         SJYK1S2Xbh4wgUd2x4Wp5V3FyiBEu/GAUaY917gpl3IUu3VDurtVTm/THicIUuOZuXvz
         r7qmQxwWDljj7tsSwsPlxAE5UEBixFn2RpkX8gVTNsZzd009rCBin8A5b2GY4UOl4Uov
         Qw7LdR9YxMaLkGEQEj0cM39MJsIvuBzqmCtnHlO/Pp4iGo4NY8Xa8EdcXyZ6CztqSiES
         6BiUGXHeZSy3lBi1gqMxB0waoJCQunD9et22g2A8BTPj2GMlwu4exHNoMLVHwsF2YVwP
         H4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782152869; x=1782757669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZfByu8gdwDv0BvdWBA40b0KLY7HOorlkxzzRkB0G/VM=;
        b=geBzoEjr2uyR4zvtQ2NCLja6OKrn8rNujqLIz2Lk31DL8buQeC31KvhBkN6jXBHPIO
         VXNTM/JRhF2Dr0racmGAkMudC89u81J78dcpz3ObrlvzPclW29RCuwRSxDUJF8nHkdME
         QoNHA8FbwKnydXSD+k6V+Ggvn1fyGqJ1JFLBOV83FmWRPbBV053Ttd43SqZEKRiRw2q+
         oi8qc5FhAUpMWWNzpgTIRiM+R8r2HDFrpxd2UocXg/Ho9SvY6y+DYSsr1P0PeUxuaDqG
         NCSkeLO+U93BDAKx0UtN85TjDSVAYJWnYzT2FgdCaoq/clZuLmcXBD1uAtWI7hCMtP9u
         LL1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+fBnCumVK0vk72pgYcZDWK4PPIWZjE7OGzAwFjXFAdiI9lWNkcZsUHF7NKI6fHEqqg1fhHTprT+g3gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1c9Yr4b0EIOOPvo2aBwOmWoQ9fTJWKKVbnVcM7MeeLIZkYTA4
	4JS29tq0YNUFD7wWYC15ANq8/Qa/0bF+KSCOPhocZOIXGnNnWTJsTmvI
X-Gm-Gg: AfdE7cmL1bybTqrkmSTpxF2c0pXkV6K97TmJIHeog9oBj6SzcEFiZDKi+OESgY7Q+Xk
	oZKAeDa5gDYow//8lWL9KUpJDWWK+BV1qhEGuRxtXYOI45Sw9FGHl12A5UDXdDnJtG1HHjt+oIZ
	S4OhKT9v7ez5XFxYYXYkiSauz6NmCL/npUp3pnyV6mynmjiaYS4g61sGq1gnykdKvzbfcUMYPaN
	yqlFgxm2IAQbhXLL+JlbAkBDe/MDaP99rSmBNxWcR6VD7eZXv+0GMOfOoezV1Fqe9zGAdA5tgRO
	m3HWP5WcTJLIQYPK7isILMbg48gJfJR9njenGrCXOd7AEvBVtaFDdOuEcBVg4mXUmCdh0pkZmT5
	z72VBC41PWhxqMxp9EXGE8BuAc628hVPkbD3woveQedjxuAArCTs9GiurkX0nR3hXoJ7wXvyKTB
	HbAU0rLmEgFTEUwiKv6wGN80whbMcF6DWBGLQG6WI/VKdoAS1YbwyfRDQNIwv6sdciqh3oeQrLN
	dv0fVLzzDA55D5aMo6Jp8aFbgJc
X-Received: by 2002:a05:6000:184a:b0:43d:7606:5a47 with SMTP id ffacd0b85a97d-46a7eaeafa0mr958486f8f.2.1782152869112;
        Mon, 22 Jun 2026 11:27:49 -0700 (PDT)
Received: from fedora (89-67-127-240.dynamic.play.pl. [89.67.127.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm27220048f8f.34.2026.06.22.11.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:27:48 -0700 (PDT)
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
Subject: [PATCH v4] ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519
Date: Mon, 22 Jun 2026 20:27:33 +0200
Message-ID: <20260622182733.23947-1-bjuraszewski@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7c3d5b30-a415-48e5-a0e6-8d910424f0fe@sirena.org.uk>
References: <7c3d5b30-a415-48e5-a0e6-8d910424f0fe@sirena.org.uk>
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

On Mon, 22 Jun 2026 12:58:13 +0100, Mark Brown wrote:
> You need to reset fw_dl_task_done for each run through this, _fw_ready()
> will set it unconditionally so if the first attempt to load fails the
> second attempt will see the flag already set and not actually need to
> wait.

v4:
 - tas_fw_load resets fw_dl_task_done before each _fw_ready() to fix wait
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

 sound/soc/codecs/tas2783-sdw.c | 73 +++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f..140cc5264789 100644
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
@@ -1121,28 +1134,15 @@ static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t siz
 			  bus->link_id, unique_id);
 }
 
-static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
+static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
 {
-	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	s32 ret;
 	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
 
-	if (tas_dev->hw_init)
-		return 0;
-
-	tas_dev->fw_dl_task_done = false;
-	tas_dev->fw_dl_success = false;
-
-	ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
-	if (ret) {
-		dev_err(dev, "sw reset failed, err=%d", ret);
-		return ret;
-	}
-	usleep_range(2000, 2200);
-
 	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
 			     sizeof(tas_dev->rca_binaryname));
 
+	tas_dev->fw_dl_task_done = false;
 	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      tas_dev->rca_binaryname, tas_dev->dev,
 				      GFP_KERNEL, tas_dev, tas2783_fw_ready);
@@ -1157,8 +1157,35 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));
 	if (!ret) {
 		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
-		ret = -EAGAIN;
-	} else {
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
+	s32 ret;
+
+	if (tas_dev->hw_init)
+		return 0;
+
+	tas_dev->fw_dl_success = false;
+
+	ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
+	if (ret) {
+		dev_err(dev, "sw reset failed, err=%d", ret);
+		return ret;
+	}
+	usleep_range(2000, 2200);
+
+	tas_dev->fw_use_fallback = false;
+	ret = tas_fw_load(tas_dev, slave);
+	if (!ret && tas_dev->fw_use_fallback)
+		ret = tas_fw_load(tas_dev, slave);
+
+	if (!ret) {
 		if (tas_dev->sa_func_data)
 			ret = sdca_regmap_write_init(dev, tas_dev->regmap,
 						     tas_dev->sa_func_data);
-- 
2.54.0

