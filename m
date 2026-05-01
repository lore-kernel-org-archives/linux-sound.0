Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260BF3CFF6E
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649547; cv=none; b=JfcwxIVjs7cK9tykxczLoBUvejFMIJnoInPmnvbj9nmL+FGhl6ndmttXogfW/FFfRz+mflexCzEZlaEpYZsU9dHSPSpD0JXsOClMJtytVnSpVCHs7V+pU82KdfPZaG66w+igseuIk3ZvadajtAvgemDEPls70lED9SfEosQ5EzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649547; c=relaxed/simple;
	bh=WkQUxS/816U5853s3MLnvYSUgDbpQorPDyga4dqZbF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzCE5krGTLG2I1RUvwYi5LaFW+yFMJnhV/d5IYIfNIx4OS8C5AEn0l6PMGNUQ8g4+KOb7UBldgozFAApuOeRxbkbRuQO0nInOWub9xQoPcZN/qwaoh+sYMvoFa8KbRKjwwKpSP35Cc4wkvD7+4MJ9KBC54kQAcZQB5DFRMUzXVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG/8zoHT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG/8zoHT"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b4aeddfacaso13578466d6.0
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649545; x=1778254345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=dG/8zoHTjG7GwlEoUscDOij+2eVVCWjM4TTI+fjb3IRVxkLGWAFikaJ7MWt6lPJ6R+
         QbQ9ywnfU69+01gZQDpPqasFx5mxN0zWQNrtgdqFNhcJEtgfUg3YaOxs6JxV6X4w7uOo
         ASCUl5/LfGbtP2W4ytbIuR0LP2dxoN3cHCCGfc/UERuVKK1Z11i1vODqS/thOTlG+FMt
         VUmo5TMihaEW3DMw1TYo16x/sBXSXRWjlSISmQNOGEdBH9TG5axvjHCQHajupToICy6W
         ldWIwJOcASqKA/VtS4lr1eMOhAbW/0TZY7jzH/25Pr6J/aNau4m0aUAS/CZ/Y2nNbWIz
         WICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649545; x=1778254345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=aws16SNyO+Oyu1ABoxT6a/ckxgExzH0Jx7O5Md2Zi8ohuzllNcvHXGM9zsMiaoMVPz
         ipP6iXAQxSaqbiSjubcT/oNOVCjxwBD8PHtxQh56DT+D1+VDwPnWUfPKG35S7keM09/U
         y6tnq0ifyew6aDloinQJUcPglMZgkjMMtzQ4fO7KPzPNpoCDAU6BGmaNyKpIj6h5F8sJ
         /JsRuEmmmF0p1WYMNo/1CW/eOx1KFiZsxt9cFe4doTane6Q6LT5Ueo+PDuRN24OCJPaF
         757WephiCYXFn1ATFzPa0ewp1lAi19ztds5BpHEg+sH2THh/tNC9xVgmqRLZ5pn4Pgmv
         OVOg==
X-Forwarded-Encrypted: i=1; AFNElJ+caQyQ80IpRScWdYH/kk7AZt/gdVUa/XHPpzBlPHbuL+igZ3RfjoJe5BRsSqPdJRVZmIqQqfbNwStstg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybrEf+gJWYam9+Flb6fOTJDLtPZHUkyfb9RNPFCrWWvXVeggyQ
	8bhwT+2ZKrV132XLNtEXC1SVD7i5iyDuwhxDKTXIdOirhHbtQF/vLCKV
X-Gm-Gg: AeBDiet64nlz2yJy4DHiydHT0/JQCsNSnJ8RO+0usKJupF05YU5KfE1msOi3kDDjLtQ
	9yAuGjef6/ViGPienZ16Kvg6QDqfZu1DHl8wvlpVJmbuJDgp73JyAuLCw9dtq0z8i5fzNjTp8iL
	IWnqYCXU6+3r92/AEJ2zy61dIbFVorN/eCiicYvwWa7iJaC8lM3LG27Hg5gwTafX688b4ZWEfDC
	tp2Ju5qFTzEUYbXkNhslIVK53dflfNJkUWkqsKeFaadr/mgGVDjvY01Gr+DzO17ZVu1hRcJrMMO
	DF7wNC1djWKz29KB0nHmJF+v15awM07eTcNTrJVfZGdvtQXdS0j/aAaSl+3MVs90nTvi7axNo51
	wlhBmT6rYznmCMyiO6FW3GOEEI9RD8gTgafvAdJcF0j5MZtyKpNmD6tGQA1MeYL/Yrh9vkslvoa
	yjzj+8TBcMzJYKVZD1YTbhZDs43HLvSSpND09L/bSDxLoFdsNV72H+aDpePQHUENZLJryfCX2t4
	HKFQLOGWRMZ5HmNhU0J7XjwzQ==
X-Received: by 2002:ad4:5aeb:0:b0:8ac:a154:e156 with SMTP id 6a1803df08f44-8b3fe7e7316mr114395476d6.29.1777649545206;
        Fri, 01 May 2026 08:32:25 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc606sm26653506d6.31.2026.05.01.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:24 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Fri,  1 May 2026 11:31:23 -0400
Message-ID: <20260501153128.8152-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal MI2S ports are connected to a WCD codec which may support
headphones. Register the headphone jack on codecs connected to the
playback port, INT_MI2S_RX.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..7e2a8745594d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case INT0_MI2S_RX:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.54.0

