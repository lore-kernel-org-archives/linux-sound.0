Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAC2F1FEA;
	Sun,  1 Mar 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401078; cv=pass; b=fvWX1I/J/FGE0nNFOFcdGee5qQi/UWvehmxyJ6UABNpAkSFZ4YwpX+ssSxY3Hw0VljhLfioWtMpM1EyIRlyySmLXkomMzW+CB8etJvMa9/LxwwuDHdFK8ZLKdpJ5BNEiBeJ/2Lwnjy5jAtx51CMId6jmWXi37mu4yp1f/IiMDyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401078; c=relaxed/simple;
	bh=/lQIky8CZKavwRz8u5C5zMFPyf0VvC0LS2EBXvJ14Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCLgKkIv55mWbBIsvs9pzaK6MymIKYyNAgzUXdPAZw+kb9FdHoFsPXrLQhU67pglGJ59H1O67xSI9lLBjGHRYygvRiVMOffxZbHbIQfU/T93EOeTOyU2bsNnDMy4gzda0AKp6d1by+CF64R9N6VPzwzYpaubHU1X/HKdCWQw6pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mLSzJnLL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mLSzJnLL"
ARC-Seal: i=1; a=rsa-sha256; t=1772401062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CPOGVLSK7TuL32Hm/qxUDxZQqHGWVZ/ivxo7pzy1oXHRXBLWrcXMMhu0QMABS555ubWcmW+znLp82j2HJB1D+Pws98r7magOhV0J88VGEMB8TuS5GMkL9oivdYTWflYP0gpuw9D05gDAaLqyfEfbbV3hJI1V6YIxyohAzlHLiWM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772401062; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dfOtOj2mJ90DyMmFUn0bS67YeVG/vNESqFGEOc96Ml8=; 
	b=LUCt5oGY4inX7IfvR67U+s3NVJdPhYqhNbSoyfETc+KYfr6NF1CV5lvFn6FmhF8B63zMOXZt77LYI47U7P90y0OA88Xv26EklOY842XA5e2Ewwaf0aTxH3jaA01RZYaDX9zwysAZFrrx/PJFL46l4zmAOVhcdj3ANsSbJgVnXew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772401062;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dfOtOj2mJ90DyMmFUn0bS67YeVG/vNESqFGEOc96Ml8=;
	b=mLSzJnLLpvR/1aeJOdzsvvWoOiL9w5RoXWbhoYrjpDH0bPK5Maqt414Mz203Vw7q
	8EfMqFY+sv6H7JFsSh/c6rnDN4l/G2GhQdWC+YwBXQap8bkrPPwnKFVr1UXn6DMICOd
	CjrAA3fQlq/IfnpybhtMSdLwne09PqfPlC57mMuE7XUEyrjm96QQqSXtytb71aGXd/B
	Bob1cxGiXIM7RB2wd5YbGtJjBq7o96YAh3KusGwzrIWv3ON+X0AbS28uVG445JOntnV
	G6eXE1+Qz7uUbKllaK4IAbVaWjOMPQTIj3KqUiD8h1eBGDWqmeGJZSNvnjoayDz3d5U
	gALemgFAPQ==
Received: by mx.zohomail.com with SMTPS id 1772401060546918.7972675807081;
	Sun, 1 Mar 2026 13:37:40 -0800 (PST)
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
Subject: [PATCH 2/9] ALSA: usb-audio: Add helper function for volume range checks
Date: Mon,  2 Mar 2026 05:37:18 +0800
Message-ID: <20260301213726.428505-3-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260301213726.428505-1-i@rong.moe>
References: <20260301213726.428505-1-i@rong.moe>
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

