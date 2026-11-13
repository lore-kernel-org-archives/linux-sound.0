Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546479;
	b=vwjnDyXC6REQU7OdnznEeeSPaxqwlSHLdWsoZa6nhRJXEt4sWJCjOFjwOsFk+5UfHTFj
	 epfnaPk+TEmEpozzn2Rs/1dG4LYeotn8xcMNX6rdOEFD/qUMvPCu+lPv7D0xQ6j7XrOiV
	 7x7ZRXQGhPKKmx8AdwetWqhQCM4eUoAQqVQVOnt1k2nrAbOZrZVH7Yw2HTjCp3pd7FHoP
	 rwNanur1gNPH6s5gLdGDZfxf1W2+CM6DegNYkAT7Lnp/3YKgZ2wha1mrB6GwMLkJwoXXS
	 7DGObsXgYMf9J5M5UqJ+CuUDp0tmOCUXUUcgGFWs2PxBWVXBoOA/GcXlSByKDtPjgzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
	b=uPLHLiI2ILj3hgQNNyOKUmhKc/UqlsbEPkUZuSLF65QBCOtVvB1NXyGSKFefmIIF2sGS
	 0f+NV3+4Itu7hsn8PrevRD4Qfjmrp0fBaTR0JCKLfwWqz4o3I20nKvRcIl6/faHcF2eQA
	 e32tM/IbKf5g5tdMPlhvEJWOyPPdfPJQMykAexcoOp0r1tj5HPW5qeb73xFz2KmSGn7ON
	 c1uEslWxVZ/OKFfri8Eooag6sjV6atxrjGSzweLZ11rjxofj2BPEKsC8G0i7OOgvBfYJk
	 GsN6dqmsVFgYBVNoSCjfyjENhfP8agk0B4g/2avpYi4Gx7YXhFZRE+hyRfcjqDItsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISwb+DzL;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950E606A323
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B950E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISwb+DzL
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed06b725fdso11904555ad.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546478; x=1795151278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
        b=ISwb+DzLyEuCNr+1kReUrfZE6bN/JMey2seUdZy/T6q82QDdE50nkrshvbU8t7Z6VH
         4RuX34WAhu/YCsOzGp1RORwqe5NGypbf9Xdm58uZP1WafrJUKM3zz3OxOjdvFetDuAr1
         P+/0kj68+k+dg3cYW2Dzj5Bot1IwQk2odxKpDpvvHyLn9CtsGJwbu1tTmtriRnKJhgTL
         p0Fo0L86R7uvxlSB/ytc1RFQ85xKu8MlgZwvSOprI5Xoeto7s8i81fCqPkpP3fPyUw5D
         Qk5k/vXQDxOgp8UIF2R6nS7ZZjkvOldzpQCu6RGyHlEcMw1fXpWKUtM54ZrWzf+Z6G7N
         GbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546478; x=1795151278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2Yp9Za6L9hqRc0w40QLKrtVSVZ2CNI9cglsNjGbvpA=;
        b=DXbCoIOQCXCO9oQ/8PdICkRqn5fuAmSMWHcslXZGQOlTSurdiCQhsKbxxBc5cPpNf/
         o0szjbFztnqJ5BqiSTe30yOvpwul8CclkJMSwaR9bcI6z4HfGnX6fYbPrb5IF5gwkw6U
         gIaVzJIYAHLRaGLOLuARlyGUK6yqg/2OXMyF3CPOtl1vjuJfmCBx3PhZaJNZPgDkJYeo
         aeNeVTR9l7U5/Cww8AVnkSeCJPyqe+R0Ji54mWbVPWqBGuMxzJKIDhHM8L6/f2/g4QTe
         rIWuT6mD7fiI5pr/QNpqYAEM22hSdMxzmh9ycLCLysJfLPb/5pUnfiJi/Yf24PvQwbW3
         ZzAA==
X-Forwarded-Encrypted: i=1; AL+hErFisjWJWt3V48MZJigMJHIE/0tf89+EGmxUe03kHZGu/HG5UW7kFeOBaFM8EvgSEzwTSXZ45aq8Lz1a3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9avM5+gqUn0gkJThwHzAgGX1IgO26PbOEsR9AMMadETzwVGbMV
	3b26yylreU3nMf+mool2czpANpuozSOuSnC62VjA+Ts2JoM/5M7noIpV
X-Gm-Gg: AYBFou1U0qvTt6bgKSvllC8Qhgeo0fHsggS0TQMqiWo2ITkrKP72+nkp20RbLoOvcbR
	gXpdVmxCqAshRgHkRjuvA8mxgG+yI0V6zTvW1Plimq10jE4CeEmdoNa6pomhiYgOIeAkJwibs5r
	O8hDrwePG5ZYFZpX8I9WysIdPjI58/hrblmtHqTy3fQvxH47TB0dWzSC4PjUmeC/Cow5fAFnyld
	Im84mcpkksZgD2ychU0EaeukSb2yAUCRxDgotCTzbCIDaccFvd8kN4p6Og+t1/JfZTnK29oLDn+
	ADAqqW0r2H1Z2otQWZ5jY6Acs4YE+YoE9G9jDFGQaGUVe3A0IMNgRYULTT7akb6mXV6JFJ2hEay
	uumr6Qv9f+oYJ7eYMB4TE8HrZiQQkK4P4ACpaZUisO5rs1vr3JuhHllKAtxq3LbqmWMNbK4C26/
	PRhL3gZ0mDCZlchLorCLshHs3FD59H6zd3jLdKJeIoLiBDwRo5cjw/977fX34HzQW9VOxV9+DVY
	aCsjbfmURdp8sNEh2jGoTtauo3wNfBigM0L0Um1a3Mo9SZxHdIKgoEX8/ieFtTHqZyrli16A7dk
	arvpXA1ywfmzwqkulYZn9mDci4UMeZ03M+YHvp2rRu+FhcIY5UP4mTZk42q2e3SdQWheWrwesl6
	ERvHPO/03pC1EoaWsBLuz5Snng19kNxn5UlDXcanbWfzU
X-Received: by 2002:a17:90a:d60e:b0:3ad:677f:567f with SMTP id 98e67ed59e1d1-3b1b0d7622bmr689241a91.40.1794546477658;
        Thu, 12 Nov 2026 21:07:57 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:07:56 -0800 (PST)
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
Subject: [PATCH v2 0/6] ASoC: fsl_asrc: Fix probe and resource management issues
Date: Fri, 13 Nov 2026 12:07:21 +0700
Message-ID: <20261113050727.14053-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi all,

This series improves error handling and resource management in
the fsl_asrc probe function. It fixes deferred clock handling and
runtime PM usage count, ensures the IRQ is requested after device
initialization, and moves runtime PM cleanup to devm.

Link v1: 
https://lore.kernel.org/all/20261112105116.32274-1-phucduc.bui@gmail.com/

Change in v2:
 - Update the commit based on Sashiko's review.
 - Add handling for CONFIG_PM being disabled.
 - Add a patch to use devm for M2M cleanup.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: fsl_asrc: Improve probe error handling
  ASoC: fsl_asrc: Fix handling of deferred spba clock
  ASoC: fsl_asrc: Fix runtime PM usage count on init failure
  ASoC: fsl_asrc: Request the IRQ after the device is initialized
  ASoC: fsl_asrc: Use devm for runtime PM cleanup
  ASoC: fsl_asrc: Use devm for m2m cleanup

 sound/soc/fsl/fsl_asrc.c | 113 +++++++++++++++++++++------------------
 1 file changed, 62 insertions(+), 51 deletions(-)

-- 
2.43.0

