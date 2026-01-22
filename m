Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF83392822
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 02:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769050303; cv=none; b=COoGi0LuQIqvs7YHcDO6PlCwemuwhB+NpZCik43l0KslcU9RYom8kMgzYl1ht6oYZLvH2/qW/0G59G3KdpqRJOFAtahT+28CkiUgkmqw40PD4l1xx/3wOJYfX4fx+h8rMlfzJ9N3toQw4xOd+29egXexIwxelOiDdJzbcFn7rzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769050303; c=relaxed/simple;
	bh=UbXDWwXNuth28nGsK0Lf/kWl5ygU/FoxQgjCggkcxfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ett+ybRCqo1BhoHrWxmDkPkPXbfcoMJerzurABoKFTE2oacIR30iqB9X91grFBHMZZ97HE/qKlXnRlV0lgjXkwMxqsQCFW9fmP4FkT1KdW9CI30Wo0EFXNQLhY0yQ6O75Hu+I5IJJCoDT1PFIKBQD1qcIApwOicHzQE9tOJUUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=martinh.net; spf=pass smtp.mailfrom=martinh.net; dkim=pass (1024-bit key) header.d=martinh.net header.i=@martinh.net header.b=O8Ks+Pz+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=martinh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=martinh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=martinh.net header.i=@martinh.net header.b="O8Ks+Pz+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so2767735e9.2
        for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 18:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=martinh.net; s=google; t=1769050298; x=1769655098; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jf58Nd2C1MaJTnsyeFDPWfQLo+rAATd9OP2nzG8lhII=;
        b=O8Ks+Pz+duPUHC4LJeE1JeM31QJdmHaQG6irxKBln0S+/RZUCPVIkttb3FbgcyVhC5
         cDv4B2KS9K+yC0bNpB5KjdYs93evDVRaa1c+vErChe04SnVksNrVLdWW2R34DLq6bFMK
         CmdhDXJK/iDwku2dNEbOl9hteWlzolUjFs7GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769050298; x=1769655098;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf58Nd2C1MaJTnsyeFDPWfQLo+rAATd9OP2nzG8lhII=;
        b=JClRW7IHklttVdKVqssNhZvZfiqIWFxKnk8ht/rCwGikk3uXvBumMviWT1Vk+oxXRu
         VuJ61/EMVMcBxSobxAxUhKmOBY/JIvLbKQPECxx67hHjTZOo0/vlegV1TY0YLBjTygPt
         8DcBcDct8HredxM8HUB9ZlolRMnnSMGEJcx0of54mUhB+n2onGUVV3UYu/uxQyilzTLE
         z0zIr0/WKKnwtNAeN3a616Epe8cuv2nl0KFAI+P0mnqA+2CNA21DS1sjqPJkNmGICa9c
         QogNoR+wFwfHtu6kDGy6KHoZjRgRPApWHLjb6v0honoLclaUY3jxb7j7hZhB3JONjRry
         M0BQ==
X-Gm-Message-State: AOJu0YyK9L1u7UxFkZrlcHnmrKqxgM7UrqxKfVYltOhz5ztc8wEz+B3Y
	V9gfj7d5a8wQP6v5owX8ETfE2czUC2vbX097Yf10nMtGpsWjZTR6tuqcgffcIoRfTw==
X-Gm-Gg: AZuq6aJ5JopSOHWV6u6VmcJNHvFO0WtiAW+x/uAvfyTLStQVq1DHYkw5jukqSj/lIa7
	YrA5JKeTBGFBJTXmM6Bvcw873uPxD0ZpksprUopEDKk+wPSEb7ghpeJDoGolxbeDehWZ1bPQwKy
	zwrLHoSjQU0adj/0rbf3Zj83kz8tLLjQoQKK1zuO4uQNZMr10Le5+Li/4eu1u2ubPYbZJCpbiD3
	5pUHea1KD38iAUWMfcQxPDAFhAmrmrbHO1w2weLL+wv68fm8KYVj5wr99cZjvB9E2YGWdGuzOs+
	vsgT4/66k4cQVnuuGdAjuFOetl+iUBEXyjCrsfTcYAvpWo5QhB+ulm4IWgpT3KC050bil5UqpwM
	ng4jQbawG5Yiw52714RuOx3s8mDbJBH9p5oKX7lMltYhFwWrnObfljJLO+PeYppjdOKahL1/rbD
	HaRHiyG345SGJ6e0fTgjDWBcjSafd1QSVcbYO8ewabVf/wbancGj61Pu5XewmYtUmokPWHHgY3K
	42eyD9QNRyF4OkkyniJQc/vZ46ChjrkUbsQ93QkSsVzQQ3ICi8tXWHumoSynRTBrTtOE0W/Ob1h
	y375fRXB/MAqZgYNUi/XsSar27hmWhATeeYG2zPoAWJJ
X-Received: by 2002:a05:6000:4205:b0:431:808:2d50 with SMTP id ffacd0b85a97d-4356a024d4cmr30388196f8f.13.1769050297721;
        Wed, 21 Jan 2026 18:51:37 -0800 (PST)
Received: from [192.168.86.246] (f.a.3.f.4.7.1.b.6.c.8.5.2.2.0.4.9.f.5.b.8.b.4.a.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:a4b8:b5f9:4022:58c6:b174:f3af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm42025916f8f.3.2026.01.21.18.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:51:36 -0800 (PST)
From: Martin Hamilton <m@martinh.net>
Date: Thu, 22 Jan 2026 02:51:18 +0000
Subject: [PATCH] ALSA: hda/realtek: ALC269 fixup for Lenovo Yoga Book 9i
 13IRU8 audio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-alc269-yogabook9i-fixup-v1-1-a6883429400f@martinh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bOtuhfgVebg7i42c7iKSf3d5n
 KaZByIH4Qht9kDgU6L4LYHOM3Cz2SZGGRIDKaqUJkKzOqoavP1krPdLIzjKdexYlNpapWrWpYF
 U74GT+M9d/74fDLSvs2kAAAA=
X-Change-ID: 20260122-alc269-yogabook9i-fixup-351bb007e15a
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Martin Hamilton <m@martinh.net>
X-Mailer: b4 0.14.3



---
The amp/speakers on the Lenovo Yoga Book 9i 13IRU8 laptop aren't
fully powered up, resulting in horrible tinny sound by default.

The kernel has an existing quirk for PCI SSID 0x17aa3843 which
matches this machine and several others. The quirk applies the
ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP fixup, however the fixup does not
work on this machine.

This patch modifies the existing quirk by adding a check for the
subsystem ID 0x17aa3881. If present, ALC287_FIXUP_TAS2781_I2C will
be applied instead of ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP. With this
change the TAS2781 amp is powered up, firmware is downloaded and
recognised by HDA/SOF - i.e. all is good, and we can boogie.

Code is re-used from alc298_fixup_lenovo_c940_duet7(), which fixes a
similar problem with two other Lenovo laptops.

Cross checked against ALSA cardinfo database for potential clashes.
Tested against 6.18.5 kernel built with Arch Linux default options.
Tested in HDA mode and SOF mode.

Note: Possible further work required to address quality of life issues
caused by the firmware's agressive power saving, and to improve ALSA
control mappings.

Signed-off-by: Martin Hamilton <m@martinh.net>
---
 sound/hda/codecs/realtek/alc269.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 29469e549791..c832a1c75301 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3736,6 +3736,7 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC298_FIXUP_LENOVO_C940_DUET7,
+	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -3823,6 +3824,23 @@ static void alc298_fixup_lenovo_c940_duet7(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+/* A special fixup for Lenovo Yoga 9i and Yoga Book 9i 13IRU8
+ * both have the very same PCI SSID and vendor ID, so we need
+ * to apply different fixups depending on the subsystem ID
+ */
+static void alc287_fixup_lenovo_yoga_book_9i(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	int id;
+
+	if (codec->core.subsystem_id == 0x17aa3881)
+		id = ALC287_FIXUP_TAS2781_I2C; /* Yoga Book 9i 13IRU8 */
+	else
+		id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP; /* Yoga 9i */
+	__snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC269_FIXUP_GPIO2] = {
 		.type = HDA_FIXUP_FUNC,
@@ -5834,6 +5852,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_lenovo_c940_duet7,
 	},
+	[ALC287_FIXUP_LENOVO_YOGA_BOOK_9I] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_yoga_book_9i,
+	},
 	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -7191,7 +7213,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
+	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260122-alc269-yogabook9i-fixup-351bb007e15a

Best regards,
-- 
Martin Hamilton <m@martinh.net>

