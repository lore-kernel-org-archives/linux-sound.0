Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39534B437
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494953; cv=none; b=ihvy+wJrT02jwoItHlUX9L+JWus6ULngystJIXS8Zjqs5IIcep1uRtUq1Mlc1LubGz9569pRj0NPf05bR1pf9ovQa245pqPuqStVjGCxgG+j+U6XMP2u1gE2Z2wyI9+aih/QCzCZX7QPq/tz/S5n1KSruA1ahJne+14H5jcH8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494953; c=relaxed/simple;
	bh=iN5EhjeghjEgE3jMcQY9XrllmhdNPX/1Gcxt7iywidk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2eWgekalHoyMxcE6Ls44uD8/869Kw8F776rtFjDxTwlYFFN9+2Z04GTGq7ulMZYdKx1Ohl+3IbCa4ugVDQHVOUnKbUqqOCs/bI87Ep7KUoL7vXpbQXriAvfHEPNIDinuyNpZ6/HHfU5wdw/0eH9fXHxaA+IPqq8H0I5Fe7G9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzWVk7/l; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzWVk7/l"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2503998e87.0
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787494947; x=1788099747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/D+AGcffhLBkn0W3Q2qK3YzKcDS73n3F6MZc155ndM=;
        b=TzWVk7/laCIoRaVpiFngd41vwNyQqk61AInpZ/Qci8Iq5h+JWymUIL+LehogRzQlBa
         L9O8aap3SXCvoYUUiCOw7Ce+wHN3qnCRG5wJZ0N6xs9LvqrLw/JPl11yoCwWSxpSDgI/
         QdcQ+2jNgXY5XILnK0FxZ6rd8EtdyQYseZ8rftOaDu/fhyeleke2k0Skq0zj+XL/UQV4
         a6o8kTVuDOCtCIZ0alIW8QwaTBSYv40I1L5vbI+nTdjdhuZCZdmlDkPdZo4aYK4rX0X6
         LxM9+Ch9g8ewebjm31IETakInFAcC5xkZbsaLrkG7EkLfKTRah/6llthy0Htq38IO7Vq
         wg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494947; x=1788099747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/D+AGcffhLBkn0W3Q2qK3YzKcDS73n3F6MZc155ndM=;
        b=TXC1l2989h06PdxgbWF6qC2WTwEhWdN9gzSSS0noUJWyMo7sERBV6WpfRbJcmlgNVI
         6onhomTTvy0m4oqkQ7BE1VbO7ZeNq3igkNOBVY90oUZtcdILJsXVfUTccGcQ1O7V+z+I
         2KpRuE09/LV9A+bop8xVbfOsnk3NUK51l1ELer3SrNsEsWg3whCFrzLzVAajIuvNztn5
         PgZmWqVyllD3SAVdG0tLf6d7IF+8kfYMx+XuAP5gTOwW7at01+qd7TjWxdJ4d8TN8VV7
         2MfRfrUZKki/ytSmxERKK15JAiK92z66r0n8FuNIHkWDHB24WiGfNc75dVYq3NEfrSId
         6jbw==
X-Forwarded-Encrypted: i=1; AHgh+RobyxAKbMZp1uvop2a4bz0VeOa9cbQ94RmtP0BRAIJpnY0ii2K8SdL8pS2J3ctTGjuxtUkxh50kk/84Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lVS59VJBPpDapYJk6tLM3rQR98v1ba+2lBzK3vNQefRSVIrHkJ
	gEWgPsa6pA03WaK3rAFrHxdG8lcBFWQgVuazre3lUl0a+b+7OgulZqB/
X-Gm-Gg: AR+sD12+zofSOKefzOR0GMOV1kOpcplgjB9axlYj07Tc8za3TxiJdp9+hFDZfpXHr+Y
	eeqpNW+TSMrj9+s8BCaV+avSD6avvA/gCyPveK4d7uSLMybmZULlNr773IuFYiXntPYKf8azDsh
	8YQXZjyXN+fy+LhYc8BwJ0yJqQQfSWkff27sRbrm9z7x8T/xh/V6yjwibX/6KB0gwILfodnaEjt
	G1L289nZGJPy9V3oFZcuBFyxQIsIHDJ7hve/5UCDeSHuByNAfrRRTzkpx6hs52o1Gu6leA6XlFa
	zreqPxn4D6GZVAZUR0R6W1kz/gCEG6jadp+KSTa8jIMvnb+7EvCP76ipaoVsBIXAK7HJwP5h1oY
	NTU/8Vcqmt8D1W8z8JCytwBML9aj7PyKBquUmznfJYe0scdm6gCiW1kVM+zbsPzJ2nX8IqL91qF
	NL8X7EF5K3EFgwNZWg8p2DwMzDJbh7xzVDz1bMcp4bQ6tnIIvHVMG8g7e7GziC09fgDKAUZh1rO
	bOyAxF9y/PMEdMat3JxmwRLhz2EAX4QCMdn8ST7q2cQ2Q13pehndSPN2h5x
X-Received: by 2002:a05:6512:a350:b0:5ae:c201:c3d7 with SMTP id 2adb3069b0e04-5b48421a5a3mr4437913e87.8.1787494946632;
        Sun, 23 Aug 2026 07:22:26 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48cda2b73sm1006644e87.23.2026.08.23.07.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:22:26 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2 2/2] ALSA: usb-audio: let the M62's outputs say what they listen to
Date: Sun, 23 Aug 2026 19:22:16 +0500
Message-ID: <20260823142216.79704-3-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823142216.79704-1-mikhail.v.gavrilov@gmail.com>
References: <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
 <20260823142216.79704-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each output on this card has a source selector: it can take one of the
three internal mixes, or any input, or any playback bus straight from
USB. Which it is decides everything downstream -- point the headphones
at a playback bus and the card's mixer leaves the path entirely, along
with every question about what is summed into it.

That matters more here than it would elsewhere. There is no control
panel for the M62 on Linux, so a user who never runs the vendor's
application on another machine has no way to see or change this, and
inherits whatever the card was last told. One enumerated control per
output gives them the whole choice, and it does so without exposing the
sixty-cell mixer matrix, which without a graphical representation would
confuse far more than it helps.

The item list has "Unknown" first, and it is deliberate rather than
tidy: THE DEVICE NEVER REPORTS A SELECTOR. Not to this driver, and not
to the vendor's own application, which on connect pushes its entire
workspace to the card rather than asking it anything. So the current
setting cannot be learned at probe, and saying so is the only honest
thing a control can do until a hand has chosen. Selecting "Unknown" is
refused, since it is a report and not a choice.

The numbering the card uses has a hole where 4 and 5 would be, so the
item index and the value written are kept as separate tables rather
than one being computed from the other.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 sound/usb/mixer_topping.c | 125 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/sound/usb/mixer_topping.c b/sound/usb/mixer_topping.c
index 3405f28dec66..029f54865e22 100644
--- a/sound/usb/mixer_topping.c
+++ b/sound/usb/mixer_topping.c
@@ -125,6 +125,45 @@ static const struct topping_ctl_desc topping_m62_ctls[] = {
 	  topping_tlv_out_0 },
 };
 
+/*
+ * WHAT AN OUTPUT CAN LISTEN TO. The same numbering serves the outputs
+ * and the loopback returns, and it has a hole where 4 and 5 would be,
+ * so the index of a control item is not the value the card wants and
+ * the two are kept side by side.
+ *
+ * "Unknown" is first and is not a choice: the device NEVER reports a
+ * selector, not to us and not to the vendor's own application, which
+ * pushes its whole workspace on connect rather than asking. So a
+ * driver cannot learn where an output is pointing, and the only honest
+ * thing it can show until a hand has chosen is that it does not know.
+ */
+static const char * const topping_sources[] = {
+	"Unknown", "Mix A", "Mix B", "Mix C", "IN 1", "IN 2", "IN 1+2",
+	"AUX", "BT", "OTG IN", "Playback 1/2", "Playback 3/4",
+	"Playback 5/6", "Playback 7/8", "Playback 9/10",
+};
+
+static const u8 topping_source_value[] = {
+	0, 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
+};
+
+struct topping_enum_desc {
+	const char *name;
+	u8 target;
+	u8 prop;
+};
+
+/*
+ * The selector answers on ONE target of an output's pair, unlike the
+ * volume and the mute which must be written to both.
+ */
+static const struct topping_enum_desc topping_m62_enums[] = {
+	{ "Headphone Playback Source", 0x64, 0x02 },
+	{ "OTG Playback Source", 0x62, 0x02 },
+};
+
+#define TOPPING_NUM_ENUMS	ARRAY_SIZE(topping_m62_enums)
+
 struct topping_mixer {
 	struct usb_mixer_interface *mixer;
 	struct usb_interface *iface;
@@ -139,6 +178,7 @@ struct topping_mixer {
 	spinlock_t lock;	/* guards val[] against the URB */
 	int *val;
 	struct snd_kcontrol **kctl;
+	int sel[TOPPING_NUM_ENUMS];	/* what a hand chose, or 0 */
 };
 
 static void topping_build(u8 *f, u8 target, u8 prop, s32 value)
@@ -312,6 +352,58 @@ static int topping_ctl_put(struct snd_kcontrol *kctl,
 	return 1;
 }
 
+static int topping_sel_info(struct snd_kcontrol *kctl,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(topping_sources),
+				 topping_sources);
+}
+
+static int topping_sel_get(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct topping_mixer *tm = elem->head.mixer->private_data;
+
+	ucontrol->value.enumerated.item[0] = tm->sel[elem->control];
+	return 0;
+}
+
+static int topping_sel_put(struct snd_kcontrol *kctl,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *elem = kctl->private_data;
+	struct topping_mixer *tm = elem->head.mixer->private_data;
+	const struct topping_enum_desc *d;
+	unsigned int item;
+	int err;
+
+	item = ucontrol->value.enumerated.item[0];
+	if (item >= ARRAY_SIZE(topping_sources))
+		return -EINVAL;
+	if (!item)
+		return -EINVAL;	/* "Unknown" is a report, not a choice */
+	if (tm->sel[elem->control] == item)
+		return 0;
+
+	d = &topping_m62_enums[elem->control];
+	err = topping_send(tm, d->target, d->prop,
+			   topping_source_value[item]);
+	if (err < 0)
+		return err;
+
+	tm->sel[elem->control] = item;
+	return 1;
+}
+
+static const struct snd_kcontrol_new topping_sel = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = topping_sel_info,
+	.get = topping_sel_get,
+	.put = topping_sel_put,
+};
+
 static const struct snd_kcontrol_new topping_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
@@ -354,6 +446,34 @@ static int topping_add_ctl(struct topping_mixer *tm, int idx)
 	return 0;
 }
 
+static int topping_add_sel(struct topping_mixer *tm, int idx)
+{
+	struct usb_mixer_elem_info *elem;
+	struct snd_kcontrol *kctl;
+	int err;
+
+	elem = kzalloc_obj(*elem);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer = tm->mixer;
+	elem->head.id = 0;
+	elem->control = idx;
+	elem->channels = 1;
+	elem->val_type = USB_MIXER_BESPOKEN;
+
+	kctl = snd_ctl_new1(&topping_sel, elem);
+	if (!kctl) {
+		kfree(elem);
+		return -ENOMEM;
+	}
+	kctl->private_free = snd_usb_mixer_elem_free;
+	strscpy(kctl->id.name, topping_m62_enums[idx].name,
+		sizeof(kctl->id.name));
+
+	return snd_usb_mixer_add_control(&elem->head, kctl);
+}
+
 static void topping_private_free(struct usb_mixer_interface *mixer)
 {
 	struct topping_mixer *tm = mixer->private_data;
@@ -479,6 +599,11 @@ int snd_topping_init(struct usb_mixer_interface *mixer)
 		if (err < 0)
 			return err;	/* private_free cleans up */
 	}
+	for (i = 0; i < TOPPING_NUM_ENUMS; i++) {
+		err = topping_add_sel(tm, i);
+		if (err < 0)
+			return err;
+	}
 
 	err = usb_submit_urb(tm->urb, GFP_KERNEL);
 	if (err < 0) {
-- 
2.55.0

