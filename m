Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997047;
	b=SyCVy4iyqVwW+8CU4c3CaOuUx7HN+7pRsWGs+9b6emNm+6KK6gJLVHKh0gx+YUPm5D5d
	 JCCddcDlIv0z2EDWviwnmtvjai8dPMMLx1EiwjDu3qVGRCv2XmrEOKvwUiz1rr8psgGvl
	 edwuhP8y5CgGRO5TU2Z3oNG3X9U5v6B0LjL9bhpDs1B2zUTB3KVBd68yOu9aCJQW56mcg
	 4cszRW6ZENTPlCuIqXB4R/Y86q1+lwpeuulMPd6PIw7YrUfLW0KNEKfp899YEnzIZAYcz
	 uuocQV9Wxky15F8SAIRZKVP4IZJG3XDQmHLAeN510i7Jz+wUtoSDvHoby5zT27LI1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
	b=uRHMnu653mypmUkYZLmYOXZRh2L9B72yqd1eLSeord51nm312Xpzyew2hJ+rVG9eH22g
	 vbmb1B/Fdd1LHrqmBCgW2hEsU18kZ/83FKfQYp5ZIRaYS61ROJKI8hCFht1sczbvkel4P
	 Cb1LF1GE/UZi4wnuXn2f9RZ6hNmi71lMvFBYZkE8Vr7hAC4jAAtVALZZ4/AwY1Ur/76we
	 z6fK0Jc2vN2tVWytMpkjNJFV+h8HNailc5MTF9ZaODMivdVHW5MTDyxEfSCCD/DEzUMRP
	 zL3PS7pIGmIrscR2blCD+UH66q8mLBPacsv2L6nMCCHRJ7kXMBTVeuWvERC4XIiQRGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fONB6Qyh;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45451606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 20:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45451606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fONB6Qyh
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d68de53053so717274eaf.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997045; x=1794601845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
        b=fONB6QyhII8LrA6wEFGjTRJ6FJk1LtaqVCn8unkx3BDDhO6PUzVJz47bWgDSuGxGCr
         VeCmMaNEvmFoZNrrHqlxPk2GryAaGsnRVC9ivNok26vCQJZb5ZUAiPl/JW3UM11fZNOt
         +aQ53Teci6NJ+dfRv+iG1dSxJqF1mDdG+3ym0B3x/L4WIomKO1sH/2ww/JI6PEMSwsH0
         lUEBg85NJZ6IhyQPvImzaiOFHR7yVB/45QDSOZwa41/opfXfhR5pjW6an1GCfSrqP1n0
         KoHt/UkEVQn7m90THv1WCTDcNfsSbAGUdWM1YikKSizHf5B2baniOGMfnDoM2JxTQkdT
         sIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997045; x=1794601845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDl5/MgXQuCQFzdaeynJUphUR2A+eiDxz+hBUu35V5U=;
        b=2S9Yc3MdJ+Nmvwl0rNY/vGN+zHsD6mxfBE3dNagAmXi7ZyJO1PkpVMLywXQ721o95u
         v0Fs0Jn5TAAD5Tb1k+Pj4zSqpwzbECReNwhvGQ/okynpdM4pDzTnD1iBqAbp58aNdFJ7
         WxUO+QuY7vWq05QNuQqaFfs6LXO0YVa3baWGMOwkYhghdBFgmSeqSgfLZjUveKG+JIKe
         UcZmY20ItHdOmhSGhV6ec/hIyy4LHJbG36lEPkDPO7YtW1SnI8Mg5K7fHjSK984jcnVL
         Pibi5+yq3OLySVkxhtvPHB034I/N8IKa8Oi6UVOftFfX1oJjrOypkcqZwXHyM1lO9P9W
         t3Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzg2MR2i5pixH5leC9BMIgpoo3hX+xDPe9tIlQ0mmM87C8OG1dC/TL663KERe7eJPcPsFfjIEH8gpHnJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yzq7RyE4xdXFYtz84BaDOFtWLZLKA0WKOusCV6r4y9r51K2Ev
	Q/tISp2xwLtzKRRVoOjfe8RNJH9wOPc84xvhgoVVzE9od09h0aPNxcTE/QHPQA==
X-Gm-Gg: AYBFou01pCHSwpyIXJQAsC1Ir9LTegeAQC2oKMEAmecSbS5KIP2I/C/JjxvB4Wuvcsu
	Qp/Qs1MLO+Dh5FWLVPUq8UEnb035vn9AFi4v2rhCC8sdmOm1mB30C47Mmm4RHSUJIWiyNP4ZGHP
	ZhdOGJ9RWm5vDFRkkOr+tLrOsxEv8D+qLcfaWf3sFx7J8pQ2Grlm9ugdeN1jH4PVIwD79h1lLty
	D1H3b1bMh3HzT0oHxu/eR2s4iBXh55QjiMurWpBUrBL23g4IFiBDLMUyQtJGDRkCM1ZJ1qMl0f+
	8uSHgW4CQVpyFEzjl4YLP6iUDwjA/EJKxU6lfqbZJ0fVzfAEcpIG075LDSdK2Fz2VyiFp7hlsH+
	H+UJJUMRYjgLDJpySTvLq+uOhG7GuPE9pYjA8C0exAjPPMloIsugAb1Ylxd8bjPXiQvZMRiSi3P
	ST90t0Iuqn1cDJLvNMig/JOMZD0vLRhsPAUcItB4ue0Pqtq2rWFxs1GbfLD5i2FAQjLuRzwWepz
	pL4HQTcw16fSSctSPmzbKgzfuIV6eszomYjB4dCl6wEJIiSy4cqqLUL/HNvVPn1+xQ/5dkfhT69
	23HHeqmNs0Uwqg2pxXecx+Nh2/EAwgDPssirxrI6Ae6+Gw==
X-Received: by 2002:a05:6820:2910:b0:704:4ad:9c47 with SMTP id 006d021491bc7-716e79e7188mr2022604eaf.68.1793997045017;
        Fri, 06 Nov 2026 12:30:45 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad979d7032sm2782071fac.7.2026.11.06.12.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:30:43 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Date: Fri,  6 Nov 2026 14:29:43 -0600
Message-ID: <20261106202943.1034941-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-201869@kernel.org>
References: <sashiko-outbox-201869@kernel.org>
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

Hi Christian,

The bot found a real problem in my patch 13:

> Does advertising ctype->enumeration->items + 1 items in
> snd_ctl_audient_info() while rejecting item index e->items with
> -EINVAL in snd_ctl_audient_enum_set() break the ALSA control UAPI
> contract for writable enumerated controls?

Yes. mixer-test writes every advertised item, and alsactl restore
fails on a value that store saved as the extra item.

The diff below drops the extra item from every enum:

- A device value outside the list makes get return -EIO. I chose an
  error over a fallback item: an unknown routing value shown as Main
  Mix could hide a route that bypasses the speaker volume, cut and
  dim. The device is not known to report such a value.
- A write-only value that no transfer has confirmed (only after a
  failed probe write) reads as its init value, as a write-only switch
  reads off.

Tested on the iD14 (stable 7.2.15) with the diff applied, with a
script that does the enum writes of mixer-test on this card only:
get returned every advertised item after its put (from the cache for
the write-only controls), and the item past the end was rejected.
alsactl store and restore of the card succeeded. I did not run the
full mixer-test, because it writes the controls of every card.

Does -EIO from get look right to you here? If the diff looks good,
I'll fold it into patches 13 and 15 in the next version.

Thanks,
Will

-- >8 --
From: Will Porter <mrwillporter@gmail.com>
Subject: [RFC PATCH] ALSA: mixer_audient: Advertise only selectable enum items

Every enumerated control advertised one item more than a put accepts.
mixer-test writes every advertised item, and alsactl restore fails on
a stored value of that item. Advertise only the real items.

A get of a device value outside the list now returns -EIO: an unknown
routing value shown as Main Mix could hide a route that bypasses the
speaker volume, cut and dim. After a failed probe write, a write-only
value reads as its init value; this does not confirm the device
state.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
Proposed change to patches 13 and 15.

 sound/usb/mixer_audient.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e65c62e1eac4a..4180d7d8b325c 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -67,10 +67,8 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 #define SND_AUDIENT_CTYPE_FLAGS_CACHE		BIT(3)
 
 /*
- * An enumerated control: item i sends values[i]. The texts have one item
- * more than the values. A put cannot select that last item: a get shows it
- * for a device value outside the list ("Other"), or for a write-only value
- * that no write has confirmed ("Unknown").
+ * An enumerated control: item i sends values[i]. A get of a device value
+ * outside the list returns -EIO; it does not show a wrong item.
  */
 struct snd_audient_enum {
 	const char *const *texts;
@@ -85,7 +83,7 @@ struct snd_audient_enum {
 		.values = name##_values,				\
 		.items = ARRAY_SIZE(name##_values),			\
 	};								\
-	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values) + 1)
+	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values))
 
 /*
  * iD14 MkI units. The monitor controller, output routing, headphone level,
@@ -126,7 +124,7 @@ static const DECLARE_TLV_DB_SCALE(snd_audient_tlv_id14_vol, -12800, 100, 0);
 
 /* Mono mode: one-speaker sum (Left, Right) or phantom centre */
 static const char *const snd_audient_id14_mono_mode_texts[] = {
-	"Left", "Centre", "Right", "Other",
+	"Left", "Centre", "Right",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
 		 snd_audient_id14_mono_mode_texts, 1, 0, 2);
@@ -139,10 +137,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
  * mute still act on every headphone source.
  */
 static const char *const snd_audient_id14_route_main_texts[] = {
-	"Main Mix", "Cue Mix", "DAW Thru (full scale)", "Other",
+	"Main Mix", "Cue Mix", "DAW Thru (full scale)",
 };
 static const char *const snd_audient_id14_route_hp_texts[] = {
-	"Main Mix", "Cue Mix", "DAW Thru", "Other",
+	"Main Mix", "Cue Mix", "DAW Thru",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_route_main_l,
 		 snd_audient_id14_route_main_texts, 0x14, 0x10, 0x00);
@@ -156,12 +154,10 @@ SND_AUDIENT_ENUM(snd_audient_id14_route_hp_r,
 /*
  * iD key function: the value is the monitor controller selector the key
  * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
- * through the HID interface. The last item of a write-only enum shows a
- * value that is not known.
+ * through the HID interface.
  */
 static const char *const snd_audient_id14_id_key_texts[] = {
 	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback",
-	"Unknown",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
 		 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
@@ -170,13 +166,13 @@ SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
 /* Talkback source: the routing source number of the input; none = 0xff */
 static const char *const snd_audient_id14_talkback_texts[] = {
 	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4",
-	"Digi 5", "Digi 6", "Digi 7", "Digi 8", "Unknown",
+	"Digi 5", "Digi 6", "Digi 7", "Digi 8",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_talkback, snd_audient_id14_talkback_texts,
 		 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
 
 static const char *const snd_audient_id14_optical_texts[] = {
-	"ADAT", "S/PDIF", "Unknown",
+	"ADAT", "S/PDIF",
 };
 SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 		 0, 1);
@@ -933,22 +929,23 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
+		unsigned int item;
 		u32 val;
 		int ret;
 
 		ret = snd_audient_raw_get_one(mixer, ctype,
 					      snd_audient_cache_slot(elem, i),
 					      base + i, &val);
-		if (ret == -ENODATA) {	/* unknown write-only value */
-			ctl_val->value.enumerated.item[i] =
-				ctype->enumeration->items;
-			continue;
-		} else if (ret < 0) {
+		if (ret == -ENODATA)	/* unknown write-only value: init */
+			val = ctype->init;
+		else if (ret < 0)
 			return ret;
-		}
 
-		ctl_val->value.enumerated.item[i] =
-			snd_audient_enum_item(ctype->enumeration, val);
+		item = snd_audient_enum_item(ctype->enumeration, val);
+		if (item >= ctype->enumeration->items)
+			return -EIO;
+
+		ctl_val->value.enumerated.item[i] = item;
 	}
 
 	for (; i < nchan; i++)
@@ -1007,7 +1004,7 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 
 	if (ctype->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED)
 		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
-					 ctype->enumeration->items + 1,
+					 ctype->enumeration->items,
 					 ctype->enumeration->texts);
 
 	uinfo->type = ctype->type;
