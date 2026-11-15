Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748994;
	b=Bafu4zyPgRkjh3p36uuQbS9O58+kl5s/dXaCtBzfPNmOpTTFk9znu+ughkSAbr/4rRcn
	 YhhVoXSRLeaQ1jyh1lwD/Z6JiNdWIMhHlpgl7RYQrdv0+Xbwc5T43bLPA0cx7oeI2FUp/
	 3Jrq4wZbikydkPvfvgPM3BnuC291cdebpNWA/oJTlvEPbj5ruC5qKrC+hCBmK8Ow5Zs6f
	 j8KasPGQakgOMjwE5L/a7uHBZ5fhmUrbrYtrZ9faIuqkpMsA/LsQ2y0k7SF8RNExgzkTS
	 4Pi1tuiKHLMg5gQ78sJwUmvZKsPnmXlc8IVuPxIfRofhLaD9jSLk5GfWAlDAQ7GAQxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748994;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CjqQPNhZow+JJGKg1R+gp2dO325Gr8fRFWJtkgK9zaE=;
	b=10woPfGtjhp9JrIXurI3JqR1W7reqxqbp8qckKXehzmDFeUxxbIpWEcCepGbi04QlUPY
	 hXMwKKCUTKMban0/OzY9MKbDGLB5PTlc3F6ySUB53zgmn33NYJ4KQKdBJgUsHD7ksw/a8
	 Ddi32Jrq2cc2plkLQOHo5cllaf1zo5Un4nZbBlKTjYywCjV8bIHfHmozFAezE6jDc7o4D
	 ZLwjs210B29OMMpr3+J0khD+z++ewz7GFD5CJLgG2xWfG+ne0WsQ7FPgXJwAz6v7ItM31
	 5TAq6ZinnNHM1Werdlhp95D+r3fMP1H4IGq+wGaS0pv4LzSjaQQtJjqxtCSAZnMLq1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F40606A31D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F40606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso2864810c88.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748993; x=1795353793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjqQPNhZow+JJGKg1R+gp2dO325Gr8fRFWJtkgK9zaE=;
        b=LKWU3SXd5zyftAXyQNhJywLKdpAN/W9w4EJQs604x0MbxDg1o0hm++wa0mceESTq7/
         U1b/WlS7htdJbwd2i42pLJTB3EKCtN5EI/Urw8IgHeoyjRFsQ0uptFpG9FoOaD262cMk
         B5maYJehLl8RblYO2Jw3L5UAcMKRlKZOvLm7f3WJ9tjZQbWKoZCIsnXD4Z+qk5y0XL4b
         O2ry3YTGeYyI59ACcCJjbDtrBuTYOGp08keXXWkLs0mWdebtt+q16NIXSSQDU0+UVy/A
         FR0WjgFc1ZaaVtBOMIFkCFerG5aZoZowhFs06j7cSyUa14l1tfPyS6sRHCu8NmdvjsIQ
         EgcA==
X-Forwarded-Encrypted: i=1; AL+hErG2L5KanEWiPfzTMFHFddXJ/V9vvurI8Pqcj+4ZMJ/fsE2AaKh6CUN2KUa2/2k2QCXYgeZA1ztW7DB0BQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fzJ/I8UKl069g6VBiat5DoL7XnUiP1GG+AUfiUT3h/39lkJ7S
	fgTjsl0xy36WSMWN2SGacyX6XVx9RmTsq0XKobZPTNHw2jivKe7vLnsV
X-Gm-Gg: AYBFou0kS17k7iTFEn/uZt9UNK07GEFb82DsoNbcZ/n/jMOC9I4nbnO6J0e4tm9kNJ0
	ThngUdULw3+k1EjqDqhEWGFamJxs1dKm+gUeqNUNy+VzqaXiKtt4PIf1X/f9WV/tl/1QAj89dMD
	H/8F8ZVSiDSDu4pJ4leErc8uPdmGjRUyfpB7BALm+wlR1hqywo7x/EyOyA3sKBuyTW0kUN8C2i0
	6PmL5LlEkvqmsEnk1pzPUuR1p67yxdfDl0cfFAybmNZ06em8snB1GQdaHsRL9+B84NwqYkmrju+
	aEFvmb5Z8sKlJ+JPUAJJUx7d/+zO+GSzEjBL/iLeiVJLkfmeiD8W+PeK+BZip84kZ6gH/R5gfl7
	updOq8CpIHXHea6AlmBx9ATEInH4uS+q4io0s4SOi5oOipWL3h7sQ7ASFcfSk1fmjtRUCHC/KDB
	6n7+J5tOPhjAnrWzacjg9faCKZ20tDfVEjQv09xfD5QO8ANUc/2UQ6wVyVVufl4QQw8RK3XPMuT
	p8WNwDWBgaYc/0iwKhe4xoavv/Us9toUxD1SE2U9TbIrV6Z+cXiff9D96E818Cb/LWe/+ECA+L+
	It5IiJ8AnD4h3Tkt8YAjqqzcvK7hbx7DNyvwiB3MriL2xD++kNoZl3xavqk1YcmxIUGAgg==
X-Received: by 2002:a05:701b:2415:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5030e74d1mr6757528c88.12.1794748992847;
        Sun, 15 Nov 2026 05:23:12 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm21263584c88.7.2026.11.15.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:23:12 -0800 (PST)
From: Sungwoo Kim <iam@sung-woo.kim>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>,
	Sungwoo Kim <iam@sung-woo.kim>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
Date: Sun, 15 Nov 2026 08:22:15 -0500
Message-ID: <20261115132215.4084031-2-iam@sung-woo.kim>
X-Mailer: git-send-email 2.47.3
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

The fixup specifies a chain_id but does not set the chained flag,
which prevents the chained fixup from being executed.

Should chained be set to true here?

This was identified through static analysis and has not been tested
on actual hardware.

Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
---
 sound/hda/codecs/realtek/alc269.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..1be2e609c28d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_TMI] = {
@@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x20, 0x8000ffff },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_L101] = {
@@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A1802] = {
@@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x21, 0x03214020 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A190X] = {
@@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x0201401f }, /* front lineout */
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
-- 
2.47.3

