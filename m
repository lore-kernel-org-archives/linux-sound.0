Received: from mailrelay-egress15.pub.mailoutpod3-cph3.one.com (mailrelay-egress15.pub.mailoutpod3-cph3.one.com [46.30.212.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD73793C6
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166092; cv=none; b=mPC/MGZnWX0TDNlLSzPzxIFmqFQikZketzsU5Th6XbUk8XtScv1DoGx+IbpZ4pLZ5pXbGjVPU/WQTAdqoCPf1OOJ3V0b3rz9YpHg//HciYK+UrM25KsYq8QT4/DD2rofGYwOHyUhoYyPC2thnOKkQSDo8eamGegx3720oQZ0h7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166092; c=relaxed/simple;
	bh=1rN9j6vSOOTrHY3xSJ2XsOaUPPmFuq/xSyjyRRHGFpk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bizu8Z8LQomdtGUhaDWdrstTaWwVwm0iNnp25rdTVAHWydToIfTK0bzBF76VnTlE8bDb4EGLoZRZ2Uid/jimkITiIyY9vMdfpVA3snFQKKsQ5WywRoILFAjZc9mP4/V9+2kbPL8wSdhu4+lKAWXiZg8EtE1rP6iAm4Wn61OrujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com; spf=none smtp.mailfrom=androscientia.com; dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=DKJ9YL01; dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b=+uMtoyjO; arc=none smtp.client-ip=46.30.212.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=androscientia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=androscientia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="DKJ9YL01";
	dkim=permerror (0-bit key) header.d=androscientia.com header.i=@androscientia.com header.b="+uMtoyjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1781166019; x=1781770819;
	d=androscientia.com; s=rsa1;
	h=content-transfer-encoding:content-type:subject:from:cc:to:mime-version:date:
	 message-id:from;
	bh=uWkJIv5C83QzFS1Kj9xweXbIG7+kbcIvkVe6gExSON4=;
	b=DKJ9YL01Lj0xlYLoW2cxa/F9Q/nBRdXdH5DiZ97ewOLwXJnkZg7bYpm6SdYXMW2H9llxR7mM1hnvZ
	 l7AAXNYzzKj4/9saOfciWYuPN9RcA4slRudYNq0uapNU5BIZCkMyGOLXDmMoT6mRoR8pOS9nLSu3xp
	 ENa7t9vG2dryDe10/h/+XJV0nRy8bpWK/OHtc0L/Rt7sLb2MIe9qY8IeMyzveRAwswmJYUuMbS8zmh
	 Pvf5S9pxv6wGw+zXz303jGUM8XuyprvDpKEBVnTDJ3EnsA+BggGg2fzp2d0VMm9Cxfh/e66q2/vQ7O
	 Ty1eoVoYNUd0D78abka+/K8LYH0XNKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1781166019; x=1781770819;
	d=androscientia.com; s=ed1;
	h=content-transfer-encoding:content-type:subject:from:cc:to:mime-version:date:
	 message-id:from;
	bh=uWkJIv5C83QzFS1Kj9xweXbIG7+kbcIvkVe6gExSON4=;
	b=+uMtoyjO3tG4uSLACAvuJ42VQytmDo2Mo1NjRgzz+O3tzFSx+jt0A95qxnDW5z0YJPoXUvxxEAQh1
	 NEwUk02Ag==
X-HalOne-ID: 617bcd40-656e-11f1-81fb-f7376af24660
Received: from [IPV6:2001:2044:21:2a00:f419:cb74:b22e:fad4] (unknown [2001:2044:21:2a00:f419:cb74:b22e:fad4])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 617bcd40-656e-11f1-81fb-f7376af24660;
	Thu, 11 Jun 2026 08:20:19 +0000 (UTC)
Message-ID: <f39f2aa8-33f3-4cb6-b2ed-56254ad63f3c@androscientia.com>
Date: Thu, 11 Jun 2026 10:20:18 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, Mark Brown <broonie@kernel.org>
Cc: Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Andreas Axelsson <andreas.axelsson@androscientia.com>
Subject: [PATCH] ASoC: tas2781: Do not report cross-instance writes as errors
 on SPI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On SPI-based TAS2781 HDA systems (e.g. HP laptops with two amplifiers
on separate SPI chip selects), each tasdevice_priv instance services a
single device. The SPI bus glue intentionally returns -EXDEV for
register access addressed to a channel the instance does not own, and
logs it at debug level as "Not error" (see
tasdevice_spi_change_chn_book()).

The shared firmware library does not handle this convention: firmware
blocks explicitly addressed to another device (dev_idx != 0) and
calibration data for other channels are still processed, and the
resulting -EXDEV returns are reported via dev_err and counted as block
errors, triggering pointless retries. This floods the log on every
boot, resume and profile switch:

   tas2781-hda spi1-TXNW2781:00-tas2781-hda.0: tasdevice_process_block: 
bulk_write error = -18
   tas2781-hda spi1-TXNW2781:00-tas2781-hda.0: process_block: single 
write error
   tas2781-hda spi1-TXNW2781:00-tas2781-hda.0: chn 1 r0_reg bulk_wr err 
= -18

Treat -EXDEV as "block not for this instance": skip it silently in
tasdevice_process_block(), keeping the sub-block parsing intact so
the data offset stays correct, and skip foreign channels entirely in
tasdev_load_calibrated_data().

Tested on an HP laptop (subsystem 103C:8DE8) with two TAS2781 amps on
SPI: the error spam is gone, firmware and calibration still load, and
audio is unaffected.

The root cause analysis and fix were developed by Claude (Anthropic AI
assistant); tested by me on the hardware above.

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and 
leverage SND_SOC_TAS2781_FMWLIB")
Signed-off-by: Andreas Axelsson <andreas.axelsson@androscientia.com>
---
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -896,6 +896,14 @@
          }
      }

+    /*
+     * On SPI each instance services a single device, but explicitly
+     * addressed blocks (idx != 0) may target any device. Writes for
+     * a channel this instance does not own return -EXDEV from the
+     * bus glue ("Not error", see tasdevice_spi_change_chn_book);
+     * they are expected and must not be reported as failures. The
+     * block is still parsed so the sub-block offset stays correct.
+     */
      for (; chn < chnend; chn++) {
          if (tas_priv->tasdevice[chn].is_loading == false)
              continue;
@@ -921,7 +929,7 @@
                          data[subblk_offset + 1],
                          data[subblk_offset + 2]),
                      data[subblk_offset + 3]);
-                if (rc < 0) {
+                if (rc < 0 && rc != -EXDEV) {
                      is_err = true;
                      dev_err(tas_priv->dev,
                      "process_block: single write error\n");
@@ -953,7 +961,7 @@
                  data[subblk_offset + 1],
                  data[subblk_offset + 2]),
                  &(data[subblk_offset + 4]), len);
-            if (rc < 0) {
+            if (rc < 0 && rc != -EXDEV) {
                  is_err = true;
                  dev_err(tas_priv->dev,
                      "%s: bulk_write error = %d\n",
@@ -991,7 +999,7 @@
                  data[subblk_offset + 4]),
                  data[subblk_offset + 1],
                  data[subblk_offset + 5]);
-            if (rc < 0) {
+            if (rc < 0 && rc != -EXDEV) {
                  is_err = true;
                  dev_err(tas_priv->dev,
                      "%s: update_bits error = %d\n",
@@ -2552,6 +2560,10 @@
      if (!data || !cali_data->total_sz)
          return;

+    /* On SPI each instance owns a single device; skip the others. */
+    if (priv->isspi && i != priv->index)
+        return;
+
      if (data[k] != i) {
          dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
              __func__, i);

