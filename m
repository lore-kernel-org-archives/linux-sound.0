Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279146;
	b=gZHPfg+tbhLn9fkhVaoPi2SAW/ci9HlT5qrgyYgeLw1hBRYN/9gtBHoc8lN2KOFD4PyA
	 EaomIKbLP/qKTAMXzK0alPKWloNzLihemYqiplcgPUwqk9FPH8gEcoE73/BHQj6cYu03H
	 X0Drtflijy2zYWjllzMNX073cP+H9nQSLVjnxXo1I/5NsaoGUk6fNc4Xmz2jE+iBARsaJ
	 zS7ob9VDNxhEKla/iDhovGRZkTuyFv53Osz/a4BU9ALlY5HJrC/1zSWP+nGOFhDrDZA9n
	 ZkZ0UtiMCLcCIAIiIg3j68Y/Tl/P57JaPF3SQ4jNn0o2Vds0zy9iBYKV66ose7iJ2Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
	b=3QL8ecbc7GuIGnBgfZg87avG93/yrZHDshbb1qvhYdPQc3528+PydI6e7GBdH298bIJx
	 KFwPBHqzxsy0p1Qn/KBFbd5V6mUgwYXbSy8xpzaJRWMKkq+d3YrE1D93fPsWJ8313Cgsy
	 48oNB4ExBROMGY/fIFfqteLP01kxRd0358bRu/KID+wRiEBlgl5TwJnSE0d+dKNUPmmD0
	 5P5/Qh1F9QuwGftZoe5//pLQ8dv5GYF+ACSDP48A2luoZgk4IeohifZi6vG+Ar4nxM1Mu
	 lMYNi0SDB6sXdk/v0JBXIbioX5etGoVHIl9gmiO8wDWdNHZnidLCL0+jP6avkLSyh4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0Z1+RBH;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B7B606A32E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 13:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B7B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0Z1+RBH
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15943c9c005so1424893c88.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279145; x=1793883945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
        b=b0Z1+RBHNX51Mk1N0BEEnymeLKvBCMIDV3LQX1GA5YjhmMxTeZ5GUscPtVYL0HzVM9
         CpvsnF6PXb/Rrwk5oLrQgUD3wmD26JQHPv8ZjFlZz7LG37/3k3fOuI8L2Ay8+HVpOLCn
         NwO8ma+ICHu7ei1tvcD26EGn+gYfWN983XV6d6b8TvJqxEuQjMBqjUoGoyVawac+1x9A
         ZhTf45ucKratTaL+vsJn851UpfsHfPrymSSHM9Za2dlxDjJ+pvqha14lE+8VXudb22Lm
         BnCz3gSIzNoE0KWZzBHGwvWwEKh+mZvjDmpnO0MhiEqguhkEbg4PLz09+Ehbr0A9tmrN
         IECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279145; x=1793883945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
        b=2W+CpyVx4Ivqzhxa9f5uW//e2jLhLI5npIFDQTTm9drlKzri7GNkhr5RfU/Q7EFvny
         /kVwinXTJD6StO7+HX3zAuMXbNV1+XfJwdYSO6yQNbZWZ2XRXQxUjPMhVJJeNvspTdc7
         C2XBtF6yihRfLAmmDs7Wgg7sS1l2JncXgbUuWdGOwtmvLGB3P9gvdP+48Pughy5ljX1V
         eBcATk806fjPUBWGvakRWCkP+hUMPSGR8dktbCcy/+05UKrYzgJr123sF+qHrf4RBIae
         eEYBvyl5eUeCKXHvdlOXMS5CORUussJpwjyVS3ay14tsFZWKtB3SSaynx5dWTWGqCSqu
         xbEQ==
X-Forwarded-Encrypted: i=1; AKwUvByJfjJG1rnXHxFMg3fxp1cH9UQt+QGqWJJR2/rYZGu9XZkga5o4gFqZ1NIPeajOzjvE9v4hrYtlqgLvXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI3ALVteFMeVarQkGr2enQACwG4U87o2qZWH2tb5+I0i3ObPzep
	azgEINE+KgPhOg0XYvTttj+xX4k4gfZeDfRkm9GqheBQo16FMvGhyrzJ
X-Gm-Gg: AYBFou2lzIv5UB/jFtjBPYoc/OfZMLDfbLX7R3nkU/hjC2r7tnl1rkPemJoJ678QWcu
	ogvN8xfjRCpDwiaiutScdgdhAzhA4Kn3tqJ0rrw2URtqX1tmB7QpUu2o3Ge25IREDNKg8WqkfC9
	McLHyuWB/OtoayajUifcYTPHb0nugXdXOLuyIfdp6ENU0XHsFfLcaOsGrzT176jDW5S2Vih8jBU
	Vey1nNsSVnF52r4K1Vbo20ZtKs6YFwXNQT1JApUk4i6R4rNS3u3QSjeQgf/fv7JvXd/FXNDThkq
	dqVsJYliBuzsDn+WS5VYMfrwfxx1DKLUMERs9gzaaPw/gAegw7rQ7M46cS6/dG1/18OC/56bcfP
	D7ldbK8FAzgphweTse5HZqrWrqrL5F10FB9J7X2U+BtUsQ+5wigHZKvyVt1CiSf7EwR4yyNEzO7
	o6nucI00x2rhZal6OCuu06yJv39bwifhJWVLCzcdTpuNGXZsF8oz4bKsOYgX6QFP4P/p97L5Xns
	2S9JQWKqbdteNUDKf9dqqCl5/8jGE5lkNQixvQoLkgJh1+dsr2Jdgjv4M6kYU9YLyEqykIkUyli
	gtuVUDObkv6I7F8ReTL72kgqgd7c2rN7kbCH5kA0cA12yV5aYdVSI3Y+gl82kneAbcLtAGPnIKA
	1dbDpT0rIaB3a5MzLnN8E6ECLsIirDj9cRz4JY0ua
X-Received: by 2002:a05:701b:4509:20b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1a6cdb50d84mr7706490c88.26.1793279145054;
        Thu, 29 Oct 2026 06:05:45 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm15322824c88.23.2026.10.29.06.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:05:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: ump: Fix dropped data bytes at UMP System message conversion
Date: Thu, 29 Oct 2026 22:05:37 +0900
Message-ID: <20261029130538.1985867-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The cvt_ump_system_to_legacy() function switches on
ump_message_status_code(), which returns only the upper 4 bits of the
status. The case labels are the full 0xf1, 0xf2 and 0xf3 values, so they
never match. MIDI Time Code, Song Position and Song Select are converted
to the status byte alone, and their data bytes are lost.

Switch on the full status byte in buf[0] instead.

Both callers of snd_ump_convert_from_ump() pass the result on as is: the
legacy rawmidi input of a UMP endpoint, and the MIDI 1.0 path of the
f_midi2 USB gadget.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested with a KUnit case
for snd_ump_convert_from_ump() under UML. Without this patch, MIDI Time
Code, Song Select and Song Position come out as one byte with no data.
With it, they keep their data bytes. Timing Clock still converts to one
byte.

 sound/core/ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 0a7972d91ec5..ecbd894f4c83 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -69,7 +69,7 @@ static u32 upscale_14_to_32bit(u16 src)
 static int cvt_ump_system_to_legacy(u32 data, unsigned char *buf)
 {
 	buf[0] = ump_message_status_channel(data);
-	switch (ump_message_status_code(data)) {
+	switch (buf[0]) {
 	case UMP_SYSTEM_STATUS_MIDI_TIME_CODE:
 	case UMP_SYSTEM_STATUS_SONG_SELECT:
 		buf[1] = (data >> 8) & 0x7f;
-- 
2.43.0

