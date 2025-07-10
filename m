Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1A27FB02
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162727; cv=none; b=e7WzCxsczsKdlxPdXAtm70L8/W3Di/ILWwh6+yBZ/z4Hsyxizy6+mM8MSIEfnk44j/lD1FgykRcXR7KDFL+BMW87H2nayCWMrBlrzAf7bXfrI+2JwrM3aZEV3dZup0Ma/ZFlRXxkzB64IxUg2DmDMwiweth45tIqCiwwRX8HO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162727; c=relaxed/simple;
	bh=vZWFDt1fg2g84/6CbpXmdsOPkf8vAndRakJ7mBAnblA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=FRAmzsOurRXlEplz0bwAuu41eFKMLbvBHWUh45GaNvbeaMHJD0gnLP7lCmmwNKcRmj7s3MnQfSoAGEp47jBeaJzWUAJWIHpP5BUYWgQmJ3UUoB2ua7D7sxecWC6TnC1nmHWH+V4mquMhjquGIlUTt0W+1vJJXyT6cvJRzvKpuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtpP05j9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtpP05j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
	b=YtpP05j9+TNZJKPk5z2z7PUQcL6RnP50mbe8dBJdYgk+jMCmOkBjqFfIaHZ1mHt/gsU9Qb
	QnnjS+xtNMJPfZWssyEWjvUHq+9+xRrZJ3mcinX2eFHzVV1+YT7QbE3ZL50YeYbn1/s9o2
	hwBddFOQiEF+v1ijYfogwV429pWi6x4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-eSAO7vs8NMOihiL4PA6w2A-1; Thu, 10 Jul 2025 11:52:01 -0400
X-MC-Unique: eSAO7vs8NMOihiL4PA6w2A-1
X-Mimecast-MFC-AGG-ID: eSAO7vs8NMOihiL4PA6w2A_1752162721
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab979413fso18706826d6.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162721; x=1752767521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJwHo4Zhfo+XQdxC69KbVscnMO2afRdyYYJQIDGMOLg=;
        b=U43BL358AhHWDBas11cBNvv08ArPnW6gkW1Xu/GR4aYz5Et+Lc22Lv8qV32DK+gXQz
         ROlbJp5/LG3zUgN1+a40vnicFAiwUiCg4OufN0r4DvozDm9Z+NoChbtxBmHWDeLNOLbr
         3MNpsvdNgCJgeBiQEFWa4xhFpWUXVvDOWezRY1818C4XAeKxdCByMZly27GhrxysTBIo
         11kkDszks97IgjQpzrsr1ViBaobOgZ2Uj/5FnRKAfvwbeXSJ2YlVp6Cp8GTndmffezmc
         XwJMb4DTzjpWNpfMGv2G6V6rfx+t8Hw5Fircx40GUN8VR1TxMhDIe0qU4xMuDnKFycwa
         sKjQ==
X-Gm-Message-State: AOJu0Yz/aZgXwKqHlUEhtwWSUmFE5aWPUl/lMErCSymHywqglsxmNEeK
	cVCersYdLZg7W86q4FDFQHfgXCRX5U8Y0Bnwwm7NFJeQWA8DqOIUJtjtyQYNm2sRbNKzFWrfjzG
	EtvKco5blWX1Ec2YuWsLonIGsTIq2kOqys+oOfWAPIQ9u+eZSqFZ6N7z1uacmHv00
X-Gm-Gg: ASbGnctjzjvtBXnr/B6dIum25YitIfAoqrCFnYDJ7PzLp3hi2uGdafca2mHjhpDTMHw
	sspTLiCCYrZ2InwzzwNsQI+TbPZeczW+M+9Uo23eYuIXS0Z13dcB4meNBNe+b6N45XwDqXe1DO/
	Bs6Vu2ivgNEA0HDp8Q43GEDGx8wBIWNA4qG5sufVUXJ4BGwXDhz39BAzvA+TV+1ypmJrf6l0TOS
	If9hFpocH8iGIvST2AIkf4s4DrSgaKuPiDN4d70/gQhNsto1fEuySp2zVomj8A7kN1XulrQ+H16
	0RDbPAUw4/W82kuuAz7Bu7qeBesurZc3E/aUM/UnZWIyDpMNwNK6qeLzGkPk
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id 6a1803df08f44-70494f70162mr73492246d6.19.1752162720388;
        Thu, 10 Jul 2025 08:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG03Gb2AMowqF+jhr90PyL5QhMQySpCZDY992sVjt31FhV8SI5QbSkQU4E7TgwJWA3WWhabRg==
X-Received: by 2002:a05:6214:27ef:b0:700:bae3:e1a5 with SMTP id 6a1803df08f44-70494f70162mr73489626d6.19.1752162717842;
        Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:12 -0400
Subject: [PATCH 6/6] sound: soc: stm: stm32_sai_sub: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-6-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1764;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vZWFDt1fg2g84/6CbpXmdsOPkf8vAndRakJ7mBAnblA=;
 b=qoEKZTVvf/Mg1qqHNBU8HndCgCmiS0GmOJSvOpA45N85Yb6978lTjjiSZ4dbTnh0LPFhTtH2p
 Pn2SWV3e4UADKJGs88lQVhTDLPfehYeojWCySSStGKSngtnmPzV3I8g
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T1nBrVa3kfeBiq7b1EM2Tuw3X_WuLWX32UFNpmIoW3E_1752162721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/stm/stm32_sai_sub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index bf5299ba11c3c95ad89dfb00612ade7ed42b9d0d..463a2b7d023b9cae802f88041c23a9bcc3219a6a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -489,20 +489,22 @@ static int stm32_sai_set_parent_rate(struct stm32_sai_sub_data *sai,
 	return -EINVAL;
 }
 
-static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int stm32_sai_mclk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm32_sai_mclk_data *mclk = to_mclk_data(hw);
 	struct stm32_sai_sub_data *sai = mclk->sai_data;
 	int div;
 
-	div = stm32_sai_get_clk_div(sai, *prate, rate);
+	div = stm32_sai_get_clk_div(sai, req->best_parent_rate, req->rate);
 	if (div <= 0)
 		return -EINVAL;
 
-	mclk->freq = *prate / div;
+	mclk->freq = req->best_parent_rate / div;
 
-	return mclk->freq;
+	req->rate = mclk->freq;
+
+	return 0;
 }
 
 static unsigned long stm32_sai_mclk_recalc_rate(struct clk_hw *hw,
@@ -558,7 +560,7 @@ static const struct clk_ops mclk_ops = {
 	.enable = stm32_sai_mclk_enable,
 	.disable = stm32_sai_mclk_disable,
 	.recalc_rate = stm32_sai_mclk_recalc_rate,
-	.round_rate = stm32_sai_mclk_round_rate,
+	.determine_rate = stm32_sai_mclk_determine_rate,
 	.set_rate = stm32_sai_mclk_set_rate,
 };
 

-- 
2.50.0

