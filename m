Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E927CCC4
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162720; cv=none; b=q7Nom4b0BquRFmhb5r534TPjAeVkFRTVoWWv4Z3bs6TfQQzbqWHHtnQ8/jg0/iP61uwy8mwF2ehKojdrP2Q3fae6LTFC8meB3lCuCiXU9HXtBDCvQZ/LBpoF3ogeWFJWdMleFID6/DbePE7UPv7A+SDi7/KmV+2064iuEygBvU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162720; c=relaxed/simple;
	bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=gk6N/s6dXioq2Afmpe176uAgvcN0e7z7lEy2krZWZ5vvMTVSp/wMAcrhKH1wOA6W2J94xoUWiCxbNWiH97gqm0JqP4I3o5KV5bel9Rq/KmNpENbrTFsII2Tc2Jtw1bjeRx+fJZ49aomJlwOJYA1hAV1fZi8DMK/fgvibsScWyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KyHjHqHj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KyHjHqHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
	b=KyHjHqHjjxi9eXT4dyrK4LLYS9CAF4H9wLEpLOWwRiR4uorNYJqVmyuiK+5LHLLXUnnCBp
	Kv3GqD0iqAS69ELL1NeLTuV8CgNAy7Zxc19pWz81j8vZ31J9nTAGBkXZjhiBzObRlJGziR
	0wHJKufKpPK/P0LCqW17D9TykLuD+9w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-bTcrc4otMzapxiKXRFi06w-1; Thu, 10 Jul 2025 11:51:56 -0400
X-MC-Unique: bTcrc4otMzapxiKXRFi06w-1
X-Mimecast-MFC-AGG-ID: bTcrc4otMzapxiKXRFi06w_1752162716
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-704817522b9so16605146d6.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162716; x=1752767516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG1BadWZpL7H715pVBNXXfvnkpwspQ8t98toz4xLpZQ=;
        b=rnpkA1ekA2HXe7dQtd/CIOxYzkq8wGNvSYnmdgADClXIZEescbpYWtk3dODa20drwt
         4MvxCJGSIbRkLE3BJxatg1d3YtGT6d4ptgGLlPI6+mQuewIkIxW0xawPvpilW7MVnDPk
         YpqGDrea6T6qLPCWhNlx+d0GAn84gGgOEfuL7SQEXkAStY1QDC6G6WmnyicuqJLZUnBZ
         MvgaaiYWwMqi7kMQ3X+vKTBQpqH1gQguLndH8+jb9/HrLA2xWFZSRDJgTcmCekwnyJUz
         XAmSb31B2U2n6eqdTuS2aH2DbgeNpp9UghsfPmAbsMJ4ld6u/xvK/FiGgXvIEYhWopUY
         6pXQ==
X-Gm-Message-State: AOJu0YzIHmQbYyVKOoUbKurVxgaCKCkyawpcoFg6i1KRsdEq69Lp3D9E
	N+KZsJJyoOMummGf9t3NxEVtUTzErl1zMDhfxBChozYT39JfRvCgGHo+HjLOeUsW8C5lLW4O14M
	dxiQCayHivDLacRwuqb39gOgKPA0jhjKyu+n/4ud4jSO5MruC1ObJnEZN/gx6crSJ
X-Gm-Gg: ASbGncsTtRHeiReU9UWPlHrRblO1Vto/brU2HECR2ZicennHPD6j728SLe0yIvRNgsi
	IKWhVFiV7kGRYvZWT6mkfwTp7grV/1WLiShVvy74b5Sut5tMyNJMcvPAMZnGffQgHi7VRA48aTt
	vCaSVFUFhmHtFgq9fcXri6E2GHcz6XUJPo1vZ7UFS6ezTpg6wLyqmtuQcwOYnWugGJF3QW57VEB
	ULI9JYjYzXA80VNw7bDmeXLT0Bs7UN7fA6oJivpb8b+Q1J7gPvd7edLNOsRcyPbrLQtPvSf46/8
	Lxekzg/5ss0oYZBv/4i4DjRL3mNQVhTvnPhNJOWW2qMnTSKR/S8LrPYX1LhK
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864656d6.16.1752162715905;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhATSlh+JJuRzkMWsk8YJM8HUQ4igJGizu8oIXouI4tsZbHB3hz8OxedljaxwZ18b6yh4tAA==
X-Received: by 2002:a05:6214:2e92:b0:704:9588:f0b5 with SMTP id 6a1803df08f44-7049588f0d2mr46864246d6.16.1752162715355;
        Thu, 10 Jul 2025 08:51:55 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:11 -0400
Subject: [PATCH 5/6] sound: soc: stm: stm32_i2s: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-5-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1800;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=irsEjDFgWLJcIRLSdB719V4Ehwxr6Hq/ROabLh9M7vY=;
 b=w46CeQJbLms7jsanP0xDGuQgHsJotX9gQmmNfNXgBWY+HckWjmp9QYjCSEVuxHqbdfSej7iYE
 m2Ah4xmtB30AIx+iZaZOBsQNN8TYWOwYh9Bcz8BF3HVHSMRZ3eurvHX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zaLiAcxf_xK8UcO7g3SYgwlC95RdlM0VKMQpXWtr59g_1752162716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/stm/stm32_i2s.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 6037b7a9c97bf25621fccb1feb59c4caee3250ca..0e489097d9c1086efcd9e3d1013acffeb0a46d4a 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -461,20 +461,25 @@ static int stm32_i2s_set_parent_rate(struct stm32_i2s_data *i2s,
 	return -EINVAL;
 }
 
-static long stm32_i2smclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int stm32_i2smclk_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct stm32_i2smclk_data *mclk = to_mclk_data(hw);
 	struct stm32_i2s_data *i2s = mclk->i2s_data;
 	int ret;
 
-	ret = stm32_i2s_calc_clk_div(i2s, *prate, rate);
-	if (ret)
-		return ret;
+	ret = stm32_i2s_calc_clk_div(i2s, req->best_parent_rate, req->rate);
+	if (ret) {
+		req->rate = ret;
 
-	mclk->freq = *prate / i2s->divider;
+		return 0;
+	}
 
-	return mclk->freq;
+	mclk->freq = req->best_parent_rate / i2s->divider;
+
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_i2smclk_recalc_rate(struct clk_hw *hw,
@@ -530,7 +535,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_i2smclk_enable,
 	.disable = stm32_i2smclk_disable,
 	.recalc_rate = stm32_i2smclk_recalc_rate,
-	.round_rate = stm32_i2smclk_round_rate,
+	.determine_rate = stm32_i2smclk_determine_rate,
 	.set_rate = stm32_i2smclk_set_rate,
 };
 

-- 
2.50.0

