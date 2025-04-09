Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2BB25D8E7
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195862; cv=none; b=krYrtz+Zjjmo/OFBl74ieZmfz6w02Ms2D+O0XwhzyMHlAjM2v7MxO1rvBVDrZYQb1nEiDN9MgfepueMV8sKJuAQVy87WJBuQGbQOGy0dN4hmlJRqYY8QfMdQqUsTpMV/CEO4mCbV7B0gvFT0zJzgRwsuqFaDk0E0dZY0Ufehn5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195862; c=relaxed/simple;
	bh=hjeM+9DgD9nUByAQbkl92cVc5223EI8wFxHAwurcPPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EApRnfc5k3bj/1vzIiv1IGiR69w7e0La7AKRK/KuYUvAL4geuoU89f7odfbIeqBgfsAU6Rv9Pt60SIKeGbxNiqN+TSZRcp/dHMI38i7vzQQ8AzRl3Xv2f6Epvb3j7Y/Po7AZdIL4wZ8IPJIn+c4XpZ3Z6fYO5zmiIM/Wl5dnHM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0W1vSnT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0W1vSnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195861; x=1775731861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hjeM+9DgD9nUByAQbkl92cVc5223EI8wFxHAwurcPPg=;
  b=R0W1vSnTDsOUJJ5l8WmgGWpsGjbH2k+UbmxeYZxgsn1X5TytDCfPArw5
   st3egJtxoYx4WEJ1PcH7s4XjfOGipmsDUA+inWhHhUO1KvJgrrXBBNCZG
   91FOMk0NbRDUi/AoSgLdpyHiG5KSIdv8KQkoifEuBB/2a2NMzIVazjonD
   3ZueilM8zk7ljgxEqA8okQOu1Lba+DyFN6h2C+LXtUD2nweGrQBVl4OJ5
   rmDYPGXgTd2hW/2Be5OPJw8BcN7HRYHMAFz92AlfcyTmPIkXOLISsVD3P
   FG7uCmwslW859B/nd320cFqzOiA5yAVlw6F+Yt/DIQS4MunimjbAoCMv1
   A==;
X-CSE-ConnectionGUID: mg+vskCvRuy0HIwYJ1Cu+g==
X-CSE-MsgGUID: 2JkTG6kjQTWtbIV7IR7/Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380030"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:00 -0700
X-CSE-ConnectionGUID: 4sI6bRSITDqYqQ3+ABi0XA==
X-CSE-MsgGUID: pxT0xWMZTK6jFZfw2R2YxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426183"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:50:58 -0700
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
Subject: [RFC 02/15] ALSA: usb: Drop private_free() usage for card and pcms
Date: Wed,  9 Apr 2025 13:07:17 +0200
Message-Id: <20250409110731.3752332-3-cezary.rojewski@intel.com>
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

On ASoC side, drivers operate on instance of struct snd_soc_card instead
of struct snd_card. The latter is owned by the ASoC framework. To make
the existing sound/usb code ASoC-friendly and avoid freeing-order
problems when soc_cleanup_card_resources() is called, resign from
cardd->private_free() and extra-size when allocating new card with
snd_card_new(). Similar pattern applies to PCMs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/card.c   | 50 ++++++++++++++++++++++------------------------
 sound/usb/stream.c | 14 ++++++-------
 sound/usb/stream.h |  1 +
 3 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 03694295491f..65de8e7854b6 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -485,25 +485,6 @@ lookup_device_name(u32 id)
 	return NULL;
 }
 
-/*
- * free the chip instance
- *
- * here we have to do not much, since pcm and controls are already freed
- *
- */
-
-static void snd_usb_audio_free(struct snd_card *card)
-{
-	struct snd_usb_audio *chip = card->private_data;
-
-	snd_usb_endpoint_free_all(chip);
-	snd_usb_midi_v2_free_all(chip);
-
-	mutex_destroy(&chip->mutex);
-	if (!atomic_read(&chip->shutdown))
-		dev_set_drvdata(&chip->dev->dev, NULL);
-}
-
 static void usb_audio_make_shortname(struct usb_device *dev,
 				     struct snd_usb_audio *chip,
 				     const struct snd_usb_audio_quirk *quirk)
@@ -630,14 +611,17 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 		return -ENXIO;
 	}
 
-	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
-			   sizeof(*chip), &card);
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE, 0, &card);
 	if (err < 0) {
 		dev_err(&dev->dev, "cannot create card instance %d\n", idx);
+		kfree(chip);
 		return err;
 	}
 
-	chip = card->private_data;
 	mutex_init(&chip->mutex);
 	init_waitqueue_head(&chip->shutdown_wait);
 	chip->index = idx;
@@ -665,8 +649,6 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	else
 		snd_usb_init_quirk_flags(chip);
 
-	card->private_free = snd_usb_audio_free;
-
 	strcpy(card->driver, "USB-Audio");
 	sprintf(component, "USB%04x:%04x",
 		USB_ID_VENDOR(chip->usb_id), USB_ID_PRODUCT(chip->usb_id));
@@ -755,6 +737,19 @@ get_alias_quirk(struct usb_device *dev, unsigned int id)
 	return NULL;
 }
 
+static void snd_usb_chip_free(struct snd_usb_audio *chip)
+{
+	snd_usb_free_pcms(chip);
+	snd_usb_endpoint_free_all(chip);
+	snd_usb_midi_v2_free_all(chip);
+	/* mixers and midi1.0 freed with snd_card_free(). */
+
+	mutex_destroy(&chip->mutex);
+	if (!atomic_read(&chip->shutdown))
+		dev_set_drvdata(&chip->dev->dev, NULL);
+	kfree(chip);
+}
+
 /* register card if we reach to the last interface or to the specified
  * one given via option
  */
@@ -934,8 +929,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		 * decrement before memory is possibly returned.
 		 */
 		atomic_dec(&chip->active);
-		if (!chip->num_interfaces)
+		if (!chip->num_interfaces) {
 			snd_card_free(chip->card);
+			snd_usb_chip_free(chip);
+		}
 	}
 	mutex_unlock(&register_mutex);
 	return err;
@@ -997,7 +994,8 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	if (chip->num_interfaces <= 0) {
 		usb_chip[chip->index] = NULL;
 		mutex_unlock(&register_mutex);
-		snd_card_free_when_closed(card);
+		snd_card_free(card);
+		snd_usb_chip_free(chip);
 	} else {
 		mutex_unlock(&register_mutex);
 	}
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index c1ea8844a46f..4d83c95bd9a8 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -55,7 +55,7 @@ static void free_substream(struct snd_usb_substream *subs)
 /*
  * free a usb stream instance
  */
-static void snd_usb_audio_stream_free(struct snd_usb_stream *stream)
+static void snd_usb_pcm_free(struct snd_usb_stream *stream)
 {
 	free_substream(&stream->substream[0]);
 	free_substream(&stream->substream[1]);
@@ -63,13 +63,12 @@ static void snd_usb_audio_stream_free(struct snd_usb_stream *stream)
 	kfree(stream);
 }
 
-static void snd_usb_audio_pcm_free(struct snd_pcm *pcm)
+void snd_usb_free_pcms(struct snd_usb_audio *chip)
 {
-	struct snd_usb_stream *stream = pcm->private_data;
-	if (stream) {
-		stream->pcm = NULL;
-		snd_usb_audio_stream_free(stream);
-	}
+	struct snd_usb_stream *as, *save;
+
+	list_for_each_entry_safe(as, save, &chip->pcm_list, list)
+		snd_usb_pcm_free(as);
 }
 
 /*
@@ -533,7 +532,6 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	}
 	as->pcm = pcm;
 	pcm->private_data = as;
-	pcm->private_free = snd_usb_audio_pcm_free;
 	pcm->info_flags = 0;
 	if (chip->pcm_devs > 0)
 		sprintf(pcm->name, "USB Audio #%d", chip->pcm_devs);
diff --git a/sound/usb/stream.h b/sound/usb/stream.h
index d92e18d5818f..f70693502281 100644
--- a/sound/usb/stream.h
+++ b/sound/usb/stream.h
@@ -8,6 +8,7 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			     int stream,
 			     struct audioformat *fp);
+void snd_usb_free_pcms(struct snd_usb_audio *chip);
 
 #endif /* __USBAUDIO_STREAM_H */
 
-- 
2.25.1

