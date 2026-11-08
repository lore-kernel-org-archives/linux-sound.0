Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142193;
	b=POpEgn4ytTM/TXBwkZ5BMX6InUd9nGcqvEs3IaPzHn+MaVLgWcQd4caPmp0vHB2pSfBO
	 0j0Z9vJtwH/mWxlDFXTpZN5IZ82CmJHl+Gc9jM/S+fRD/MitzNTEhsGMbjoX+xMr9tf6s
	 E3Orj7sVSf14a/erM+9rI3+BPRHlsynf1FliYaJQ/0Yj6ZK0EDTVCuI0nTSo6ysONpSFM
	 yzUZKTCxDQ9KSHC29pPajjXCoqe1Zwmv6C10q6lhbtUpfGPxOUQbW9Unj9A5i+bvXpGFi
	 84w0ZQEsy7DSxhw9SuyYZV2N2GNebM+LEWqJiR1xl9AkS0HDy8YdZM90x8aoXMRaUPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
	b=5anxoadFLtag36J03jcAqSILBWzMq91qxNEZhBMubT4z7xYgoJINkEvmKNuzyBQV2QKs
	 x13mcwF8eLQLfrE0WSEQ10mTyfzTzgo0dMrzlzyX6Yn3u0rC4BWzh7u0QluyH0lg3trAp
	 1GPstB5nQU+9zMf3iIuHEHIKJsFWQQz5OHyeYhIXJYN4e0iKNgRFbu5cliM1LUFF9b7LU
	 tkPa03pho+nCpvpdmbytvDhiAvgu36T4C08amuhpJ79orHcq4xnW+VKvAl8rxbbOCSbNC
	 IXDll3WJ/IXTIlYdNjg1lbTLrqC9H6RAbl+WAMqLE3qtJjap1qD2FL2XI1/q5ri8gZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeDiOjJJ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346FD606A330
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 12:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346FD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeDiOjJJ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso218536c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 04:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142192; x=1794746992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
        b=LeDiOjJJTV1qH0oUdJe962ARYenZo4GwF/uIxXoC1O4Bc0+EXAPseKS4DIKzjuh6Fu
         1C5N+7wi//IAxNlOBqf9TfOYhvThtehMIh5Zj0bADC7HDtuUghp1aDKvLa529BSp/PhW
         xrndWzAC9mDRLn9YqhwLsNgZ8FNAzY3PBYnynrzjGfQ06p3Fgwa4fZKxGMfc8o8eoprB
         yB6nJbo/z9fsrpNVCck0L03KGs/U98CLthtSDfDpnyssATGf54OsMLNRrFfAZrmSEki2
         aUqQzjxxbOyG2YN8NlpR1jrIF5RyS9A+aqQt4f38RWb/6xCWmyp0pQnkoT79itrrTy4Y
         hGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142192; x=1794746992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
        b=HRpB96zcyNhlTfYlhMNoASIc0MlNmkVdyMwACEDNOdEI+Zpa7snxbYxlrpq+UJ8xJC
         ZjZxOAFSIyasd4DIccmkuz2O/raLYbZRn0/5V10kQBO6wpHv2Xq/8xY+N7PmTlH6rxxI
         8VFh8+TzVAyYurhZiH2K7rpuyO7Hxa7E6R8QF/0GOg85X5qLFOaHSUEmbwFLd95fpGdB
         m2BmTwYW2lGL0Awv0IE7PbslT8PIWpDohTe705fX0WxmIwhZOyCmH85DVNLU+WtmCBYL
         W9HEzt4ZAtajbXG0UHnE2BhK367fSgyHysPmOz02aylnz2jDRmYQTHvqbJjhtruJh6ZE
         ZpjQ==
X-Forwarded-Encrypted: i=1; AL+hErFbhIHiZU8AINuYv65sYk4XStRuT+8XtJ2Bqzf2tIA0tCAsbS2vF3DK0oF47nyktl1WagARa+4nKj8Z5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sMSnIGTeCy2+1wu4OLItXbXceMQZSQqh8lFurX0kYqZFNzbw+
	Y1yUU5G74IqP8QkjEQARoiihE8WyC3usNXpNv6lfC7nRDNGJ21Bxsciv
X-Gm-Gg: AYBFou0hSShWRouEG1sLFD2XWpZDdEaNWOS3lk226GjcuVe5A8UFuNUoqOm1GyWPcWw
	uUbXbgdpAdgGabrQBn/8ygPdb/wfF0b6ZXzFVGAZsqE9hFVkpnWg6ZXrMp/Fy5TOZC2T5qYtXKO
	WSMnSU9QgMkWwPrjAaEav/aG7XmC4teP6inMeIy+2xB0gd7N8kD3op1RFSpGQ1uWO8I4JfwRhtw
	rfaER2jV0yviXEy8HMtYbNsRfdYLs2qo6xhQcxKj6nqcbW01HwlmUtJFdFWATTDHcr95S3mkhky
	fxJoNnbKEgPSfpPn4iQyMKuXsVj16jy3dqu117bsZACzBSSLk98A2xYrBt59Lk7JA7GpBCOoGMZ
	L66DGZmGiAvVX4fQXcu+DhRRVMbqee5A8W/57KTwM6aweQFXNbajtmZMqFaK+CK/cBP/s9p2JX8
	8/h4twLUGqu91CCq6tPKI5BkyZgVvznzHQV0AUnSPR4bgdiD1lLkea2zhj6qONCVpBc39WTWkEU
	jAjmtMc5L3UGYT1ESD4im2erR8oc4olV2w9AD9rWMkTKdTmqXL2H1t5IRqebbLUOwzL5P1dFLVD
	6hiUyNE61uCGaZlVyuojcK949JPDxM8bSBkMKgxCqNEcZDiRgaqvhqczhB41cjzqHTF4/AgofB2
	gGEUmh0q6t4wwj6YUxF2NMYU8x976hWKOvwNPjKyr
X-Received: by 2002:a05:7022:81:b0:144:de98:eec1 with SMTP id a92af1059eb24-1b39fe87bf8mr2150277c88.11.1794142192325;
        Sun, 08 Nov 2026 04:49:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:51 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/4] ALSA: seq: ump: Clear stale selectors in sequencer conversion
Date: Sun,  8 Nov 2026 21:47:49 +0900
Message-ID: <3c5cb0ef0023c4d2e835805498a14751a92feda0.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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

From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

The sequencer MIDI 2.0 converter tracks RPN and NRPN selection flags
separately. When the controller stream switches selector type, the
previous flag remains set; fill_rpn() checks RPN first and can encode
subsequent NRPN data as RPN.

Flush pending parameter data with the old selector, then clear the
opposite selector before recording new state in both CC and Control14
event paths.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
[HyeongJun An: drop the KUnit test, fix the subject, add Fixes and stable Cc]
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index ff4ee26adad1..bac37d4ef43c 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -847,6 +847,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	switch (index) {
 	case UMP_CC_RPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_msb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -854,6 +855,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -861,11 +863,13 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_NRPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
 		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
 		break;
@@ -975,6 +979,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_RPN_MSB:
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->cc_rpn_msb = msb;
 		cc->cc_rpn_lsb = lsb;
 		cc->rpn_set = 1;
@@ -984,6 +989,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_NRPN_MSB:
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
-- 
2.43.0

