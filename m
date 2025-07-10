Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5F2798FA
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162714; cv=none; b=tC90a+KYlzdsxEH1VLKD7x1jdFdeQe0sIxvGtBMSkZGS6m3m3PRsMcXYm9MnpVGkvKIXGf778xvZBMUKY7SIpec0vBht9+K8F5I5PIzXCJnJP+bL6sH7gDRboWwYymCXWVUv5gOXbl6hI3sVc4DR54ypuzLeUTlTdxW4dmMx4Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162714; c=relaxed/simple;
	bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=mt3ZapZZ+4Na+S8dwv/b+DNNVMPP9IXvRythgaFqXqpy/TpMzby3pNeylHJ9KOkCOecrHpLCnFDW+5A4mF2Gh4MGrEPKND3sgUx/XEo71GNC2bR6qtPMBeetY7p3vH8OTfzObjtPhUvxBSCptZM+ZSylF8WS5YZjTgYBE4buaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6HNelAo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6HNelAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
	b=a6HNelAo8VodhsWCWgI4DGmzH6CJvuHfLKMnctihDsvxYwN1nOOmUN5lw4hxXybAmjMXYH
	ZAYsD2O0UhnyX/VXnkiRdgHKrK7dyZ73Byy0TGYFhJ91Fb2SANvcQpZrntb6celMznC5hF
	hqEiD2HcE2OHkbtGspW3nGFKcm4DyLA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-7foGywi8Oj2uOO4sS2zB7g-1; Thu, 10 Jul 2025 11:51:49 -0400
X-MC-Unique: 7foGywi8Oj2uOO4sS2zB7g-1
X-Mimecast-MFC-AGG-ID: 7foGywi8Oj2uOO4sS2zB7g_1752162708
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb50d92061so16871346d6.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162708; x=1752767508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGKF6eOX7Jk+EpeggU8l+LOb8l3CYbEDXRYR6gPHE9Q=;
        b=p+4sR5G5f1Exg2Wg2mVT5CwPmydf2A1ZT6k8mVgl/pKmfv3thsFuu1gJ8qpA1CdfDU
         opQfJEIksD9xtTpMcdlbIr1Wg8J4jedI6vGrG7Q0I/ESvC6ULlAxVnFdd9Lc4Ypv/MZ/
         Vy6o0bLnSRKPge1KGwfkh4Bl93Aexp9BmQSWU/Mxkde50LETR40KR7gcDDyaPZA7a+ge
         pD0+dkYvQSVvqa+mrzfpulky1T9bfKCZPlV+j2HB3xrO9ZhJvLSOAz2pbr+VO056fiWd
         CGSaDifUfc+mnGSKZgsTiJdvDSA0WijswGUHCePb0GPv31Pr5PtHC14xFWAmEFMPs5Ae
         Un3g==
X-Gm-Message-State: AOJu0Yw+eH+XikX7UPac3/5/y6FuJkCZzIXmxsVLekeJwam7iXi0NeI5
	EMHmGSRLl48N6w8z+hO/0KUSUJsGlG1QxSDZcRNHGvKNVmlqHo1IyaOKEE0ALB3qi7mAHJigkXy
	HIUsPH3CG4x3eTgIbhqdA7iFlrJpCEaQdXDFPiIQXjf9PbPBTE/x7ilxqANtbS8uw
X-Gm-Gg: ASbGnctaOVW5WvKKqMrPUxMEtjgNqGvOyT0tM66eNKBaoo2GMy6OoGIZtKSTMgsndmB
	D47CImQ2lF5alZPdWzVr044Btpy7DLvrPDqUDmqwIa01sxAVPzrdDMKbeVc3IAscgmNJpzGx4Rl
	PwalACcIHZwonm84XSX7osejbr2Fl7o7ZLqWdSER2WSge15/c7QkdMzi4EPyZn4MdLPX067tcZo
	EV8aOU/a7zlo8CIVUcQGD6easrH8BhwD75TgMNAzuZsIpmFjMgZMfd87zWqf533vZxUgkxCK/ig
	4tbvFasz+JWHkyQ8pU0yDz+S7vZZ/CoUbXH2LlFKyOpIM3MLob51zUct29RO
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73517786d6.3.1752162707895;
        Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiBnQKyOU9ItMPJPrgQVPScQNEJSbolGEYy2qaZnVPuAr8zwJYLa8LtkWFTwl7pjIeSY0WKw==
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr73517366d6.3.1752162707432;
        Thu, 10 Jul 2025 08:51:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:08 -0400
Subject: [PATCH 2/6] sound: soc: codecs: rt5682: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-2-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=3278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=t2hjGCARaRQgI0Ustel3aF+sNP5ba1R6WUsBnvpS8Gw=;
 b=aqGq6Wwv3mN+qouYIGF3pJ+rhEvmpUrlcSVA+xDWGeOk1pwtlMf/NqlX0M/HemN2IEuG5nCBi
 JURzf2JUU/1A51p4xURtCdQ1xTp4/K/hH/dOMIbhw6NBEwmj4I/5xek
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mh3rSN0SMMwg1GRm8lv0kX5haVtk9koYH8d7jpyZwX8_1752162708
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/codecs/rt5682.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7c88370e2dee6a4c2332f1e3db885c980f5e8079..a0abd2ce0c1e1f6cf59fecdd426db16136befe66 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2675,8 +2675,8 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	return rt5682->lrck[RT5682_AIF1];
 }
 
-static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_wclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
@@ -2689,13 +2689,13 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * Only accept to set wclk rate to 44.1k or 48kHz.
 	 * It will force to 48kHz if not both.
 	 */
-	if (rate != CLK_48 && rate != CLK_44) {
+	if (req->rate != CLK_48 && req->rate != CLK_44) {
 		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
-		rate = CLK_48;
+		req->rate = CLK_48;
 	}
 
-	return rate;
+	return 0;
 }
 
 static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2795,15 +2795,15 @@ static unsigned long rt5682_bclk_get_factor(unsigned long rate,
 		return 256;
 }
 
-static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int rt5682_bclk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
 	unsigned long factor;
 
-	if (!*parent_rate || !rt5682_clk_check(rt5682))
+	if (!req->best_parent_rate || !rt5682_clk_check(rt5682))
 		return -EINVAL;
 
 	/*
@@ -2813,9 +2813,11 @@ static long rt5682_bclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and find the appropriate multiplier of BCLK to
 	 * get the rounded down BCLK value.
 	 */
-	factor = rt5682_bclk_get_factor(rate, *parent_rate);
+	factor = rt5682_bclk_get_factor(req->rate, req->best_parent_rate);
+
+	req->rate = req->best_parent_rate * factor;
 
-	return *parent_rate * factor;
+	return 0;
 }
 
 static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -2849,12 +2851,12 @@ static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
 		.prepare = rt5682_wclk_prepare,
 		.unprepare = rt5682_wclk_unprepare,
 		.recalc_rate = rt5682_wclk_recalc_rate,
-		.round_rate = rt5682_wclk_round_rate,
+		.determine_rate = rt5682_wclk_determine_rate,
 		.set_rate = rt5682_wclk_set_rate,
 	},
 	[RT5682_DAI_BCLK_IDX] = {
 		.recalc_rate = rt5682_bclk_recalc_rate,
-		.round_rate = rt5682_bclk_round_rate,
+		.determine_rate = rt5682_bclk_determine_rate,
 		.set_rate = rt5682_bclk_set_rate,
 	},
 };

-- 
2.50.0

