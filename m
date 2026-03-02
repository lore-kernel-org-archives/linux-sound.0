Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A1373C05;
	Mon,  2 Mar 2026 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477970; cv=pass; b=k8N/IDf7jT38+pG7BJ4C8R5x2DyhRABiQeImc/XjTgViAj9IF4TO+2bPTchzaJzQ5WbZ7GOn+qeKmnjhGRche4xtSzZixVjW0pPmIBqU7ZYwAJa5IAh/HMUN3ZohqBeJmAwLXfEhpW0xf7TMa9HA5QsShVArmhA+ZAyViyI5mwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477970; c=relaxed/simple;
	bh=/lQIky8CZKavwRz8u5C5zMFPyf0VvC0LS2EBXvJ14Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvhEvX8fBlO9uGU/JMMW7nrxcBb38EL17P8OLaFJzcG+1pXWhrpmBUDKgZTIlD9kSBZ8fRq4018X2KpDuE4vnLdSymmshfjp86hUp+1HXaPP4w/p9YewHapQsxB0axswc3GpVCK4dh0TeOyITs6yK8P84MT6KjlV9fe+91OrWD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jiyLqlPp; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jiyLqlPp"
ARC-Seal: i=1; a=rsa-sha256; t=1772477955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U1eqRarNYQI4fg3IGAlPTvg0c2iV+amw9jUfs5Mn9kMhsAf9mMfM4CsRwEAhenisBLTy0gC53MIP14eB0YOiydQIeWu2gOOd3RSH6oWP1jBtH8nCko7ryzPLdIN2YmC4a2Crcs5HJZpqDCal9pqBsFdYhhUdKIRnlBHX9mJroqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772477955; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dfOtOj2mJ90DyMmFUn0bS67YeVG/vNESqFGEOc96Ml8=; 
	b=MDXUkZSOpuKeKKgaq7N6c5QsHU/SL/SLmUqerwWuIJfqoTVvxHDM4wABzGkGgZuak7hAHJhef5dKjoArwI5JJrOYzznhRGdZwG0HvrfyHFnB0/j3vGOrl2QTtmWgcf5ynzqzIJ/LCsnFIThw7iHgGu5UHlo/RbamxCuSL3328AM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772477955;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dfOtOj2mJ90DyMmFUn0bS67YeVG/vNESqFGEOc96Ml8=;
	b=jiyLqlPpzBtkuR/9pj/T2G9cEAP7DNBM0+Qzx8Lw7pQuaQzQii+No8aMwh0wE9ru
	0vNU5xVVPx1DePDpBZ87eRYLh8c3N6pAeatKJKpBBijPSqI/N7XBb1fxnxej3fPtQpi
	ct6P9If240gmZmIj/L5ZSdtgMyNJOqfVND8IG5REum8zjFqnspxfGeyO1GX6x3USeHP
	ulrZk363oy4u1x4hWogeUPvbFBv8jxa3d73ouMtFDGOtdOm+LJfPN1FsI4k3w9EvpFy
	9hjjSy0Z3bEAeeVO6dyZxMvEL8h0r9qMN+eEFjA6sX3YFPIPWRUjS3XgWrdc/0tEPZ+
	TqkDTlKkqA==
Received: by mx.zohomail.com with SMTPS id 1772477952939128.88145861487385;
	Mon, 2 Mar 2026 10:59:12 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 2/8] ALSA: usb-audio: Add helper function for volume range checks
Date: Tue,  3 Mar 2026 02:58:53 +0800
Message-ID: <20260302185900.427415-3-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302185900.427415-1-i@rong.moe>
References: <20260302185900.427415-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When a potentially insane volume range is found, the volume control
parameters will be printed in WARN level instead of DEBUG level.
Currently, it's done by emitting a open-coded usb_audio_warn() in the
corresponding check.

The following changes are about to add more checks against volumen
ranges. As the first step, extract the current check logic into a helper
function to improve readability.

No functional change intended.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index df0d3df9c7ece..f52ca0d7e6653 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1660,6 +1660,27 @@ static const struct usb_feature_control_info *get_feature_control_info(int contr
 	return NULL;
 }
 
+static bool check_insane_volume_range(struct usb_mixer_interface *mixer,
+				      struct snd_kcontrol *kctl,
+				      struct usb_mixer_elem_info *cval)
+{
+	int range = (cval->max - cval->min) / cval->res;
+
+	/*
+	 * Are there devices with volume range more than 255? I use a bit more
+	 * to be sure. 384 is a resolution magic number found on Logitech
+	 * devices. It will definitively catch all buggy Logitech devices.
+	 */
+	if (range > 384) {
+		usb_audio_warn(mixer->chip,
+			       "Warning! Unlikely big volume range (=%u), cval->res is probably wrong.",
+			       range);
+		return true;
+	}
+
+	return false;
+}
+
 static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 				const struct usbmix_name_map *imap,
 				unsigned int ctl_mask, int control,
@@ -1673,7 +1694,6 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *cval;
 	const struct usbmix_name_map *map;
-	unsigned int range;
 
 	if (control == UAC_FU_GRAPHIC_EQUALIZER) {
 		/* FIXME: not supported yet */
@@ -1811,25 +1831,16 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 
 	snd_usb_mixer_fu_apply_quirk(mixer, cval, unitid, kctl);
 
-	range = (cval->max - cval->min) / cval->res;
-	/*
-	 * Are there devices with volume range more than 255? I use a bit more
-	 * to be sure. 384 is a resolution magic number found on Logitech
-	 * devices. It will definitively catch all buggy Logitech devices.
-	 */
-	if (range > 384) {
-		usb_audio_warn(mixer->chip,
-			       "Warning! Unlikely big volume range (=%u), cval->res is probably wrong.",
-			       range);
-		usb_audio_warn(mixer->chip,
-			       "[%d] FU [%s] ch = %d, val = %d/%d/%d",
+	if (check_insane_volume_range(mixer, kctl, cval)) {
+		usb_audio_warn(mixer->chip, "[%d] FU [%s] ch = %d, val = %d/%d/%d\n",
 			       cval->head.id, kctl->id.name, cval->channels,
 			       cval->min, cval->max, cval->res);
+	} else {
+		usb_audio_dbg(mixer->chip, "[%d] FU [%s] ch = %d, val = %d/%d/%d\n",
+			      cval->head.id, kctl->id.name, cval->channels,
+			      cval->min, cval->max, cval->res);
 	}
 
-	usb_audio_dbg(mixer->chip, "[%d] FU [%s] ch = %d, val = %d/%d/%d\n",
-		      cval->head.id, kctl->id.name, cval->channels,
-		      cval->min, cval->max, cval->res);
 	snd_usb_mixer_add_control(&cval->head, kctl);
 }
 
-- 
2.51.0

