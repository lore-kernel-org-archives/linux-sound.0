Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E08F25DAEF
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195888; cv=none; b=m+3Bcb5WSUuNmPqRCFwuKhejO+wwnKL3OkQnKWvL58ZQP1DPMXioKimoqMDjfoZE5gJy0RjKxzMXC8jSxuh23usAOkPr0aGn6cx1KAY7XVPx30rlvnJ8jnmT/HxFL9xjT5x9B7OKcpU7ran40KsGO12Ot5KT6J9FLb4YuEi5q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195888; c=relaxed/simple;
	bh=05EWgN9JvZt5KZ6BNyQfi9CE29UQOn5kp7B83WEMT4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nyX5W5h5K4Vd5AAEceYvxSMboInLXD//+gNnxeUfn7zyY6KCrJWLDQcxokvUFuI/baImn7dED3HekGzJ46XHZHk3aJl6JCY/oR1dg6z5y5gUqhG885cLHFcqkjoyDNsE0gw6K9MkrkntwYblSHT8hUeSxD3g5bTDHsfZxYkXzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp6VF3JP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp6VF3JP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195887; x=1775731887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=05EWgN9JvZt5KZ6BNyQfi9CE29UQOn5kp7B83WEMT4w=;
  b=hp6VF3JPjZnh+FiekgXKh6vWC8YJYCmYISROorwNwmeSB+lVFxgkINen
   KMxoDDX1p+f/BDvLvSc9sm/ICWPKR4wBdQnVgTSc785h6bB+e9PQPkXs+
   r0PyopLbKr4YoPFVDdpdYr4BQkphqIuPlcHEnwoGcm8u76AIeBnmm3tHh
   o9g57m81SB+Vi/nL4xkzdAFJ/TPZeQCVxt7fKojhJLjhnoH4Soum1BCyb
   yZLadKtiXiYJBnQUNuvKYG3BQWXKyZFgYw38sF6HJ2QO2Uuf57SFYv8NG
   KfKMiZMfxwF1LakLEKCZjylE5eRa3j8bnH8f0cBGjo0MBbvWVZAPNLJbb
   A==;
X-CSE-ConnectionGUID: WoNgVsBqSXWwHFsp76gI+A==
X-CSE-MsgGUID: RlEyAJVUQgqsxZIU6qoSig==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380115"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380115"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:27 -0700
X-CSE-ConnectionGUID: jsppskMcRXSjTrYYzGFDBQ==
X-CSE-MsgGUID: qUHT+kJ9RFa4Qonu0aoG9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426252"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 12/15] ALSA: usb: Export card-naming procedure
Date: Wed,  9 Apr 2025 13:07:27 +0200
Message-Id: <20250409110731.3752332-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB sound card features customized naming procedure. For ALSA and ASoC
drivers to share UseCaseManagement (UCM) configuration files, it is best
if the naming is aligned between the two.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/usb.h |  1 +
 sound/usb/card.c    | 78 ++++++++++++++++++++++-----------------------
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/include/sound/usb.h b/include/sound/usb.h
index fbcfa2b985f7..b20badfda6a6 100644
--- a/include/sound/usb.h
+++ b/include/sound/usb.h
@@ -91,6 +91,7 @@ struct snd_usb_audio {
 };
 
 void snd_usb_release_resources(struct snd_usb_audio *chip);
+void snd_usb_make_card_names(struct snd_usb_audio *chip, char *shortname, char *longname);
 int snd_usb_bind_card(struct snd_usb_audio *chip, struct snd_card *card,
 		      struct usb_driver *driver);
 int snd_usb_bind_pcm(struct list_head *stream_entry, struct snd_pcm *pcm);
diff --git a/sound/usb/card.c b/sound/usb/card.c
index a4bd8ba6a26c..20a77e63a7eb 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -525,103 +525,102 @@ lookup_device_name(u32 id)
 	return NULL;
 }
 
-static void usb_audio_make_shortname(struct usb_device *dev,
-				     struct snd_usb_audio *chip,
-				     const struct snd_usb_audio_quirk *quirk)
+static void snd_usb_make_card_shortname(struct snd_usb_audio *chip, char *shortname)
 {
-	struct snd_card *card = chip->card;
 	const struct usb_audio_device_name *preset;
+	struct usb_device *udev = chip->dev;
 	const char *s = NULL;
 
 	preset = lookup_device_name(chip->usb_id);
 	if (preset && preset->product_name)
 		s = preset->product_name;
-	else if (quirk && quirk->product_name)
-		s = quirk->product_name;
+	else if (chip->quirk && chip->quirk->product_name)
+		s = chip->quirk->product_name;
 	if (s && *s) {
-		strscpy(card->shortname, s, sizeof(card->shortname));
+		strscpy(shortname, s, sizeof_field(struct snd_card, shortname));
 		return;
 	}
 
 	/* retrieve the device string as shortname */
-	if (!dev->descriptor.iProduct ||
-	    usb_string(dev, dev->descriptor.iProduct,
-		       card->shortname, sizeof(card->shortname)) <= 0) {
+	if (!udev->descriptor.iProduct ||
+	    usb_string(udev, udev->descriptor.iProduct,
+		       shortname, sizeof_field(struct snd_card, shortname)) <= 0) {
 		/* no name available from anywhere, so use ID */
-		sprintf(card->shortname, "USB Device %#04x:%#04x",
+		sprintf(shortname, "USB Device %#04x:%#04x",
 			USB_ID_VENDOR(chip->usb_id),
 			USB_ID_PRODUCT(chip->usb_id));
 	}
 
-	strim(card->shortname);
+	strim(shortname);
 }
 
-static void usb_audio_make_longname(struct usb_device *dev,
-				    struct snd_usb_audio *chip,
-				    const struct snd_usb_audio_quirk *quirk)
+void snd_usb_make_card_names(struct snd_usb_audio *chip, char *shortname, char *longname)
 {
-	struct snd_card *card = chip->card;
 	const struct usb_audio_device_name *preset;
+	struct usb_device *udev = chip->dev;
 	const char *s = NULL;
 	int len;
 
+	snd_usb_make_card_shortname(chip, shortname);
+
 	preset = lookup_device_name(chip->usb_id);
 
 	/* shortcut - if any pre-defined string is given, use it */
 	if (preset && preset->profile_name)
 		s = preset->profile_name;
 	if (s && *s) {
-		strscpy(card->longname, s, sizeof(card->longname));
+		strscpy(longname, s, sizeof_field(struct snd_card, longname));
 		return;
 	}
 
 	if (preset && preset->vendor_name)
 		s = preset->vendor_name;
-	else if (quirk && quirk->vendor_name)
-		s = quirk->vendor_name;
-	*card->longname = 0;
+	else if (chip->quirk && chip->quirk->vendor_name)
+		s = chip->quirk->vendor_name;
+	*longname = 0;
 	if (s && *s) {
-		strscpy(card->longname, s, sizeof(card->longname));
+		strscpy(longname, s, sizeof_field(struct snd_card, longname));
 	} else {
 		/* retrieve the vendor and device strings as longname */
-		if (dev->descriptor.iManufacturer)
-			usb_string(dev, dev->descriptor.iManufacturer,
-				   card->longname, sizeof(card->longname));
+		if (udev->descriptor.iManufacturer)
+			usb_string(udev, udev->descriptor.iManufacturer,
+				   longname, sizeof_field(struct snd_card, longname));
 		/* we don't really care if there isn't any vendor string */
 	}
-	if (*card->longname) {
-		strim(card->longname);
-		if (*card->longname)
-			strlcat(card->longname, " ", sizeof(card->longname));
+	if (*longname) {
+		strim(longname);
+		if (*longname)
+			strlcat(longname, " ", sizeof_field(struct snd_card, longname));
 	}
 
-	strlcat(card->longname, card->shortname, sizeof(card->longname));
+	strlcat(longname, shortname, sizeof_field(struct snd_card, longname));
 
-	len = strlcat(card->longname, " at ", sizeof(card->longname));
+	len = strlcat(longname, " at ", sizeof_field(struct snd_card, longname));
 
-	if (len < sizeof(card->longname))
-		usb_make_path(dev, card->longname + len, sizeof(card->longname) - len);
+	if (len < sizeof_field(struct snd_card, longname))
+		usb_make_path(udev, longname + len, sizeof_field(struct snd_card, longname) - len);
 
-	switch (snd_usb_get_speed(dev)) {
+	switch (snd_usb_get_speed(udev)) {
 	case USB_SPEED_LOW:
-		strlcat(card->longname, ", low speed", sizeof(card->longname));
+		strlcat(longname, ", low speed", sizeof_field(struct snd_card, longname));
 		break;
 	case USB_SPEED_FULL:
-		strlcat(card->longname, ", full speed", sizeof(card->longname));
+		strlcat(longname, ", full speed", sizeof_field(struct snd_card, longname));
 		break;
 	case USB_SPEED_HIGH:
-		strlcat(card->longname, ", high speed", sizeof(card->longname));
+		strlcat(longname, ", high speed", sizeof_field(struct snd_card, longname));
 		break;
 	case USB_SPEED_SUPER:
-		strlcat(card->longname, ", super speed", sizeof(card->longname));
+		strlcat(longname, ", super speed", sizeof_field(struct snd_card, longname));
 		break;
 	case USB_SPEED_SUPER_PLUS:
-		strlcat(card->longname, ", super speed plus", sizeof(card->longname));
+		strlcat(longname, ", super speed plus", sizeof_field(struct snd_card, longname));
 		break;
 	default:
 		break;
 	}
 }
+EXPORT_SYMBOL_GPL(snd_usb_make_card_names);
 
 /* look for a matching quirk alias id */
 static bool get_alias_id(struct usb_device *dev, unsigned int *id)
@@ -1058,8 +1057,7 @@ static int snd_usb_create_card(struct snd_usb_audio *chip, struct usb_interface
 
 	chip->card = card;
 	strscpy(card->driver, "USB-Audio", sizeof(card->driver));
-	usb_audio_make_shortname(udev, chip, chip->quirk);
-	usb_audio_make_longname(udev, chip, chip->quirk);
+	snd_usb_make_card_names(chip, card->shortname, card->longname);
 	sprintf(component, "USB%04x:%04x", usb_device_vid(udev), usb_device_pid(udev));
 	snd_component_add(card, component);
 	snd_usb_audio_create_proc(chip);
-- 
2.25.1

