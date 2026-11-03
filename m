Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705529;
	b=K9pjSKDuHpN7eNGfDAOlymFgvRbuZwNL+awqHHTWKQJfdK8ECDC6yMqocJRd2WgHHs9X
	 nd3NqkKMR6h/zWm13Ohf2t8XDZ19z9mcKxm7fyIJUV64yFyH35Yds8UhGVFN7K/rEbziD
	 pagV3DjrBN288+LK2bSwT6eKgEcuYhM0bsTeivG8cle19uSVtKvYLPL3sGN7Olu8SsuUQ
	 xKSU++mm4hPahnhKH2CXzfTEOnbm+o5hKxVayqeL/Bv8N36eTANXnCeK7HQC6ZpAwLN62
	 Ku8AZ/VP+v+cioCL7/egO+t9hVmpsz0mWJkJilibT/cyxe4xbjLfl2RbC1dKpExVzTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cHxQy9d8se/+NwmvN4QvVdPtQ30y022hLhYzn29U0Ro=;
	b=zBRD2r6d4EQ4Aiyx96rYBG+SxSOZJp3ScZIT78TunpvhRTV2rydo8/vap+MiRCLj7RMF
	 xe5jnG1nO0T0BaNjs/+/e9XsBG9RlbHb4kcQCtHalpBXF611Eq9cpcpTqTFimn9J3nIvm
	 yAnUJsRUIDH5LYa7gzS327P4bIYxHsSwzI+EPXtJlGfUdE5ajlrVPDMrHNbYE+lHA8cyr
	 eOqkAMz5PqkFbRQmfkHoM6o9Jhy+GLOj8wGT0aHBCAICPgaSLr5YnqolN0QKlwoOZr1rn
	 asmrBXcnV2A7MkwPns55H7JVOOFhrCxiQSyIfpXN4bjTFfnTnwccp0lP5g1INUP4coA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnOBdZju;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E13606A33F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 11:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E13606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnOBdZju
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8fe8e343fso27040225ad.2
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 03:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705529; x=1794310329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cHxQy9d8se/+NwmvN4QvVdPtQ30y022hLhYzn29U0Ro=;
        b=SnOBdZjuvsXIOIAPvqmTfZxOb8Orr59NOSae+Z8oVdqbuO0nd4MMrqF/lHMiSVNAHI
         rU842HrhbNDFvHLvh3JZh3NgIxG6ZRu3he64OfGmrkf4BSzO8FlWHP5osR3WF8jOA//n
         WF1RpYajdVadgVrp9XqTNwBgKrG+tyW4Y2GviAxa9NRjkz5+foD0jz9k28Xqhp6YwpT6
         G0ZD5SeIPdICvlJCa67PXswg8wikoNvurHkIPveqo9vAFQG+Ei3lr2LfGP6GMnSJYbag
         Ak9LxHBSfqYyJsV9+slN6Y+SAZHGeeJQNBqSL1W2s2IvMbpRxraszh2983OsLSviWd4z
         ouFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705529; x=1794310329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHxQy9d8se/+NwmvN4QvVdPtQ30y022hLhYzn29U0Ro=;
        b=cCg2+/Z57VeDsWGrYHRa7a3S6iaOS4VnOJb+ze8X07l+Wow1dQSaVnHVSZyRrtehb7
         tWmaKtPT2GptqTrQWmnZqdUZ/U7GCdZ7kadX6W4d/mwpnG1CkIcN1asnKbGk3WMjbqzq
         LM2xyNV8OIrxIGDt/T8borGxJ5XqJ6IzkXF6C0oZ6uGBE9aFg4GFFITo57frOALNHUXr
         9a5tn9f+KJ85rVhNS3ywPWmH4MI0y9KfMEAJIpdW7874Mk6q0bfKQD+ezUqaw3h5Hweg
         WVcdoXP9nnYZYBAqI9efQQfQkgkLUsYjE+lPMtN4BRS7vfDEFWhddyrkzzQNpfMrMcLI
         RaKg==
X-Gm-Message-State: APuU4Z8cOAPDvA6hT9XFK2RFdp2c2QyOZhv7dW2vqMf4Uq0eGAVFJdNT
	WDDZ9EGaGwPQ82S4pJzzZnoZqUL22VzGoum201BQarJjk0i7m+UeTPZ2
X-Gm-Gg: AYBFou0dgacVJjXUrZjlMTZDCxQGV1yGC5hZh8WuNbCxJ/T4YLqxYZG8O3aaEw+gp1A
	ATmZhM1qTnyOpKXzYjFF4Mkx0/rhCiR6DNMvGK9Qb0tl1ZkQzZekHSgcDBu4ON/TIVWAWrGeMrf
	VrM4xf4EkoAPl6wuCICFLbquGBBrQPdWGT65iw6b1vY5eNFU4Xlquv4l81j+oZsVyQbZcjoBi+F
	CmMcoHSP4eRjammwWNkBUPFxsb6nrcoEeQs/ralLCARKcvgbGeOgVWxz10UD2if0OYAhSFa3X/2
	viQhrozDSwUcOYcgapOJpsVRL/r4HevZvT+y5tPg701BWIfvtpo3CU0A6IaY/oFcWqcJrOjqV0E
	YJR4KzCJbvIXbbsKcm2Egj4yo7W/BrTfhhXNW9Rev//hCLI/B204XXAQrmGH7tj3iaYMQZsBoA5
	5jBUTLheEdZiTVz6hXAPd+lkhPHNN3vO4NvQDLqNf1D3zfGBmcUlMr4TNkPK+xz1ew5RDBZs8Ht
	eaXDaK8SO5ciCXezI2C0FpJ1koRmU0qe5KbRkuNzee/jrclS/FYwszFjz8Jo+Rj/b/Xi0uRy06Y
	u9SqslnRHeRWoZkydmO3oUjHCXXh8w==
X-Received: by 2002:a17:902:ef45:b0:2e9:5b20:1c2b with SMTP id d9443c01a7336-2eb36396190mr107150025ad.5.1793705528546;
        Tue, 03 Nov 2026 03:32:08 -0800 (PST)
Received: from AD03042041 ([115.137.252.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm40770865ad.34.2026.11.03.03.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:32:08 -0800 (PST)
From: Deukjung Kim <mentalese@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deukjung Kim <mentalese@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add Arturia AudioFuse 48V/Main mute mixer controls
Date: Tue,  3 Nov 2026 20:31:38 +0900
Message-ID: <20261103113138.39209-1-mentalese@gmail.com>
X-Mailer: git-send-email 2.53.0
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

    Add mixer quirk controls for Arturia AudioFuse (0x1c75:0xaf02):
     - Input1 48V LED Switch (wValue 0x0001)
     - Main Speaker Mute LED Switch (wValue 0x0500)

    Values are written with a class MEM request to entity 0x46 and the
    initial state is read from a 178-byte status block of entity 0x47.
    Protocol reverse engineered from Arturia AudioFuse Control Center.

    Signed-off-by: Deukjung Kim <mentalese@gmail.com>
---
 sound/usb/mixer_quirks.c | 188 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5eee501948fb..97f4c581e902 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
+#include <linux/usb/audio-v2.h>
 
 #include <sound/asoundef.h>
 #include <sound/core.h>
@@ -4419,6 +4420,190 @@ static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 	return 0;
 }
 
+/*
+ * Arturia AudioFuse (Rev2)
+ *
+ * The protocol was reverse engineered from Arturia AudioFuse Control Center.
+ * A parameter is written with a UAC2 class MEM request to the vendor entity
+ * 0x46 (wValue = parameter id, 1 byte payload), and the current device state
+ * can be read back as a 178 byte block from the vendor entity 0x47.
+ * Both entities live on the audio control interface 0.
+ *
+ * Layout of kcontrol->private_value: (parameter id << 8) | current value
+ */
+#define SND_AF_CTRL_IFNUM	0
+#define SND_AF_ENTITY_SET	0x46
+#define SND_AF_ENTITY_STATUS	0x47
+#define SND_AF_STATUS_LEN	178
+
+#define SND_AF_PARAM_SHIFT	8
+#define SND_AF_VAL_MASK		0xff
+
+struct snd_audiofuse_ctl {
+	const char *name;
+	u16 param;		/* wValue of the set request */
+	u8 status_offset;	/* offset of the value in the status block */
+};
+
+static const struct snd_audiofuse_ctl snd_audiofuse_ctls[] = {
+	{
+		.name = "Input1 48V LED Switch",
+		.param = 0x0001,
+		.status_offset = 0x3e,
+	},
+	{
+		.name = "Main Speaker Mute LED Switch",
+		.param = 0x0500,
+		.status_offset = 0x5c,
+	},
+};
+
+static u16 snd_audiofuse_windex(struct usb_mixer_interface *mixer, u8 entity)
+{
+	return (entity << 8) | mixer->hostif->desc.bInterfaceNumber;
+}
+
+static int snd_audiofuse_ctl_write(struct usb_mixer_interface *mixer,
+				   u16 param, u8 val)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	/* snd_usb_ctl_msg() bounces the buffer, so a stack variable is fine */
+	err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+			      UAC2_CS_MEM,
+			      USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      param,
+			      snd_audiofuse_windex(mixer, SND_AF_ENTITY_SET),
+			      &val, sizeof(val));
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+/* Returns the number of bytes read, or a negative error code */
+static int snd_audiofuse_read_status(struct usb_mixer_interface *mixer,
+				     u8 *buf)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int len;
+
+	len = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+			      UAC2_CS_MEM,
+			      USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+			      0,
+			      snd_audiofuse_windex(mixer, SND_AF_ENTITY_STATUS),
+			      buf, SND_AF_STATUS_LEN);
+	if (len < 0)
+		return len;
+
+	/* enable with dynamic debug: file mixer_quirks.c +p */
+	print_hex_dump_debug("AudioFuse status: ", DUMP_PREFIX_OFFSET, 16, 1,
+			     buf, len, false);
+	return len;
+}
+
+static int snd_audiofuse_ctl_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] =
+		kcontrol->private_value & SND_AF_VAL_MASK;
+	return 0;
+}
+
+static int snd_audiofuse_ctl_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	unsigned long pval = kcontrol->private_value;
+	u16 param = pval >> SND_AF_PARAM_SHIFT;
+	u8 oldval = pval & SND_AF_VAL_MASK;
+	long newval = ucontrol->value.integer.value[0];
+	int err;
+
+	if (newval < 0 || newval > 1)
+		return -EINVAL;
+	if (newval == oldval)
+		return 0;
+
+	err = snd_audiofuse_ctl_write(list->mixer, param, newval);
+	if (err < 0)
+		return err;
+
+	/* update the cache only after the device accepted the value */
+	kcontrol->private_value = ((unsigned long)param << SND_AF_PARAM_SHIFT) |
+				  newval;
+	return 1;
+}
+
+static int snd_audiofuse_ctl_resume(struct usb_mixer_elem_list *list)
+{
+	unsigned long pval = list->kctl->private_value;
+
+	return snd_audiofuse_ctl_write(list->mixer,
+				       pval >> SND_AF_PARAM_SHIFT,
+				       pval & SND_AF_VAL_MASK);
+}
+
+static int snd_audiofuse_controls_create(struct usb_mixer_interface *mixer)
+{
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = snd_ctl_boolean_mono_info,
+		.get = snd_audiofuse_ctl_get,
+		.put = snd_audiofuse_ctl_put,
+	};
+	u8 *status;
+	int len, i, err = 0;
+
+	/*
+	 * The quirk is applied for every mixer of the card, but the vendor
+	 * entities are only reachable through the control interface 0.
+	 * Checking this per mixer (instead of a global flag) keeps the
+	 * controls working after re-plugging and with multiple devices.
+	 */
+	if (mixer->hostif->desc.bInterfaceNumber != SND_AF_CTRL_IFNUM)
+		return 0;
+
+	status = kmalloc(SND_AF_STATUS_LEN, GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
+	/* a failed read is not fatal: start from "off" and keep audio working */
+	len = snd_audiofuse_read_status(mixer, status);
+	if (len < 0)
+		usb_audio_warn(mixer->chip,
+			       "AudioFuse: cannot read device status (%d)\n",
+			       len);
+
+	for (i = 0; i < ARRAY_SIZE(snd_audiofuse_ctls); i++) {
+		const struct snd_audiofuse_ctl *ctl = &snd_audiofuse_ctls[i];
+		u8 val = 0;
+
+		if (ctl->status_offset < len)
+			val = !!status[ctl->status_offset];
+
+		knew.name = ctl->name;
+		knew.private_value =
+			((unsigned long)ctl->param << SND_AF_PARAM_SHIFT) | val;
+
+		err = add_single_ctl_with_resume(mixer, 0,
+						 snd_audiofuse_ctl_resume,
+						 &knew, NULL);
+		if (err < 0)
+			break;
+	}
+
+	kfree(status);
+	return err;
+}
+
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4609,6 +4794,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x03f0, 0x0269): /* HP TB Dock G2 */
 		err = hp_dock_mixer_create(mixer);
 		break;
+	case USB_ID(0x1c75, 0xaf02): /* Arturia AudioFuse */
+		err = snd_audiofuse_controls_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.53.0

