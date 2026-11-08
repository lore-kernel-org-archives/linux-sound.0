Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794164324;
	b=VQBQi4saV8Xgz4MLxyJ6DppAjSyp3OCJHwjvAdMbQPTcuKtYvgrxT2MWdxJ2zn2k7a1D
	 wXWPl2GO5LqFagpky46a5z+GrLTu6C8x5RE5JROhjT2Ot8ihvViUu+Dbs1/QRy6/Aykpn
	 KrC7uDFGCoF/iYTvLep7C5uuooAfHVbNBWFHDFV1xpEuepXGOSUeDMTY49ZLKmEroBH3a
	 PMJlgTofVmnDwV8Y8R6i67jpjBCReDnIIzEtBYo57X2us6UWBkBt3WulMP35ovlZYBEW/
	 mIgnBLqaY1flgPf3t4odQKQh+8tvBnpI7+sdP0ybteHZbi6qkrquxvxxmamDZcLKp3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164324;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CsO6sgDlUkl/S8akvYgmR0TwDWH4wflTbAb12Tms+as=;
	b=EaQ0BITtlMPoxYqKOJpNKDwSXoKuC7tH0zbK7h6q/p+9NZ1AxAXOevM56vVBY9izcGnp
	 zI75VBknsOj6lPOimruK3jahGdWHtAAkypIxTLfWr0MoIahawj6IersVHaQNFg3ewmJ3p
	 mG+9r3ERqwG9xNTAk5FV8qEOv6M/gZiyw+llHe3q8pGQY4QwDxC3z2BnB8UuGzl2HhAhH
	 iyQ/BXA8qJZgYFQ8y9RglZt1QlM4UwkbfdYzPBd9fXe6s6VSOvPTRtbcJr7N6Q001EAPK
	 D7AddaKQS/Yhh+hMP0msOu2xRNY0k5k8exbg3GZ31Yks7vdBLJOwivoyyQUNDJAJ2zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7pcE2t9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DA606A321
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7pcE2t9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794164324;
	b=U5CzmfezDDG6WZ9TijhhRuYEclCwBXZnKDEiLuqtdUaWdtJ9jONvhC6JX8j/A47Mu00C
	 vIAK8tZF2t4bB7PEKGxAGBTsUVY+oqVDINSsNjMInHBGJ5Ns+qSVeh3ywgtJ92djz3bOz
	 j+/j6Rfx6qFTS9Cuko0q3+O0iDdS06i2V/czi4mJFk1cq+8ninuAiCIEO5r/rRmHBQotX
	 KNclfD4+rE4f5B5slpUGOOJ05sGxZQk1XXLMZsniZPryR3GZFd82HRf0/rjcG3vllmUn4
	 huz+PuK2MGK/AJ9XfIx2Oe3gUceaDCAqIHUcxDWQJqW3mTmkjWC3PAXag6BC5M5yrwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794164324;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CsO6sgDlUkl/S8akvYgmR0TwDWH4wflTbAb12Tms+as=;
	b=VpPAMOVZ7H+Sxwa2JN6jrnz6h0yUX7Fu0C6UmQjqYw4+sArwebVssZoV8e2lGZcPF7FO
	 1UHRNzyQ89UIeaew92bVQ/zNQd5/HOWx0tJ/5OQuoQifeFhEVlT7EUyD78hsuBmRjn2a+
	 nn00vV639GetyUdxpXFgSs3lkFdpFHSj/s1wWEpSHJTjUtfPLHgfFYzdQrRzVsAGiLqRK
	 HP494faX5gz/6YfHAnWx4knZ61oVe4KxQmWaQmxl0oJBWgqoz/pJLHjAScYMhzDS2gDWt
	 zby2j0aWjR5NeHO76nLn/urL2wJ9Cc20oQD1tqt6uMT2FSyosgEFltc2QMN5C7cfsow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED3BC1F008A2;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794164323;
	bh=CsO6sgDlUkl/S8akvYgmR0TwDWH4wflTbAb12Tms+as=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R7pcE2t9LDMBGHL4wsb0ILXe/GIEODWKXL0JCV+/XW4LU5TiqGBu0Wrtf16nzSUbf
	 ACpzAGsRR3D03HB7LJCBRePQH6uVnQDoMiaMaWLMYqdrlri7wCkS6TdT1MuhhyhxuX
	 1UGdc1ArhVKVgtzwUntJNOhArgSRB2Yz7JJiXPySCMUpyzYmnSv2Z3Vpfuv0S3S3X/
	 BclRPrnZotZrcz/4m2eWGojVbf+S70SXoShxNmz4wOxQA3j4azPaviU7NsGL2hPhFe
	 PzV1fIKdOFBjiBkmRmOeZ8bHV2eXO5T4UyyeKaNRqysf4OhSSefT+pNgrkGHfHX/zo
	 /zP9+wi/cK6kQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 73D6B4803B;
	Sun,  8 Nov 2026 18:58:42 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 19:58:38 +0100
Subject: [PATCH 2/2] ALSA: usb-audio: Add ES9219 speaker volume for ASRock
 X870E Taichi
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-alc4082-taichi-v1-2-942558088157@gmail.com>
References: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
In-Reply-To: <20261108-alc4082-taichi-v1-0-942558088157@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6121; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=CrUI3MaXbG+WmdY+DVmVexEKKmLG1d8AUhv7tprf/RU=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWR9OJbYtuD5rAubcn+u3ioX4fhThPlNFrd7v+sJ2caNU
 vmH3i1/0PGRhUGMi2GmmCLLgy85bxTib31zNbrkAjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 uBm4mZs6uzkYGpm4ujm5mJqbGRi5GJiaOjm7Gzk5mlhaGTm6OriaWDFycAjDXmE9kZPj4VDZNsn
 7Nvo1nxZX8/e5lZvgumdck/n1h1AvmA2v1sx8x/FPY5XjgxdOPLgcinFO4nA795Cp8c9tpwnI5i
 wfh7NfLe3gB
X-Developer-Key: i=ferringb@gmail.com; a=openpgp;
 fpr=E9C121C8F3E4519A7E8E7E39C5068414B0C044B7
X-Endpoint-Received: by B4 Relay for ferringb@gmail.com/default with
 auth_id=1454
X-Original-From: Brian Harring <ferringb@gmail.com>
Reply-To: ferringb@gmail.com
Content-Transfer-Encoding: 7bit

From: Brian Harring <ferringb@gmail.com>

The rear output of the ASRock X870E Taichi / Taichi Lite onboard audio
(26ce:0a0b, Realtek ALC4082) has a feature unit with only a mute, but an
ESS ES9219 DAC sits behind it which can be used for volume control.

The DAC is reachable through the codec's I2C bridge, using the vendor
requests found in Realtek's Windows 10 driver (version 6.4.0.2449). That
driver doesn't enable this for any ASRock device; at a guess, ASRock
simply overlooked it.

Assisted-by: Claude Opus 5.5
Signed-off-by: Brian Harring <ferringb@gmail.com>
---
 sound/usb/mixer_quirks.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 4c7d68311f20..075fb5847030 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4656,6 +4656,159 @@ static int snd_xiisound_init_fu_pins(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*
+ * ASRock X870E Taichi (ALC4082): the rear line exposes only mute (feature
+ * unit 19), but there is an ESS ES9219 DAC behind it that is usable for
+ * volume control.
+ */
+#define TAICHI_I2C_READ		0x3d
+#define TAICHI_I2C_WRITE	0x3e
+#define TAICHI_I2C_INDEX	0x0100
+#define TAICHI_ES9219_I2C_ADDR	0x48
+#define TAICHI_ES9219_REG_VOL1	0x0f
+#define TAICHI_ES9219_REG_VOL2	0x10
+#define TAICHI_ES9219_VOL_MAX	0xff
+
+static int taichi_es9219_read(struct snd_usb_audio *chip, u8 reg, u8 *val)
+{
+	struct usb_device *dev = chip->dev;
+	u8 buf[2] = { reg, 0 };
+	int err;
+
+	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), TAICHI_I2C_READ,
+			      USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_OUT,
+			      TAICHI_ES9219_I2C_ADDR, TAICHI_I2C_INDEX,
+			      buf, sizeof(buf));
+	if (err < 0)
+		return err;
+	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), TAICHI_I2C_READ,
+			      USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_IN,
+			      TAICHI_ES9219_I2C_ADDR, TAICHI_I2C_INDEX,
+			      buf, sizeof(buf));
+	if (err < 0)
+		return err;
+	if (err < 1)
+		return -EIO;
+	*val = buf[0];
+	return 0;
+}
+
+static int taichi_es9219_write(struct snd_usb_audio *chip, u8 reg, u8 val)
+{
+	struct usb_device *dev = chip->dev;
+	u8 buf[2] = { reg, val };
+	int err;
+
+	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), TAICHI_I2C_WRITE,
+			      USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_OUT,
+			      TAICHI_ES9219_I2C_ADDR, TAICHI_I2C_INDEX,
+			      buf, sizeof(buf));
+	return err < 0 ? err : 0;
+}
+
+static int taichi_es9219_vol_update(struct usb_mixer_interface *mixer,
+				    unsigned long pv)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	err = taichi_es9219_write(chip, TAICHI_ES9219_REG_VOL1,
+				  TAICHI_ES9219_VOL_MAX - (pv & 0xff));
+	if (err < 0)
+		return err;
+	return taichi_es9219_write(chip, TAICHI_ES9219_REG_VOL2,
+				   TAICHI_ES9219_VOL_MAX - ((pv >> 8) & 0xff));
+}
+
+static int taichi_es9219_vol_info(struct snd_kcontrol *kctl,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = TAICHI_ES9219_VOL_MAX;
+	return 0;
+}
+
+static int taichi_es9219_vol_get(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = kctl->private_value & 0xff;
+	ucontrol->value.integer.value[1] = (kctl->private_value >> 8) & 0xff;
+	return 0;
+}
+
+static int taichi_es9219_vol_put(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	long l = ucontrol->value.integer.value[0];
+	long r = ucontrol->value.integer.value[1];
+	unsigned long pv;
+	int err;
+
+	if (l < 0 || l > TAICHI_ES9219_VOL_MAX ||
+	    r < 0 || r > TAICHI_ES9219_VOL_MAX)
+		return -EINVAL;
+
+	pv = l | (r << 8);
+	if (pv == kctl->private_value)
+		return 0;
+
+	kctl->private_value = pv;
+	err = taichi_es9219_vol_update(list->mixer, pv);
+	return err < 0 ? err : 1;
+}
+
+static int taichi_es9219_vol_resume(struct usb_mixer_elem_list *list)
+{
+	return taichi_es9219_vol_update(list->mixer, list->kctl->private_value);
+}
+
+static const DECLARE_TLV_DB_SCALE(taichi_es9219_db_scale, -12750, 50, 0);
+
+static const struct snd_kcontrol_new taichi_es9219_vol = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Speaker Playback Volume",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+		  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
+	.info = taichi_es9219_vol_info,
+	.get = taichi_es9219_vol_get,
+	.put = taichi_es9219_vol_put,
+	.tlv = { .p = taichi_es9219_db_scale },
+};
+
+static int taichi_es9219_controls_create(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct usb_mixer_elem_list *list;
+	u8 v1, v2;
+	int err;
+
+	err = taichi_es9219_read(chip, TAICHI_ES9219_REG_VOL1, &v1);
+	if (err < 0) {
+		usb_audio_dbg(chip, "ES9219 VOL1 read failed: %d\n", err);
+		return 0;
+	}
+	err = taichi_es9219_read(chip, TAICHI_ES9219_REG_VOL2, &v2);
+	if (err < 0) {
+		usb_audio_dbg(chip, "ES9219 VOL2 read failed: %d\n", err);
+		return 0;
+	}
+
+	err = add_single_ctl_with_resume(mixer, 0, taichi_es9219_vol_resume,
+					 &taichi_es9219_vol, &list);
+	if (err < 0)
+		return err;
+	list->kctl->private_value = (TAICHI_ES9219_VOL_MAX - v1) |
+				    ((TAICHI_ES9219_VOL_MAX - v2) << 8);
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4797,6 +4950,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = dell_dock_mixer_create(mixer);
 		break;
 
+	case USB_ID(0x26ce, 0x0a0b): /* ASRock X870E Taichi (Lite) */
+		err = taichi_es9219_controls_create(mixer);
+		break;
+
 	case USB_ID(0x2a39, 0x3fd2): /* RME ADI-2 Pro */
 	case USB_ID(0x2a39, 0x3fd3): /* RME ADI-2 DAC */
 	case USB_ID(0x2a39, 0x3fd4): /* RME */

-- 
2.56.0


