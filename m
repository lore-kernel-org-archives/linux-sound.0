Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451067;
	b=5NJj1JJCLkGOu/2OePpAORpatI/SfHIerHHJZjICT1BFP6CCXlifKNWyZrkFDfmNLcOg
	 6xWbq9kk6/YbOX31MEZg1so6kxXuQoT5hZp+nRDxOGo3i4qI/kTdnrRpP4tN/VD8bLoSb
	 ajWKpKXxFIivkqzsP0MKzytkVbUeVbB8R+AoUFQhMXo4Vb4rUwUznTxSuN/MkWNxCmG/q
	 hnoQsus9Jp1LUWDOqWtjPLrK9+l1WpIn3saEfGrWID8Sz4OiFBAgQ6WX9iUjDKLJn4V8o
	 ped0Lk0oa0Fz0T3oXAAyX8aouSSzToRdKPJ7+V51ToMa1yGxdNZyBhGv5W3v8LG9w/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2mRXZGSPdgNHHT2/pZXAV6632ANYHD1Cc/qsuDMYNY=;
	b=DfZK0bGyD592JLZzXQFQDVXkWfD76Wy6xcMKko807paaIFqtEwF4htN2kJuoIUGY85Y8
	 dYRXZe5G4I3uUoKs0Ek1hd3NGPDSpmbNfhJalKVKAcwmuaCHRctW+he+mGxP2TIFqqIXe
	 TZyBfhESaCZygnU1KJBtCMynn+CQri7OaB9tD9Jyo/mBUIUL+v3gOfjq8Aec6y6msdFIR
	 Q53ll1r0y5zvRIps0+twrnmCfde3KkOTfFT9ZHntQclc6xejnNe9eY4MFcohd2NMVNEB7
	 IXL7mcnIVSvx9IPyl0Ua4Bp0d6lRhvqLzzlpEhnmG0WxKqfY8MY6j1IZTb9fnd/gfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWoUd8+O;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287560A261F
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2287560A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWoUd8+O
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-854b6e2e41fso1963663a34.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451065; x=1795055865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2mRXZGSPdgNHHT2/pZXAV6632ANYHD1Cc/qsuDMYNY=;
        b=GWoUd8+O6KpSoM4TF33IMaPMFGYRYBNMvUYdivSGT21Fn6lIETtCJbZtjjfHQFhHhv
         RRjk40hoEVCHi84dsW1y2zrIJKjxNn8iXkUIqkqz8iXzy/X2tGEq2+qsfteqsB3gN5dL
         TVFN2+V7nC/nJ0YtXZNHQM6nipV4SxbLizCVh/A0W2DrNpmpuo53DFQGAINpo08Fz5Un
         +VLigJHFoijz6TXqZuyqs4ZKK19QxtLsCo+4ARfxBmnl/hGO81APyYdIlkONsFU+SJkL
         W7UsRmgBzIlZ23ZPvkrCI7s/cJL1Mx+SR0A1JkF0ggWEM1H83hnT6hEPKRA4jXUsB7ya
         XKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451065; x=1795055865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2mRXZGSPdgNHHT2/pZXAV6632ANYHD1Cc/qsuDMYNY=;
        b=elkgSGpfvE6TupwEDSyoN1V9Ry1kl46IQclGKoan4lFeUvp9HeuwbVNT51dq6W2WN5
         pP78iIBEJcWQ/K2vapyjgfvGGHv0vICs6WD8/HsC6i6s25i+QvtTd0g+AL/6mj5sxvY3
         ot+Ke5luRhwd45Ty29yuuLq22NNrjOS4rrUYFUJP5ngTsEhm2MuLHS8Yfmcy/bD/TBF1
         e3aYJ0sflBTpah/eFEA+l4BhL1FwxUuHyJUQClYCjTLG8ZAoLn5XrDouPJPrW39yNfjN
         jfl/iHUxNSNR+VtzPRR48hKOHSnLthuZbknf0arRuolVKDA4WLcaIlU54oaFBO11KiA+
         KOoQ==
X-Forwarded-Encrypted: i=1; AL+hErG2cz/tIrKA2acoguniU3/FrjHA0K6GA2IGiSO0ovCeERlrb+bi6sXby72z9ugoQgCGcHCZtTRJ0PmOKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q0G779BA27txE4qlWwyBNUGeOr96m3e75svoLXweAEfbMieKf
	qeP7IKmkydFvEw+3U4U1pc8rn14RYX6K3nGCZ7GjmGWdb3QQxhI/em92
X-Gm-Gg: AYBFou1ezzbqKV0wsJI7/a1XPtX0FTvUlU0VvHbeL4XneBUTsPVHKLk7bzCDtirvmnP
	pbO9mX7P1qr6wkdNhME8jWiG+y5HERln8KvJnheCSiS3ZFZ9wSnvuNcmFeDXlwkEemN9dSzV4m/
	Gpaa7xM1lILeJzXo84T0REY2SXHWoO0txP8x8RoSWe9P+2+ziKun2Ij2SyxwquuIXbNYcRZXytW
	6BRjxyILlm73nX0viJ4o5pDIulJUv2yxrXA/QUpqOJAKKaTngLCd0siuWSxecNRcefktbpBdgYm
	DEHxZaly2BR4T3llxOev9BPyXPMhBtqoUzC3EJYyLC9cQ/xdjbcWVVrD+XUUcV4rm92Beh9E5gd
	pv/ieYRajb9wcfH8wPYldLpGW2T+ZaHGmji+hMj8Dv4q05L+nf6lkNZr/FAVohaVkR/6SY8I9gU
	RqDO77EQKo+1dPYipH3xfIz939gXWYqMsZ4/sBOymXDAhLap0czz5G4Iaagb1jyWX3mB5VS8A0i
	lIkLiRC1wM1E1l3WBu2XL5BKiYDCmWX7Bss78/CzLjB1nCgptwgz68U7Xz+846TWZkqEz8XBeKT
	93nmVRJoNugGGCSBcxBbrmLMc8EF6j2nDWRKSVgMjwkdFGLvYOrTnUYJmikPRoXffBQ=
X-Received: by 2002:a05:6820:c2d4:20b0:703:10f3:89dc with SMTP id 006d021491bc7-7191793f0camr2117052eaf.43.1794451065021;
        Wed, 11 Nov 2026 18:37:45 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4327310fac.6.2026.11.11.18.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:37:43 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 5/6] ALSA: mixer_audient: Use one get and one put for all control types
Date: Wed, 11 Nov 2026 20:37:19 -0600
Message-ID: <20261112023720.1503814-6-mrwillporter@gmail.com>
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

The boolean, integer and enum get and put functions differ only in how
they convert a value between the device and the control. Replace the
six functions with snd_ctl_audient_get() and snd_ctl_audient_put().
Three helpers switch on the control type: one converts a device value
to a control value, one converts a control value back and checks its
range, and one fills a channel that has no hardware.

The locking and the order stay. Put checks every hardware channel
before it takes the lock or sends a request. Get returns -EIO for an
enum value that is not in the list.

The get functions showed an unknown write-only value as off, as the
minimum or as init, by type. Every write-only control in the tables is
a boolean whose init equals min, or an enum. So init gives the same
value for each of them: use init for all types.

No functional change for the controls in the tables.

Assisted-by: Claude:claude-fable-5-2
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 284 ++++++++++++++------------------------
 1 file changed, 101 insertions(+), 183 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index ff7bf518743ee..edc568830366c 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -706,84 +706,6 @@ static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem,
 }
 
 
-static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
-				       struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer = elem->head.mixer;
-
-	const unsigned int nchan = snd_audient_kctl_channels(kctl);
-	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						= snd_audient_kctl_type(kctl);
-	const u8 base = snd_audient_kctl_cidxoffs(kctl);
-
-	int i;
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i = 0; i < hwchan; i++) {
-		u32 buf;
-		int ret;
-
-		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
-					      &buf);
-		if (ret == -ENODATA)	/* unknown write-only value: off */
-			buf = ctype->min.integer;
-		else if (ret < 0)
-			return ret;
-
-		ctl_val->value.integer.value[i] = (buf == ctype->min.integer)
-						  ? false : true;
-	}
-
-	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] = 0;
-
-	return 0;
-}
-
-static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
-				       struct snd_ctl_elem_value *ctl_val)
-{
-	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer = elem->head.mixer;
-
-	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						= snd_audient_kctl_type(kctl);
-	const u8 base = snd_audient_kctl_cidxoffs(kctl);
-
-	int changed = 0;
-	int i;
-
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i = 0; i < hwchan; i++) {
-		u32 buf = ctl_val->value.integer.value[i] ? ctype->max.integer
-							  : ctype->min.integer;
-		int ret;
-
-		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      buf);
-		if (ret < 0)
-			return ret;
-
-		if (ret)
-			changed = 1;
-	}
-
-	return changed;
-}
-
 /*
  * With a step size (res), an integer control counts steps from min:
  * 0 ... (max - min) / res. Without one it shows the device value.
@@ -819,106 +741,104 @@ snd_audient_int_from_ctl(const struct snd_audient_ctrl_type *ctype, long val)
 	return ctype->res ? ctype->min.integer + val * ctype->res : val;
 }
 
-static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+/* The item index of a device value, or -EIO if the value is not in the list */
+static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 value)
 {
-	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *const mixer = elem->head.mixer;
-
-	const unsigned int nchan = snd_audient_kctl_channels(kctl);
-	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						= snd_audient_kctl_type(kctl);
-	const u8 base = snd_audient_kctl_cidxoffs(kctl);
-
-	int i;
+	unsigned int item;
 
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
+	for (item = 0; item < e->items; item++)
+		if (e->values[item] == value)
+			return item;
 
-	for (i = 0; i < hwchan; i++) {
-		s32 val;
-		int ret;
+	return -EIO;
+}
 
-		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
-					      &val);
-		if (ret == -ENODATA)	/* unknown write-only value: minimum */
-			val = ctype->min.integer;
-		else if (ret < 0)
-			return ret;
+/*
+ * Convert a device value to the control value of hardware channel i. An
+ * enumerated value that is not in the list returns -EIO.
+ */
+static int snd_audient_value_to_ctl(const struct snd_audient_ctrl_type *ctype,
+				    struct snd_ctl_elem_value *ctl_val,
+				    unsigned int i, u32 raw)
+{
+	int item;
 
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		ctl_val->value.integer.value[i] = raw != ctype->min.integer;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
 		ctl_val->value.integer.value[i] =
-			snd_audient_int_to_ctl(ctype, val);
-	}
+			snd_audient_int_to_ctl(ctype, (s32)raw);
+		break;
+	default:	/* SNDRV_CTL_ELEM_TYPE_ENUMERATED */
+		item = snd_audient_enum_item(ctype->enumeration, raw);
+		if (item < 0)
+			return item;
 
-	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] = snd_audient_int_min(ctype);
+		ctl_val->value.enumerated.item[i] = item;
+		break;
+	}
 
 	return 0;
 }
 
-static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+/* The control value of a channel without hardware: off, minimum, item 0 */
+static void snd_audient_empty_ctl(const struct snd_audient_ctrl_type *ctype,
+				  struct snd_ctl_elem_value *ctl_val,
+				  unsigned int i)
 {
-	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
-	struct usb_mixer_interface *mixer = elem->head.mixer;
-
-	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
-	const struct snd_audient_ctrl_type *const ctype
-						= snd_audient_kctl_type(kctl);
-	const u8 base = snd_audient_kctl_cidxoffs(kctl);
-
-	int changed = 0;
-	int i;
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		ctl_val->value.integer.value[i] = 0;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		ctl_val->value.integer.value[i] = snd_audient_int_min(ctype);
+		break;
+	default:	/* SNDRV_CTL_ELEM_TYPE_ENUMERATED */
+		ctl_val->value.enumerated.item[i] = 0;
+		break;
+	}
+}
 
-	for (i = 0; i < hwchan; i++) {
-		long val = ctl_val->value.integer.value[i];
+/*
+ * Convert the control value of hardware channel i to a device value. A
+ * value out of range returns -EINVAL; a boolean has no range error.
+ */
+static int snd_audient_value_from_ctl(const struct snd_audient_ctrl_type *ctype,
+				      const struct snd_ctl_elem_value *ctl_val,
+				      unsigned int i, u32 *raw)
+{
+	unsigned int item;
+	long val;
 
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		*raw = ctl_val->value.integer.value[i] ? ctype->max.integer
+						       : ctype->min.integer;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		val = ctl_val->value.integer.value[i];
 		if (val < snd_audient_int_min(ctype) ||
 		    val > snd_audient_int_max(ctype))
 			return -EINVAL;
-	}
 
-	CLASS(snd_usb_lock, pm)(mixer->chip);
-	if (pm.err < 0)
-		return pm.err;
-	/* serializes the transfers and the cache, also between gets */
-	guard(mutex)(&mixer->lock);
-
-	for (i = 0; i < hwchan; i++) {
-		s32 val = snd_audient_int_from_ctl(ctype,
-						   ctl_val->value.integer.value[i]);
-		int ret;
-
-		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      val);
-		if (ret < 0)
-			return ret;
+		*raw = (s32)snd_audient_int_from_ctl(ctype, val);
+		break;
+	default:	/* SNDRV_CTL_ELEM_TYPE_ENUMERATED */
+		item = ctl_val->value.enumerated.item[i];
+		if (item >= ctype->enumeration->items)
+			return -EINVAL;
 
-		if (ret)
-			changed = 1;
+		*raw = ctype->enumeration->values[item];
+		break;
 	}
 
-	return changed;
-}
-
-/* The item index of a device value, or -EIO if the value is not in the list */
-static int snd_audient_enum_item(const struct snd_audient_enum *e, u32 value)
-{
-	unsigned int item;
-
-	for (item = 0; item < e->items; item++)
-		if (e->values[item] == value)
-			return item;
-
-	return -EIO;
+	return 0;
 }
 
-static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_get(struct snd_kcontrol *kctl,
+			       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer = elem->head.mixer;
@@ -938,32 +858,28 @@ static int snd_ctl_audient_enum_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
-		u32 val;
-		int item;
+		u32 raw;
 		int ret;
 
-		ret = snd_audient_raw_get_one(elem, ctype, i, base + i,
-					      &val);
+		ret = snd_audient_raw_get_one(elem, ctype, i, base + i, &raw);
 		if (ret == -ENODATA)	/* unknown write-only value: init */
-			val = ctype->init;
+			raw = ctype->init;
 		else if (ret < 0)
 			return ret;
 
-		item = snd_audient_enum_item(ctype->enumeration, val);
-		if (item < 0)
-			return item;
-
-		ctl_val->value.enumerated.item[i] = item;
+		ret = snd_audient_value_to_ctl(ctype, ctl_val, i, raw);
+		if (ret < 0)
+			return ret;
 	}
 
 	for (; i < nchan; i++)
-		ctl_val->value.enumerated.item[i] = 0;
+		snd_audient_empty_ctl(ctype, ctl_val, i);
 
 	return 0;
 }
 
-static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
-				    struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_put(struct snd_kcontrol *kctl,
+			       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_info *const elem = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer = elem->head.mixer;
@@ -971,15 +887,19 @@ static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
 	const unsigned int hwchan = snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						= snd_audient_kctl_type(kctl);
-	const struct snd_audient_enum *const e = ctype->enumeration;
 	const u8 base = snd_audient_kctl_cidxoffs(kctl);
 
 	unsigned int i;
 	int changed = 0;
 
-	for (i = 0; i < hwchan; i++)
-		if (ctl_val->value.enumerated.item[i] >= e->items)
-			return -EINVAL;
+	for (i = 0; i < hwchan; i++) {
+		u32 raw;
+		int ret;
+
+		ret = snd_audient_value_from_ctl(ctype, ctl_val, i, &raw);
+		if (ret < 0)
+			return ret;
+	}
 
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
@@ -988,11 +908,14 @@ static int snd_ctl_audient_enum_set(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < hwchan; i++) {
-		const unsigned int item = ctl_val->value.enumerated.item[i];
+		u32 raw;
 		int ret;
 
-		ret = snd_audient_raw_set_one(elem, ctype, i, base + i,
-					      e->values[item]);
+		ret = snd_audient_value_from_ctl(ctype, ctl_val, i, &raw);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_audient_raw_set_one(elem, ctype, i, base + i, raw);
 		if (ret < 0)
 			return ret;
 
@@ -1057,21 +980,16 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 
 	switch (ctype->type) {
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
-		knew.get = snd_ctl_audient_integer_get;
-		knew.put = snd_ctl_audient_integer_set;
-		break;
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
-		knew.get = snd_ctl_audient_boolean_get;
-		knew.put = snd_ctl_audient_boolean_set;
-		break;
 	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
-		knew.get = snd_ctl_audient_enum_get;
-		knew.put = snd_ctl_audient_enum_set;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	knew.get = snd_ctl_audient_get;
+	knew.put = snd_ctl_audient_put;
+
 	if (ctrl->hwchannels > MAX_CHANNELS)
 		return -EINVAL;
 
-- 
2.47.3

