Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187394;
	b=GnETG1hd4eG0CogadWRYUQva9IbuC92I9uhuqLcghwBhf2w/GD6wX2pROXk7bV8TCEIv
	 I54Li/n+QmXq846o2QbSX+UE7YGtdHCdYQAsE75uSVFfjJhKv+ZrCLjj99tV2oSr3XNut
	 QX/2LM8u9Cp9dccOMGjxcHGYwJU+BG8jfDdkFq0fv4gf2ck3Z6FTKwox9+UAvlrq4jShr
	 JZ+ZmF2zH2HR6AsaxE6VPNmLCVXeJtfJfOsNJRrWxDdhhyXxZGrohkcXJ5tn9120F4K3u
	 v7QtuBpXDMA8fegpbd2GEd762ucArPfxQi0iILq7A6Y+WUh1Pe+g8wJuxXZ6FayjB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187394;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tTbM+rzPEuII6acF+LPzuhRONPlEgHHHD5r3MI2hii4=;
	b=2bmTn2mIeq39ie3Qoh/ZgoAQ1yNor+/FxWmdYnezxaKhWZvmJGxWPvEDF54IZIpAe79H
	 2/i2DaoWLmHBsIdlfF2mEiBLTxLJRU/JhZxd0iKNl/KVj28E9kp6IXj1UI/0fA27ZlPkB
	 4UC2Kf1DB77AOTjDL3mBOsiyHJNj/u2PlEpFI66jIhFxDzIS+fvArUe3blCE7aDBGDvOC
	 S0t+Mr44GLXvPRG8wVE1npaRg2135Moy94MuTzTAUki3u0ITj6My08xWPJUU+CnhvOGqu
	 1WGLFA1VL+POOtxSixnruG8IYEUSTw17oM40/ZkY7LCSYN/kX16Ogoz2A1rH9VNXO7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yw+iXLnw;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A954606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A954606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yw+iXLnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187394; x=1826723394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AakqgHMFbxgSNvU1jGnNdEv2Hr1KuLKyMTH40xLS95Q=;
  b=Yw+iXLnw13dTKli6oYOVcAO6UKa4BhuERW11NxuYTmvI+/4CCFnwjeIk
   QHB65ubXrDup8M2XfVYCWOFwLrrDD8L2mORIpUr3RpvDhgtT+7VA2pqPC
   CKfoGJetIsH8HNGoS6ooBE4pW6aEftTzy4TPEbakyLd2QXefQbnPWc4a8
   G9HpTlSdPLvOtmInw1au2EwXn9vRUxj7l0nEYXnvtEg7DlP3U+kRmwJUx
   al/y4QVKiNyN/dm5VQhrFyYxyHoDS4ydi4vraBSDoeyA4TvV3ZIioOt1Q
   dHAme0elec/8eUm5k8dApM2nZi+L4/noJkNjZsIfbJdcP5KWNRTZH5Zml
   Q==;
X-CSE-ConnectionGUID: ed2dfEiqSB+Xrsgv2gwGTg==
X-CSE-MsgGUID: IrHmFetjTPC+udKAToxJ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3912158"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3912158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:09:54 -0800
X-CSE-ConnectionGUID: M/lFBPAMRKWGIO8ahonWBw==
X-CSE-MsgGUID: zKGjVez3RhmNj94M4ym3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11072665"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:09:52 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	kai.vehmanen@linux.intel.com
Subject: [PATCH v2 2/2] ALSA: hda: intel: Remove unused free_on_error from azx_probe_continue()
Date: Fri, 20 Nov 2026 17:09:37 +0200
Message-ID: <20261120150937.2187228-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
References: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
work") changed azx_probe_work() to pass false for the free_on_error
argument of azx_probe_continue(), and left freeing the card to
azx_remove(). That was the only caller that passed true, so the
argument is now always false and the code freeing the card on error is
dead.

Remove the argument and the dead code.

No functional change.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/controllers/intel.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1f754f04eea8..acca8bb9ef0b 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1184,7 +1184,7 @@ static const struct dev_pm_ops azx_pm = {
 };
 
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error);
+static int azx_probe_continue(struct azx *chip);
 
 #ifdef SUPPORT_VGA_SWITCHEROO
 static struct pci_dev *get_bound_vga(struct pci_dev *pci);
@@ -1211,7 +1211,7 @@ static void azx_vs_set_state(struct pci_dev *pci,
 		if (!disabled) {
 			dev_info(chip->card->dev,
 				 "Start delayed initialization\n");
-			if (azx_probe_continue(chip, false) < 0) {
+			if (azx_probe_continue(chip) < 0) {
 				hda->init_failed = 1;
 				dev_err(chip->card->dev, "initialization error\n");
 			}
@@ -1739,7 +1739,7 @@ static void azx_probe_work(struct work_struct *work)
 {
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
 
-	if (azx_probe_continue(&hda->chip, false) < 0) {
+	if (azx_probe_continue(&hda->chip) < 0) {
 		hda->init_failed = 1;
 		complete_all(&hda->probe_wait);
 		snd_card_disconnect(hda->chip.card);
@@ -2362,7 +2362,7 @@ static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_TERA] = 1,
 };
 
-static int azx_probe_continue(struct azx *chip, bool free_on_error)
+static int azx_probe_continue(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hdac_bus *bus = azx_bus(chip);
@@ -2458,10 +2458,6 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 	if (err < 0) {
 		if (hda->vga_switcheroo_registered)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
-		if (free_on_error) {
-			pci_set_drvdata(pci, NULL);
-			snd_card_free(chip->card);
-		}
 		return err;
 	}
 
-- 
2.43.0

