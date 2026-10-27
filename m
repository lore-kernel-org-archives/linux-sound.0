Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144858;
	b=eAc3jspxEIbmQ4QcVXf3wZAGwS1GrVnMkPvZ/IDLztvLlceowvKvqQ53Q/yTux7iKF74
	 gKsmkCI08WAm96dugnRZgrsDUfQS/s1o9lDYtcb1VioMHjSyIYFtv869caoOkgyvOcGEC
	 2+vFNVklSK+tt8o8kSwGM559U4/JH5+AjUxWm5RqhlCElP8MgiUtTeyVsw3irTgjrwaQd
	 eQlyTfBqbqeHnBO1Y3w0VJIF6HbkwUR7PlwIv5rfQyqK9tYeFG3GH6yTgeVGohILxqjQi
	 oJEX3PRtt8GJUicLNLaZua+FJTBb/N/Z4BPF89TLN4VeDTCRY/JRf9Y+eZ+sHRsvX8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
	b=GfS7V/MDBgtfW1H9v7bmliSV30Qc44rmOTsajeJ+afuoiHzykRcWylLA6S++Nexi+uH0
	 /1B63YDGSazjJouXPjZZUhFh+W4yAh08c9IE7IQ/gzPmAmp639fmX+UJwAhlenckgGbRU
	 rp5RIJi/Wi5Z4FWA5a8LKXk0btaGzrwDWljQ5CwUnTG4Q/Dvx0RADCUIpSRoEh3ZU0beU
	 O3cBP0Fvza9BNTbQnp4UCLziwcOaR1EGa9mcFFh54mDonL8ONh8VY0skP6mrvE2Dvlp1+
	 lsQl0h2w6wVbGt9SU6sxHLUiTXosQNiFsMDNjvqj7wu+o5dg2LGLDOTkb3+zXHY1T3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoRtLJTz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283DE606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 23:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoRtLJTz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso2958575e9.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 16:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144856; x=1793749656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
        b=zoRtLJTzm3WXPgvBJXiFVZ+MUih4dfxDAUp9aZRpcShjdqilgb5SJSmPI215uBqHSC
         KiKM9g63qR6c7yS3SOU07/XtqCGwuU8yT79uzXCjRJ7Me4+NvifGIKCWwPJ+nmMmxph7
         2t4Opjgn1vF3qvyBPIY/KkLY+aQj4euEePwgVjtovyquuNJaBZPSd/on0/TQu1R42tdA
         kWI9kxUhWLPvLbxI4i9F/JkAzZPH2tv+dVJJ1djR4eNrWYOfvMgLwCwiUACaLUUOPwuh
         bon1H+JLdP3JwNznXDl7WxVXqfnj1UImUcETCi8GcuPufwicELbquu4+yrrQRdlxg1DG
         EKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144856; x=1793749656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeoTTHjrmkN+lAjLjMn+hlXcwBGCw4hztvP/cN1zZZU=;
        b=RSXQ4TX42quWktb79psp37hotj4Dpg2tyQa0DaHkmS42XNvZLpcVpHfo0Fm2p2XuqY
         7Spyix7hapgcUn51HA3CyCfnK09+HNGhKHnkMs6bKqwiVmNMh+WaL3D1beedmK3os2mk
         f5zGwagUOYfa0zsIaMFye6ajyXPjVvLXlz44Guzzc3/jvh4ifWWU9VXl33PIyA+MrgQ4
         GH/Vm2/yMb4JZxPXn0u17MO0+eE8QWizEUZza/JzS5Lp9hGUw48HZC+PrGbGgoP3rKHi
         B/EXiin+j7vykt6so7694F6z1OWFToIdHaBbn3qMQpIdNz5KXY5f/QSjguIjsPbeYVBs
         KHbg==
X-Forwarded-Encrypted: i=1; AKwUvBxZPx2vGYQs/P4Lr9qcXLIPBFUPWOTGtRRTzZrMLUFPLUkGLDMai9f6dt+Xiex0Mi7CzbwSk1oJ5fm8wQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsP2N5yCAAyk7ooAXN8/MB1qVf22W2TU4+mSO92E/85mgLDNfe
	C2iar4Eo1glq6y7TaJ3tIqWs6HBglUZKc2Dz1ydr7rWaonwg59NhwORC
X-Gm-Gg: AYBFou18Ew+SVcnFRjjl8X1w+i0WX8wMTqz782bYqwQE3wOPFBRM/vGYResvcYlhsfg
	kxrtc+1SiWX1wj91W5mwcJQVDpZlPAZu81rShDZ7wCOGIHYWK52VP7D9iD2GNWWS84jlj3MOORV
	SP4hrtsUIMdiydwBpVe2xceVuSocg99vrEuXRPY+rcYd6mtOEUt4uByFn9hQFguMWIQ+3OMAh2t
	HdVtKFglPhVxwZD5u0sWzw8pyl/c60T2uhBzWiJhfJjOvGLmf8PRxFanKLW9QcJG2rubUH3UgBq
	FCk0j4ULYhKoilyTtJVGw4nv/14ILRXb33Q73Se6gh+e35hHAT47mS7y3i+077JBwEFlCMNaRv3
	gtiJHJXVXC9c0WJxO97wDcmOanlBQrcoDAU4KbMg8Tt3Ed4ks6OC5DK4/yxMSM0ShIahbVGYA7c
	Bp0yvpQQahlJaXD6+rhGNxL5EsMl4//xShtvwIm8G/zH8goOAswWBydHKZYpbU3S+mjI+q4bzWF
	h24d6trrduR8OUt8lCZ9i1urGhjeHVj945m9sydP+GX/qs1A0acfCS47iEQ0AmmvMYyYftJqCjs
	8a0Bna7QUL94yAt8bVz8Exez/l974jmo+rWseiX78BKwiikOB9KKExNw6Qve6qLagX7EMAo=
X-Received: by 2002:a05:600c:524a:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a9674e6bf7mr9591635e9.35.1793144856486;
        Tue, 27 Oct 2026 16:47:36 -0700 (PDT)
Received: from matebook.galaxus.box (adsl-84-226-215-1.adslplus.ch. [84.226.215.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a8f28a1sm2905285e9.4.2026.10.27.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:47:34 -0700 (PDT)
From: Cian Ruane <cian.ruane1@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Huawei MateBook X Pro 2020
Date: Wed, 28 Oct 2026 00:47:32 +0100
Message-ID: <20261027234732.6893-1-cian.ruane1@gmail.com>
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

The Huawei MateBook X Pro 2020 (MACHC-WAX9) has a combined headphone and
microphone jack, but the BIOS marks pin 0x19 as unconnected (0x411111f0).
As a result the headset microphone is missing and only the internal
microphone is available.

The mic mute LED on the F7 key does not follow the capture mute state
either. The machine uses the PCI subsystem vendor ID 0x1e83 (Huaqin)
rather than 0x19e5, so the Huawei vendor-wide quirk that sets up the LED
does not match.

Add a fixup that configures pin 0x19 as a headset microphone without its
own jack detection and chains to ALC269_FIXUP_HEADSET_MODE, which enables
headset mode and the mic mute LED. This is the MACHR-WX9 fixup without
its other pin overrides. The remaining BIOS pin defaults work, and pin
0x14, which the MACHR-WX9 uses for a second speaker pair, produces no
sound on this machine. Configuring pin 0x19 with presence detection
(0x04a11040) does not work either: the jack state drops to unplugged
while the headset is still connected.

Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.26,
Ubuntu 26.04 (kernel 7.0.0-38-generic, with this patch backported).

Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d588..5a4cb04aa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4330,6 +4330,7 @@ enum {
 	ALC255_FIXUP_DELL_HEADSET_MIC,
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS,
+	ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS,
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC295_FIXUP_HP_PAVILION_X360,
@@ -5063,6 +5064,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x04a11140 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 	[ALC298_FIXUP_HUAWEI_MBX_STEREO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_huawei_mbx_stereo,
@@ -8727,6 +8737,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1e50, 0x7007, "Positivo DN50E", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1e50, 0x7036, "Acer Gadget E10 ETBook", ALC233_FIXUP_WUJIE_SPEAKERS),
 	SND_PCI_QUIRK(0x1e50, 0x7038, "Positivo DN140", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1e83, 0x3e21, "Huawei MACHC-WAX9", ALC256_FIXUP_HUAWEI_MACHC_WAX9_PINS),
 	SND_PCI_QUIRK(0x1ee7, 0x204e, "HONOR DRA-XX M1020", ALC256_FIXUP_HONOR_DRA_XX_SPEAKERS),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.53.0

