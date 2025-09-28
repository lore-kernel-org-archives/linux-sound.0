Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFB280CD2
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059494; cv=none; b=MGZLTX0gcGxdyBXPqaRslUbMC4qnvKOpSBDKKTtXHs+b6OM9veT4EP3g3ooQ9lc3S+MCBCVO+boxKJdhmgEgSpDcNxnDB4xNwEOy6vIQ1MADuo9ZuAK2+HPxoLyyfOO0hv6aFOl9R3DC40RDJrAWe3Y8usDKD5DFuiw0oki7+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059494; c=relaxed/simple;
	bh=1iYi9QZBqkETwiJ5bgyHDZlYokS7FelpjQXiU7aAN2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv5Y6jLUBA78UWrkXi8XDEBHowWWKi7O2dfqJUvawshbjf/hDfDnjLq8iiF/srz6Cu9LlulEjFJ5157U/aOrjPFYbAsmt2SIyRpo70Z27U+1J5UJNCZF4ZrCjLy5mS/C/95f/RhDZXwFfkPRzSiLn2cNcTOjDo/BojUuW+HFxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MahgVXdv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MahgVXdv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so4120068e87.3
        for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059490; x=1759664290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NP1TBi/Uq1U4HFlrzc09PLrqCprFZBzxIzWOrZFbPBY=;
        b=MahgVXdvKR4z6GFtw381G3pOI7Pac1odxWrh9+h41edpWeCJeOGq4hE5nDDGhrD3X6
         372FAkhJxPS2bUFhbUX+61Ozdrmp9cJ7FOOX5K8y+EbxqeRiApmXxC59t8VZVB0Gs8qm
         hqzike3qeIlgY2E1VITLK1lhX6tVQsaiW9168gte1m0+45ABqiFvTRMWaSI0xLuj/5kK
         rEmpFDuug5rdVeFPj6ZIUUKpRxYfJo6NmemqysBvIV+zvTOvw02/jT4qwJJh6w5DOEFX
         n1C0O+BJ/r+OvE6SbGGTluKm+C99OHStSzOEXRtf01BhpPLEj7osiRWFv+Pe7c4vLxGp
         s9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059490; x=1759664290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP1TBi/Uq1U4HFlrzc09PLrqCprFZBzxIzWOrZFbPBY=;
        b=qP/mVOYp0Y8xmVsGuNB1xZVQiWzxYsGxZbK2JeKLr2q4rNfyouhJ5g2J1FhH3OsJxY
         Grc75ImkzlcbruUO4yEzRpy9qYQjL102ml25b9bxCxmGsftL+5UyvKnArryEExRFueex
         naDDBKIUpwB9jxeNjtNhGlorAA6Gmaj7RiAMA7liU4hHpoNOe7/fSZqapTkUMTK1SX7X
         3e14CmCHDXYurFAcU1A51b99Ftax5rrNcjoW4DmrkNpocVQmI+nrY7+nlrkREvYIW7ah
         4Mx4NF59YUBbGzdb6OzJzGszuRsU7Kbe4a/Jyv/3BcmlGSfGpSXRdwZPrgBHdm7Bca9T
         4hYg==
X-Gm-Message-State: AOJu0YzGTpHulLRqszxju00dU5JwPN0PLFMUWTSvwrBU2pcp5qseXPlN
	EnqszdviEdDN6pCEaDTVRBdu4b+JMcL7i9Jl3Coxb/BH1sBOmczPM8Yl8aOo89jp
X-Gm-Gg: ASbGnctEU+1tNM92iVcQ6XJqodUbBRE8tLwuI5vXOrcelOoFOGl5/sY+21jT8nyNhU8
	/Ni0pGPN0/PPNeI9Nm2BwTifWqvoqlY5yW1GN3IWraHidEqwzTx1xGNDqZQrTCZczLERPZMCthN
	Kx4VC8OiRsxNDQnr8PQuoduHomWutx6BN8dM/E6rbBKoZMs9SOCaVZMwqB3zly2gypQvn/frEIz
	MX5i/gbReZhkFI1vdiAp0zRbRqwpMfeD+OO4XOCNX1eNl+r9luh2nAOrvn/4j96h1Qze82X8eet
	qvPslDuSM0SSQZ5Ya3QGu9Kz41gtvq1W+8n2NMe0U+9rPDTSXQPix1zoySLYTLrmo/FgOAZF5IJ
	U5irOwo4=
X-Google-Smtp-Source: AGHT+IHVNBRR/P0eZQHC6TZ6vz+GMEdMoWFqjfG8fZCi977E3Etkw4wsvNO7JHalr5KDO9Qa7FpkcA==
X-Received: by 2002:a05:6512:3090:b0:560:9993:f14d with SMTP id 2adb3069b0e04-582d092e5e9mr4468255e87.3.1759059489863;
        Sun, 28 Sep 2025 04:38:09 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58620aac9d4sm1031918e87.74.2025.09.28.04.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:38:08 -0700 (PDT)
Date: Sun, 28 Sep 2025 13:38:07 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ALSA: usb-audio: add the initial mix for Presonus Studio
 1824c
Message-ID: <029b47dd8ca0accaa980e053e25104a4b044e7d1.1759059196.git.roy.vegard.ovesen@gmail.com>
References: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>

A reasonable initial mix for the 1824c is the one that
Presonus Universal Control calls bypass.
It mutes all the physical inputs, and connects
Daw channel 1 to Line out channel 1 (left)
Daw channel 2 to Line out channel 2 (right)
Daw channel 3 to Line out channel 3 (left)
etc.

To get the most out of the 1824c a mixer application like
Universal Control is needed. One is available for linux
Link: https://github.com/royvegard/baton

Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/mixer_s1810c.c | 227 ++++++++++++++++++++++++---------------
 1 file changed, 138 insertions(+), 89 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 656f0b4bfdf0..b2658f922d07 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -215,115 +215,164 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
  */
 static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
 {
-	u32 a, b, c, e, n, off;
+	u32 a, b, c, e, n, off, left, right;
 	struct usb_device *dev = chip->dev;
 
-	/* Set initial volume levels ? */
-	a = 0x64;
-	e = 0xbc;
-	for (n = 0; n < 2; n++) {
-		off = n * 18;
-		for (b = off; b < 18 + off; b++) {
-			/* This channel to all outputs ? */
-			for (c = 0; c <= 8; c++) {
+	switch (chip->usb_id) {
+	case USB_ID(0x194f, 0x010c): /* 1810c */
+		/* Set initial volume levels ? */
+		a = 0x64;
+		e = 0xbc;
+		for (n = 0; n < 2; n++) {
+			off = n * 18;
+			for (b = off; b < 18 + off; b++) {
+				/* This channel to all outputs ? */
+				for (c = 0; c <= 8; c++) {
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+				}
+				/* This channel to main output (again) */
+				snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
+				snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+			}
+			/*
+			 * I noticed on UC that DAW channels have different
+			 * initial volumes, so this makes sense.
+			 */
+			e = 0xb53bf0;
+		}
+
+		/* Connect analog outputs ? */
+		a = 0x65;
+		e = 0x01000000;
+		for (b = 1; b < 3; b++) {
+			snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
+			snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+		}
+		snd_s1810c_send_ctl_packet(dev, a, 0, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, 0, 0, 1, e);
+
+		/* Set initial volume levels for S/PDIF mappings ? */
+		a = 0x64;
+		e = 0xbc;
+		c = 3;
+		for (n = 0; n < 2; n++) {
+			off = n * 18;
+			for (b = off; b < 18 + off; b++) {
 				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
 				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
 			}
-			/* This channel to main output (again) */
+			e = 0xb53bf0;
+		}
+
+		/* Connect S/PDIF output ? */
+		a = 0x65;
+		e = 0x01000000;
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+
+		/* Connect all outputs (again) ? */
+		a = 0x65;
+		e = 0x01000000;
+		for (b = 0; b < 4; b++) {
 			snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
 			snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
 		}
-		/*
-		 * I noticed on UC that DAW channels have different
-		 * initial volumes, so this makes sense.
-		 */
-		e = 0xb53bf0;
-	}
 
-	/* Connect analog outputs ? */
-	a = 0x65;
-	e = 0x01000000;
-	for (b = 1; b < 3; b++) {
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
-	}
-	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 1, e);
-
-	/* Set initial volume levels for S/PDIF mappings ? */
-	a = 0x64;
-	e = 0xbc;
-	c = 3;
-	for (n = 0; n < 2; n++) {
-		off = n * 18;
-		for (b = off; b < 18 + off; b++) {
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+		/* Basic routing to get sound out of the device */
+		a = 0x64;
+		e = 0x01000000;
+		for (c = 0; c < 4; c++) {
+			for (b = 0; b < 36; b++) {
+				if ((c == 0 && b == 18) ||	/* DAW1/2 -> Main */
+					(c == 1 && b == 20) ||	/* DAW3/4 -> Line3/4 */
+					(c == 2 && b == 22) ||	/* DAW4/5 -> Line5/6 */
+					(c == 3 && b == 24)) {	/* DAW5/6 -> S/PDIF */
+					/* Left */
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+					b++;
+					/* Right */
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+				} else {
+					/* Leave the rest disconnected */
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+				}
+			}
 		}
-		e = 0xb53bf0;
-	}
 
-	/* Connect S/PDIF output ? */
-	a = 0x65;
-	e = 0x01000000;
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
-
-	/* Connect all outputs (again) ? */
-	a = 0x65;
-	e = 0x01000000;
-	for (b = 0; b < 4; b++) {
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
-		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
-	}
-
-	/* Basic routing to get sound out of the device */
-	a = 0x64;
-	e = 0x01000000;
-	for (c = 0; c < 4; c++) {
-		for (b = 0; b < 36; b++) {
-			if ((c == 0 && b == 18) ||	/* DAW1/2 -> Main */
-			    (c == 1 && b == 20) ||	/* DAW3/4 -> Line3/4 */
-			    (c == 2 && b == 22) ||	/* DAW4/5 -> Line5/6 */
-			    (c == 3 && b == 24)) {	/* DAW5/6 -> S/PDIF */
-				/* Left */
+		/* Set initial volume levels for S/PDIF (again) ? */
+		a = 0x64;
+		e = 0xbc;
+		c = 3;
+		for (n = 0; n < 2; n++) {
+			off = n * 18;
+			for (b = off; b < 18 + off; b++) {
 				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
-				b++;
-				/* Right */
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
 				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
-			} else {
-				/* Leave the rest disconnected */
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
-				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
 			}
+			e = 0xb53bf0;
 		}
-	}
 
-	/* Set initial volume levels for S/PDIF (again) ? */
-	a = 0x64;
-	e = 0xbc;
-	c = 3;
-	for (n = 0; n < 2; n++) {
-		off = n * 18;
-		for (b = off; b < 18 + off; b++) {
+		/* Connect S/PDIF outputs (again) ? */
+		a = 0x65;
+		e = 0x01000000;
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+
+		/* Again ? */
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+		break;
+
+	case USB_ID(0x194f, 0x010d): /* 1824c */
+		/* Set all output faders to unity gain */
+		a = 0x65;
+		c = 0x00;
+		e = 0x01000000;
+
+		for (b = 0; b < 9; b++) {
 			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
 			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
 		}
-		e = 0xb53bf0;
-	}
-
-	/* Connect S/PDIF outputs (again) ? */
-	a = 0x65;
-	e = 0x01000000;
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
-
-	/* Again ? */
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
-	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
 
+		/* Set
+		 * Daw 1 -> Line out 1 (left), Daw 2 -> Line out 2 (right)
+		 * Daw 3 -> Line out 3, (left) Daw 4 -> Line out 4 (right)
+		 * Daw 5 -> Line out 5, (left) Daw 6 -> Line out 6 (right)
+		 * Daw 7 -> Line out 7, (left) Daw 8 -> Line out 8 (right)
+		 * Daw 9 -> SPDIF out 1, (left) Daw 10 -> SPDIF out 2 (right)
+		 * Daw 11 -> ADAT out 1, (left) Daw 12 -> ADAT out 2 (right)
+		 * Daw 13 -> ADAT out 3, (left) Daw 14 -> ADAT out 4 (right)
+		 * Daw 15 -> ADAT out 5, (left) Daw 16 -> ADAT out 6 (right)
+		 * Daw 17 -> ADAT out 7, (left) Daw 18 -> ADAT out 8 (right)
+		 * Everything else muted
+		 */
+		a = 0x64;
+		/* The first Daw channel is channel 18 */
+		left = 18;
+
+		for (c = 0; c < 9; c++) {
+			right = left + 1;
+
+			for (b = 0; b < 36; b++) {
+				if (b == left) {
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0x01000000);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0x00);
+				} else if (b == right) {
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0x00);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0x01000000);
+				} else {
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0x00);
+					snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0x00);
+				}
+			}
+			left += 2;
+		}
+		break;
+	}
 	return 0;
 }
 
-- 
2.51.0

