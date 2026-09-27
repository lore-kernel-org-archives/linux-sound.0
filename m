Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BF293B75
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 00:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790469418; cv=none; b=SKb829OZ3NIlFUKBocccHVexyuTYfUYZYd78pKZ0e9zszGkznrkUAIcHXwI+3f02DslOXzk5wkdFsjSXi/+OWwLpNrlkRH8ki8QxfTbr/3EuL0KKrfA+16oDF8Rj8vQ2qTW772bhUDSnmISjbZKqDXqZ1ZiZOXPGmgqqOUoXolo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790469418; c=relaxed/simple;
	bh=02zBX49f3sqNU0BILqiTEn9zyUCR0Xx8AFC/BOF/B1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcBctfyMmD8u8b9eaFo8rp/mpi9k5JRM4DQ0XQU3Su1UVxBiXDBGCBGmbGysZd7E35389AI922B97tyWzSIq1TBHS9cJxtwsuCpsWXnKyPnhMAGvYYIr6afB0erEXNHw4cvXbmsuJSvhVgXamV3SocA85V80C6x2JpJoqNrJsJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5XdoaZh; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5XdoaZh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so676316e87.0
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 17:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790469413; x=1791074213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmLoGadpdAnru0RD5C+4GYI+WssPCB6S3yObPWQjjgY=;
        b=P5XdoaZhoVVrsn43us2pwn0cd4/WhbCi2qFkmnGWaKfV9/Htt4lpKpwoqry2/0nKfM
         5bI47QbckyBabfDxm1VKSQOr843O+y7w+gERfIt2Wxr3F7gbBOjejG41B9UAzxdZi1FG
         kTvTwErIItCNTLSFfN9YnBaR/XqisUcpVMWuyD9uVRpcAEFXxnHi+wmYmnCk7I1+cTR+
         ZyWwb/lKXPMcG3lvHe/AXTFGNIK8r++nZ/d+5hpU78JJR/GWWc53yl0p4t3PhSZd3ZXf
         t5BkJTx2XenwtTstk4kCOHDRLcwkwZYbzbmmJ2VM6kwhsILNbYOX+BwY9OSUVMGzDw2v
         +Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790469413; x=1791074213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmLoGadpdAnru0RD5C+4GYI+WssPCB6S3yObPWQjjgY=;
        b=qXFo5pgFtflA5kZf/JB3PAaxQpZl6XZi5ccxQV+PkDNS/R4TstvLR+qeIa3M1oWtvP
         Nyesq7725Nxx00RJ+ALcOsqzJWtW0ICxX8g4bXtHjYDp75cWzxRulhNtbOoqkek/hj7p
         xFb2Tk+vcNqgGryaWOAgVOeYJBncN7a33hGA5ReuCXLk2OsOKJb9f5f5uCXVBbhEBd/L
         Ycof2bwlYPKzEo9dYswLwGsPsUK+gNwa/1Qrce5nlSe3FPVpns5DK8dooDsnJTqdIE5F
         p4/pR2Y7P6IoSaWjcSdR3gaNKsnEflfnXhKeXExxCfgxUohgqxelWijX+XWaS7QeaaUL
         lWsg==
X-Gm-Message-State: AFq9FYJwfUMRqold39AuRhbqdSavJicj7eYxFRZyTDwHfhbbdzcnT5yG
	BOhcqrY8v7RxsR9tfZHTEOxX8SSeKGi0PWOAfoK6ZY1wCkx72YgXd550xizER6ft
X-Gm-Gg: AYBFou3Yhd3plfiT8AYnhlP2ts92VdXEZ/BwpQnjTeOZwNtIUEQDFxqJsiO6LBrcmwT
	2GIYqhikVXKvFC2tecofAxShQ8IcLzgPdxwAXdgfgnM5YHwcWO/2kMi+svzQc1UI6nEvHIB1jn+
	gno4mwUaJVPUPcKIn3rlm2eA/j0em8yUVwEIVNkyZepXtJvDdegjSNTwqpM64xh1QHbhZSviNcY
	gQIquKyH5SKBoj9uK4D4kC8gCRUJqGvS++l3wkBrhS6i9AVQATnt2YAUdJziGi9JPvdr51JeCB6
	VN+iBZiFg8P9v4T2ARVr2XpEVpjWVClHG3B2HEIvVKhYvNPYMNN+zKWM+x8d+fGH+OtKW+6GYaX
	P16N2eCs3134Ox03I4BR6chtc3/6p9F40FfGbx3DjCoXb1ueohFLlCUKE8IR/+OAAKnoF5k3gQE
	4QDZYLqdM/TKDBx3I0EI3FDhW8WDb69MUgNB+NFn75cbP8z/kaFr//NfiI3+KZ/Ik+mJWyBEC+b
	CVBAf3o6pWIMGoQ1irAmeGdpG5MTriy
X-Received: by 2002:ac2:42c6:0:b0:5b8:9ec6:66f7 with SMTP id 2adb3069b0e04-5b8df0de196mr2156547e87.19.1790469413244;
        Sat, 26 Sep 2026 17:36:53 -0700 (PDT)
Received: from Shigure.lan (n30b00u6luibwsaibf2-1.v6.elisa-mobile.fi. [2001:999:2c9:b0::44e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6a8bdf3sm1572795e87.8.2026.09.26.17.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:36:52 -0700 (PDT)
From: Niko Huuskonen <niko.huuskonen.00@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niko Huuskonen <niko.huuskonen.00@gmail.com>
Subject: [PATCH 4/4] ALSA: caiaq: Add LCD support for the Kore controllers
Date: Sun, 27 Sep 2026 03:35:32 +0300
Message-ID: <20260927003532.289468-5-niko.huuskonen.00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
References: <20260927003532.289468-1-niko.huuskonen.00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both Kore controllers have a 128x64 pixel monochrome LCD. The driver
does not support it, and userspace cannot reach it while the driver is
bound, so the display stays blank on Linux.

The firmware passes EP1 packets with the command byte 0x08 on to an
ST7565-style display controller: "08 00 <n> <commands>" carries
controller commands, "08 01 <n> <data>" display RAM data. The vendor
software sets the controller up, then writes each 128 byte page in
blocks of 32 bytes, each preceded by page and column address commands.
The OpenKoreBridge project documented this from USB captures of the
vendor software with a Kore 2.

Add a hwdep device, "Kore LCD", for both controllers. A write carries
one frame of 1024 bytes: 8 pages of 128 columns, with bit 0 as the top
pixel of each page. The driver sets the controller up on the first
write and afterwards only sends the pages that changed. The device is
exclusive, so frames from different writers cannot interleave. Add an
"LCD Contrast" control (0-63); the backlight is already the "LED lcd"
control.

Tested on a Kore controller (USB ID 17cc:4711): full frames, frames that
change single pages and contrast changes show up as expected, while
audio, MIDI, input and the LEDs keep working. A Kore 2 was not available
for testing; it gets the protocol that OpenKoreBridge uses with it.

Link: https://github.com/OpenKoreBridge/OpenKoreBridge
Assisted-by: LLM
Signed-off-by: Niko Huuskonen <niko.huuskonen.00@gmail.com>
---
 sound/usb/caiaq/Makefile |   2 +-
 sound/usb/caiaq/device.c |   7 ++
 sound/usb/caiaq/device.h |  10 ++
 sound/usb/caiaq/lcd.c    | 258 +++++++++++++++++++++++++++++++++++++++
 sound/usb/caiaq/lcd.h    |   7 ++
 5 files changed, 283 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/caiaq/lcd.c
 create mode 100644 sound/usb/caiaq/lcd.h

diff --git a/sound/usb/caiaq/Makefile b/sound/usb/caiaq/Makefile
index 9a99c17a2c1b..ffa5a7edf95c 100644
--- a/sound/usb/caiaq/Makefile
+++ b/sound/usb/caiaq/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-usb-caiaq-y := device.o audio.o midi.o control.o
+snd-usb-caiaq-y := device.o audio.o midi.o control.o lcd.o
 snd-usb-caiaq-$(CONFIG_SND_USB_CAIAQ_INPUT) += input.o
 
 obj-$(CONFIG_SND_USB_CAIAQ) += snd-usb-caiaq.o
diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 3e63eecebe00..dfbfd30b418d 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -22,6 +22,7 @@
 #include "midi.h"
 #include "control.h"
 #include "input.h"
+#include "lcd.h"
 
 MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
 MODULE_DESCRIPTION("caiaq USB audio");
@@ -387,6 +388,12 @@ static int setup_card(struct snd_usb_caiaqdev *cdev)
 	}
 #endif
 
+	ret = snd_usb_caiaq_lcd_init(cdev);
+	if (ret < 0) {
+		dev_err(dev, "Unable to set up LCD (ret=%d)\n", ret);
+		return ret;
+	}
+
 	/* finally, register the card and all its sub-instances */
 	ret = snd_card_register(cdev->chip.card);
 	if (ret < 0) {
diff --git a/sound/usb/caiaq/device.h b/sound/usb/caiaq/device.h
index 0354e348e919..e888a53562bf 100644
--- a/sound/usb/caiaq/device.h
+++ b/sound/usb/caiaq/device.h
@@ -30,6 +30,8 @@
 
 #define MODNAME "snd-usb-caiaq"
 
+#define CAIAQ_LCD_FRAME_SIZE	1024
+
 #define EP1_CMD_GET_DEVICE_INFO	0x1
 #define EP1_CMD_READ_ERP	0x2
 #define EP1_CMD_READ_ANALOG	0x3
@@ -37,6 +39,7 @@
 #define EP1_CMD_WRITE_IO	0x5
 #define EP1_CMD_MIDI_READ	0x6
 #define EP1_CMD_MIDI_WRITE	0x7
+#define EP1_CMD_LCD		0x8
 #define EP1_CMD_AUDIO_PARAMS	0x9
 #define EP1_CMD_AUTO_MSG	0xb
 #define EP1_CMD_DIMM_LEDS       0xc
@@ -101,6 +104,13 @@ struct snd_usb_caiaqdev {
 	unsigned char control_state[256];
 	unsigned char ep8_out_buf[2];
 
+	/* Kore LCD */
+	struct mutex lcd_mutex;		/* protects the lcd_* fields */
+	unsigned char lcd_frame[CAIAQ_LCD_FRAME_SIZE];	/* shown frame */
+	unsigned char lcd_contrast;
+	bool lcd_ready;			/* controller set up */
+	bool lcd_frame_valid;		/* lcd_frame matches the display */
+
 	/* Linux input */
 #ifdef CONFIG_SND_USB_CAIAQ_INPUT
 	struct input_dev *input_dev;
diff --git a/sound/usb/caiaq/lcd.c b/sound/usb/caiaq/lcd.c
new file mode 100644
index 000000000000..dd2a3b949a43
--- /dev/null
+++ b/sound/usb/caiaq/lcd.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * LCD support for the Native Instruments Kore controllers
+ *
+ * Copyright (c) 2026 Niko Huuskonen <niko.huuskonen.00@gmail.com>
+ *
+ * Both Kore controllers have a 128x64 pixel monochrome LCD behind an
+ * ST7565-style controller. The firmware passes EP1 packets with the
+ * command byte EP1_CMD_LCD on to that controller:
+ *
+ *   EP1_CMD_LCD 0x00 <n> <n controller command bytes>
+ *   EP1_CMD_LCD 0x01 <n> <n display RAM bytes>
+ *
+ * The display is exposed as an exclusive hwdep device. Each write carries
+ * a whole frame of CAIAQ_LCD_FRAME_SIZE bytes: 8 pages of 128 columns,
+ * one byte per column and page, with bit 0 as the top pixel of the page.
+ * Only the pages that changed since the previous frame are sent to the
+ * device. The contrast is an ALSA control; the backlight is the existing
+ * "LED lcd" control.
+ *
+ * The controller setup and the packet layout follow the USB traffic of
+ * the vendor software, as documented by the OpenKoreBridge project.
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/usb.h>
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/hwdep.h>
+#include <sound/pcm.h>
+
+#include "device.h"
+#include "lcd.h"
+
+#define LCD_WIDTH		128
+#define LCD_PAGES		(CAIAQ_LCD_FRAME_SIZE / LCD_WIDTH)
+#define LCD_COLUMN_OFFSET	4	/* first visible controller column */
+#define LCD_CHUNK		32	/* display RAM bytes per packet */
+#define LCD_CONTRAST_MAX	0x3f
+#define LCD_CONTRAST_DEFAULT	0x1c
+
+#define LCD_KIND_COMMAND	0x00
+#define LCD_KIND_DATA		0x01
+
+static int lcd_send(struct snd_usb_caiaqdev *cdev, u8 kind,
+		    const u8 *bytes, unsigned int len)
+{
+	u8 buf[2 + LCD_CHUNK];
+
+	if (WARN_ON(len > LCD_CHUNK))
+		return -EINVAL;
+
+	buf[0] = kind;
+	buf[1] = len;
+	memcpy(buf + 2, bytes, len);
+	return snd_usb_caiaq_send_command(cdev, EP1_CMD_LCD, buf, len + 2);
+}
+
+static int lcd_command(struct snd_usb_caiaqdev *cdev, u8 cmd)
+{
+	return lcd_send(cdev, LCD_KIND_COMMAND, &cmd, 1);
+}
+
+static int lcd_set_contrast(struct snd_usb_caiaqdev *cdev)
+{
+	const u8 cmd[] = { 0x81, cdev->lcd_contrast };
+
+	return lcd_send(cdev, LCD_KIND_COMMAND, cmd, sizeof(cmd));
+}
+
+/* controller setup, in the order used by the vendor software */
+static int lcd_setup(struct snd_usb_caiaqdev *cdev)
+{
+	static const u8 head[] = {
+		0xe2,			/* reset */
+		0xa1,			/* reverse column direction */
+		0xc8,			/* reverse row direction */
+		0xa2,			/* 1/9 bias */
+		0x2c, 0x2e, 0x2f,	/* power up in three steps */
+		0x27,			/* regulator resistor ratio */
+	};
+	static const u8 tail[] = {
+		0xa6,			/* normal, non-inverted display */
+		0x88, 0xef,		/* sent by the vendor software */
+		0xaf,			/* display on */
+	};
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(head); i++) {
+		ret = lcd_command(cdev, head[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = lcd_set_contrast(cdev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(tail); i++) {
+		ret = lcd_command(cdev, tail[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int lcd_write_page(struct snd_usb_caiaqdev *cdev, unsigned int page,
+			  const u8 *data)
+{
+	unsigned int col;
+	int ret;
+
+	for (col = 0; col < LCD_WIDTH; col += LCD_CHUNK) {
+		unsigned int addr = LCD_COLUMN_OFFSET + col;
+		const u8 column[] = { 0x10 | (addr >> 4), addr & 0x0f };
+
+		ret = lcd_command(cdev, 0xb0 | page);
+		if (!ret)
+			ret = lcd_send(cdev, LCD_KIND_COMMAND,
+				       column, sizeof(column));
+		if (!ret)
+			ret = lcd_send(cdev, LCD_KIND_DATA,
+				       data + col, LCD_CHUNK);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static long lcd_hwdep_write(struct snd_hwdep *hw, const char __user *buf,
+			    long count, loff_t *offset)
+{
+	struct snd_usb_caiaqdev *cdev = hw->private_data;
+	unsigned int page;
+	int ret;
+
+	if (count != CAIAQ_LCD_FRAME_SIZE)
+		return -EINVAL;
+
+	u8 *frame __free(kfree) = memdup_user(buf, count);
+	if (IS_ERR(frame))
+		return PTR_ERR(frame);
+
+	guard(mutex)(&cdev->lcd_mutex);
+
+	if (!cdev->lcd_ready) {
+		ret = lcd_setup(cdev);
+		if (ret)
+			return ret;
+		cdev->lcd_ready = true;
+		cdev->lcd_frame_valid = false;
+	}
+
+	for (page = 0; page < LCD_PAGES; page++) {
+		u8 *shown = cdev->lcd_frame + page * LCD_WIDTH;
+		const u8 *next = frame + page * LCD_WIDTH;
+
+		if (cdev->lcd_frame_valid && !memcmp(shown, next, LCD_WIDTH))
+			continue;
+
+		ret = lcd_write_page(cdev, page, next);
+		if (ret) {
+			cdev->lcd_frame_valid = false;
+			return ret;
+		}
+		memcpy(shown, next, LCD_WIDTH);
+	}
+	cdev->lcd_frame_valid = true;
+
+	return count;
+}
+
+static int lcd_contrast_info(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = LCD_CONTRAST_MAX;
+	return 0;
+}
+
+static int lcd_contrast_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_caiaqdev *cdev = snd_kcontrol_chip(kcontrol);
+
+	guard(mutex)(&cdev->lcd_mutex);
+	ucontrol->value.integer.value[0] = cdev->lcd_contrast;
+	return 0;
+}
+
+static int lcd_contrast_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_usb_caiaqdev *cdev = snd_kcontrol_chip(kcontrol);
+	long val = ucontrol->value.integer.value[0];
+	int ret;
+
+	if (val < 0 || val > LCD_CONTRAST_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&cdev->lcd_mutex);
+	if (val == cdev->lcd_contrast)
+		return 0;
+
+	cdev->lcd_contrast = val;
+	if (cdev->lcd_ready) {
+		ret = lcd_set_contrast(cdev);
+		if (ret)
+			return ret;
+	}
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new lcd_contrast_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_HWDEP,
+	.name = "LCD Contrast",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = lcd_contrast_info,
+	.get = lcd_contrast_get,
+	.put = lcd_contrast_put,
+};
+
+int snd_usb_caiaq_lcd_init(struct snd_usb_caiaqdev *cdev)
+{
+	struct snd_card *card = cdev->chip.card;
+	struct snd_hwdep *hw;
+	int ret;
+
+	switch (cdev->chip.usb_id) {
+	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER):
+	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_KORECONTROLLER2):
+		break;
+	default:
+		return 0;
+	}
+
+	mutex_init(&cdev->lcd_mutex);
+	cdev->lcd_contrast = LCD_CONTRAST_DEFAULT;
+
+	ret = snd_hwdep_new(card, "Kore LCD", 0, &hw);
+	if (ret < 0)
+		return ret;
+
+	strscpy(hw->name, "Kore LCD", sizeof(hw->name));
+	hw->iface = SNDRV_HWDEP_IFACE_CAIAQ;
+	hw->private_data = cdev;
+	hw->exclusive = 1;
+	hw->ops.write = lcd_hwdep_write;
+
+	return snd_ctl_add(card, snd_ctl_new1(&lcd_contrast_control, cdev));
+}
diff --git a/sound/usb/caiaq/lcd.h b/sound/usb/caiaq/lcd.h
new file mode 100644
index 000000000000..423464750278
--- /dev/null
+++ b/sound/usb/caiaq/lcd.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef CAIAQ_LCD_H
+#define CAIAQ_LCD_H
+
+int snd_usb_caiaq_lcd_init(struct snd_usb_caiaqdev *cdev);
+
+#endif /* CAIAQ_LCD_H */
-- 
2.55.0

