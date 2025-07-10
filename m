Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB71927AC59
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162717; cv=none; b=VdEXjhzwLiGvK1+82nzq9WqgomSJ44dBwzgE5K4rON9DQAhAmGmVu4Vkf5VXVNHtqt8LdnDCuzkqLqXzkLcXDYHN098naGEwlRrtlPQZ8H54/PJ1EuXx9OLw+lxGSqLEBdEcB01Tv77nNjLlrcw513A2C94yD/NSX3BCRNg8KGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162717; c=relaxed/simple;
	bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=b8h5hXSZ4Nbp6HWM3YrBHKfpMq2qVnzOsXwWQn+05AtmBIv5D1e0BudiAft47Ujs5ndmeEH6w1uAK125HbDvrfbkT5CH/1x791beVvOVs6VTErLttVKQfUhDqK3QIs2gfZ+IyociS+PtVkVQf65e0EmE2UX+b8CnpV4bwLtH38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3JkbSCx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3JkbSCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
	b=O3JkbSCxhaJJITK5gkbYX1NLTFWdJ254MGwX2wZJCbGOECrquPfm+xM4nASt7qtpEcx7kr
	gTJwYNAt7pOmaxsEMruHraAnWlmrjYzSwJgjrCxRkTD1e36dub+P2lC/Ekrn9Ji+nkvC18
	kpDQT1JyDFnUFwz93RK5hc/mBIV2Kog=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-UxY5HUlPOY6YaQ59pwaIRw-1; Thu, 10 Jul 2025 11:51:53 -0400
X-MC-Unique: UxY5HUlPOY6YaQ59pwaIRw-1
X-Mimecast-MFC-AGG-ID: UxY5HUlPOY6YaQ59pwaIRw_1752162713
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-702b5e87d98so23402226d6.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162713; x=1752767513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
        b=VFI2FcJu6Yj38CI0OFaCgFgr5xbpYeTbdYKz2VlPp11NlOwB++iAb9DheXwe+t5mZB
         Om1Wr4rVh/g5tx2iDs3P+0xfkyfYpRZtpsz4/H2aJI6jVjEssFZHM4ELGEZzJMInZ2yu
         jbVTLpzBSB2gwaZSURco8FuCNp2LfQOvnmSgSvNHXKIcwG9TX762TkgGZ3G+yd9o0Kk9
         HrsYlqAUNYUKawxhY+PON3OJHe6YHzTXsve8Dhn7mT/dWeDZh1SVHJpuNP6nsh43aumc
         qNA361LRgPgBKLb0kdi9G/vogpkwWSw/MJHIF8kDKgH3BzZIwSvB5vqFfPBaqdBk6jt5
         q24A==
X-Gm-Message-State: AOJu0YzwDcvXlB424rTBqMXjvws+8Qg3I80OBI6v513vPW04meT9oQcP
	hh7i85rCotTWDGrPXckKSoXdjI7zaWkH40aMiAyL2Sz+KBaFlyGNjRTWbAXPx8is8Nu2j7Ao+33
	q+ZCjFpzjETTWCAlYwDf0DcjT8CsbncLPL7/3AVrYH1cpERx8x3is7pI9TlHKaHlF
X-Gm-Gg: ASbGncuAKutFA7J6rvDSG822NHz1NXwjIxdMhx0bwudYQWFtZYm0pxQMuSWBtrEjxz5
	BuyM6u9ornbxC/cjcvCsW2Pl8TodD0T7OsUerpa5YC8yHJlItMicNM8SIDSeOiKxNAnhAGKnOgi
	QlyhqjG3KA5kmzoCe4daS/DkCCz8mM7Ta572mpv1lSww8FbdqP/CEmUnVPJ5qFMNUG6Av57xPHm
	EAo+heidK5iE5i3pEvNJCZCQ06tKuNtgS89Iu8Obe/YHf6BejvUY2TROU/wGBQe25HSoqxWI+f/
	0J0tAKvJHyGW50Kd4q5B9VK/9CQ2+pdvkT4hZtmT8ujA6IFyR0d2Py42kK0q
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101826d6.33.1752162713175;
        Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETv8kKkAF9gRKcsuP04l5OSaop0yTF67wtB5mlM/oS84I84ISgz+5x5RQyUV0R0LiOWXu3+Q==
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101146d6.33.1752162712560;
        Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:10 -0400
Subject: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1297;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
 b=C1NOkFYk4ZvkSlhR/nJT1ZMxm1WrhT5fr4V1f6MUwtgu1IwsGHRhGihPJyKm/qfChcPciMqRX
 jMkYCRRA7J1Bi4cmmruZSnKv3HXP26MoB05WHwsHZzBAvqaIhMzvhGA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EeZRR2Wv1FDa7fViezDU5zZt7VL0dlHXD4Q9lZgzB_U_1752162713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index e758411603be5157e468e8c076620d7c18661bf3..03838582aeade389d9a2d90cf9f03fad835f0733 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -69,17 +69,17 @@ static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_q6dsp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_q6dsp_ops = {
 	.prepare	= clk_q6dsp_prepare,
 	.unprepare	= clk_q6dsp_unprepare,
 	.set_rate	= clk_q6dsp_set_rate,
-	.round_rate	= clk_q6dsp_round_rate,
+	.determine_rate = clk_q6dsp_determine_rate,
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 

-- 
2.50.0

