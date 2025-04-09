Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925525DB0F
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195880; cv=none; b=k5CmMBpfQ2i3grt0f9sgjeFLzHDJVEcPZcyBaq6DHNrdplpwoyZvfLdXXNfRpJtrph/KfwfSYx4HtAJ4VOX+AecSlaHccGZfXv8TsDg1oX2FhRkwS/NDQ9LARsBGZOuE2iBZswhpFftVSHDez69xkCXNy/jJwzNsYaxASkUyquU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195880; c=relaxed/simple;
	bh=lbymKk2ajwterb4kUk0MAqFiA6Az++OGnOfHl4m1vig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9qgS4OOPw+zs8lFZ697ALjy5cAM7FzFNMjXwKna1Vt143PSH4vBONtgtBoDQgLfKK3cmtivU6D9Jhvm7knKLWuk81dmrg45VI+trKOyirUVMlLDu0w9Jt4T/DlnJgsPr3P1C79zancqmpeuX1ztdvchXjzVwCx33jQI3R2/FSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC7XEcSf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC7XEcSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195879; x=1775731879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lbymKk2ajwterb4kUk0MAqFiA6Az++OGnOfHl4m1vig=;
  b=iC7XEcSfDG/tsUXWoZy692IflLfMUYGgAJL2zviU2Drfl1DOYdormKR2
   yA4MWPh3uUk+QCwKTGkQpNRdPxlNJJ0LeF6M3sPs/mMDg5YSEl5e3yNdG
   h/HD02Gydkq1CqVs6TUjXEROEJ4r1TgPQ+btV1tb66BWH4YskHiixg91N
   UM4c/Pmyob93oj4vddGpYgR+nciX7DTinY5Sa3G1dJaHgc9eNiY3Av9jR
   6+v8ZY+iX587ct2FHaY1h9Fyboqpz5M8bsBNZ3KxN6JepplRO8J5o+Hyw
   bLBJx6YML4UnEwKTrTIp4aMjNW9/j4N1l4/mA/NtnaSoU9LmDY/IWQhHP
   g==;
X-CSE-ConnectionGUID: yru8glubRoy6quWwEhjEGQ==
X-CSE-MsgGUID: lc5b3n+DQPyC8r68WIel4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380092"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:51:19 -0700
X-CSE-ConnectionGUID: YSObAZF2Q0WJp4iWFwUdDg==
X-CSE-MsgGUID: l9oUkYzgSISBhIvFlQzAgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426239"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:51:17 -0700
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
Subject: [RFC 09/15] ALSA: usb: Switch to the two-stage quirk applying
Date: Wed,  9 Apr 2025 13:07:24 +0200
Message-Id: <20250409110731.3752332-10-cezary.rojewski@intel.com>
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

Utilize newly added functions and update existing apply-quirks procedure
for USB Audio-Class (AC) device from one-stage into two-stage process.
In consequence, drop create_uaxx_quirk() and create_autodetect_quirk()
and update existing snd_usb_create_quirk() so that it only creates new
streams, leaving the PCM parsing process to snd_usb_parse_pcms_quirk().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/usb/quirks.c | 42 ++----------------------------------------
 1 file changed, 2 insertions(+), 40 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4e402c6406a9..037a45c79fbe 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -412,7 +412,6 @@ static int create_autodetect_pcm_quirk(struct snd_usb_audio *chip,
 	return create_auto_pcm_quirk(chip, iface, driver);
 }
 
-__maybe_unused
 static int create_autodetect_midi_quirk(struct snd_usb_audio *chip,
 					struct usb_interface *iface,
 					struct usb_driver *driver,
@@ -423,19 +422,6 @@ static int create_autodetect_midi_quirk(struct snd_usb_audio *chip,
 	return 1;
 }
 
-static int create_autodetect_quirk(struct snd_usb_audio *chip,
-				   struct usb_interface *iface,
-				   struct usb_driver *driver,
-				   const struct snd_usb_audio_quirk *quirk)
-{
-	int err;
-
-	err = create_auto_pcm_quirk(chip, iface, driver);
-	if (err == -ENODEV)
-		err = create_auto_midi_quirk(chip, iface, driver);
-	return err;
-}
-
 static int create_uaxx_pcm_quirk(struct snd_usb_audio *chip,
 				 struct usb_interface *iface,
 				 struct usb_driver *driver,
@@ -556,30 +542,6 @@ static int create_uaxx_midi_quirk(struct snd_usb_audio *chip,
 				    &chip->num_rawmidis);
 }
 
-static int create_uaxx_quirk(struct snd_usb_audio *chip,
-			     struct usb_interface *iface,
-			     struct usb_driver *driver,
-			     const struct snd_usb_audio_quirk *quirk)
-{
-	struct usb_interface_descriptor *altsd;
-	struct usb_host_interface *alts;
-
-	/* both PCM and MIDI interfaces have 2 or more altsettings */
-	if (iface->num_altsetting < 2)
-		return -ENXIO;
-	alts = &iface->altsetting[1];
-	altsd = get_iface_desc(alts);
-
-	switch (altsd->bNumEndpoints) {
-	case 2:
-		return create_uaxx_midi_quirk(chip, iface, driver, quirk);
-	case 1:
-		return create_uaxx_pcm_quirk(chip, iface, driver, quirk);
-	default:
-		return -ENXIO;
-	}
-}
-
 /*
  * Create a standard mixer for the specified interface.
  */
@@ -652,7 +614,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 	static const quirk_func_t quirk_funcs[] = {
 		[QUIRK_IGNORE_INTERFACE] = ignore_interface_quirk,
 		[QUIRK_COMPOSITE] = create_composite_quirk,
-		[QUIRK_AUTODETECT] = create_autodetect_quirk,
+		[QUIRK_AUTODETECT] = create_autodetect_midi_quirk,
 		[QUIRK_MIDI_STANDARD_INTERFACE] = create_any_midi_quirk,
 		[QUIRK_MIDI_FIXED_ENDPOINT] = create_any_midi_quirk,
 		[QUIRK_MIDI_YAMAHA] = create_any_midi_quirk,
@@ -667,7 +629,7 @@ int snd_usb_create_quirk(struct snd_usb_audio *chip,
 		[QUIRK_MIDI_CH345] = create_any_midi_quirk,
 		[QUIRK_AUDIO_STANDARD_INTERFACE] = create_standard_audio_quirk,
 		[QUIRK_AUDIO_FIXED_ENDPOINT] = create_fixed_stream_quirk,
-		[QUIRK_AUDIO_EDIROL_UAXX] = create_uaxx_quirk,
+		[QUIRK_AUDIO_EDIROL_UAXX] = create_uaxx_midi_quirk,
 		[QUIRK_AUDIO_STANDARD_MIXER] = create_standard_mixer_quirk,
 	};
 
-- 
2.25.1

