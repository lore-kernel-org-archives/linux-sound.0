Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351710;
	b=YY2CEkgA3K/bNX3SUGiml9hgkq0brNKLxzj5MyPiPVUS2oXQdnzjAlCIgM8zzCvb0vNa
	 /8jPqkrAxNiOHIgMPF1XJjetmiNFA6gc9f8WNDeoP2E+ff8sXdvePfr1UZo/WOiX6wzdC
	 T5Iy8SPjF3RjICm2b3A8GkG15+UzMb8HoYXIkevdLr1Bf/rjRtC+dxK4ot+mzT792DlmX
	 /qp9Kt0I1DzXqYehn7e1aab5aWYntdz08GVwxrJ3ZSldhBmZOABTSueDMRrBsophozxbk
	 EVrCDhj/ktKhCzPom9viSjgc9qBqVUST9Ktb0JI0sCrAJLCFGEr44itIkL3bRLj017w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
	b=kKiGod6pDO9eoZHeqqVLK65K8Kss2Sa9TvejwtbTkrZX2rJd1piYXx1deqshJPx72N1F
	 R9clkIy9KujWnbDOj8dFhFr5jo3tN6mV+lWM82sWDgLPSFX9vKB7ZryanPiWY9FA2EjQv
	 AwWwhL9bR2PLjOr6N03hKyWwkZw46LRNN31uJ9dCIx8zQrh33ybR8tBG+YQemRGZ1tasp
	 W88H0BbF3JiVPmITlijNK3/sqqNqfDHD1Hd2MkoziCg0gxFyFMbcFr9o/87BJhYQctFM/
	 s0HVRIdC0vumO/4j8W8Ga/ZKePp5wBZOExp4v/4EXo0ycKNn8B84NRthYo8fC59D2zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYtsxvTc;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E94606A320
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E94606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYtsxvTc
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e942864693so2830225ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351709; x=1793956509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=lYtsxvTcwthtHDc0a8igHBLGJYWIJBVSb4ZpHZE71Hit12rXs3rtSKFBEtcBrfc580
         X77yKJduAhLZywudyLT/zY1wggGtI6haVeK720oVpaDK1vR7UobAtMuFCDPREMO72Kfr
         r+Nr3fjU6z/srV+R3A32rkKGUHMpxhDxrvN6JWVoRAFtVb307b0/KQqkDuQbJxxnBFQ2
         QgVDc237PRtXsBjNBCCUiQrpE4WXvLff/3I4MVoyFL6b4vd1rLU6sAo2Nb4KjTgRlpzb
         0C7hxTDuHHclt/j5BOTRCHngch0jkquslVvL1uHSmSw5a1yOi65yAZGA+Xnb0OIgOaB/
         B9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351709; x=1793956509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=WpSqMqqY0jHi7I3h5ZQW/bjhVbt6TCLRJSfXF7N1SKV0EPyCh4W6w6cyXxzjP8LpcT
         h2yvtW3D0yFRv81n67EZ/xA739G+NPy0HiaeQv0dv5EJ0M7QTpQ+EJNgWHwBlLjixCZ/
         3TALkdU6k1P2b6xe4XhqJ4NjWJQy/751OorPS+SjNkURghzqzqI8CkHGPx0u+vPk6hI0
         MdskGWQgmKTwtw0u/2xXIypb1ZVEL5uieei2sL8xAi3NBjeOLLPd1kJPbcHEYPjkvnxb
         8hbOKVJ34LmNz/ovS1y79HAM8TpWzKuyl13lLLhy/iLxX9TGPjI4wP8ghionCbJ4swnW
         QgZQ==
X-Forwarded-Encrypted: i=1; AKwUvByQPb8I/baNlIHgCdV6xf0rMTd4nFvawKTJhOEspRyalLAJfNcTTtAHgaXHShgU5sqQ8MFEoNnxvon9iQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsaF3CrwUy0rgGrCyZDwsH+fox9hm+kdAEOtbSR19tquP/TaNq
	FiIonw+qQ/TEJ9mTZWGJTRKkoFHfxoc4NHi7yw/YvkyAKSWAQsLPesjG
X-Gm-Gg: AYBFou349LxO5J242YwGdzRXNP81yXIdaU4fmz1+GgyYkZbMcwAa/1g6UWAk4Q45jCm
	nJgzfeTypZ0cOXnBnhSh0R5vQp7IfmZGRCrwHP37kyLYnUvpV4fAAka3hiY6pvW1MQeiLt/8t/D
	TaPei0hzk1cGTC9OcvR7RVWLqyOnj4/kbfS26cUNuUCKjZQE8sEiP5WaoC274B2V62lE08vDpfR
	ByI8EmzdZH5+H6B08CCYjPhxyXpT/UGSiUAO/eVoYoEOcK2GD4tDEsyLi16SRNh9fkH4joMXjW2
	kk8ODHGUeNjWZTZMSddMdlOD1Nmw2bBp5HGiGWXsahrQmiBJblM8Tz/Jmqv+76NfkDmluTbv6Gy
	n2w1Eyvx1OfCWEBKvF6SD0skwtw0XSddkjt6c31qXUJpgFm6xk8OC0kGISne3hYY3/0G/T504zy
	WedlrBGqzgc1Xi56zoMaPIFSHKSpAL4Btx0b4RByLEg9OpZN3xOCVaVhzp7gfh3R4EkNYI/s4es
	bjJynI+ec7UKgzTA2aeiD53mnnD/NXwoJgl6BJexG+W9mezO8YajwIq6BBfQfGgE3jmxGwO+S7D
	CNwY0fnxbEReJT3QmC4PqpI5TeyF4n42tHZQIzr45GFych4cfA+2h17JsRSTbm09Y/Z4CeYf0Hz
	h4NA/v1t4YR/ZLWH4UoZKDnJL5YznzUpZqdxG1i26uSwS
X-Received: by 2002:a17:903:324c:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2eb364cbff5mr18087185ad.34.1793351709346;
        Fri, 30 Oct 2026 02:15:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:08 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: fsl_sai: Drop redundant dataline mask AND
Date: Fri, 30 Oct 2026 16:14:04 +0700
Message-ID: <20261030091404.18757-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

