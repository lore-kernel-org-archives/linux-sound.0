Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2937C923;
	Tue,  3 Mar 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567318; cv=pass; b=qX6rVJ5FiD8P5Hubjo4PCL5z6Mx793OPTIBJVuf/bPO9IC6rUZceSzTzWyeZJiJlRP4uQsJgghzSMAbQ5jx72TR7GU+6pN1hwE6aEejRtKJjh9y3tKft08zV4UOoaT/P3s24KdDjJuXFnMwVydJM4bNkp7yz5q118nX4Znpdk5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567318; c=relaxed/simple;
	bh=8IidKWQb6PDv+9QcRgdnroqcQT1ZJ9HF+prpfNElgMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDXCnv/JUutFXKB5wA46FK6sOqiChSx36U8MG0K9m96P8pUHiQmOa70EwpZ9b2uglZLULE+hrNGwZyLmp9G56z4uFA6XcoYQtbafQ7SNNcZ+EGSOH01Jg5s8cHHNisx+leYD2y0DG6E/nieZk6MLBaIaa48YrfWrHl9r+3PGW8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=jck1I5FK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="jck1I5FK"
ARC-Seal: i=1; a=rsa-sha256; t=1772567301; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TRVnT9O1NZ4kl3laP7/rfXlROieRI1JH+UOdhqObv2LttClc+KCRZfIb0rJIdsBbF7ZGnQF0E9qpXz1LhQXly77AOR3L/FCtG8qZUZxnqyBiDF3vOT1ecNlejTsGqvbLUvvbAs3X6HW9VU1/uj7IcfauDVsoAUquYB0Lwh1EO2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772567301; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cWKW70CzyWRfKpXpZuWrqBeuXkIL34U6KH4X/AyoKE4=; 
	b=Gky2nH140Z+yM1IJ1LEdu6501lJ040MTNgabun8xAbBt928cAhLbaP2NEPVxRNl2eU73Et1uAzGxc4kynYJDes8oAGPFbaGQlaxIW8cbaJBS9fz7fbebEtM4PjJw8Y1hUf3ENaXyE21kwhjtQS0bDA/WdOKNUXGY5AuDUBmSpcE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772567301;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cWKW70CzyWRfKpXpZuWrqBeuXkIL34U6KH4X/AyoKE4=;
	b=jck1I5FK5F6A0TF5PndDAXXW2EnJTdWUFQd/XW7oFR2gKGqS0F2bCbYkRqyeEB7p
	l6nunYz4B0oFtSqKa/xwR3+rBMKQpL3vsQpLRUVmG37F72C3hSwjPgYF6EbYQzLjNSg
	p1yL/jjfjIveDkqPzcBNJh0LeJ9DKrLCBUeX0HfPk5hjAmIYWUr7PCPPuXpBIt5/kOQ
	jG/1JjZfM0X0MFnNRqjmFTAYrf0l0pOjVbXmj68+94IE3EMRWPN7OJLZNTJQoR1aN54
	mpHe6ejnGGzS2+aSkfCnr0EdnjY0Q0aeCicBinq6Gbt2tk0UeYXvvrRzqPPrOzN3RFP
	KrrZnOIrUA==
Received: by mx.zohomail.com with SMTPS id 1772567299007644.4348995233211;
	Tue, 3 Mar 2026 11:48:19 -0800 (PST)
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
Subject: [PATCH v3 2/8] ALSA: usb-audio: Add helper function for volume range checks
Date: Wed,  4 Mar 2026 03:47:57 +0800
Message-ID: <20260303194805.266158-3-i@rong.moe>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303194805.266158-1-i@rong.moe>
References: <20260303194805.266158-1-i@rong.moe>
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
index df0d3df9c7ec..f52ca0d7e665 100644
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
2.53.0

