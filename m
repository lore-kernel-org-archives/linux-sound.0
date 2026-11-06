Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982751;
	b=u+P4G8i//MlvoCZwv83GGZ87+iXuuMZvaAokJOnTuzNBXGrHdyQlB5uzemRIktsHBtMI
	 tAoQmK07y5izw0uqSnUObR73H4AR4RCRbLfycR3vUjl4eLAizhbYTB8OMYwkMiUzhY1UM
	 xjVVkC4GQOeC2F6911gKAa2qmnq/IGaHaURwSugYnYHwwhznwPDGW+ik7GGwRh/Sls3cw
	 6r8v3nxYrIV6OV4Qk+gVmR5ZyBrmLm/5+4ghvJ0pN5GoT+qJyla1dvtw7nF5UyeTCZUsN
	 59p0J9F8r76gy1+QqUdydDj/IPQH6l2+Ohoz7ZfFFJPMdgFVvpUH85X68ShiwEbDiBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
	b=zLQs5Ykszqi1Xd+v3ggcDWEggxRnSW9OiLxwdIJcDDePh24zzAP7SvGLOq9LbmPXLoQS
	 AIQDK+FpolOpJ/ein7T9Wp4PzPvEFprsmsFi/mA4IGOEe1z4AOYBoHy7ypsFOFIRsmRum
	 zBCQkJ9W+0yLfDH1/fCfHLTKEJchHU70jjUwnnAuhJdK/Gdf0LUMkAuXTAMiwBmDj6pau
	 hp6TgB+w8f+9phE9ORInea4ZWmBH3e1uakD9Y84WYIkr1o3jVa+Q5uVow9ubBWOmScatw
	 /hAS3JYY9l8+8cfvMcCE4FC2FzroOsju5QL/DXtnJCPY92lm7VfcTQ9mzlU8DaI+cyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWfQ0qij;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D6606D81A
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3D6606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWfQ0qij
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-823b938464fso636920a34.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982750; x=1794587550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
        b=XWfQ0qijEUU6r3i77dltIp1xpP1PX7rWnJKD7DwgrGVmseb3neS5ZwJ3PewAuqAOIo
         IQWn9wl9JWf9aXNsWdn94cG41ExL62ycerJZpERBSgzXyKpPPXg/eLsEsgO6EfHqGqsT
         zxATjs/M5mLsa0L5ZOZmbOTBcpCViz098hmPJDmZB8uDfqmfYD64WVMTjGAy64/QNmos
         6gE80NvNXg+w+imSsy+r0dX9mT/bIcHmjfAYlUh/ogPMeJQucHMVXXZYSH2sJTKmJ8aU
         OmWTOBW4sxee2h2G7yu5P9xiFFFf3c4JjBqfZi+IfU2sxx3HkgtHoEYUlu8gh7fjZGPu
         GR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982750; x=1794587550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogULZeKBoS9bJBR+xY1nkcv/MSU5DLXAv7RQ492d6Mc=;
        b=oVsDNQ4yLwXfDqeeZKslg8lURvdyYN686G3zF0l7kOPl6MjdSxi/DlrZQMIEb8FYZF
         U3EqxuIQTR1XhtN/ctXxFK3HzuyuwtZ0buR/pxq52AjJfV0uZl2qlFepgxH2OyW49TgT
         12DUNBGsyK/oYVymPclSNJOxB1/3mh69cskg4vD/ybTexblXZgWBtWThrgIeooTlHigQ
         JhCDsxwWk5eU+zVyXNJ/IhJex/3BbY737/Av0DKd1eFmwwD/iW7CtZLSADeQrgN0eylb
         85UYSmLHQutlLAqN3C4IOoJFHZKDU1aNJypIBRyOmZrwnFgM6uCi1iQe6mk1I+8ZsvUw
         Qk7w==
X-Forwarded-Encrypted: i=1; AKwUvBwuc1ycFCJ8MCoSk2pcUdfP0v6GiaG53mk4+gu/6Hv4Ts2POdFKM1LqTLl3yfllNdL63V4yAzEUeQ5wVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+s4RdheBU0Q1uXSL49kaI7k3BENmHORtpi8aGjObXMbhgwB8c1
	awAAafAtuGkkNQqm6VwgJ6lSn7bn/gpZvoxqIPWwa29PTpjXMZBuFlIo
X-Gm-Gg: AYBFou2se6PA+HJgmvKL5fYSea9/Xr/sZPs6UEk4zvwzMHRTIKpHJ0n7MpA5o/UhJqZ
	gh1iTmb4lzwLXdJuZ00Pf3feRpyz/g9v+ReiYuDTkxtS1RSD/ntHMWDHHYwwj5tALqrE83m/8ZL
	kr2mfNx+QLbldARwxgl4BUJNyqt27RWmJZ/BmurhFWE8P7a+LUXjKTeSiMTE6zvlfOGcJfha1hS
	YLnXEzEatAP76fbnJvliDtNNBSxZy/apiyxakyBX7JHbs+gPqUitL+XJ9mLU8zle/JEWBYDYRpN
	nYwVAmkcO2UTPN59QFTTmowiP/Svl4FPWZMELfTUkEiy013q6wQ6twwpvmsUBrsQF88iMIJ0l7Q
	4GcFB4KN01lutE8fGKauCo0TImIFOTHzUXXgoBpo4AMfhMMTm2Cn9as2B8uph1enR587VMbqz09
	3PDR5cj4w7fHmcSTvD8Hz4qzxNEZnYQYdj7G2g9IO1lqXjdv61yQ1E38XUx6RwJNCUtG5FWw3JA
	xNLIAEPLqctWFd2LIukzby8LYxlITkB87I44DOR2cf9L6K8SU697wegApRBGKDJClkj6iXgfb1G
	afiBnw6PSJ3wdOrPYTWMenDlTUUjOVzVH6xsv+fPT39BCXqTaZHL+QiNJzf0OxHIRi0=
X-Received: by 2002:a05:6830:310b:b0:829:10c4:2c11 with SMTP id 46e09a7af769-85f1cb65e44mr3643211a34.0.1793982749727;
        Fri, 06 Nov 2026 08:32:29 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:29 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 05/16] ALSA: mixer_audient: make USB control transfer size configurable
Date: Fri,  6 Nov 2026 10:31:18 -0600
Message-ID: <20261106163129.1006907-6-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Previously, the USB transfer size was hardcoded in the datatype get/set
functions. Make it configurable in the ctype structure in preparation of
new control types for the id14.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 131 ++++++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 1f3744a7c10a..57d856d25271 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -12,6 +12,8 @@
 #include <linux/usb.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/tlv.h>
@@ -35,8 +37,12 @@ enum snd_audient_type {
 /* Mixer matrix: -128dB (mute) to +6dB */
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
+#define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
+	unsigned long flags;
+	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	bool invert;
 	union {
 		int integer;
@@ -50,6 +56,7 @@ static const struct snd_audient_ctrl_type {
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] = {
 	[SND_AUDIENT_TYPE_MONITOR] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.len = 2,
 		.min.integer = 0,
 		.max.integer = 127,
 		.unit = 0x38,
@@ -59,6 +66,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_PHANTOM] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = false,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3A,
@@ -67,6 +75,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3A,
@@ -75,6 +84,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE_OUT] = {
 		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert = true,
+		.len = 4,
 		.min.integer = 0,
 		.max.integer = 1,
 		.unit = 0x3B,
@@ -82,6 +92,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] = {
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.len = 2,
 		.min.integer = -128 * 256,
 		.max.integer = 6 * 256,
 		.unit = 0x3C,
@@ -236,44 +248,91 @@ static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 #define U8_U8(HI, LO) ((((u16)(HI)) << 8) | ((LO) & 0xFF))
 
 static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev = mixer->chip->dev;
-	const u16 value = U8_U8(sel, cidx);
-	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value = U8_U8(ctype->sel, cidx);
+	const u16 index = U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
 
 	const int ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
 
-	if ((ret >= 0) && (ret != len))
+	if ((ret >= 0) && (ret != ctype->len))
 		return -EIO;
 
 	return ret;
 }
 
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev = mixer->chip->dev;
-	const u16 value = U8_U8(sel, cidx);
-	const u16 index = U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value = U8_U8(ctype->sel, cidx);
+	const u16 index = U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
 
 	const int ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
 
-	if ((ret >= 0) && (ret != len))
+	if ((ret >= 0) && (ret != ctype->len))
 		return -EIO;
 
 	return ret;
 }
 
 
+static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixer,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, u32 *const value)
+{
+	int ret;
+	__le32 buf = 0;
+	s32 val;
+
+	ret = snd_audient_get_cur(mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	val = le32_to_cpu(buf);
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_SIGNED)
+		val = sign_extend32(val, 8 * ctype->len - 1);
+
+	*value = val;
+
+	return ret;
+}
+
+static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, const u32 value)
+{
+	int ret;
+	u32 val;
+
+	ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val != value) {
+		__le32 buf = cpu_to_le32(value);
+
+		ret = snd_audient_set_cur(mixer, ctype, cidx, &buf);
+		if (ret < 0)
+			return ret;
+
+		return 1;
+	}
+
+	return 0;
+}
+
+
 static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
@@ -296,12 +355,11 @@ static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 		u32 buf;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
 		if (ret < 0)
 			return ret;
 
-		ctl_val->value.integer.value[i] = le32_to_cpu(buf) ? 1 : 0;
+		ctl_val->value.integer.value[i] = buf ? 1 : 0;
 
 		if (ctype->invert)
 			ctl_val->value.integer.value[i] ^= 0x1;
@@ -334,27 +392,18 @@ static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u32 rbuf;
-		u32 buf = cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
+		u32 buf = ctl_val->value.integer.value[i] ? 1 : 0;
 		int ret;
 
 		if (ctype->invert)
-			buf ^= cpu_to_le32(0x1);
+			buf ^= 0x1;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret = snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
 
-		if (rbuf != buf) {
+		if (ret)
 			changed = 1;
-
-			ret = snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return changed;
@@ -379,16 +428,13 @@ static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		u16 buf;
-		s16 val;
+		s32 val;
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret = snd_audient_raw_get_one(mixer, ctype, base + i, &val);
 		if (ret < 0)
 			return ret;
 
-		val = le16_to_cpu(buf);
 		ctl_val->value.integer.value[i] = val;
 	}
 
@@ -417,24 +463,15 @@ static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 		return pm.err;
 
 	for (i = 0; i < hwchan; i++) {
-		s16 rbuf;
-		s16 buf = cpu_to_le16(ctl_val->value.integer.value[i]);
+		s32 val = ctl_val->value.integer.value[i];
 		int ret;
 
-		ret = snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret = snd_audient_raw_set_one(mixer, ctype, base + i, val);
 		if (ret < 0)
 			return ret;
 
-		if (rbuf != buf) {
+		if (ret)
 			changed = 1;
-
-			ret = snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return changed;
-- 
2.47.3

