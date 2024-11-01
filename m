Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682D1B4F2D
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730479929; cv=none; b=TX5vpJjK4GavL0CRZ+V5UWYGEB5Dqu7+YQE4ubT0OSBejT5l3aTQxDlZi0PAmB+9XMNtxvvG+HU5nZsm7FJU/a0QDvCcAsjVHR+S3xbf2qpXkpTUYxEk2tL3iLG7yMPPlc8eJ1Fg7BB1WE1FI9bMCq6f3e32r8l8IlS4UlHL6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730479929; c=relaxed/simple;
	bh=0cI4Druq3wgMwpIPC03lQBTwMFzExwhpaf3TyJoH828=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9cNEhW1gB53fhKkqKJNPY0iCXP5pwjdtQJan0YHHunhLgw1yCY0Hy42sdBhLfo/5ci+WhdNiUEa22U3HoR6FJP4GSmuGtSj1+5DgoKCAh1M1CGyfvyidC7HxMYNibnPO4auPFaO6bw1L/HmW3P9hJ8xWqXwU2S1QtP8QH9pEts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIxJvSEr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIxJvSEr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a273e421fso38004266b.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730479925; x=1731084725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIgFE8ajZMpeiAYpHYnBzqCc2nrL9qems2WygOLr4KA=;
        b=EIxJvSErlGQfUuPSfVH+4bis9Jd/eCI4oTLmCXsB9mTQNFlF52LQ0625J59+3AGobb
         P7tovIOQVZFqE3eySd8htYCHz9jDAoIgvPjF1EpSAAve/paO/IS4izUmLqEd+KckaDZ2
         jkAxGwk7LyFemrmacZ9PLCOUGLJfyKMvyOfYJfCT/x2R8fbOZddM0YP+4Ei7SztZYD6q
         WruKSNkAvX+HkJJ4lrkcMFChykDe8C5XXCWx58AKHFyV5mj4XBlVurzR3C2lTyma94qE
         gRZCARnI+1h2m5AnqiDuRUYmmu2aoaX+31m360r0ReVbf70DhQizXCf34kESo9lXeb6R
         nMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730479925; x=1731084725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIgFE8ajZMpeiAYpHYnBzqCc2nrL9qems2WygOLr4KA=;
        b=FgwGjJ5mJX/oRBsXGBstnAOV2VcwwSOX3z178wrRnrcNoPNTaMqd4W1JC6X3g1yRXy
         bukZFNTqx/p0UGq+QpcxlCVee5qIR+6177Gxgg9L6S1CJG/KiCw/dvPFVozobIOKl2M0
         o4jRPEnPrS2ZV1SKGlM8swCd2WSjFK2KU2x8fa0heBiv5I+bFa2mf+DKp0wdzwd6CvH4
         dYtW/6SBxdyEV6T9VOCV2TrdKYfsPacEQ0hbblSgmkLPs3wNUqcfNQY+duLEDuh2iv1v
         R45+JSfQPD3HQ9a3QBauiE2sm5QNY9Bq6bN0jgLtyN8yFtfkb2lCt0GBerPZt/I0xXKi
         SR/w==
X-Forwarded-Encrypted: i=1; AJvYcCWotDMzaw8CiULdvxAMF7aLvyfgHrueZH/vkaMVTbkLe44FMaja5tgPgM6jDIMupEbJSln4l9kNjLbn2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYkOAMdZAwrx/ipdGuLVezTc4MX0Js+oQazlRGM0Hym8DMm1g
	HG11F3dX7PGOYru+yEsCwDZ4mtNT6Z+UNhNLYs0O3NJfdYM7XmQQYwNYETwDdEU=
X-Google-Smtp-Source: AGHT+IEvUE1QdVJCYM6Vp3B7nB2TNby7k09UhE2S3PtVGATUzFJeVEY/1uZAt6ol92DJsS0nXER4lA==
X-Received: by 2002:a17:907:7287:b0:a9a:1a17:e1cc with SMTP id a640c23a62f3a-a9de5a4a878mr945085066b.0.1730479925286;
        Fri, 01 Nov 2024 09:52:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564942b1sm202087566b.5.2024.11.01.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 09:52:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp Add SM8750 sound card
Date: Fri,  1 Nov 2024 17:51:59 +0100
Message-ID: <20241101165159.370619-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
References: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add OF device ID entry for SM8750 sound card with its own model name,
used to load proper Audioreach topology file.  The sound card is
compatible with SM8450 and newer family.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 922ecada1cd8..311377317176 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -190,6 +190,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
 	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
+	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
 	{}
 };
 
-- 
2.43.0

