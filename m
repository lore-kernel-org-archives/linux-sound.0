Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB437754C
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785051906; cv=none; b=DRiE06i+z4EG8dNcNKtQIBJPYME1vEFTjezf7k0MvO2VGfcFdNcl2Uy0VDn/v78MzJypbulc4GhNpeoBdN8T/sAwWiZDi3eiB5rek0Z1j+rQtcB8QBcRZEWapl1Z7LnihVUzpyh6stdoW2oxyUyX8VWo61pjYMuFUAlUa5t8Z6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785051906; c=relaxed/simple;
	bh=o4sS3pNcMrPIt5lAItdgt9pdc1g3KpcfFAAG3Ro9GY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIMNPWmwa7MGtf2l3Y/JsBmmyqFNH+nUJSK2TmVU92sLdPh5Uhh24e8jrOieyRWAgSWSgq1Poy8HVfXrkrPJlHYmwJbY62I/180+cLkG1IQo4fJ38A9h5Ek/PX8SyyiKrYWaihuJSUjWHISFSZnqkXlPto9thcwS/6Wf0e3W0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=FlTQkO9J; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="FlTQkO9J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso20883035ad.3
        for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785051905; x=1785656705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIOw3G9cR0WlaOF2E7R+FHWgkAS7O5dwSaIK4mjCqdc=;
        b=FlTQkO9J0agDe7ZGq9c19K0PAjr75oNPEvmPR3BDLnXsGA9+/X9dlL3cdIM89cte0v
         mOEhdexUD2YZCkaagxXJDKKg7X6yk16DxFWADSQ5D3CqgvE4MYU3Yuk7l5K3iH1qnb6/
         Xnw4ds7iZkNRtghlxXv90/xO8uCHW9KT+hEFAlnNmabsTPC7k/cXU2ZYppnrGo4NWgED
         pL84MpMLES1VFFx7dC7MkyreRAcwxGKASYMEFa6HiVBEtasswDZjto2+IAFXs9XBTtAm
         vYp7nyff+/kj5YkJvhv3uHEWsyyLBZt75o0B6Y+5fE5EaYMyn/YOj/vUuhCUECSA7WCY
         tgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785051905; x=1785656705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QIOw3G9cR0WlaOF2E7R+FHWgkAS7O5dwSaIK4mjCqdc=;
        b=Md1BAmLVt7fyiVo/kZYLZVDEoTjkhpRNhI86wvjKBwkNOhl0VMjcBKldGzSM9vQD1H
         xHtXcxNQcu55LRfvGQFFIlLuUDIrI2ImJhpngG6tTqCBWxrj5XxaKoCGqNDcl5V594KE
         v6+RcQP3XTZJGAvFyMeMssnivAV/5cgBcjQxrZW8gSz3BrfEYeK8Rb4Fs0it5cKH0l2i
         297zRVmAlPym3ALLLU3DfxUZBPZD0ilcwGCGASR73nC5gw7mN1e2WzXnLqqjYW62lsF3
         bP612UXCBECG8R4ixZaoPbjePHliYUKDwxCws1UxDNPh6JCsZQAWNj/5rmb5UIjf7Yyf
         w+uw==
X-Gm-Message-State: AOJu0Yxo2KVkRZK5CiTOkxVTANN0tmsh1QZdECI/w7vg4Jr9tlJWcLFj
	Gm/nsXOgcicl9vX1SxcH3zyEbjwvrPvILjLdpRWaZrkO9k07n+T97SKHVUhcqkhswaIv+mCdpDs
	/UkreIjY=
X-Gm-Gg: AR+sD10fGCWI8G3UKQc5TNoTmS4JLzEEf6UsIPVQf1DLXa1lMfwmcbR17X6M6toTfhJ
	ZvJYhQZpL2pmSWv2bxk0U/dT5PYpttL1g/SSTzechJ7Xdn3IPYBDQVLc3J7n1eHuOCrAkNbIle/
	3Piu/9e5mj6OfZBjFePsI4gWiLDQl0tfGqw6XYkdB8PlqYWH1MlbQsCP7iAfxYP2zJRRad8S7yC
	wZ6T2uPtKg6mZmVXhbmYcDR9XT70aXJ240Zi1hPb5gznZWe6Pz1miu1pyL3s4zYC9jTRB/21S1D
	UqWkMJ/C3CoVgc0VOeegdSMLpEt1xtRtqnIDaW7YTXka0avbEszTEcBx9JvI/FE+DiOWF11/Icf
	6yBdRo0mx49fKIaG4txnlqxP+P8uRuUeZBhHuI74OmLR8RonClu+6TzGDctPj4zVTVDiQ73r0Ae
	mfJsYSY/7oGPixs4rZAZ63kbQ7c4tRh00wg4SfrypynfnK0pKG6bhDpnG5mec3
X-Received: by 2002:a17:903:17c8:b0:2ca:ea56:7a58 with SMTP id d9443c01a7336-2cfde851e69mr38145885ad.37.1785051904571;
        Sun, 26 Jul 2026 00:45:04 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc502sm17143375ad.54.2026.07.26.00.45.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 00:45:04 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: tiwai@suse.com,
	tiwai@suse.de,
	perex@perex.cz,
	clemens@ladisch.de,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: fix OOB write in snd_usbmidi_akai_output()
Date: Sun, 26 Jul 2026 16:45:00 +0900
Message-ID: <20260726074500.50145-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260726052040.41315-1-baul.lee@xbow.com>
References: <20260726052040.41315-1-baul.lee@xbow.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_usbmidi_akai_output() computes its fill-loop bound

	buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;

as a signed int, so a small device-advertised bulk-OUT max_transfer
makes buf_end negative.  The loop guard then compares the u32
urb->transfer_buffer_length against that negative int: the usual
arithmetic conversion turns buf_end into a large unsigned value, so the
guard stays true and each iteration keeps appending SysEx framing and
payload bytes past the end of the URB transfer buffer, which is only
max_transfer bytes long.

A USB device that advertises a tiny bulk-OUT endpoint can therefore
trigger an attacker-length- and content-controlled heap out-of-bounds
write when a process writes to the created /dev/snd/midiC*D* node.

Return early when there is no room for even one SysEx, so the loop is
never entered with a bound that would wrap.  The loop is the last
statement of the function, so bailing out is equivalent to it not
running.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 4434ade8c933 ("ALSA: usb-audio: add support for Akai MPD16")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
v2: use an explicit "buf_end <= 0" early return instead of casting the
    loop guard to int, as suggested by Takashi Iwai. Verified with the
    reproducer under KASAN on v7.2-rc4: without the patch the kernel
    reports a slab-out-of-bounds write in snd_usbmidi_akai_output(),
    with it the same run is clean.

 sound/usb/midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index d87e3f357cf7..f8996416c3be 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -797,6 +797,8 @@ static void snd_usbmidi_akai_output(struct snd_usb_midi_out_endpoint *ep,
 
 	msg = urb->transfer_buffer + urb->transfer_buffer_length;
 	buf_end = ep->max_transfer - MAX_AKAI_SYSEX_LEN - 1;
+	if (buf_end <= 0)
+		return;
 
 	/* only try adding more data when there's space for at least 1 SysEx */
 	while (urb->transfer_buffer_length < buf_end) {
-- 
2.50.1 (Apple Git-155)

