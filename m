Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271F2EA151
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850286; cv=none; b=lqXhk8KGjtdJxbI4nZIRc6r8db+y4fhnOdskM4chRbLd3oEOB3SPWKoGmspC1flFFZzCJHvweby9eMK4i+qp+vVrSBWef11EYuJ4cn0qeBbrFX34oGMOMHGgyia0uhLzq3HhvKsScvrYN1n38CoVXopwlIKlhU4ogKPedRKgCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850286; c=relaxed/simple;
	bh=1nwfCdmMnMg65WBKK8lw9ZoudANllkS4N3veO+B0VL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qG9z80fry9HeUTQS/p5VrBxKiAfy3V9QD2Dovm++la9dZH8j14igmjEXcieUwVV6nA9XaIW063dZzGruJBgHXf+7X8Drvqy8PJDJYAQXARvmD4uWJmznK/xGcG/H0UWznA4wvCYgWPeUkc32DT6WnEMkARsXoPXsEhoHEd5hBy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iitj.ac.in; spf=pass smtp.mailfrom=iitj.ac.in; dkim=pass (1024-bit key) header.d=iitj.ac.in header.i=@iitj.ac.in header.b=FP1ZF9JD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iitj.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iitj.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitj.ac.in header.i=@iitj.ac.in header.b="FP1ZF9JD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842307473b5so1205902b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iitj.ac.in; s=google; t=1781850282; x=1782455082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQo4UvjNVvrYqU7Y+wep4Sy8I2wUm/d5UrrzO59jjuw=;
        b=FP1ZF9JDEiMgRph3UQlqDTBPxQEPr1Ypsl/EfNh1AqJR5jDBXAXY4SXzpq5hDWyH5P
         CxvuByMq+6wgypKUBtb8Cb4tOE2kKmFHhznzGeOIWEs+mjn2AKahm4AvKO75b7YrdL/h
         jW9XDjROlRmHmzTRVDXAG02kyQShIByW9JAEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850282; x=1782455082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQo4UvjNVvrYqU7Y+wep4Sy8I2wUm/d5UrrzO59jjuw=;
        b=GabYRbe00nJc4QEhodX61t7HFNarildIPN6R0PbcaBfcOk9htbpVj5CM3/LVrcFtVl
         rU2Fp/sAkJaBJUdzlmKLH5h6cNPmIOZ5tp6I33Pbi0Nbp5EwJQ03ZlWcPwVscIQjCdnk
         a5roQxeeh2CtkN3BCN/lGqM65ESaMIg6X1wS9EM9eWaum+dwT3oLlMN/Frg/1aY3+hTj
         69Aq1tUNXZvFUoJf7CxVxM0A70fzG1zwO6K14wOeLcwoPg+teIjBZFfl06ECrUY1e/9I
         0pNnkg7C7hYmFsZ+oHv6G6Kt+bjkd/Wg5r1e5pWXz4VS29FxuiNMmcxof1Q881x8PG34
         1feA==
X-Gm-Message-State: AOJu0YzC7a79JNXz8RHtUTD0D+u29HHsJ4+x8ApHLWAE22Nn1F4ioc1r
	5oqviD6gN0UINRdOl3o5oolDIZCf0ZW++TBGOzM5z63dKyvs0Xb2N6SNjv9oPI5nV9c=
X-Gm-Gg: AfdE7cnbW2zz62MuZ/GtdHtjXsNmJCxvBakGGG0EuoHEEGYvf5OgUnCdrVZr8fnj1mw
	1A+yVjb9wVE/Z4gglEP1NPYzAUlQ7Ac5cMQFgRJN0+DCC6AIiqi/MkLCdGVOmnjtEvENzkmOdUO
	0cj6p6zSU+OeH4cINqT3dc2IYJbP2qjNqRlmmmv7Vuc2PFOHXw6Fd84gNfwkZGO/ugZPVIPuKHA
	eztJJMDxi0GchOk4Vx8Aad8HwrhhfWizgluNR9pqCRBJjy/sgBlXmiaScso7RmhGgGckWIGu1oM
	+ptrfXcW7EJ67YbkfzO8OJlghnOZKnftKD4XfEsdEsbNCMI5pQXpBMfSNf6/iUTKXX7rCa3Igc+
	MSMF3dKtcM//CmvVuWTyxJCKyjZlxlSQfRBgHegYwXQeCZKG7O+BMttp0bum9hXHR+6vqExGFAm
	b7LESTy0uu2NfIGa9D
X-Received: by 2002:a05:6a00:9299:b0:845:42a7:ae81 with SMTP id d2e1a72fcca58-8455606a48fmr1472568b3a.10.1781850282621;
        Thu, 18 Jun 2026 23:24:42 -0700 (PDT)
Received: from fedora ([36.255.88.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364d4e7sm1194882b3a.11.2026.06.18.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 23:24:42 -0700 (PDT)
From: Ramcharan Rajpurohit <b23ci1032@iitj.ac.in>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ramcharan Rajpurohit <b23ci1032@iitj.ac.in>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED on HP EliteBook 840 G6
Date: Fri, 19 Jun 2026 11:54:35 +0530
Message-ID: <20260619062435.26256-1-b23ci1032@iitj.ac.in>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 840 G6 (PCI SSID 103c:854d) has an ALC215 codec whose
mic-mute and audio-mute LEDs are wired to the same GPIOs as the already
supported EliteBook 830 G6 and 840 G7. Without a matching quirk the LEDs
are never registered, so the front-panel mic-mute LED stays permanently
lit and does not track the mute state.

Apply ALC285_FIXUP_HP_GPIO_LED, mirroring the sibling EliteBook entries.
With this fixup the codec registers an "hda::micmute" LED class device and
the LED correctly follows the capture-mute state. This was verified on the
affected machine by forcing the same fixup at runtime via
snd_sof_intel_hda_generic.hda_model=103c:8548, which made the LED work as
expected.

Signed-off-by: Ramcharan Rajpurohit <b23ci1032@iitj.ac.in>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5d09baa6d..67855f25f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6986,6 +6986,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8537, "HP ProBook 440 G6", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x854d, "HP EliteBook 840 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
-- 
2.54.0

