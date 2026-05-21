Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058D3ABDA8
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361301; cv=none; b=sjO1D/NgtDIBxRgJ8z1636V6scPsiGeIovIq7qSFVO152nWAl3VhWUWQqXsFhmQRn7eVNaUKrf7l2mPQm1qZ/ZG1ljt4bRU7f6ZFBfWBSoVM+h/1o7ojkCoiB0VL/EMAAkl/QunFmOf5wZiQEsIdQq1LPKn/ZckcQUJUNWbq72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361301; c=relaxed/simple;
	bh=x7eWhfGu3dQUgHL1BW3vucHVFwNpD0MaxyrtevC/hYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CF3RwtTV0h9Q9Roki0rggqpgtXQvib6qrGAoDXlvGRoZxsgqAkT9XfZbWBsU+/DYcky7RykR/spR4qgIYNUPjSbU9WGFoufBA2H9MZNtcktMmUT+qZbo2PDvytWGWTNjwMm43Cp8mWWYrD95BQRxLlrHdYOA0L9V+JWQNQzZTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRb56IBm; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRb56IBm"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso5972703eec.0
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779361289; x=1779966089; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNj+qvFCgT4xwCDwwemkPTkGBsOHauIWtLPl/tY6GBE=;
        b=sRb56IBmZQMCNsIA3QRobLMsdzVIjhDODHBKmtheMI1YkMublUxkvGRIyo4POf87Hq
         GMWpXvO174WHPQ+u+cUpURXuDEjERdlyXh/rJOhxYMTE6UyTKbfPccokPPNZa4W6de8R
         yFvPOHiIEql5XroA712i50WGu8jwvqxSk9b1GNyX46FDZgIoo0F7txohj3YrcF8LEMZX
         DJ6eG+cemxJp7sYO4zv/g1dpysLtFh+SQvLP4Scv7f14HtCBFmXYrAemzEOv7Dhpb/8Q
         H07UoT9i4Cq5IFnX2zD6+50EuvSiko/MS5faptwMOA1pKvWZyZmOouGT9SO+lgCjjLrc
         cMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779361289; x=1779966089;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNj+qvFCgT4xwCDwwemkPTkGBsOHauIWtLPl/tY6GBE=;
        b=aQZLDVl7oA/Q9NFTbvYNKZH+D/aCh6ExYpPClWlxHf7HSMV7Y1/9yIwHyzV/TyFpER
         5ebMRAuLbHBgUs9VP2V03gPSj8yRpwJtJcXMU4YG69VQfDxI70EKdA0dT09RDCJy5ukB
         cDqEYPiKYJ7NB0gebFN15pDuhnmFTJ+v9U6Op5LKKxz7BqFEOq5w7e2rxsM4TGVZAXxR
         02nCKtCm1z2vsWhO0EbyCB6ptmJbj02w4K6UpvELIPo8F1V23RPXkPDUo4foeNXb5r8N
         FYUJ30GKwbLI4z0ob/BIOx8L7WXsUipb74PAmftBmYhRKVREQVZQ5RkAqgLa9WEUy8Dr
         MuUw==
X-Gm-Message-State: AOJu0YyKy5y1oq1LflougEI3ksZHcSpV7OHN38fjV136ByZCZGalLPIJ
	YnoIWD7PCkMfal+4e9uobGjiO/4zMhEfvUt1FNBAjYyhR3LkD7bQ0LAk
X-Gm-Gg: Acq92OF64cydUi3HgWxA2oMq116msjAgl4GJ5u38L0Uw0zhH3YDJSG2Fgg/MaIk/ms6
	AF+MCHQSCkCHxyoIdIXVtj1DTWioUwXtmbZuH5UYcTHTqy8VuZjVpyXfBHXwEvsEq1A9JAx087A
	J6ga0HS5TueyEEBXpHuNArtBjOVYJU2z8GwvdslbliTibePNkHAw/7P+lnn1LFDMk1GOWX1r2vb
	HI+h/Iprx0JIcFDPoC70eaXGddClfp2PuWEWTOyxosQt/dM8VAoama4ii+A8v1Vn7jPg+MMyeQK
	8/1PJ/NcRxDAZqrD5r3E3BLk/GQgWRLhZCNf1dw2xwhcdJ+qStUZS1fjVRO8hq52hUYi0NdOVrm
	QY+AD01mB38hdE8QFVgybJSc5ftztfaEz5i9C87TIFigEW5ZH2ZQD719gYhDv5nL5GUCOr4Eda9
	n6SxEftrZeS3D6C5l+tSDrmZb8MJlBRu5OGfXNb48AFHomxtHkISaetQMM5HmOZL5v32Wnng2MV
	A==
X-Received: by 2002:a05:693c:2c07:b0:2ed:e14:7f5e with SMTP id 5a478bee46e88-3042faca12amr1339898eec.34.1779361289247;
        Thu, 21 May 2026 04:01:29 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304432dc579sm219449eec.6.2026.05.21.04.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 04:01:28 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 21 May 2026 08:01:23 -0300
Subject: [PATCH] ALSA: firewire-motu: Protect register DSP event queue
 positions
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-alsa-firewire-motu-event-locking-v1-1-708e1c2b5e56@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTtJ24QSvAphUcqAo9iaTkETw
 t2tsniLb/O/HYQSk8C12iHRxsIxFOhLBf7mwkzIYzEYZayqlUa3iMOJE73L8BnzirRRyLhE/+A
 w46jrdmht46zxUDKvRBN//hddf1rW4U4+/7pwHF8pnXkvhAAAAA==
X-Change-ID: 20260501-alsa-firewire-motu-event-locking-d159b967a62c
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=x7eWhfGu3dQUgHL1BW3vucHVFwNpD0MaxyrtevC/hYw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFl8z9h+RGfvmK098dEEhcgPPGxMny+5XNIqeJdiHqqwT
 8OR4VZPRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEykqImR4bP0/Wdvow89iJ32
 eYu8m9T57KKLJZlqX59q6MlMEXy014eR4Uvc537jHOGIbfYveWOuelQXZbgLpwXYruiRE1vd37W
 CAwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The register DSP event queue is updated under parser->lock, but
snd_motu_register_dsp_message_parser_count_event() reads pull_pos and
push_pos without the lock.
snd_motu_register_dsp_message_parser_copy_event() also reads both queue
positions before taking the lock.

Protect these accesses with parser->lock as well. This keeps the hwdep
poll/read path consistent with the producer side and with the cached
meter/parameter accessors.

Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/firewire/motu/motu-register-dsp-message-parser.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index a8053e3ef065..4ec23e6880d9 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -386,6 +386,8 @@ unsigned int snd_motu_register_dsp_message_parser_count_event(struct snd_motu *m
 {
 	struct msg_parser *parser = motu->message_parser;
 
+	guard(spinlock_irqsave)(&parser->lock);
+
 	if (parser->pull_pos > parser->push_pos)
 		return EVENT_QUEUE_SIZE - parser->pull_pos + parser->push_pos;
 	else
@@ -395,13 +397,14 @@ unsigned int snd_motu_register_dsp_message_parser_count_event(struct snd_motu *m
 bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32 *event)
 {
 	struct msg_parser *parser = motu->message_parser;
-	unsigned int pos = parser->pull_pos;
-
-	if (pos == parser->push_pos)
-		return false;
+	unsigned int pos;
 
 	guard(spinlock_irqsave)(&parser->lock);
 
+	if (parser->pull_pos == parser->push_pos)
+		return false;
+
+	pos = parser->pull_pos;
 	*event = parser->event_queue[pos];
 
 	++pos;

---
base-commit: 38c607c673155d6335591cdbd9c785fb2b7550e5
change-id: 20260501-alsa-firewire-motu-event-locking-d159b967a62c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

