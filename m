Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875420;
	b=dfXBi+c5JMIlQGfiFq6ARhRXalZ1QD8YbYJxdRIhn3oC3oMUPQwIBmchF4tSn8RPHkR9
	 oFUxIeRf2CGNIvC0Ij6R4zUGF/MYnX8cutNFZXYhpqPrDXWla1Qg4B2CTy13lRfNHFOon
	 piHIKVGmIPBVqlroUoraYtLpZkz6LGhW9V1Txup6c7FsPTcJS0NARjVcEbLahd3OD7oqx
	 4h9eH0usDDxA8wokfiw2yhpIPwTiAwH5bNh3qiIAz1XVSLKzd6q87rASbF7NiGCkMr9Zk
	 Enhwrie059lLBXMgJaHvWRGRj/KCde8UCvbDrhqsq2vXaiVZMJ1GXjXym7Wy9UW7lWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
	b=0cH8lKqbLzczGEPH2njT8pvrmPR8rB72LqVT0mIEWwQtByhe6IItEdyzJNIHd8ou+muM
	 BYsr3KYKd0uTw4VUf6V713+qR2XFSmiFC4+GODtF6Wij/zxyqZgVKDg+LMsdwqDfoHakk
	 U0BHhJjx+WyJ5jMKiduWGXHQ03HYffs7MDLR81uESW9cl6Hy4vz5PAFAo0AFh6smgjiYV
	 Nqh7qaeN+ZXjtDd6VRCQrvxXRH9ounERLdovb0jC0//txIwuSuNBYvlowDRRu2HpoHNKB
	 XQIuktuyhjZrIovXhZtSXzhmpUBkFEOHUpnoW9oz7lxIzca83H6VJZ5QEMniOAJKutg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/I6sTG9";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6EA606D829
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6EA606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/I6sTG9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2908691eec.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875419; x=1794480219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=y/I6sTG9kAMzO3v3PVfvzCxwYYPiYbghjnVa1cHegzah+YMTDiFbdYIVtDRd0RJAp2
         weKv+B3G7Olp6f+2tvNKyVFTkhQiXari++x8/tYAiUKzI48i05xdni57UGWBpPI0krSg
         kyG2EaQU7h2ehXyzxTSRzuZVXeTNkkC7JlrYG8X1xDC63Io7d5IZ8AhGrvAQW2lLhlxB
         Cdpvmjyk5ysNQ6/AH77/ZJHjCHVVWd4S1x9X4QhUYiwvyZ5Vvn/fsuKDrzl25GhjuZHz
         liETzKOOdovBixeOx1aOFfkFiDM7NAfkQ4TsmBa+gHNk7Nf7YNSJo8T1SH50eEp0j1ms
         8QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875419; x=1794480219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=qHoaTt5w92qjgRrsrmRkM/F+uL7FDFQaibf8dndRh6KaXcdzsLrnC/8f9DrWK8lwkc
         U1HFtR4H1SMUdKR/A36M5SF5gZ8C3qPWJLGJwYrfbFxWm+ciSY89AS/p9LoFITXmRmtb
         fHnVilhtxEH9EDlzYUke7f55/Jp0DIyqNqMuIscZ+PP5P6ieWi6Xk3s8/vCRzrjlntCz
         644BzQdSnjyVGEcWVXYMalXAhsM+0j792hlgOAwT7/VJ4b6tVwf/kZLHu3nMIAT9lDIi
         wAHJbd6UZsQxQI5anQXC2KxBIH+TKAF9Ghhkf1RopTIEsezMFuG1NQ9/UYACc03MdyrP
         vFvg==
X-Forwarded-Encrypted: i=1; AKwUvBz1meXsP0FwOmDZ9RTY1e7ukpFUc1MBXzRK9vSCDKZRsivyHGm0RROpVnNnaGViZAWCqF+IkUpSF7If3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9769fXhjAvYO9idqKhqH7olicv3eX1S1tQnsmaVT7bSWE5jOYr
	mxUaXQTQWQYo0D0W0l9bqg3/rdBbA15DfbataYcYX+BQSOmt1qcoRWQg
X-Gm-Gg: AYBFou1dDi43brjtleRVQFLwE3GhggpUmR76sgF6UJhf5whGQWEdisyTgsVf+PR5Ihg
	kAqPqVOZn8VefVazSeqUYgO6D5ouZS3rqdehtTpp1W3DZ2Rt7Da/csiAWJ2DFBB9/D7kgc0S941
	jUhX02KFL38tLhpHky5FJiO9ALOLPMkpuDxt+GScTAJ5alD66zGBMsExS9Mr68XwPI8MKgQY/vO
	Nw1OOQty1gzpr/vfC4vb4lJvHMcHoP53C1vyO5XU9GGXr6gTGHRp2EBZwqqudYcRlde3QhthRkw
	kfokNOkZffeENkY3TTjb+/33tqDE/R+NDFB6136onX4wftvbs7tWTXMgyajjGZeizngcMMb2elU
	f53y7WWTeWsuHZMcMrYHeIIbVZndqjYcsD6pfTFIDi+ZSrp56DE7/aKJtheXRF8FtZ063aAYfg8
	L909hxXgIY2u5lnp0FOOuXWKrCufJjS7QFyPEpZAYdrYVdtTilrq88T3YY8RHNqJIsP/DkummUb
	A45JypaIkYl8juTsTTw8lYhrrLQZ8IN2/ONg+RgHae4nNzYTBqPvB7KEtou16kiYKqqn+yHQyT7
	GGvcT4CirfI2AeSEh3jfecAskZ5ldjmb4byys8wdHcLg4kUbszpQ//hfJzQJGt9qTydENNOasQh
	zAcrxDNoaXetiw3ZYW5g82QqN3dyN8PmMgvfL3bq6KsIQ
X-Received: by 2002:a05:7022:3a8c:b0:14b:cf58:ce5e with SMTP id a92af1059eb24-1ac4fa14bc6mr32640189c88.0.1793875417516;
        Thu, 05 Nov 2026 02:43:37 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:36 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/10] ASoC: fsl_sai: Drop redundant dataline mask AND
Date: Thu,  5 Nov 2026 17:42:32 +0700
Message-ID: <20261105104237.38542-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

The rx/tx masks with bits outside soc_dl are already rejected just above,
so masking them with soc_dl again is no-op. Remove it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cb07e7d13132..8315a0d8893b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1510,9 +1510,6 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 			return -EINVAL;
 		}
 
-		rx = rx & soc_dl;
-		tx = tx & soc_dl;
-
 		cfg[i].type = type;
 		cfg[i].pins[0] = hweight8(rx);
 		cfg[i].mask[0] = rx;
-- 
2.43.0

