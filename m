Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428463;
	b=Kwc6CsOfjom2Cw9thYeITv7sKUJQ1CMSWImWtbVltMAHoEuaC1DaHYVgRbGzMDbQM3LA
	 w2z9dyl6jQGxdT0KrBumMYd6vorMx7A36Zldm1tV7+kuV3e9TrD9RcEwR/95BV7INwHl7
	 j4iLUWqmmN5ZVOpgbRXBlY9eJVyiRIoL3C9xiBcDdkjca94SUEoz8yR2OSaUng9KGvZBS
	 HYWhJugaHOupxs5chDZwgc+82oUzHJplUhfdgB3xuhfKFTDXVkLQuPwiy3UqffMCS63Ze
	 70Eo7La+8P6hzUdndYRyyq6zzi8kVFPzUf2H1qNkTVO3lakWJA8aPWnDv8Fu5db8rcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
	b=n4vuavYnx7cJc4MOZe4tXj1IeW4VMLGx+hQlMt/YhIQef6v3DtIo0Bbyr0RvEpD+amI0
	 Y8TDWA/aaetOzw21c2wegiXu9k3bQOplSuwigoTw4+bmAeFkKRWXmMgNXMfkLOuirt6DK
	 MNAZvfuK16bmpNcY3zMTm2G+1xLM68PQ8LYtuhOjC3iBK3I3eoqn9bWTmmRPOEQSWUjaB
	 7ynuE5OpkkPEHIalxd4S8L8MGpXlIqBjIEYM+Jko524/gwZLx+ctC7ZNqwHE8TF3oG2MJ
	 8mKtdRyBquqU8P/vXprMzj4qjbJj/rS1+yXnK8UXvdP8UtIAbBtwKcqpHaR4ZDoNMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xpvnq2HT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60E606A325
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB60E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xpvnq2HT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so17107285e9.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428460; x=1793033260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
        b=Xpvnq2HTrnUk4hfzuZpMjcV2xCKd8TMLNEMgvfv+0DdzmU9FRnIA4dWNYg69XCDL6J
         YbMZV54UxalWCqLi4+G8u3P97REwiwaO3Wlcyhs6QMPIgNZ29JuUVfrx6tjkOM2DxaXA
         Za3THjryVwJ7rnbNkooWYnHn3fNfKcAjy7pGarKen/Nkq0XTqOJWs+Tzz4O7MEZnjqcq
         NREp7xn2NDTrlq3U4LuPglxt6ysNeB9fiWA6tTIHA0i1TC5d7TC+Z1atAp1xaQBWKSb5
         o1Eekqhuw2qh8f6qHiXKO0tK1zXniROhG4iMJtWDlaaOGK0HYhS1stelGqzy99R9OZUJ
         lIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428460; x=1793033260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
        b=o+GwHk3sbyxaxbvcf5uhiGmkf70//cd2FjZx6vLycqzO6yh0Xekql8EwTMz33somct
         HNog7QvmqDmsKbvmTNS3yanXRInRaIUpGemtjXNWo+zhXAAwNyIEnUEwDIRE091pSFN1
         4MVcaJ1gPumf80Ib+hECibZ5+o8oEHewNUBDfZsuG7VQw/4ImfxkgRBcpUIULrpDMTgK
         OAoYX1IFsQpuaOEO82dwicdcVBz+2lsuUhm2aEccXD8WgjEju8nIBgIbP8ylg6eujs9Z
         uZTJNsu31zb0uRIOVMMR2dOQM7ieQFmz7N4vQF/a3Gp1V7/I4yd45ea8AmAfr6Y/jayO
         LRqw==
X-Gm-Message-State: AFq9FYJ60lq4M0i7BPAwnift8nsqvUxXLW/MVchUouDTZWndbtlZ1HaS
	yQyasShyIuauuHL3ucF7gG0YfT8jpQscw4hSvmEg8P2tB1HNIn9VgVU7
X-Gm-Gg: AYBFou3mhjEtZ33Svy+O5Eo1WXfSdySnMjPLdqTD3AyTE0+HZN2fHWlFEVpzhu/MEr+
	Pv1Y81YCiEMYDKSfTBbdelzPNc5+CagfOZYCFnriyf/nDZYF+R4Y+YpXloywwu16bEcFE/CZFxZ
	kw5/jt7ihUvfOZHXGEkFv50xGmrsbWOaoYAuTuL6DemwOS+UqYNHTHH9hkt6XmM1c7NwH8zdMwk
	D3MC/N+Z8WhXXhTh+B3KQng9Bf0HshlF4mvZRdOZV6Z5MIArZjzBZARGvLL1E5JXfsOwOli9ZJn
	62eIBbdF39DhNURQk5k+0HuqNk/UrcnfVb2a/kdW8M6wB6h66q7Ohcg7q05vDsfg0/KGNJ5LRS1
	0ws6DHAc0L2euWZvxu8IM3/ybuPyRvp1L8kv/fZqSXgLsrCOJQ1OwBgfiTLBbvEgvTJEUhlfYGh
	73KfQJgJznvA0pWKpfG3b0L2GeW65lNFUu9mmdIjvRw+szxUnoULYFensEZX441MBe1p35
X-Received: by 2002:a05:600c:5492:b0:4a1:e4c4:f6a9 with SMTP id 5b1f17b1804b1-4a1e4c4f8a8mr90899505e9.23.1792428459935;
        Mon, 19 Oct 2026 09:47:39 -0700 (PDT)
Received: from fedora ([185.212.237.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm193400685e9.3.2026.10.19.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:47:39 -0700 (PDT)
From: Moroz Tymofii <moroztymofii@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Moroz Tymofii <moroztymofii@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED on HP Pavilion 15-eg2xxx
Date: Mon, 19 Oct 2026 19:47:25 +0300
Message-ID: <20261019164725.10666-1-moroztymofii@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The HP Pavilion 15-eg2xxx (103c:89f6) uses GPIO bit 4
for its speaker mute LED.

Enable the existing ALC287 GPIO LED fixup for this system.

Tested on Linux 7.3-rc7 without an hda_model override.
The F5 LED follows speaker mute/unmute correctly, and
audio playback works normally.

Signed-off-by: Moroz Tymofii <moroztymofii@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926..b3ce4c238 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7550,6 +7550,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89f6, "HP Pavilion 15-eg2xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a05, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0e, "HP Pavilion Laptop 15-eh2xxx", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.56.0

