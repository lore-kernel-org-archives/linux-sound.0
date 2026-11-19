Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104517;
	b=FpfD9ztr7cak/X6T0sCJle5UQmPHRWbPXg/pANbPW59O8xvFbxKTWjdgF7r7B2uGD/QM
	 MR+zwy0cwVqoLOZfg6+zBgLBjE9P1pp3hrBWcg2uiQ8ZOXtXyzhOUYQntUTCHL9D9MiMU
	 uP8YlzDAyQRLgds3CJ+ZzDcngPNhY8RGG94GZ7eQXQsHgFTeT6f/foRThp+KVCbI+vvya
	 e1dRUlpWAI4B0FLgvaTOGRfA17fLNiUbw9nGgzXPkrWMdT0mWIf+RorMXRZwqmuyiJo+/
	 DkvFz6lyfyPM0LSQu2rF2+TReHQlkPwlI9e8oj8t7YQ1XA2GHWrcchnR7hiBRhrjQpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104517;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sdYuD2HjwbSOb7Vn9JpYwPgkfX842GXZG/Cbv45k/TA=;
	b=PtCRxzjzgLI5DyQT4pXRPErXCjLq7VD9PYzBoFhz4EfoiFWK8M4OnlCHYNCLQNIE4xD/
	 Tm67k3k4KuObuBILHdfNlWTXcr//tMgQjgmRjqHksv+wAde1v6rRWYSIBJmKHGHMVCOWG
	 77WWgA9Vsxq063HwLNTvQqhjJaYTWwD0Q7p9prQxiAyhbChw+bmNFYs9EY0P61/la9WaQ
	 wWB6E5zIWdD1zCbX+9xKnXBc90xPuZjurox6nzKc7ZcQCez798EJV2a6YI01m65NdDHgV
	 49Tlkapr2AeAI5W1kRhbdYo18VWM+T8sSz6iqFKZi5Go+uhxT8IVaYEghOgDo7CZMPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpNgqpyo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFE606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpNgqpyo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795104517;
	b=Xqr0buDUOcYTcDdDJIKvJi7HjQOlS4DRAi8UUo3A5CjuFZluGUan4JC5haeWZwDc55EA
	 0IHn4yt1qdJ6xZzh3/dLRTS/zbyx1Igx4cVU4uq4PB6IfrvGdntBtvB8W+xxEhVM0DYur
	 NtqeHGttRAFz4rCdNKiNzSjfj1BJmwrb1XJa6Gs4klAVUCgjDGWl5DIzyHc0Bx6/Ck945
	 V0gf6WcOB6gac/JKXbxCVYl39P4ukMcFFjCNghLUW8crtl1v9A//0rYpMZsv6Brp7FNo9
	 BNi92ttMmPs9LxqYZQAZmDuKPFDJ5VPVkHQMs9UkzVnL99pg8m6ULdwoRgf3Mm5X5rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795104517;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sdYuD2HjwbSOb7Vn9JpYwPgkfX842GXZG/Cbv45k/TA=;
	b=Ac7TabnYRdSQVVnZ36ys89AUg/TOhJSrxdYSvg5HemdabZwkHUwKMFLTaGU0br/aijwL
	 jb63jKijHoYG2ZxPLN2LgmmuGbQD0YGQO7uLvInvb9sCn2SaOQ0huJYIvgl+EBC/SUH8I
	 7Yw7NT6LqhmFtXMfEBJ2t9kaFupen/QP7kn10Yq8DD7P585Fao5PjpnGMtqHEQHmHaUSv
	 z3fKo8ZrEvAUu001g7+arZ0cF28AjLsYgfrtjuak2aqowMJS3qssrPnuG+UIijBH1KO3g
	 yMWGYur15gYJqZbZXFJygN8b1WVmQzJ32K1gGJoNA+iaH2+uq0T/z3G5EgGxuX5xIJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6D591F000C7;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104517;
	bh=sdYuD2HjwbSOb7Vn9JpYwPgkfX842GXZG/Cbv45k/TA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gpNgqpyoU3auqo1S8BbehoXBk0Nqy0BKaA3r4t57YtAS3bFj3RhtpC4dIrYpHDN/1
	 0D+RbdTcX7skIThyj75Ubx2jPylWM+Hs93lmm0XE6fRP0fF0/gkNaN+qpPNkLFhCcP
	 8LcB/WSs8vrvHyL4fEm5VFv5cjZdxngF6GwXr1LJa/eMxUBOuPm94XpFQpdc5lXeua
	 YbRUup7ALHyUc9Ctnha6pqAgk/vAF2ZjC8vIcgmKgn6uC57WdDoXDf1RG0IrwR4YPy
	 ksfIWTc8qH4ecb2icY32gIQsp7bp6UEdgDmH1o0BG59kYL2/f7lpEvJ3ibRgDQAtAP
	 XQIuCKx1aMVYg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 507CE4B32E;
	Thu, 19 Nov 2026 16:08:35 +0000 (UTC)
From: Brian Harring via B4 Relay <devnull+ferringb.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 17:08:19 +0100
Subject: [PATCH v2 2/2] ALSA: usb-audio: Add ES9219 speaker volume for
 ASRock X870E Taichi
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
Message-Id: <20261119-alc4082-taichi-v2-2-03ad1352f807@gmail.com>
References: <20261119-alc4082-taichi-v2-0-03ad1352f807@gmail.com>
In-Reply-To: <20261119-alc4082-taichi-v2-0-03ad1352f807@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Brian Harring <ferringb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6908; i=ferringb@gmail.com;
 h=from:subject:message-id;
 bh=lSh/qHb25Tg7quVVsmt2XVuCsa65HieBvrZ9zbTdyJA=;
 b=owGbwMvMwCW26vPpzMb96zwZT6slMWT9l2eK4C/rXLxB/K1gz5rAANGjB7f7SzMYRi3+w3Ig9
 8iTPj/Djo8sDGJcDDPFFFkefMl5oxB/65ur0SUXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLXE
 1cDMxc3Z1NjIwdXNxdDMzMTU2cjEyMXF0dDN2djKztDB0cnN0NbFk4OIUgLlmvjzD/+icWyvW1/
 in2XU5eEx/cyfXK8qALZ+dadWa3OuujKIv5zL8L82JePN7edfsjVVTOeLYfZ3UOrkzKz8InVZXi
 eZxY9jCBgA=
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
 sound/usb/mixer_quirks.c | 177 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 4c7d68311f20..60ac92a1ca4f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4656,6 +4656,179 @@ static int snd_xiisound_init_fu_pins(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*
+ * ASRock X870E Taichi (ALC4082): the rear line (feature unit 29) has only mute,
+ * however there is an ESS ES9219 DAC behind it that is usable for volume
+ * control.
+ */
+#define TAICHI_I2C_READ			0x3d
+#define TAICHI_I2C_WRITE		0x3e
+#define TAICHI_I2C_INDEX		0x0100
+#define TAICHI_ES9219_I2C_ADDR		0x48
+#define TAICHI_ES9219_REG_VOL_L		0x0f
+#define TAICHI_ES9219_REG_VOL_R		0x10
+#define TAICHI_ES9219_PRIV_VOL_L	GENMASK(7, 0)
+#define TAICHI_ES9219_PRIV_VOL_R	GENMASK(15, 8)
+#define TAICHI_ES9219_VOL_MAX		0xff
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
+/* The return value follows the kcontrol put contract */
+static int taichi_es9219_vol_update(struct usb_mixer_elem_list *list,
+				    u8 left, u8 right, bool force)
+{
+	struct snd_usb_audio *chip = list->mixer->chip;
+	unsigned long *pv = &list->kctl->private_value;
+	bool update_l = force || left != FIELD_GET(TAICHI_ES9219_PRIV_VOL_L, *pv);
+	bool update_r = force || right != FIELD_GET(TAICHI_ES9219_PRIV_VOL_R, *pv);
+	int err;
+
+	if (!update_l && !update_r)
+		return 0;
+
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	if (update_l) {
+		err = taichi_es9219_write(chip, TAICHI_ES9219_REG_VOL_L,
+					  TAICHI_ES9219_VOL_MAX - left);
+		if (err < 0)
+			return err;
+		FIELD_MODIFY(TAICHI_ES9219_PRIV_VOL_L, pv, left);
+	}
+
+	if (update_r) {
+		err = taichi_es9219_write(chip, TAICHI_ES9219_REG_VOL_R,
+					  TAICHI_ES9219_VOL_MAX - right);
+		if (err < 0)
+			return err;
+		FIELD_MODIFY(TAICHI_ES9219_PRIV_VOL_R, pv, right);
+	}
+	return 1;
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
+	ucontrol->value.integer.value[0] = FIELD_GET(TAICHI_ES9219_PRIV_VOL_L,
+						     kctl->private_value);
+	ucontrol->value.integer.value[1] = FIELD_GET(TAICHI_ES9219_PRIV_VOL_R,
+						     kctl->private_value);
+	return 0;
+}
+
+static int taichi_es9219_vol_put(struct snd_kcontrol *kctl,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	long l = ucontrol->value.integer.value[0];
+	long r = ucontrol->value.integer.value[1];
+
+	if (l < 0 || l > TAICHI_ES9219_VOL_MAX ||
+	    r < 0 || r > TAICHI_ES9219_VOL_MAX)
+		return -EINVAL;
+
+	return taichi_es9219_vol_update(list, l, r, false);
+}
+
+static int taichi_es9219_vol_resume(struct usb_mixer_elem_list *list)
+{
+	unsigned long l = FIELD_GET(TAICHI_ES9219_PRIV_VOL_L,
+				    list->kctl->private_value);
+	unsigned long r = FIELD_GET(TAICHI_ES9219_PRIV_VOL_R,
+				    list->kctl->private_value);
+
+	return taichi_es9219_vol_update(list, l, r, true);
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
+	u8 l, r;
+	int err;
+
+	err = taichi_es9219_read(chip, TAICHI_ES9219_REG_VOL_L, &l);
+	if (err < 0) {
+		usb_audio_dbg(chip, "ES9219 VOL_L read failed: %d\n", err);
+		return 0;
+	}
+	err = taichi_es9219_read(chip, TAICHI_ES9219_REG_VOL_R, &r);
+	if (err < 0) {
+		usb_audio_dbg(chip, "ES9219 VOL_R read failed: %d\n", err);
+		return 0;
+	}
+
+	err = add_single_ctl_with_resume(mixer, 0, taichi_es9219_vol_resume,
+					 &taichi_es9219_vol, &list);
+	if (err < 0)
+		return err;
+
+	list->kctl->private_value =
+		FIELD_PREP(TAICHI_ES9219_PRIV_VOL_L, TAICHI_ES9219_VOL_MAX - l) |
+		FIELD_PREP(TAICHI_ES9219_PRIV_VOL_R, TAICHI_ES9219_VOL_MAX - r);
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -4797,6 +4970,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
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
2.56.1


