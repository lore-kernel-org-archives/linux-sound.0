Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964622;
	b=gYRiBSQHbzQI9C5Dj0Ei/jWcIILK/Bbe0I4TpSG5tfaGWkhOms9ZcDgp2+wx0F0lsexO
	 sCv5/rL4HdRFJLcw2u/4Rmrwt8DNllMnO2GURo22I7w0ACyMmPNubGEGPhrP/cqn99GvC
	 Wis4JAtE2rT4VdE4yLnOCRKPKdZoIq+n3G4U8dPciTNEc50CynOzBB9u5HZjqXTA/Llt5
	 dvZBd/syFyhdRBZmQP7AV9vAa+ru2mpRbUj3eyXTD4r5gT92qeQ5FKam9Ppyhgm5pRgnt
	 0bG8+BvodA6tV2XOulC6HDFbmmMNZunK53uzO6C1q3DrTMX/uMLhuZwgSJ3R+jiMWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
	b=zAd3pJjE1kAFzfhMVh0fgnpcscNGFnqu8K5T1L8WstiMHNVG93nz4RZkaslJhhho3K1d
	 Nq/JxkeDLIxa9qMXpYthmh8hk5wYkzhY/CELbAgkfpUJXgQiz2Qbk/lJNl92HYZvctsJY
	 wZ5kDonBnuaA63Qjy1CsJQcf5zduccrFjqXaO6QwXNrdZbnFb4cIzBal5yHs51QnuqRz1
	 7qBbqPiz0eW/wb+2LpEhz9pyhT8RQ+0a4aJIKfUU2ED0WXVSXpK2GXWXywp0o/1vbi3dc
	 ZMDjxieFBUaM9QZBh2kj7WedSAIZFZj64GcAyNHR1EqEHMSMYA4UJDQ61Uhmv0mGOPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeAMtGwp;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828E606D810
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7828E606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeAMtGwp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so419062a91.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964621; x=1794569421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
        b=EeAMtGwpBQE/MsPSHuBjd9rK5sedGjxaK+JplNCLQAs5sGBpNugqDUU9nMf+BhoRg7
         dw7B0flZSomIHxRDI3rDFlUtyTMuoLwpevBUEIdQioa3SCHvu38VdMy8isA8W2H8gs+u
         jjCEs30gHTFzZi4gVCwNkqQ501deMFPGumG+vZy04cMS7J85QDN0FdFYGBKgjTATHiCO
         L9lY8VXCeHpt9fTfoaHj121VqhTUDnaLAxhSywnWcHkLeFX4Fmoh/9Ayd7G3wJBVu5PH
         qv0eyPQqXcVcW+dDfRkitc5nZHNg/nwq2lKny/PjTeualUp98k9+u8x9EPAeFzCdqtX7
         itMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964621; x=1794569421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t10Ya2aUc/aUld7ozxXDBZbEBpBup1HZ/u7PW1HDHCU=;
        b=WHdnBCETYQkFAmxYbVG0EMOOdwFV21mf0ZfW90frLQNTbN+WriVI3RMVlI3q4Hgppb
         U46SQwCut/4dnpQtJKyPpaJh0DIEjyqSz1LWtYw7VgdolSmCCjuSkBIbRSE8u5oN0eWc
         Cd6yQFO+cTHnftqAhwoam/XlkRmzPgbtwH4ahfzpjws85Vnyh/K7+TITHwxY6dGY4beU
         7R/Mv3dtQqfdPm+8+hRsL/P96bZx/LqScYSljuDF/3sgGEDeUp++xjISu0Fl6vP2KpY+
         waywOIkxx4oF+2Go8ULUgdlYJejPbt5FF1CsDDkTiynA3SNpj6z+fzHUKwECJC4+wyRH
         xdtg==
X-Forwarded-Encrypted: i=1; AL+hErFH+CqT3gDPvrOFlJNjsRlo1mNCL6a8JSHM1qBJM2F1XfYypsy9EGbZH5LArS5kctfR6N+VskkKbaTGzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EbPN5S1Z9orpTcu8dnzaSEbsGlVSPNfW0oVQ1I3uwG7B5pqXt
	KuBLjZePBUT8SGEocJyq4rXQt70JvG6Byc5TVIPgprVax691/DoATzXX
X-Gm-Gg: AYBFou3AZvtuGDIrmTuux8zAuFR/nTVyWHbkfguqnydnr9EGWCB8iwHZwF7hK6b1ooL
	5IB4UzdNq3sGTPR/gPMpaExDMRpV/j5iX1zeHbzH/xOOaD5hQEposUObat47tWF28J1NFhSPxfD
	UYfRerBkYR/LubvFxFPPQtpGWJSqEyAjWSFRfbH/Rg6f+gGZ1BRKE9iBDTqSyXINIyQziu4zEvh
	wnEkqGSVQo/Rsbw6e2dHx0hqJiVnaBBqJ97rwrdT3idxVK9u6kPLHLrd+MiU2g31jKdaQoVEgmC
	T3cBO1+QLmkxlIYWpE7Ka7beZTHrbegTYYVrMkmb3tyLaomVtilnbKYhU8umaDwaEMDJtNGvk8x
	BWMHxIN2UdlDlMkbsICouoGKI8YT+WB/L+aSskQAi35KC0PrVsJBIef+xPKK+V1rkKPP2SVsP8+
	FGQBfZ5Z+2evi9PfaPxDLGMjgu1C3k1Ttsu/zv6rwhTJ1sGbVu4wDQ1J2RQE5sHkYXNKX3Ljdnn
	s1vu9XlLdZcw/BYPPcx14CuvB/Sk1aoyI3LmFIwXGf/C/Wrscp1fFHh36kKQvFrELR8YHXu3/oC
	S6uap5RZ6jAKP3RB0SQ5oG8AbKK8H+aiGGpSlDjfP07DFrcDRmMDXjhfzEj8zCz0Xj4jKTZw69U
	wIFvQyZowO47haLcoqH5ZWtBmi+AyIMWQnN7gSSeJeufQ
X-Received: by 2002:a17:90b:5545:b0:3b0:9691:a240 with SMTP id 98e67ed59e1d1-3b0db6eb3a2mr2106117a91.47.1793964620615;
        Fri, 06 Nov 2026 03:30:20 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:20 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Fri,  6 Nov 2026 18:29:36 +0700
Message-ID: <20261106112940.53550-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..9007ba1157ac 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -331,7 +331,10 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 		} else {
 			u32 bitclk = config->sample_rate *
-					config->data_width * 2;
+				     config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0

