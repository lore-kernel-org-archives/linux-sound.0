Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52B291C10
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770502884; cv=none; b=HRweMdprNuHBdGWvpU6RNgM0CCu8qcftjbXlFz//r1UfheTqqG0gs5cPfTJJQ5+t1u8VnbGBO6pUIq5DD50Wti5ApqzTpA9mMGiUMJ0ioJsgcaqk7ZLjwgNpdbXVr367FPs2bHJ9JLxOz3d4cAAfq5tN/wZOjmO6TCBKLDiBnXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770502884; c=relaxed/simple;
	bh=xXu9pdncEEvsLWD3e1399f1vnqybnz1jzABz0fprAG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1EM2mf4ICx8rWe8w8nuALO7KWtsQEn2fNY0Zlvy0fS+QQ234BfxnZnTr38GYWyzc8uZBHLtsw7UpaXlm/BlZZBokHjz4tGXJSD5mZBQklEZuAXpxHiy+8BF0C5ZtScewjBqP2nAo0ZiWT5RUPD3U0osxKdANfuMXxwKt5jkmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLcftiwh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLcftiwh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43590777e22so1096445f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 14:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770502882; x=1771107682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6h6x+7z2MB1sy538C9nfVXZCNsrgyU7Ogs9ngekU4tw=;
        b=KLcftiwhcI8kqkFDz7i4frYsnX/UAIWC5n4XBG/j23IvIAQLWEJn73qgLf1uzNRtCs
         d/TWWNNTOJkYRsmaPyV/3DniEM6rBI9PTlGclV8PFClAuaZfQamIr9x6jtOOCjgK+TNO
         CWbIJTTf375sPiTU/gql3+//NrtwohFqVb6IgDlVidobsmphrNwTrG64D2de4MpCv1yl
         BZvU78bRes6QRR3NiPLSsKVzUhswydob40zjVVyoVV5J+1EwyzUWKSLnrRhVsm5NPFa+
         vvT9G7MvNpzBACFS2X/KOIcC4wj5wUB0o18beeHKt6E3WAK/IoqPozbaBjdz7hrQtfmp
         5ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770502882; x=1771107682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h6x+7z2MB1sy538C9nfVXZCNsrgyU7Ogs9ngekU4tw=;
        b=j26y05EeC4676Unq4BCMxev+YxFfNv5b8P6T/7wyoNasDZVP9t8KF6QkVKRaEz9K+3
         4Fq7agNtXvzx1Wqyo2jeAXqeDDcT+e5j1P73sO+LK4BS/OjusCSWJTO2qvjP3sCrXZy9
         iUcgqqWgHnDj2mpZnuhaLCNhOnxYwVdHb6jwkUfnj3fg1uHPXVxxtpVObvXcLK+rj7tN
         frlQcN8KjHLEWvLFN6Bge1SYg6sBrBasfmLefiNHiDaXYjOmDsR8Pb1hlqfVt+U26do8
         scjCZ/ZlXJgzRXoQpGY8N6j12g5k+Sz7W3OXwLdkyrJkw6qQCQTea9BCSdRC4czjFiDr
         cQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLcRxJDchudcMpHb+/Crm8wr8DlckhbYPfpw2LBn6HbUxm+Gn9N6ocUwZMIuq8I6EG+DF6juyCcYW4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFDTs9QAolv06WF4S0cpPxkgrsjGikn2gEtenvF7N71HHKvwc
	5KVrnXhYqGjIPcQ89pL8O2wcmMtDphBB8w4zf0pNp6ihSjBfR9Spacpk
X-Gm-Gg: AZuq6aJeKeFQ7sFMWBitLpzb70VXdTU8YaTPP4e1YKibdmyx1OvCW/Edg4oRFCZUARx
	my5NUx3V/bUfA7L6iR3XD7Qxxqaosm2bQBURwIswA47kdStxOo5lVFHYXUyJ3bCWQGPeX14Y6qg
	NLK97szjH9epMYKnT40f34PlJE3Ifmek6PeggDs6Ad3YrNvq//aCqEn27YpX2x8Pk02puKDcPhO
	uoght+Al0CaomdETexMeMgCz2a7rtUfCZAm0EB+/GPo5Zu6z5oD5uyMaziKQ9hLhggdRAeod5aO
	7OfwGpvMloqa/2VmGrEMyfVBwTeYe6WVK3129hV8KmR7/sra23V1vRJ6j8teEG35S5hNvaODLBt
	6vC9Ziw8pdpYvM/k/+6lqzX3aQ193NQakhX6JHtxx9BQczJb1jQsSrZdeMGudQgJ4rlsd71JGfz
	5BY9FbDa3FxLbaQCreYXuaxvC38GdIqENjK9tMRtFX5DqNcpFipfYws2cQCd32Ypub8i/KM3flD
	eNEn4XmAEHoe03stWcpqgDJ96Y=
X-Received: by 2002:a05:600c:4e8c:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-48320212d56mr108429875e9.24.1770502882198;
        Sat, 07 Feb 2026 14:21:22 -0800 (PST)
Received: from zhelezyaka.speedport.ip (p200300f66703a50d1a07f7413660af65.dip0.t-ipconnect.de. [2003:f6:6703:a50d:1a07:f741:3660:af65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm330833305e9.10.2026.02.07.14.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:21:21 -0800 (PST)
From: Illia Barbashyn <04baril@gmail.com>
To: tiwai@suse.com
Cc: Illia Barbashyn <04baril@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org (open list:SOUND),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: hda/realtek - Enable mute LEDs on HP ENVY x360 15-es0xxx
Date: Sat,  7 Feb 2026 23:19:37 +0100
Message-ID: <20260207221955.24132-1-04baril@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute and mic-mute LEDs on HP ENVY x360 Convertible 15-es0xxx
(PCI SSID 103c:88b3) do not work with the current driver.

This model requires a combination of COEFBIT and GPIO fixups to
correctly control the LEDs. Introduce a new fixup function
alc245_fixup_hp_envy_x360_mute_led and add a quirk to apply it.

Signed-off-by: Illia Barbashyn <04baril@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..8454633a540d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1630,6 +1630,13 @@ static void alc285_fixup_hp_spectre_x360_mute_led(struct hda_codec *codec,
 	alc285_fixup_hp_gpio_micmute_led(codec, fix, action);
 }
 
+static void alc245_fixup_hp_envy_x360_mute_led(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	alc245_fixup_hp_mute_led_v1_coefbit(codec, fix, action);
+	alc245_fixup_hp_gpio_led(codec, fix, action);
+}
+
 static void alc236_fixup_hp_mute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -3692,6 +3699,7 @@ enum {
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
 	ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED,
+	ALC245_FIXUP_HP_ENVY_X360_MUTE_LED,
 	ALC285_FIXUP_HP_BEEP_MICMUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
 	ALC236_FIXUP_HP_GPIO_LED,
@@ -5344,6 +5352,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_spectre_x360_mute_led,
 	},
+	[ALC245_FIXUP_HP_ENVY_X360_MUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_envy_x360_mute_led,
+	},
 	[ALC285_FIXUP_HP_BEEP_MICMUTE_LED] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_beep,
@@ -6600,6 +6612,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x103c, 0x88b3, "HP ENVY x360 Convertible 15-es0xxx", ALC245_FIXUP_HP_ENVY_X360_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x88dd, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
-- 
2.52.0

