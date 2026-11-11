Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417691;
	b=S0STBtk4g7WGZsL7Zpno2Vv3zIaJqwyKKoBU4JMqwSmjbdLHygyiOKBsGGRrgi2Bv6CW
	 /kVsfoPD0Muh38QeaixOERxUKSeIvvzKoLfk0q4kQCqrSVHj2x2Y3O5zbIISxo/UJjqPc
	 b3QSbFDvHzaQqfNdZwFfl3VpqThftNsfEu2YbwJinetEj8gUF5Qv+IKShQ/KcIr3e+gd+
	 SPXy34LVGOg1m0IxhNHGrWdLUpj8pZBvoHfy2Q55EFckUL2FKCiBoRAjx/gFHVbT3T+Sh
	 gkJ1Re6mrs9fgSmt9WZskArcn04dNnAPoFWvP10dMm+fWOqq4yI8p75ZOH16jo6/Sqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
	b=46IPr/qYV3ekFqmJwJg4h4wtZkKkofCOH1g+rntjD/Zk0BVQv9y1gZrlsqbkWgK+SGTY
	 WTO7bkSuIrLQlEoFYo21gm0lOXHhpA2sbivHUnV1D84Ha6b2O9So/L4YEL1lu6lRxx4do
	 jKXEcMuYg4GZGiuy7YV7ri96fCO9Ut7phYWVoso6uaAMpEFZQs9R5db+wJ4BGg5eAeNCd
	 4fbXT8OPXZukjOE93uGyuxxHYDnsoLCDYK4wPp4Awzxa1MP/C11ET4Mtdl76D1RVsJ9kp
	 WIri9/QHE9IP8f96BWyjhLJIwFACatSNk+ex8qQjMwUl8wu2uFxMCWVRsmv04/ly0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUXtfic;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46C606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 17:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA46C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUXtfic
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b31448caccso27875317b3.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417690; x=1795022490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
        b=DJUXtficeow3diFxT5wC3H0TK/XkcHWMt+5Je/TXWFWlsF9nScWyaeyJ27kg0OmaYz
         8e7+3oJ4HxReQNuowYXJQhFrTSR0+B6nT8AuJ5sXdtT3SdY77OQc/LwTrkPzzdZEQrtI
         yiPSc++MmEZJKKEUWHrvq7/X4tuA8ncU/ENBhSopGv0lQ+Hjzdu+vONojk3sojAmHnw4
         ovVaD3zOJWRGVW8u+OKPxiwrB2hZp4TThYuPjt/aVQfwuPFcoSexLtQV6Mj0AIpY4RAu
         6ljSVu+6MqqbsRcD67/u0V4V8XqZalbfyZ/ENmwL5JF0z7jeEwI7KNjbQa5eyq7vfQ1N
         SmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417690; x=1795022490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
        b=nNShshJJRjxk8w775NUHKUG4xm+NSNp24J+4qlQw85x2le8md+p0JlVk/3p2i97GCl
         VyUFDt5grAZUasyvvqf/CzaZb5qSt5JBKwFH6IVHSLVYmntaBIuHOqsMKQzcVHpIfueG
         xxsob+fsHyUb3UKIDkK/lDZru2sR5gsa4Q/bH3BHpTMF7qF0wVQog1uZyFlPZI62Bsg0
         /eTe4RLzjnxSmbPA1DYlWCy23yYW0c/l7SjwGEEp1vT5NQwf3qQnLcYvnx1oVY+hT/WV
         ZNs7CTNHJFK8jliVMsbZR4H36xXP+cCQ07nd8I/5ytN53SgC67FPXe5Y+w//jD7T/yJ4
         37ZA==
X-Gm-Message-State: APuU4Z+JmAeUV9rvx037A0s+n7TpW5GAL/IK43BS/y+ReoX6RLlUk1/N
	o/qek8rc8AaF4mbN39eay752ucHvnSRIfILrZG9iv8fCfYIYPjAFcMDm
X-Gm-Gg: AYBFou2ygqACBcfC8EcSh4RA2trYyfSFM9+1OmQ4ENaT4kBIW/BiJ6R4tJMAdjdGpUd
	5J6sVGF8HNr53wbhCjGuakcTw/0vEHzQ8D/ar+xIX5VTqW9+6Xk1/VdMxORScUUQFmupsh5bhDt
	GnlAMs9oxjdkgjSM1W4gTHMutcHM8okbfuLyqpyAgMYjuBWZ+cjwi51TdhW7ZH0EoQmlya8pzXL
	/kFgoAeAnsnNiXLaje6p861cpVgGcWB6jyTFU9Rs+elurrWupPJBhZJDrvrAx8kFrQztKRE4rXI
	TQ0oKyoQrW+tL2p3G7OG0ky9bnfjmsCTaSWDed4NxZQ0LAUjVACATyecaFNpEp+5pU/RGU/cEJr
	ffQOiAaO5A8klFGgjGPTTzweDQjRe96E9tYMWi4rCbyT+OxNzl2VdL2qRoqNlYtm04JxWCl0y4E
	GogN1tqWKiq0qhZjybD5fCFzc9znVhTrCEvQ7eDV3XA7Wd3DTiasZAMAoh8H66GuwP7VskPQuoH
	biyEhGXGZYmlwdsuKj48N0OZP3Piosgixsz28Md3P2xLGa52d32v5ui+Lzu2CtM4QzZwJzn4BR0
	1FLTEX8Ffej1ArbEMrVtePOLt2ri+PdlQA==
X-Received: by 2002:a05:690c:f04:b0:8b3:5b24:f575 with SMTP id 00721157ae682-8b3a81171famr23018927b3.51.1794417689523;
        Wed, 11 Nov 2026 09:21:29 -0800 (PST)
Received: from cacher.lan ([111.94.230.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c5a00sm49532107b3.16.2026.11.11.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:21:29 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Update quirk for Acer Predator PHN16-72
Date: Thu, 12 Nov 2026 00:21:08 +0700
Message-ID: <20261111172108.30011-1-faiz.faadhillah@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Acer Predator PHN16-72 (1025:1731) uses the ALC245 codec, but its
mic-mute LED is not enabled by default. Replace the existing quirk with
ALC245_FIXUP_ACER_MICMUTE_LED quirk to enable the mic-mute LED chain the
existing ALC2XX_FIXUP_HEADSET_MIC quirk.

Fixes: 34e08ad3a8da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72")
Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
---
v2:
  - Replace the existing quirk instead of adding a new one
  - Update commit message

Tested on my own device; Headset mic still works and mic-mute led now
works fine.

 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..92c158e9d91d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7553,7 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.56.1

