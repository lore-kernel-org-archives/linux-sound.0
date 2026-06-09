Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA853F8893
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022196; cv=none; b=SIz4HM2SV6yNV7b2MyEjoiMv1Do81hAmB7F2Cs79ejecjzRsewJY83wxMaaafhuvB/JRecFGfpBIx9sHjHu49jJokdEAqehwAOJk5cvk6XAzWKhU99aL5Rs4ZpiYbgJEtf6Wa/dZDvD/uacLcGoFuhWDdfmVFRhRBBQTmekkPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022196; c=relaxed/simple;
	bh=F3/Q/P8gGDDcuSGCNzRM4Jb/sel/WSnd3g4fJslYVg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd8oTTB+FfIa1Nz4uHes9Zgl1S6UYrboprAiwrmtdQIcS065AApKMpxP8HYwdU4HCB25uRx/YsFRBv/ESZUajKOYfYjTCitrn+lViqLQc4NM0MMkABo0LH1D4Qi8h3Jshu1QA8XPYwWBm+TSz215sqEK7UOqHXNwr3bfO6L+jL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExwWrScB; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExwWrScB"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-915671abde5so511509385a.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022194; x=1781626994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=ExwWrScB12UJPgUOulJhOD3WF6GW3a8iqU66RzS1Bpp7Ix+ftz0vKtD5ZlwD9RJOAV
         zCtTn8HxwtMuidzXvs7ExwnR8fS781bprWVZ5txvJAsXie2YIl0aW5fxH1RbKS//llhE
         SEJyT7kdAdvhxAmjyXU2Yf+XxFRB0Enar1/c6eeIhYklCBiKU1B5ZyPd0cb249FTPiN8
         I5H8wKWsFCHUJPouu3A4BzG15BiXjxJc44XFUUIZu47ilpMg6LJBNA4aO7GuUEs+5+o6
         m2WS23fm2KDyc+/x0jGxYlphFfCYm0KZzMbcpTJHJf7MLmK5o4fzJObl9c6fb+X8iCvy
         f7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022194; x=1781626994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=BlF05uZ/se1YqHZS2kGlRYGS5p+n/4Im7nIZcIjyCmvSO2IHJn+GqN1wRizCzVuK5p
         R9+UnNhgwpNAtBYJ1vlo8M3w5oaHTAbCOSuadA33/s6VKkg1btLBUKoFp+HKYfXBbvZ/
         Zf25ddgpptwqTRNiOCJw/2ITLsXuMbCxg9qYjuA2wB5toKr4QgUGNVtKswk9dYAaVkh1
         yRt5SoWKDZSoKruAhDz4L+yEMgRgXckCBz+ie2lKGNDI+u9jov4qlWf9OjCHNP5bTC8G
         4FEFzFLPwW358i3+lejG9+R/BpRZuBkzAutcu1S+eQ3kk80OsIVUT7v9W0JKJB7ne1OL
         wn9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/NLvsIyVt2e7lpR5rSXs33wDm4+NxJ6f6D4LseTQcG5321adWEbrCr3J4Ec5eTKZrQyKBwWySkVGrDBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfD1l+OEH1JbZa4FfE9quvChlPz/5YXdBB8HfJuP8+nY9A63n
	dqNn5YrEe/K6RMh0o5C9UrynpkiltEw9uMJ/ByYym7YcYRv5YtXrK3JP
X-Gm-Gg: Acq92OEYT2RWr3mWTfWJw/xykcI64upTs7oMDIoNTfkNSxCcnawKsq6lX9lO31QV1Na
	D/z/v62bneqJRwlgNhDi4WXNgTpW+EP1wu07Xo4kaxnw53QSk9Psi8avFiyw9723VTM4YoVzbG4
	DAaJyBeHuLomtBw0uhSCGB2lmtSCcNsXxK1SGZYzNhg4EMtFbt6KefRo+oOfIx1Ya7aP7kXYFGE
	XU/jM3OfP5zix8r648ju7l6KAispG2S6KTOtyumA+epuyLCpbGslUueovAqsiRQKu3wOLLg99zf
	gmKedZBt9s31X6hMKAZQc5uGTd+q1V7bnkflBVQ+zML6DequvcHJY2pz7Y0t1NEUvOqgmGHHNcv
	MNr4oNfplb3eUHuMjAMowO9XPbvl3wwKfTp/iAvtsnOGS3WNiupH7SvaljvY8VD1toP1kz06M/N
	tGO7gtIOadIegjrLd3ce7aMxOcn5A9BjoyKUbsdQ==
X-Received: by 2002:a05:620a:6847:b0:915:bac0:fc2d with SMTP id af79cd13be357-915bac10351mr2274439585a.7.1781022193940;
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2158510185a.39.2026.06.09.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
Date: Tue,  9 Jun 2026 12:22:50 -0400
Message-ID: <20260609162255.31074-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SDM660, LPI MI2S ports can be connected to a WCD codec which may
support headphones. Register the headphone jack on codecs connected to
the playback port, LPI_MI2S_RX_0.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..9070db005e21 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.54.0

