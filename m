Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C263A0
	for <linux-sound@vger.kernel.org>; Mon, 22 Jan 2024 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705904504; cv=none; b=mYDFImTIU41wNlmvot3P2GqlexNnmJoIclIqZheNFwEXwhlJZ/6LRjzkxlOpCjhPG9xnkTZ2Y+czo9llJ9voQSjRW4mkwkPfyuPgM4Ijlh8x3cT4j6yGKtC9Hq2iDz56REIE39A2UAbC6E0pBylVMaoGNrExZZdSX9VJWtapn8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705904504; c=relaxed/simple;
	bh=z0DhQ74I23LpCzfNU90saOifU6ICU81Zx1v2ffbAwbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVaQNJe4fbtYz5huwF4L77AXyV4vGcqBQtxO6ekJSelw8yvmi0pmIAOCasqwRICf5eWz4ZfQGVS99aZnLotQga/ekOKvbTWAQzzuctpbr1NkPvCm6KOKkTNJSImktJn3kcEPS068wFaZxjwz3UHfDIt+lDwgTFHjXmJQAdF/d6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZlZ7zrgO; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZlZ7zrgO"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5955a4a9b23so1744763eaf.1
        for <linux-sound@vger.kernel.org>; Sun, 21 Jan 2024 22:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705904502; x=1706509302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWX+6Hx9DA0gw8Icz4XnPpdw7Tg6JqdCSrJaZKV5w2Y=;
        b=ZlZ7zrgOI8/PrpfBaEdQLH4C6LO9YgQoX5/jLx1ihNjdu4BcjRoMbXIPOmGeaMms2n
         TQ9oIc4slew3xqZe1HsfNGQNHqJlqyaFwM9wfD77yauk0wJj81CtRgt+i4JjCih4bqH7
         HCBFu/ySnlnroXv/fmFTdSGKZLpwFxW+t4lig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705904502; x=1706509302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWX+6Hx9DA0gw8Icz4XnPpdw7Tg6JqdCSrJaZKV5w2Y=;
        b=EV2P/HCIVXPivizSHgEoianACZrtxWzqJvPil83oz+cFBD6dgLTrOu0yf+STEcrgMU
         PEasI28aiBr3GKBal6GXzJTTng5dJ2IFqJrrEZegs1sxFaSfoGrgKx5zmgg+ii3DllLD
         JF/Dcopl29DUS6jSCnm0kA6o6B2KW8Bl50RhhY1xr5SvstYAZ/7Ist1S6I0WMpoU28Q6
         boGoMd/Lx0itajYZFvIiKTDolSRCq1xmTjCpJHjnJALEXlIjujoZwmniHStP54v/xHFn
         uRep/7GzIOwMHWOzoCTW2UbdE2MwPTjT32X9KLAu1DWjRU52WflD7r00odEN4H6OtZhq
         egSA==
X-Gm-Message-State: AOJu0YzIHep3JWIOph03MaIiWiAhMu8TZqexdjDUOqxRumK6SEA+9eQh
	v6oLK/E++x9/2wlKn5DT3T1ARLzl8bYWgJvuGYEJ9MvWjvCouPqS+/adgTlVJw==
X-Google-Smtp-Source: AGHT+IELmfF3o5DTiZfbSeuQZLzrFVr9vWKEU2iVV2tyv9Tduic2C8Fuiy6w8NEZen4LQJ1OzIoHyQ==
X-Received: by 2002:a05:6358:d181:b0:175:76bd:2c36 with SMTP id ka1-20020a056358d18100b0017576bd2c36mr1697587rwb.37.1705904502499;
        Sun, 21 Jan 2024 22:21:42 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:f43c:6707:f29f:6787])
        by smtp.gmail.com with ESMTPSA id b7-20020aa78107000000b006dbd9501028sm1984401pfi.92.2024.01.21.22.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 22:21:42 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Alexey Firago <a.firago@yadro.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: codecs: ES8326: Remove executable bit
Date: Mon, 22 Jan 2024 14:20:27 +0800
Message-ID: <20240122062055.1673597-1-fshao@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the executable bit that was unintentionally turned on.

Fixes: ee09084fbf9f ("ASoC: codecs: ES8326: Add chip version flag")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 sound/soc/codecs/es8326.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 sound/soc/codecs/es8326.c

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
old mode 100755
new mode 100644
-- 
2.43.0.429.g432eaa2c6b-goog

