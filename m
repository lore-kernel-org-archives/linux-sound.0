Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B9175A76;
	Fri, 10 Apr 2026 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843370; cv=pass; b=E99JEev3hrdMyFhIT2YlhESVU0OA3Nco0pri9tcaVtaKQ2GWHmwWBL66c/DAZPBj3lEcamx4i/K/Bh+plPAECVtgKYgEZTumuJIfjav1dcohifVg1pzpjckLh7HSJldkB4CsruswNeSQ05Y6sd+1pQZWke0wAw47wGp6bR+ncgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843370; c=relaxed/simple;
	bh=CZYQBruP9KBIyf/fAQRIHn3lD9K8Fg7SaTUiHFP28ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2ka3igT9+DBj+FyqSY1GJwobWvd9iIXhlE3mii0S2TIl4pzgrtKi73Vl6L4WJd94+7u9pQv3SFXHzVYS3a/NRH6kegLfrszQE2kSc+tdvpu6DcExt8xditDMLM0B+BcMlRWzGhxcM10mY3XSjj3gEW7aUKU1R1afOa3xFT4Vlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Qab+SCIY; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Qab+SCIY"
ARC-Seal: i=1; a=rsa-sha256; t=1775843363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=idltcXz3m4rIGO/oKtStVIBExb3sz0g8gM+5fcwVI9f8GFiGfJlgOWpXYn/uRFlD1gngCJM4mKp7Z4caEz4fTlvWdlPePgWXyxuUfKfzab66FsjWXolq5yCi0uOmIRy0tSX4lHjd3ki+y442gW6feVC/ukHcZ8zBlRGzKRl6wyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775843363; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ywzL4TYUTBgPH4OTEZpWdrhMm0aJuIfEOysKOGlQRc0=; 
	b=WohfUQTM78SY7ev3oywvlwE7y0C66gXMlsGvbBkwoK4pLWvuom25W7viGuQFd3OONiV0pJcda/jSQJJHLJJor7ctZhn1XjhzuDCM+t9RCEZdkKd8bYb1hUgNDnr81G2qNNJSbpAPtsUAZpJrtCpnFa9FB/dcxPuOqg2NIz+tgFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775843363;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ywzL4TYUTBgPH4OTEZpWdrhMm0aJuIfEOysKOGlQRc0=;
	b=Qab+SCIYNMLGwnedVE5Y0vDj++JBYcgGQUi+29EEQV/DHddEkHG8Df+6Z873w3RH
	/HU/uNdkAjUwrKl0WmQT9l6CdhRQmSJtMBoN3Rd5CVfh9eqvbK/4J5n0AVNVV4Xua+r
	2HleIDtwzBZyLHmEglhyENDVsfPKO7YZ4QOquIQax6AcGNlIdLlNqzvJ3f7VYJufKpo
	OMUBwXCSF2U3VNrqrryOyY/Y999lmxU+r1sG6K8JxvYkXc6j+FYdaHatVxD4upZ+77v
	lVfLoq0zpWjLEaVvgk+Xq9BeftML6qRvnalOX5yrOh+UpSxsyPoz4RNXJ1LUf9wxgCi
	L/gzW2G0dw==
Received: by mx.zohomail.com with SMTPS id 1775843362450723.2142062526651;
	Fri, 10 Apr 2026 10:49:22 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sat, 11 Apr 2026 01:49:02 +0800
Subject: [PATCH 1/3] ALSA: usb-audio: Add error checks against
 get_min_max*()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-uac-sticky-mixer-v1-1-29d62717befd@rong.moe>
References: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
In-Reply-To: <20260411-uac-sticky-mixer-v1-0-29d62717befd@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.16-dev-7777e
X-ZohoMailClient: External

All callers of get_min_max*() ignore the latter's return code
completely. This means to ignore temporary errors at the probe time.
However, it is not optimal and leads to some maintenance burdens.

Return -EAGAIN for temporary errors, and check against it in the callers
of get_min_max*(). If any other error occurs, bail out of the caller
early.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/87ldewi4j8.wl-tiwai@suse.de
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a25e8145af67..e5993364c825 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1264,7 +1264,7 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 				      "%d:%d: cannot get min/max values for control %d (id %d)\n",
 				   cval->head.id, mixer_ctrl_intf(cval->head.mixer),
 							       cval->control, cval->head.id);
-			return -EINVAL;
+			return -EAGAIN;
 		}
 		if (get_ctl_value(cval, UAC_GET_RES,
 				  (cval->control << 8) | minchn,
@@ -1388,6 +1388,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_info *uinfo)
 {
 	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
+	int ret;
 
 	if (cval->val_type == USB_MIXER_BOOLEAN ||
 	    cval->val_type == USB_MIXER_INV_BOOLEAN)
@@ -1398,8 +1399,9 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 	if (cval->val_type != USB_MIXER_BOOLEAN &&
 	    cval->val_type != USB_MIXER_INV_BOOLEAN) {
 		if (!cval->initialized) {
-			get_min_max_with_quirks(cval, 0, kcontrol);
-			if (cval->initialized && cval->dBmin >= cval->dBmax) {
+			ret = get_min_max_with_quirks(cval, 0, kcontrol);
+			if ((ret >= 0 || ret == -EAGAIN) &&
+			    cval->initialized && cval->dBmin >= cval->dBmax) {
 				kcontrol->vd[0].access &= 
 					~(SNDRV_CTL_ELEM_ACCESS_TLV_READ |
 					  SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK);
@@ -1743,6 +1745,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *cval;
 	const struct usbmix_name_map *map;
+	int ret;
 
 	if (control == UAC_FU_GRAPHIC_EQUALIZER) {
 		/* FIXME: not supported yet */
@@ -1856,10 +1859,10 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	}
 
 	/* get min/max values */
-	get_min_max_with_quirks(cval, 0, kctl);
+	ret = get_min_max_with_quirks(cval, 0, kctl);
 
 	/* skip a bogus volume range */
-	if (cval->max <= cval->min) {
+	if ((ret < 0 && ret != -EAGAIN) || cval->max <= cval->min) {
 		usb_audio_dbg(mixer->chip,
 			      "[%d] FU [%s] skipped due to invalid volume\n",
 			      cval->head.id, kctl->id.name);
@@ -2233,6 +2236,7 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 	unsigned int i, len;
 	struct snd_kcontrol *kctl;
 	const struct usbmix_name_map *map;
+	int ret;
 
 	map = find_map(state->map, unitid, 0);
 	if (check_ignored_ctl(map))
@@ -2255,7 +2259,11 @@ static void build_mixer_unit_ctl(struct mixer_build *state,
 	}
 
 	/* get min/max values */
-	get_min_max(cval, 0);
+	ret = get_min_max(cval, 0);
+	if (ret < 0 && ret != -EAGAIN) {
+		usb_mixer_elem_info_free(cval);
+		return;
+	}
 
 	kctl = snd_ctl_new1(&usb_feature_unit_ctl, cval);
 	if (!kctl) {
@@ -2627,7 +2635,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 				break;
 			}
 
-			get_min_max(cval, valinfo->min_value);
+			err = get_min_max(cval, valinfo->min_value);
 			break;
 		}
 		case USB_XU_CLOCK_RATE:
@@ -2639,11 +2647,16 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 			cval->max = 5;
 			cval->res = 1;
 			cval->initialized = 1;
+			err = 0;
 			break;
 		default:
-			get_min_max(cval, valinfo->min_value);
+			err = get_min_max(cval, valinfo->min_value);
 			break;
 		}
+		if (err < 0 && err != -EAGAIN) {
+			usb_mixer_elem_info_free(cval);
+			return err;
+		}
 
 		err = get_cur_ctl_value(cval, cval->control << 8, &val);
 		if (err < 0) {

-- 
2.53.0

