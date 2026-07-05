Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12D249EB
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222719; cv=none; b=bXcuyK7OoWINiFEWRFnY3gllu0yzOJ5NIkUHKcxQ836xsXy8s7snOIYKUcfhxc59bz3I9QNJMgd5h4Gi3bmPmFzrLBh0kSbxXhd8QNWr+7Fh4NOGYhLirZuWDBxpJj1Y30KKzRFqNHOhqM+WpyAekbet8dt5Y5VAQ/go8KUkTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222719; c=relaxed/simple;
	bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vmt1fh7dgzRNjTMzuo6Kz4R+qdPmt7E73H7coXETzc4ce3HC4za+0gxnnxXww+iBRbE7JW6kr7Rj8HOVwUE1HhkU8MZqKT4mWfLesf1Z6LKCoQNJErS9RPg14ObBidyFkNTYAJVnFCv5aMHJpQ9yo6XFl3zXu0BX373F8lcx24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2B03XZi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2B03XZi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so17771895ad.0
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222717; x=1783827517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=o2B03XZiMmMWEftPT9BHyGuryMxKYMkzIUx5Q6UgWtvm2BzNeNgfiU/PhOhZNBqdZu
         JmUOKrFDGwYwLL3za+T0566Ek03tnQ6EcM+VsKlPQm7nNpXCjES2paf/UdYGvGMlbq+a
         Uiatje8KRP0l7/HPrEJVPcbHnTi4WVZBOMOZaxXuB7IL/9spLAKh/hRLoG8/JEvRJaFn
         d2PRddCVEBmIyqpQFt3BCycVG85Ims5KI1cnaNG4OBwMjSFt+kqZ8fNBG0S38mvsYLe1
         2/MvcZvJUuK45UFIFjBfXPhKGP2OdPc6Lj2//IMPWU+66fbLriI0xA/R3eHE7LFQ2Xzi
         E7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222717; x=1783827517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=Sewb8KUoHkcnJb8bpQ6qX2zQZoa0UgxBy/1uPrTaFhMgZKiwlKer+Qp/0U2qTMdfjZ
         QbLNSgtP/326I27E3KTr8zq7zzDa+NbhJqYUiES5U0p7YVOpYMSnrxzLqQKR9P9JCY3x
         LWY2bPCXc7yQupGdMmgWekOUeahg49rnor57ogESQaeHhUy1eg2ye0FFfqTtRoQVIBN0
         Zryhz43Bxdtu81PkvMlsKug/1HIpPeZizKEe2W0ReWVL7N1N+5C/z8ORfOyUo7quAgWg
         De2DcUvFPy/9+kNWY6Zx+n30FV3yeaQnmoLEJpwWNPv7+VaNdl1nRjzlgw95a3/w5+0M
         l0nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4P9UXXu2wiuqVJ7i2EOHlnbeUeIaQiWmrHla+XhtobU5odVunSoPx91FlK3Tb1h1WiwteboKkaDbxJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vnKSHjO03EtcQcTosFh2LBOlFaWzyMruHTbc+IpPx/bfjqEH
	aZk7wxq+cuZF5xRaTrHuV1dgdbTOEz9qxbdiFTzggUFcNQUbIxMo0JQo
X-Gm-Gg: AfdE7cmhCZy5A+IaB+3gkWzESZpRSj1p1nK2JA8HXA6QLAjqg9jWoinib+EH8pO8ley
	8HK71XrfI4WZc8olGBGL8PnNOMEGGt5vYt9iezrb20v5MQgrSuA/j3/wca4AWXie6Nh8ndNV9BG
	LCMJJInA/c5JA3z4xqPB4S7R8IXRZg3WGObsKNod+uLICQATXCiPyz95DGQDHP9jvFN3S9cAdFt
	K2cDMb5nh3tNzedhsPSM0ZZoT9NYdrIPQfCSxVoaV/M+57aJIjnTfS1iACwIgoFt++xy56iqkkg
	geTGUxuYb6w3XsmtbwsVDuPFDwovv2QiDXbOq+vMl8GCUzWESgB96GOGUHpomJ89uzU13KHLGOX
	PujvtN7QJuMMjMVB6buqdXYLlv4xlm6bFVMq3S/KwIq+tsX84RqRunmJsXFeFub1c20p8V50b1J
	CLjRdKQz+U4AfFgrthhDQXqIr1cxiuboDKMI8A5AM1k1FBaXsO5cNCqLrFErKP82L2J3fIL+2Pt
	KfVlJSTDoc1H5JXzheLPJzvfuGf4a+u6tdC5q+cnLHAngV6fsLEH4PjmyQSVYCj
X-Received: by 2002:a17:902:e74b:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2cbb9f0ec42mr56329435ad.39.1783222717268;
        Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:50 +1000
Subject: [PATCH v3 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-1-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7ckMoWf3eS8bHW2lbboROXpn88El2kvsQ6tjrIMX
 /2z7N3ajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT3zWP4wzlhU6DomrqseapJ86qXvf12bd3j8F+uquWXZVauPpze8oWRYXrCIpM
 d9mvytZbe+8zbHK4aKP09Y+VKY+P/hjEaVgt6GAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The SERDES clusters in this peripheral take a long time to warm up.
We tried polling the reset bit until cleared, however this is not
a reliable signal of readiness to be configured. Only waiting
~25 us to give the cluster a chance to settle makes it work
reliably.

Increase the 2 us delay to 25 us and hope we never have to do this
again.

Fixes: d8b3e396088d ("ASoC: apple: mca: Fix SERDES reset sequence")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea..ebe116f32661 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,10 +210,10 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
 		/*
-		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * The SERDES cluster needs a bit of time to reset itself
+		 * and settle before we start poking it. This is... slow...
 		 */
-		udelay(2);
+		udelay(25);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.55.0

