Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F12927979C
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162709; cv=none; b=fTYKJ6OO+s9eOKGDyWzz6P2gCdG5g/1RsXhNTKIMEnOaq7rOkbI1Hk+l9dF3ne4S2mZc6WzY1if2U4CTxbp6p/7DycItS8NUGlTA8FONcXkXbVpEWaA0zbiTUDCiNBvwmVoqk90w80cQe/9n8/srHGY4YSFTfV+ypT0AkrvcQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162709; c=relaxed/simple;
	bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Dow+JAcZnA4uGmMtJAZCzW0kzCrqpXAOYHlncUbfvw82omAlr5+wCpANyxSv34q6x4L7nSj7DpGwmbgzF6+9sc+IInRpa13B7eDamKynklYsS5j+SnMWG8VwRYgmsqhwcSCEwl0rQKxfiO9S9mJMv5iAtVZf4jqS1us+dSIIL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYwEQCMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYwEQCMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
	b=dYwEQCMpfXwNW9vLWd1yWihGkTaSJyNZj32XUsYvyw62RnJCbGM39jWZ6ilmAPmgnR6Jyb
	3ZS5X07WZ//Ma4HWjZa05QukTmg03NWZk7DfpjSvkWVYkigL1QEesWvmZEB3rl1xPO8EjC
	tkECYYcMzM6BBAcSPD8IfDZBke2G+m4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-J0iHktqqPeWMblDzcnEDZA-1; Thu, 10 Jul 2025 11:51:46 -0400
X-MC-Unique: J0iHktqqPeWMblDzcnEDZA-1
X-Mimecast-MFC-AGG-ID: J0iHktqqPeWMblDzcnEDZA_1752162705
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0aa9cdecdso91952885a.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162705; x=1752767505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPmO2oQ+ynlDeJxb9Am/uG3bA7syL2BNHimRk7a6rO0=;
        b=EYKmTrK2GrbWoHHKzH2KMNCsAyo7H/Ok2LJ1hwRAfyRa4h2HlsMP7q+C2FL6GNDP0h
         AqbCkJwxUdyZm+jeaNM6LK0pqjYuvvKeptABz5pyxeEc5RqIlA75DUIos+FM2Fzn6lx8
         cFeCbwjiup2KJlQQIG8ortIktRIGkT2FX054adEht1orgpcCDRv+shnR0sj0r/6fRu42
         WHy2jYIM5qOa0oNmNN8vauWdUNbpbhtIqqpWwe3XYGyxVzT/xGEDoKj91rJBGSydAXKQ
         0J5FBUTim12EY4F7fmS1rMjrzlNDmaqPMEQ8ndXWbOwJA4CTgR8kPoF5zvWba0BajY41
         b8vA==
X-Gm-Message-State: AOJu0YyHDfwZ59/elF0leWIXGN4PUtFR+IR74UexEi2pf/7lDjN2wuzO
	jKLZlQusS7MWq95kgiAHpp9b3lLoHbTvfcHUasz4eXPTowcDO4SwT3v2gVihDyHLEtMLnV+Aede
	XWcirNpjrPehvYwh1NTEIvGhmCBEUa56CkCm7m+q+tLbdEzLvOgEDtcRICTHoJqad
X-Gm-Gg: ASbGnct64YWrUAePvjKJ/jwn3D+ZBMqg/8k7+GV6QoieTEZC2NbPEbE76ARga8tuBkY
	qVsIAGlZX/JOldIOdp1qCaUjrQPXL8OAher0RAooP3JMRLqcikkK48QBZMyRqfZdnR9dF9iFFwJ
	fh6JIlbn5jn46wVFRq2hHAjGoKt6HWIUfN4m22GzNFPGPigI9hseR616eK7WRgZofbEmHMYZd1a
	AdUOoG143NDbQubehCTqOq9nJkrYGLMc6YRbzS+AKAxlgFzWOq3BqcN8/DrrwUddyaT0Be+/nUh
	B8bREwPV2wKOpCBT7fzCYjjFOFeqopyBTvffv7ljoWehcqg2vnzACTpiuyfb
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39084136d6.43.1752162705532;
        Thu, 10 Jul 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkuqPel6v0c9oLWEAy3uC+hrgIsFPdla2ArZn2bXT5IJXXP8ZdH6ZBnGUgw1dx0j1MhfYDcw==
X-Received: by 2002:a05:6214:27cc:b0:702:ce4a:849b with SMTP id 6a1803df08f44-704982360b5mr39083756d6.43.1752162704970;
        Thu, 10 Jul 2025 08:51:44 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:07 -0400
Subject: [PATCH 1/6] sound: soc: codecs: da7219: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-1-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3957;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vLmJmRC+9bzkFJmLST4jSrv6MV1rviG/pwzLdY7NBcI=;
 b=Whbfgc0vqEfbD1+TqJhMdUQrpnzHP0K9B9S+FRtvZgCJnqYxlve3+jWZvpTSIWePANUgtkvX7
 faBzXT5+lP7DDmWOWcvnzTKOy6haiXPgyE+uiaAkDiRx/3YzQGQaLXs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mPITYwVGeCzBc5AtzQYpI73zcQykjurylyb9dV6cPFg_1752162705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/da7219.c | 64 +++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 221577574525a5fd60180a4441331d7db88f50e2..1742f91c788c62a34f35aae44fcfd1d7fbea007c 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1982,8 +1982,8 @@ static unsigned long da7219_wclk_recalc_rate(struct clk_hw *hw,
 	}
 }
 
-static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
@@ -1992,28 +1992,30 @@ static long da7219_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!da7219->master)
 		return -EINVAL;
 
-	if (rate < 11025)
-		return 8000;
-	else if (rate < 12000)
-		return 11025;
-	else if (rate < 16000)
-		return 12000;
-	else if (rate < 22050)
-		return 16000;
-	else if (rate < 24000)
-		return 22050;
-	else if (rate < 32000)
-		return 24000;
-	else if (rate < 44100)
-		return 32000;
-	else if (rate < 48000)
-		return 44100;
-	else if (rate < 88200)
-		return 48000;
-	else if (rate < 96000)
-		return 88200;
+	if (req->rate < 11025)
+		req->rate = 8000;
+	else if (req->rate < 12000)
+		req->rate = 11025;
+	else if (req->rate < 16000)
+		req->rate = 12000;
+	else if (req->rate < 22050)
+		req->rate = 16000;
+	else if (req->rate < 24000)
+		req->rate = 22050;
+	else if (req->rate < 32000)
+		req->rate = 24000;
+	else if (req->rate < 44100)
+		req->rate = 32000;
+	else if (req->rate < 48000)
+		req->rate = 44100;
+	else if (req->rate < 88200)
+		req->rate = 48000;
+	else if (req->rate < 96000)
+		req->rate = 88200;
 	else
-		return 96000;
+		req->rate = 96000;
+
+	return 0;
 }
 
 static int da7219_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2070,15 +2072,15 @@ static unsigned long da7219_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int da7219_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct da7219_priv *da7219 =
 		container_of(hw, struct da7219_priv,
 			     dai_clks_hw[DA7219_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !da7219->master)
+	if (!req->best_parent_rate || !da7219->master)
 		return -EINVAL;
 
 	/*
@@ -2088,9 +2090,11 @@ static long da7219_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * parent WCLK rate set and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = da7219_bclk_get_factor(rate, *parent_rate);
+	factor = da7219_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int da7219_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2116,12 +2120,12 @@ static const struct clk_ops da7219_dai_clk_ops[DA7219_DAI_NUM_CLKS] = {
 		.unprepare = da7219_wclk_unprepare,
 		.is_prepared = da7219_wclk_is_prepared,
 		.recalc_rate = da7219_wclk_recalc_rate,
-		.round_rate = da7219_wclk_round_rate,
+		.determine_rate = da7219_wclk_determine_rate,
 		.set_rate = da7219_wclk_set_rate,
 	},
 	[DA7219_DAI_BCLK_IDX] = {
 		.recalc_rate = da7219_bclk_recalc_rate,
-		.round_rate = da7219_bclk_round_rate,
+		.determine_rate = da7219_bclk_determine_rate,
 		.set_rate = da7219_bclk_set_rate,
 	},
 };

-- 
2.50.0

