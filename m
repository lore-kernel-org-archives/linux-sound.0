Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451054;
	b=slSls3Zz0RjV9nt/LiMCsu29p9pRMZLK69PU0gwix55dUEvgyppgJhatyTY5hFM8r3Db
	 EDQBh/B5IRwtQKA+UevTtN0ZxtPb2AN3JCufKmNHo03ZdJGk7DCE2PeQAp/rieqtOqWqu
	 yyHDOtVK1ss1rkYLZnVxBY2j63854rncRtGYHHRPHkg+q5Z3TQ8MnzyaHt8cFV8OYv307
	 QdS4KZsHCM1lhxr0Gu6vA8kLpxwUwZaPxiwHHUxXGaBAhj/gp9e05fvmhVsg4g3vz7MFD
	 5tPEyRvwViDENXfUafuIekfUeN34YOAGDts83wtwdMpRXfyKHY/lMevsXdPcPQuoYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
	b=BvwpsxuoA4e7z6d/SFHO+408E9l0NcRLeBfNqQJFbL/axeEQoIPdCj5Uf8SfuzO/kE/K
	 v/qjLFAVXPyEOQtK7XaYmFduX0if6eDvkdVgVTMADPwZTL3aM+/vzq8IaeKPPs7sxdHbC
	 MHKiWSc3rAMbFCK6aef2pRNtzQFE2TTdPBgdMw5XlRAjFRGNe5z2GfMmcFkDZ2e1Ve+62
	 8IBljb49fCHDc0wFG9X6i45XeqZNZhjeFcqwakWrqsbirebGDVCaLsWbMKML8r8MPXbqs
	 tSVdjT87lAA9i2izS+6umDbrUDyC+bJn/G+sNTS5qCoeDjQpleO1bvf5Ag6ReBAEkZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Zce0Py;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA48606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0Zce0Py
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4adf4431ca0so1027540fac.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 18:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451053; x=1795055853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
        b=i0Zce0PywtrG7piZ23OflFxv23LyVh6JOzgVUoZVFQCkKPKKtrz0tNuJyT9uMvf8cY
         lpR+aASWPy4+SRpuZjvXQG3nOBcAMvEGp4DIlqHfhYW+oUsKkygi9aLxq9B12TulW/2r
         WdCqD85prszls+u95OteXhyQKBp5nbzbWLNSPKY6pGePOaww6MRKZXA30azxTZNH90ZM
         ZDRn3RLt2DAp2NPd+0R/9gfw1FAUeDVNXdJrnprUvoEaR7zyhrvJvc9KYsiE3pL+3YIf
         7jOn0qKo9aQbXqcPfuum8apvLLxOy8bscGuiC6Tl5R2b1VefkxrO5KtHGHU4D887KF76
         qiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451053; x=1795055853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6W0fNXslGyBParY8Oqnxf9aa5mpuA6VW71AbceQTcxE=;
        b=FFGJ60xZOh9FHsaOooW1W/aGF/PiIbFQ2dUDdjiTxq4EIg6ZOJXkjqnN47xLZTyp2Q
         51p46zEbum1OmgVyJRalAWVpK3ky3nl5+EFFCJ3dr5DkLD7KGbuktIQ6CQzBEZzG/1o3
         W8Kj7r3XlMFzh9z5siZFdnHHbaVLpZmlq4iDUEQF8q4AbcrVfLc4VNtY9nDO80CiLcnS
         ImUi0yMWzY+URC+GH2xM75216onJ5Snev4QbG1rgSHnB5r412aeRjiVz9HusrKXy/+yz
         mnDarAtju4rQyH9QY2BMHkOUUpRBD5rDfD9L2sOMio6G0iz1ITW3bPvpf21cEPu5fVoE
         jHaA==
X-Forwarded-Encrypted: i=1; AL+hErHf9l0rabCwImkMv9HaMxTH1ISpBJ8p3usXHg77f9AC9lNinhWcSGPJ9ErhO2bQLeokuMnCqpP8DHQHhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z91G0Y2evPrtc9wWCHQMl3tCtzQpZ4aeNvkkfL9HVC7peVRdecW
	7uYsq4cSOx5oAVdaI8mTPb/j+nidC7UtRYToiQL7DVF8c0XCuUu7sp9l
X-Gm-Gg: AYBFou2mx/1JVJEgjbeY4NW1gTt9e94zVmz/6waJSBLgiDJaEO0HB13XTmfzckQ8wYF
	lFfZo+wlAVmWHkK5duMP6VtrM8oVA5aFv6rmeJndySg60m4tz6luNI+l2V0GSwrS8TWosgyGgTJ
	F6A8u0wWBk+SjsbrTH8C6140FLGI2D840fxlIFcQCvW32J/xl2RL4AokLgSIEcK5z/PQ7LI8BNy
	nVUOu+uONJ8AloqY5QZvWIch9jjRLddltqNmVzEMwiAb3Mllj/xS69k7anMe+w1eJh6ZHQeQtIs
	PruVa2QbqPMnkcxEYFzgdQMHTb6RlM78yQ8ZRaICKceb4hj6KLnXEIq+MfnR0rREPSQ5Ni4RdWE
	a3WyTJP1mLByXN00f990mn+2xPVTddIfbMPhlkmjO2zJsDbZjNNPAfzEhAgVARjylh8+g548OoY
	8x10d8eog9BfQBeRSlcRPCpDjI1P2QESSnVK2QqvpXWrKX4YNmS+9fzdvMrS+SHH4X0Wzm/GlvO
	nmU7ppKlU7oSpxEuqgfe2dAQSvSQMw2uM7D7GEaGV1hFWzrD+FYH5YSP/lm0MB7WG3KkaaTlyob
	Z6RNAFluiYcPnIRMafXqUj1C1s+6NxERhlEwnAi7MCJlv5ShWNoHrgbQEnbS7yV0xDg=
X-Received: by 2002:a05:6870:d1c3:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-4ae4682ad7amr3465583fac.7.1794451053171;
        Wed, 11 Nov 2026 18:37:33 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:32 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 1/6] ALSA: mixer_audient: Fold in the review changes to patches 12-16
Date: Wed, 11 Nov 2026 20:37:15 -0600
Message-ID: <20261112023720.1503814-2-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <avOFQAGTVkCXgs2l@khmer.arcnet>
 <20261112023720.1503814-1-mrwillporter@gmail.com>
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

This patch is not for merging. It carries the changes from the review
of RFC patches 12 to 16 as one diff, so that the patches after it apply
to the RFC with the enum fix. The next version of the series has these
changes in patches 12, 13, 15 and 16.

- Declare snd_audient_int_max(), snd_audient_int_min() and
  snd_audient_int_from_ctl() inline.
- snd_audient_enum_item() returns the item or -EIO, and get propagates
  the error.
- snd_ctl_audient_info() uses a switch.
- A comment on ID14_ENUM() says that readable enums do not use init.
- The two case labels in mixer_quirks.c share one call.
- Rename the create hook to extra_init and say that it is optional.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 58 +++++++++++++++++++++++----------------
 sound/usb/mixer_quirks.c  |  2 --
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4180d7d8b325c..df1e25a55a7a9 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -219,6 +219,11 @@ SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
 		.sel = (sel_),				\
 	}
 
+/*
+ * A readable enum. It has no cache entry, so a get always reads the device
+ * and never uses init. Write-only enums set .init and .flags without this
+ * macro.
+ */
 #define ID14_ENUM(unit_, sel_, len_, enum_)		\
 	{						\
 		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,	\
@@ -494,8 +499,8 @@ static const struct audient_devinfo {
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
-	/* controls the tables cannot describe; called after the tables */
-	int (*create)(struct usb_mixer_interface *mixer);
+	/* optional: controls the tables cannot describe, created after them */
+	int (*extra_init)(struct usb_mixer_interface *mixer);
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -508,7 +513,7 @@ static const struct audient_devinfo {
 		.controls = snd_audient_id14_mk1_controls,
 		.matrix_names = snd_audient_id14_mk1_matrix,
 		.matrix_channels = 2,
-		.create = snd_audient_id14_mk1_create,
+		.extra_init = snd_audient_id14_mk1_create,
 	},
 	{ 0 } /* sentinel */
 };
@@ -779,13 +784,15 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
  * With a step size (res), an integer control counts steps from min:
  * 0 ... (max - min) / res. Without one it shows the device value.
  */
-static long snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
+static inline long
+snd_audient_int_max(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? (ctype->max.integer - ctype->min.integer) / ctype->res
 			  : ctype->max.integer;
 }
 
-static long snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
+static inline long
+snd_audient_int_min(const struct snd_audient_ctrl_type *ctype)
 {
 	return ctype->res ? 0 : ctype->min.integer;
 }
@@ -802,8 +809,8 @@ static long snd_audient_int_to_ctl(const struct snd_audient_ctrl_type *ctype,
 		   snd_audient_int_max(ctype));
 }
 
-static long snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype,
-				     long val)
+static inline long
+snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype, long val)
 {
 	return ctype->res ? ctype->min.integer + val * ctype->res : val;
 }
@@ -896,16 +903,16 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 	return changed;
 }
 
-static unsigned int snd_audient_enum_item(const struct snd_audient_enum *e,
-					  u32 value)
+/* The item index of a device value, or -EIO if the value is not in the list */
+static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 value)
 {
 	unsigned int item;
 
 	for (item = 0; item < e->items; item++)
 		if (e->values[item] == value)
-			break;
+			return item;
 
-	return item;	/* e->items: not in the list */
+	return -EIO;
 }
 
 static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
@@ -929,8 +936,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
-		unsigned int item;
 		u32 val;
+		int item;
 		int ret;
 
 		ret = snd_audient_raw_get_one(mixer, ctype,
@@ -942,8 +949,8 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 			return ret;
 
 		item = snd_audient_enum_item(ctype->enumeration, val);
-		if (item >= ctype->enumeration->items)
-			return -EIO;
+		if (item < 0)
+			return item;
 
 		ctl_val->value.enumerated.item[i] = item;
 	}
@@ -1002,22 +1009,25 @@ static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
 
-	if (ctype->type == SNDRV_CTL_ELEM_TYPE_ENUMERATED)
-		return snd_ctl_enum_info(uinfo, snd_audient_kctl_channels(kctl),
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
+		return snd_ctl_enum_info(uinfo,
+					 snd_audient_kctl_channels(kctl),
 					 ctype->enumeration->items,
 					 ctype->enumeration->texts);
-
-	uinfo->type = ctype->type;
-	uinfo->count = snd_audient_kctl_channels(kctl);
-
-	if (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
 		uinfo->value.integer.min = 0;
 		uinfo->value.integer.max = 1;
-	} else {
+		break;
+	default:
 		uinfo->value.integer.min = snd_audient_int_min(ctype);
 		uinfo->value.integer.max = snd_audient_int_max(ctype);
+		break;
 	}
 
+	uinfo->type = ctype->type;
+	uinfo->count = snd_audient_kctl_channels(kctl);
+
 	return 0;
 }
 
@@ -1332,8 +1342,8 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 		}
 	}
 
-	if (info->create)
-		return info->create(mixer);
+	if (info->extra_init)
+		return info->extra_init(mixer);
 
 	return 0;
 }
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 41d559d639d22..763bbeb2cd9da 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4541,8 +4541,6 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		break;
 
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
-		err = snd_audient_controls_create(mixer);
-		break;
 	case USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID): /* Audient iD14 MkI */
 		err = snd_audient_controls_create(mixer);
 		break;
-- 
2.47.3

