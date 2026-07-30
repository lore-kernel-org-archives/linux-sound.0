Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E008C36A342
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433479; cv=none; b=BPuLtMBm/AFbnWQS2SArFYlJYWKtqSZVLHZycfGQKm9XVZHkxssVKsAp+gblPqiBsc4ZYZqBsDPRHokyPVCsdBwJhssk02Pk6D+kddoYKiz0paD40QJgEV1abogUjmcz06o5sZh8nVX5/G93mtq9l5krWp4k9GGS+EGaX+I/dLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433479; c=relaxed/simple;
	bh=1rz4d6kUCvtk3X3Q7TzG/qxAmeJkZ7rfw4FiS6yy2dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZI/NwAVb7g2x3VZw7urLZjR3ilnzAT5LHpPyLpuGWN5CD77ThPBffEkkEViIFb1Vk+2q73fCmoGp4RYyIjTWfhFyAS/9i/7SKkx6Jr8L5yJ+W8AbowIAjX75UAhPnBg7f+XCXnRWvUS1hHXY1sJpBpKMSHjGKfhqLtLu2IwoSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbU+VxL6; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbU+VxL6"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c0ecfaee7so420581cf.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433477; x=1786038277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAaiYldDXpLVNz+o2OLMOmDKxzhY6CTVCWlAjTcIi9M=;
        b=BbU+VxL6jA5OeTPnyzM0kEzkyHpncFVjjHB/xGWgST6r2idSqwWZXa+XiYJoeFj3Yo
         fbWE0fOZY6U1F90oNhr2XQjloJGu4lvqs3HqWn6hE5wUj6uZXH5DwRbHS2edPqsd2Rnv
         vwMIN1wduSwWC29j0GU+TWsL1TBIUtenDSNE5lpIBEbC1ABmLiNLOcOAhZeTSyrxrquM
         V2h8CRWI/fq2i+AEb1PDQO14MHT7/h6JxtH/4v/5X6jUcCCNvgjOIz2Xm5FXTwsTex6W
         UysFIANXLXe1PySJHNoKgI0Fc8LtFryJ01qkKbZBMu7WjTitlZwTFf1954Qj/wtryir2
         mYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433477; x=1786038277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAaiYldDXpLVNz+o2OLMOmDKxzhY6CTVCWlAjTcIi9M=;
        b=otV6mjQrKBLOVMPLlIvxOeKHsw9DmsN9+HrGGoW0kDW7J97+oFzyLLYyQoyFZ96Ty5
         2qN6ROReGPCfAFFztfZXMTyHZt2wk/T0xms2IfuCFi60OU/ZMsHGqJrwNKUPaZbU5DtE
         q0yfic62rz5JvyUPC24qzIS7pj1IE4pK5KwuiIIAHcZwWZzJgY1/AD+YiguAml3LfkJp
         TmPJXN0D9KYlnYKjGLKwcG93LgU0aZzeXrf6moTQ8+YAaYT272/Roth0A1YC473PrNTB
         FfwP+35O13CHFPaa9KUSNpz2dfpj/nWToZKHr2rjyEZJvAfNfXseU+9Uzi+tRVkQm4ux
         0wSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3gz31iIer5kor2cW2/7/lw2f83ASgeONLpMlZW5HK9yKGWkN5uRmH3v1/ZI6TZL2bBWOdCghPXhyyzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypz6T0fW2mF3fhymiT/fQUi0sSXLN5kvuhPXhIiyIgw1xrmENk
	G751vw1tFYzhc+6ppMxzEbImdOApk3B2SRk9u6tY+Zz0TR6NvuRKCInx
X-Gm-Gg: AR+sD10quDvQtoGOQZi3Psi2h5cKsWcSQ12UBFWWeO7h25v4fRvO0r6LdjXURTPQKqo
	aV89aCx8auH5h/77ub3nhbxGJURjPLeq23Mkeyvz6FNa1ZtBIV7HO4/zIk1XO76B14MHqTgOvrO
	gBiGNbiQwzxeCFzQI8HhJBhVSNSuYXSZk8DPnr7SddMN54pxyFTjE2rjUtIw02eDmT5385uadHR
	V+ueOoELl3wsg3jCgqaMdHBHJNJPtcsmf7lOSqavch7nUbciFIL5nKVyYy+ihIlp4FG4cD/+IBk
	EsqTRumTOEEls3WQ2tzNptSo4+J5SdSPSPqdCgcKw/lTmjo6oDxKvT7YhaO9N2Iv9ZH+AT5e8YG
	/AwzwYOdbAcboNJNGh5z8VYyZhFTZzgPD8r3hE7PaQLlr00ZfGhYJBR2cbXQuyyuRyLNSChvAda
	gQyL/2LtN1bMCzPJZNbVXunckoMMO6oP0kxg/tH5K0llstT6ZhI/C/B8s/MS8=
X-Received: by 2002:a05:622a:411a:b0:527:69dd:5413 with SMTP id d75a77b69052e-52b38373e09mr38385611cf.5.1785433476915;
        Thu, 30 Jul 2026 10:44:36 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908325186b7sm22472296d6.43.2026.07.30.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:36 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
Date: Thu, 30 Jul 2026 13:43:48 -0400
Message-ID: <20260730174353.108023-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
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
index edc4611691f7..b570d81583f2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -215,6 +215,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.55.0

