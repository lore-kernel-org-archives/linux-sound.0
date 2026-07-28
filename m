Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE03AE6EB
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276813; cv=none; b=uup8LyZPZv091FIpsxUnm1Mj8SD/+/D1TKcBXcwSkceCC+7mB9YuYFNPIriBL61weRUt64vfN9pf4p2wvdHdeKsE9rwWxL77FgLQfuwMZDVHDv+Pt6/NT6bsrE65qLn6nYOE1G6cHgJOLpziKn7yzstuWGZWhieqfzJObqGAWjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276813; c=relaxed/simple;
	bh=S0v9OZJRW1Wi2klLoXbXsMTp5OnRNgeyaEIfTJhiTWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V55R88++7UqZYSHu5f+Z5Fem6CaurVSHnm5h58zxNLtd74fbDEzHnw1gmeF0j8DIrGaq4F/2dQcBwE2qtQDf/iypun+YyGFYcaLqRxIEPTGvXXCSLspg5gyarSOTLgZkpzMefQbodtFE9LJy3eW51ETfzQVCvqk05ULd8aLRfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSkofF3s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSkofF3s"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso320236f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276810; x=1785881610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STrXtc+jydjtTIXKDcXHivy4WDM1ydHxEMXgQJ0IOfc=;
        b=nSkofF3sgc1k+yYtVx/GScKpHKA3BtgfY7jfIhgS4Ap4iLN3DPXUOoYEL9FwQQxO2K
         1RsvWbQWZIvJ/5vrPmLkw5lSOj683NFUwHPVBOw8WFZsKT0NX2Yc5sajuNV1nSy5NZqz
         R67ZZsc7HHnunJFH5nvDUytkPyM2g+nf3/27eaOD3v4v8aD/SI7JYZnHVg/C23XLIE0s
         fB857BO45lJr0Dhi3GeRXQcApME6j8/qia7yfh/IrXalLh5k2+BPWLe4ZqR0xCkaLKZ3
         7Ao3MLQNeZMF4iW+HQFCMYvu2D7C2owOFiIDjyvsx13SkE6kWMSCaqlUH8OxN0cezI+r
         zDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276810; x=1785881610;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STrXtc+jydjtTIXKDcXHivy4WDM1ydHxEMXgQJ0IOfc=;
        b=KFdGxVHMRojbh/Uyl+ZymyYiyJUi4oM8j7Bbl6nv0UCkWcs78TKyVZHfSu08yASX3c
         TUWn/2C/3/VAvijDvu1LJG4A6n5lhbhWqKEX3WnniUaj/qX6b+nowMb23bTV0Newxrht
         iYsnihzOosGug679IiRIDoq3P35A/XHILyLYLrtaRrwTphZpepeaPT3gzgb+F9SOkYSO
         jKbQ/4MjfD4d2SUI0RZoS1YVvNkGPsGU0aHhqqM4mYTle/29gOM584gTNSwNDLCcV6gS
         8Ig5PQVaY87pEZCiTsP3cZ4ofDcL6fdvbR/rO0c5eWXP0iClJ8zmcfCm6O0JUojF+DYC
         7QoA==
X-Forwarded-Encrypted: i=1; AHgh+RrnSoTVyDXWNtR3zaeTbBn3lhLimtR0rqaEEEof2JAdhjfN2M9fL2IAXwnbC0ga+qC9YxeY0xms4QVvnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoaQf12Effxf1US1DSU+/qmf3iCWYeoTeVv18hsfuFgRbgQbV6
	kkzThzApV4LD01dXN0KymUkbGpkPNf+czyFZMFdNauuAqXB3fJcNf/fW2GmECs16
X-Gm-Gg: AR+sD10Nh9tkioa8hZNWNPhPm6irAWWL5manTcsarOfcLUA1L44NSPIbvGkCfWE/KTc
	yhlR62I+5pxfC+svy6flMzPeg/BNKjy4TDoP8zCGYpR5l67HCUFI43DbqxloX5B01hu5YIR1U1D
	8DblY9Bz5e+h9QvRGUQu8OJTCoo9ew7Mkp5QgNvdQ1i7MKvL4qP9tGlqA2R5PrG/76h4KmM3y+J
	eDM5cqA5AwYYHFyggA20opnRmsQAhGNqAZTOok7nE//MjWaU96TXlp1Qf1BgJHPRBelfAx+bjeb
	TbzpXDEVuKF91e/CVikw1HuEMzMbgZK137Fqm1KrqCe34ue9k7I3IQH+RgSVz17F3sGmKNmPz9l
	dUZ9IAlTW1pHlewf14PfWCT6b+GKH7M4vtfJ+xwAcSLz1pmpVN8w9zaG215VTpzE4jrhDu0Td/X
	cXdSpo3DOqJQkDYRmz8bVN5nDmus+vNWW/
X-Received: by 2002:a5d:64c5:0:b0:47f:77a4:fd0 with SMTP id ffacd0b85a97d-47fb1e6d4fcmr5159711f8f.22.1785276810263;
        Tue, 28 Jul 2026 15:13:30 -0700 (PDT)
Received: from pixos.lan ([2001:818:e86c:100:4ad3:a7ad:3c5f:281])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa392asm2202872f8f.5.2026.07.28.15.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:13:29 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Pragosa?= <pragosa512@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Pragosa?= <pragosa512@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 16-e0xxx (MB 88ED)
Date: Tue, 28 Jul 2026 23:11:25 +0100
Message-ID: <20260728221129.14680-2-pragosa512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add subsystem ID 103c:88ed to the existing HP Victus 16-e0xxx
mute LED quirk list.

The HP Victus 16-e0xxx with subsystem ID 103c:88ed uses the same
mute LED coefficient configuration as the already supported
103c:88eb variant.

The mute LED was verified by manually toggling coefficient index
0x0b (bit 3) using hda-verb. After adding the quirk, the LED is
registered as hda::mute and follows the audio mute state.

Signed-off-by: André Pragosa <pragosa512@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f4ac..1fc8ea6d3331 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7177,6 +7177,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x88d1, "HP Pavilion 15-eh1xxx (mainboard 88D1)", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x88dd, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x88eb, "HP Victus 16-e0xxx", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x88ed, "HP Victus 16-e0xxx (MB 88ED)",
+		      ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x88ee, "HP Victus 16-e0xxx (MB 88EE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x890e, "HP 255 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.54.0

