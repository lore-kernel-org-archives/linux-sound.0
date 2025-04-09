Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98E25E441
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195868; cv=none; b=lox1WtGm92DkG78pElPHALMTADzvrEPwQA7ovzKk0lUhFuLN8RylsHHYI++yDXoIwGGbvNK3wFB5eDjyBqtBQi6gHYGxVz6YIod7FWZ2KQBEwcAf3ThpPAGOtg3CxLVGyBizfW8mnJwjdSQSerC79hzOmNs1QWp1FMMDpNIlHKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195868; c=relaxed/simple;
	bh=m5qAflhwIe44jRryTmRvCNbU5P54YAc94YTF92NjS+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZBBJ4miKcJP1hOznj2mEfgZ5E/rjESMMretvu4Shp35S/lBk3giZUImPROBuZTFcJxz6XAxTVHkuXzN375qv852DDB2DPyZLT8vHBG61IeRBvsRJHyeFLwY5zXBWfo27xxMAV5NS8mSCnO94htMqrm+wNr4Vm3Wx82nnK/g8Kbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxHwcWRn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxHwcWRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195866; x=1775731866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m5qAflhwIe44jRryTmRvCNbU5P54YAc94YTF92NjS+c=;
  b=DxHwcWRn2GUQ0b8vG3q5FiZ21M8S/QWfiPUFAOdmMVNFg4eK+n59TTz2
   nHUgH5Pgj3LWWXrTyHEl3VWoydF16rtY9VDtzKfvEIvMgOs5vlrvqyNoT
   HKPEfSGdSUKkzN03iurORZKvojgpNcQgUZsVW04Ziq2iQOgqAGEj35nAQ
   fLAjmvXNE1qBKUXlJ2eMo5mjkzIY/fZnsX6ZZYF23007jZFcaria9So2I
   Oq6GDm83G9wQxYRE0nBsU4EsdxbvtFBcjyPOEmxmFS0WWJ1U7Ds82lrEt
   dwm0gFqeAt/g7MAkpCsXvcm1SOu4Ksf0fKkEermMdXMFXUIIWdQpr/RLR
   A==;
X-CSE-ConnectionGUID: O8A5ynJQT2+r20Ur6bPI9w==
X-CSE-MsgGUID: YhHGcqxJSkG7AtuGnPpOVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380049"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380049"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:06 -0700
X-CSE-ConnectionGUID: 2/fZRr4VQLasS2ca0EqEVw==
X-CSE-MsgGUID: +yP3sNT9T0+Pud7CqfpCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426202"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:03 -0700
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
Subject: [RFC 04/15] ALSA: usb: Implement two-stage quirk applying mechanism
Date: Wed,  9 Apr 2025 13:07:19 +0200
Message-Id: <20250409110731.3752332-5-cezary.rojewski@intel.com>
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

The USB Audio-Class (AC) device driver on ASoC side needs to know the
number of available PCM streams when creating list of DAI and DAI Links
before these objects are actually probed. To achieve that split existing
USB stream enumeration procedure from one-stage to two-stage process:

1) parse the descriptors and obtain information about PCMs but do not
   create them yet
2) create all PCMs based on the previously obtained information and
   follow that up with MIDIs, mixers and Media resources

On quirks side this translates to splitting all handlers that do combine
pcm/midi/mixer together into 'pcm-only' and 'others'. A top level
handler snd_usb_parse_pcms_quirk() is provided to invoke all the
necessary parse-pcm quirks depending on the quirk type. It mimics
behavior of snd_usb_create_quirk() but limits itself to just parsing the
PCMs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/quirks.c | 217 ++++++++++++++++++++++++++++++++++++---------
 sound/usb/quirks.h |   4 +
 2 files changed, 179 insertions(+), 42 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2a9470ef8b5f..4e402c6406a9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -28,7 +28,36 @@
 #include "stream.h"
 
 /*
- * handle the quirks for the contained interfaces
+ * First run of composite quirk. Parses all PCM interfaces.
+ * These can be later created with snd_usb_add_pcms().
+ */
+static int create_composite_pcm_quirk(struct snd_usb_audio *chip,
+				      struct usb_interface *iface,
+				      struct usb_driver *driver,
+				      const struct snd_usb_audio_quirk *quirk_comp)
+{
+	int probed_ifnum = get_iface_desc(iface->altsetting)->bInterfaceNumber;
+	const struct snd_usb_audio_quirk *quirk;
+	int err;
+
+	for (quirk = quirk_comp->data; quirk->ifnum >= 0; ++quirk) {
+		iface = usb_ifnum_to_if(chip->dev, quirk->ifnum);
+		if (!iface)
+			continue;
+		if (quirk->ifnum != probed_ifnum &&
+		    usb_interface_claimed(iface))
+			continue;
+		err = snd_usb_parse_pcms_quirk(chip, iface, driver, quirk);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+/*
+ * Second run of composite quirk. Creates all non-PCM interfaces and
+ * claims the usb_interface @iface.
  */
 static int create_composite_quirk(struct snd_usb_audio *chip,
 				  struct usb_interface *iface,
@@ -375,6 +404,25 @@ static int create_auto_midi_quirk(struct snd_usb_audio *chip,
 	return create_std_midi_quirk(chip, iface, driver, alts);
 }
 
+static int create_autodetect_pcm_quirk(struct snd_usb_audio *chip,
+				       struct usb_interface *iface,
+				       struct usb_driver *driver,
+				       const struct snd_usb_audio_quirk *quirk)
+{
+	return create_auto_pcm_quirk(chip, iface, driver);
+}
+
+__maybe_unused
+static int create_autodetect_midi_quirk(struct snd_usb_audio *chip,
+					struct usb_interface *iface,
+					struct usb_driver *driver,
+					const struct snd_usb_audio_quirk *quirk)
+{
+	if (list_empty(&chip->pcm_list))
+		return create_auto_midi_quirk(chip, iface, driver);
+	return 1;
+}
+
 static int create_autodetect_quirk(struct snd_usb_audio *chip,
 				   struct usb_interface *iface,
 				   struct usb_driver *driver,
@@ -388,14 +436,10 @@ static int create_autodetect_quirk(struct snd_usb_audio *chip,
 	return err;
 }
 
-/*
- * Create a stream for an Edirol UA-700/UA-25/UA-4FX interface.  
- * The only way to detect the sample rate is by looking at wMaxPacketSize.
- */
-static int create_uaxx_quirk(struct snd_usb_audio *chip,
-			     struct usb_interface *iface,
-			     struct usb_driver *driver,
-			     const struct snd_usb_audio_quirk *quirk)
+static int create_uaxx_pcm_quirk(struct snd_usb_audio *chip,
+				 struct usb_interface *iface,
+				 struct usb_driver *driver,
+				 const struct snd_usb_audio_quirk *quirk)
 {
 	static const struct audioformat ua_format = {
 		.formats = SNDRV_PCM_FMTBIT_S24_3LE,
@@ -405,8 +449,8 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 		.altset_idx = 1,
 		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 	};
-	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
+	struct usb_host_interface *alts;
 	struct audioformat *fp;
 	int err;
 
@@ -416,35 +460,15 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 	alts = &iface->altsetting[1];
 	altsd = get_iface_desc(alts);
 
-	if (altsd->bNumEndpoints == 2) {
-		static const struct snd_usb_midi_endpoint_info ua700_ep = {
-			.out_cables = 0x0003,
-			.in_cables  = 0x0003
-		};
-		static const struct snd_usb_audio_quirk ua700_quirk = {
-			.type = QUIRK_MIDI_FIXED_ENDPOINT,
-			.data = &ua700_ep
-		};
-		static const struct snd_usb_midi_endpoint_info uaxx_ep = {
-			.out_cables = 0x0001,
-			.in_cables  = 0x0001
-		};
-		static const struct snd_usb_audio_quirk uaxx_quirk = {
-			.type = QUIRK_MIDI_FIXED_ENDPOINT,
-			.data = &uaxx_ep
-		};
-		const struct snd_usb_audio_quirk *quirk =
-			chip->usb_id == USB_ID(0x0582, 0x002b)
-			? &ua700_quirk : &uaxx_quirk;
-		return __snd_usbmidi_create(chip->card, iface,
-					    &chip->midi_list, quirk,
-					    chip->usb_id,
-					    &chip->num_rawmidis);
+	switch (altsd->bNumEndpoints) {
+	case 2:
+		return 2; /* Leave this to midi. */
+	case 1:
+		break;
+	default:
+		return -ENXIO;
 	}
 
-	if (altsd->bNumEndpoints != 1)
-		return -ENXIO;
-
 	fp = kmemdup(&ua_format, sizeof(*fp), GFP_KERNEL);
 	if (!fp)
 		return -ENOMEM;
@@ -484,6 +508,78 @@ static int create_uaxx_quirk(struct snd_usb_audio *chip,
 	return 0;
 }
 
+/*
+ * Create a stream for an Edirol UA-700/UA-25/UA-4FX interface.
+ * The only way to detect the sample rate is by looking at wMaxPacketSize.
+ */
+static int create_uaxx_midi_quirk(struct snd_usb_audio *chip,
+				  struct usb_interface *iface,
+				  struct usb_driver *driver,
+				  const struct snd_usb_audio_quirk *quirk)
+{
+	static const struct snd_usb_midi_endpoint_info ua700_ep = {
+		.out_cables = 0x0003,
+		.in_cables  = 0x0003
+	};
+	static const struct snd_usb_audio_quirk ua700_quirk = {
+		.type = QUIRK_MIDI_FIXED_ENDPOINT,
+		.data = &ua700_ep
+	};
+	static const struct snd_usb_midi_endpoint_info uaxx_ep = {
+		.out_cables = 0x0001,
+		.in_cables  = 0x0001
+	};
+	static const struct snd_usb_audio_quirk uaxx_quirk = {
+		.type = QUIRK_MIDI_FIXED_ENDPOINT,
+		.data = &uaxx_ep
+	};
+	const struct snd_usb_audio_quirk *spec;
+	struct usb_host_interface *alt;
+
+	spec = chip->usb_id == USB_ID(0x0582, 0x002b) ? &ua700_quirk : &uaxx_quirk;
+
+	/* both PCM and MIDI interfaces have 2 or more altsettings */
+	if (iface->num_altsetting < 2)
+		return -ENXIO;
+	alt = &iface->altsetting[1];
+
+	switch (alt->desc.bNumEndpoints) {
+	case 2:
+		break;
+	case 1:
+		return 1; /* Leave this to pcm. */
+	default:
+		return -ENXIO;
+	}
+
+	return __snd_usbmidi_create(chip->card, iface, &chip->midi_list, spec, chip->usb_id,
+				    &chip->num_rawmidis);
+}
+
+static int create_uaxx_quirk(struct snd_usb_audio *chip,
+			     struct usb_interface *iface,
+			     struct usb_driver *driver,
+			     const struct snd_usb_audio_quirk *quirk)
+{
+	struct usb_interface_descriptor *altsd;
+	struct usb_host_interface *alts;
+
+	/* both PCM and MIDI interfaces have 2 or more altsettings */
+	if (iface->num_altsetting < 2)
+		return -ENXIO;
+	alts = &iface->altsetting[1];
+	altsd = get_iface_desc(alts);
+
+	switch (altsd->bNumEndpoints) {
+	case 2:
+		return create_uaxx_midi_quirk(chip, iface, driver, quirk);
+	case 1:
+		return create_uaxx_pcm_quirk(chip, iface, driver, quirk);
+	default:
+		return -ENXIO;
+	}
+}
+
 /*
  * Create a standard mixer for the specified interface.
  */
@@ -498,6 +594,44 @@ static int create_standard_mixer_quirk(struct snd_usb_audio *chip,
 	return snd_usb_create_mixer(chip, quirk->ifnum);
 }
 
+int snd_usb_parse_pcms_quirk(struct snd_usb_audio *chip,
+			     struct usb_interface *iface,
+			     struct usb_driver *driver,
+			     const struct snd_usb_audio_quirk *quirk)
+{
+	typedef int (*quirk_func_t)(struct snd_usb_audio *,
+				    struct usb_interface *,
+				    struct usb_driver *,
+				    const struct snd_usb_audio_quirk *);
+	static const quirk_func_t quirk_funcs[] = {
+		[QUIRK_IGNORE_INTERFACE] = ignore_interface_quirk,
+		[QUIRK_COMPOSITE] = create_composite_pcm_quirk,
+		[QUIRK_AUTODETECT] = create_autodetect_pcm_quirk,
+		[QUIRK_MIDI_STANDARD_INTERFACE] = ignore_interface_quirk,
+		[QUIRK_MIDI_FIXED_ENDPOINT] = ignore_interface_quirk,
+		[QUIRK_MIDI_YAMAHA] = ignore_interface_quirk,
+		[QUIRK_MIDI_ROLAND] = ignore_interface_quirk,
+		[QUIRK_MIDI_MIDIMAN] = ignore_interface_quirk,
+		[QUIRK_MIDI_NOVATION] = ignore_interface_quirk,
+		[QUIRK_MIDI_RAW_BYTES] = ignore_interface_quirk,
+		[QUIRK_MIDI_EMAGIC] = ignore_interface_quirk,
+		[QUIRK_MIDI_CME] = ignore_interface_quirk,
+		[QUIRK_MIDI_AKAI] = ignore_interface_quirk,
+		[QUIRK_MIDI_FTDI] = ignore_interface_quirk,
+		[QUIRK_MIDI_CH345] = ignore_interface_quirk,
+		[QUIRK_AUDIO_STANDARD_INTERFACE] = create_standard_audio_quirk,
+		[QUIRK_AUDIO_FIXED_ENDPOINT] = create_fixed_stream_quirk,
+		[QUIRK_AUDIO_EDIROL_UAXX] = create_uaxx_pcm_quirk,
+		[QUIRK_AUDIO_STANDARD_MIXER] = ignore_interface_quirk,
+	};
+
+	if (quirk->type < QUIRK_TYPE_COUNT)
+		return quirk_funcs[quirk->type](chip, iface, driver, quirk);
+
+	usb_audio_err(chip, "invalid quirk type %d\n", quirk->type);
+	return -ENXIO;
+}
+
 /*
  * audio-interface quirks
  *
@@ -537,12 +671,11 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 		[QUIRK_AUDIO_STANDARD_MIXER] = create_standard_mixer_quirk,
 	};
 
-	if (quirk->type < QUIRK_TYPE_COUNT) {
+	if (quirk->type < QUIRK_TYPE_COUNT)
 		return quirk_funcs[quirk->type](chip, iface, driver, quirk);
-	} else {
-		usb_audio_err(chip, "invalid quirk type %d\n", quirk->type);
-		return -ENXIO;
-	}
+
+	usb_audio_err(chip, "invalid quirk type %d\n", quirk->type);
+	return -ENXIO;
 }
 
 /*
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 0ea079688261..1344e4e635d8 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -8,6 +8,10 @@ struct audioformat;
 struct snd_usb_endpoint;
 struct snd_usb_substream;
 
+int snd_usb_parse_pcms_quirk(struct snd_usb_audio *chip,
+			     struct usb_interface *iface,
+			     struct usb_driver *driver,
+			     const struct snd_usb_audio_quirk *quirk);
 int snd_usb_create_quirk(struct snd_usb_audio *chip,
 			 struct usb_interface *iface,
 			 struct usb_driver *driver,
-- 
2.25.1

