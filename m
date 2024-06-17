Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE21946BC
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629062; cv=none; b=tPNKZQRZOnCUqwNqzZVa5mmKCVGMrt8b2+0h22IJGgxH8MvnLxFfiYf+G57fnfuWYZEXJAi3txqtlgK15B8CFXkmHHe789myt1INOuYhcp2MGaRDOC/7lfXbIyk5tkGUHGHKTm1AuinA8qyYIoy3k2F9wAjOXwe135D1mU5Hp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629062; c=relaxed/simple;
	bh=/lItPURxNp+cgV/Wgl9KGudHbV4MInxrsKfiHjZnra4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FC2GrkMtyI3PnsbLr9+Nyvp3iX0dcoEM9dcY6232QRSW/ViXo8/mSi/ybqNZMaHYbpT4rb1TF1497rxkvCjJ5vX4XPDgE93EpGjjmmdg8t+MzPVEMz/Lup26tfdde4hBCjAcrUpl19hJD45UXic29PTTpTgfs/HK0FpoYQuqfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Na8Rj+XA; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Na8Rj+XA"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c5c51cb89so5088860a12.2
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 05:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629059; x=1719233859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wltUW9+VLrM5U01BwAIqP+6lmMQklBsMXf/514OJe+Q=;
        b=Na8Rj+XA9A1FyHf7bd3U5PxdL/L4CQHc/XUo5tfGGPedwl2nCpfd8K4/uEsqmqP+FB
         s7CHVIz1CgqTYN88ARzgC4Tu8oWVH3O1ejWSuUDIldGl6FZuTXCI2hTgvU6pwwcUBYvq
         szKAuSWVxUFI0v5I4JZ1iKkYLjpLHylZWXdmG6aSlcFOvxaXri0vcGqQ2+rsLjJKCgz5
         TYQfr3bPHeZgjywKH7B09WXsCo6vtinXWPovOzwA/WCQnJSiG7RGZHFwEWQ3WR0UBED0
         m0jIGN/B81b9wyyJvAavXgYVW1BpYe5jcrRCMPz7uzopIJWqrzI1aua/i1xJhMA694OE
         Zwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629059; x=1719233859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wltUW9+VLrM5U01BwAIqP+6lmMQklBsMXf/514OJe+Q=;
        b=mwIcw72RWnAJUXK6o41J1r9N8zecunUt4/PuKZ+gCpYlTY8RzXGojvsdTm1RaBKL3Y
         TcpflmijpdLujHUSxcmMx0Am4H6BDCEmeo/c69NrNDreTs1w1h2iPdUNGxTy2SwT6LYW
         EhDoVWp7dcl6qFyySR/gyH/lwO7I9IGkjk6iZMRF09DpYi/d+py/K6QIawb4P4nm17y/
         l2rbLxXHFIqVO1FEFISeQrGwIkgzA9DhFwdjlt0/Z+I92bF887YD4mHDNZaPg0DXWUNq
         56bDP+tnHbcDKlq7I4pN031lU4pd32KFZVoCVXP/kZyq+5cHAsAmazmKW3CqwcdtC2QH
         dWQA==
X-Forwarded-Encrypted: i=1; AJvYcCUnenlDIv4NifVx6oqRKze1b6tqUgVXaGyQ/V81J97/orM8ja/ZqGU6yrPeuCHpGR9gnQek5FIyhqW6jnTWveVkzoUmdLwR75q+ekY=
X-Gm-Message-State: AOJu0Yy3Qzokg6p+6mi92KJp0njKHwCUBXa3VOS5r/HDAXtU+b41NWqk
	RGifQKoIho06k4UbDtH5Kis7taZPll/ME2+/FeLmoGCqQ8E5ghPyABvFYeQn0+o=
X-Google-Smtp-Source: AGHT+IHGYIv40eueTM2EmQXXq34NC5RI+q9LQWXTkgQPpugKqiNuOI0eJtyNgnoQfTPALXvl5fhCJg==
X-Received: by 2002:a05:6402:5204:b0:57c:db99:a131 with SMTP id 4fb4d7f45d1cf-57cdb99a240mr4397657a12.29.1718629058691;
        Mon, 17 Jun 2024 05:57:38 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7439070sm6428860a12.85.2024.06.17.05.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:57:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] ASoC: soc-dai.h: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 14:57:34 +0200
Message-ID: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core ASoC code does not modify contents of the
'auto_selectable_formats' array passed in 'struct snd_soc_dai_ops', so
make it const for code safety.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Rb tag
---
 include/sound/soc-dai.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 15ef268c9845..279223c4ef5e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -361,7 +361,7 @@ struct snd_soc_dai_ops {
 	 * see
 	 *	snd_soc_dai_get_fmt()
 	 */
-	u64 *auto_selectable_formats;
+	const u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
 	/* probe ordering - for components with runtime dependencies */
-- 
2.43.0

