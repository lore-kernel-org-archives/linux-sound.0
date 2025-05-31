Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AAF1624DF
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748707205; cv=none; b=Jtd/07UtRvjmjKf2EtEjHe2ppDkAwFUA3F2OHWSSyv91wtwklGVWkZ6b95JZgdZ9FtGU9tG5Fw7oDn3/4YtL33VKcM7d0bhP74SdY1uBpYSxBU5oy102j4NThYk1ozpNxFXWlkj/wZgmTZQQ8yKiewN3ACmw6uygsblES2UAiRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748707205; c=relaxed/simple;
	bh=hfuAqi0lelQWkZX6/fPYy9nuFo6zIHK36dI9WQUMvMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KSKY5e2vUDcmz53QUlH4Nst4uT5e60/DsF8fq8uqzv4I4+clwrOtAGS3BhQPXNTt4kMGh175/fxhyQv7QK3N9vFPHYK/n/jjWPqHV3bU1TuyeEXzK5maolXFiB4rfPyDp4FZs7l9FY3uYoLxvh+z8CwT5+hcUI1KsdNtH7kJYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpEJJfYJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpEJJfYJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so784225e9.3
        for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748707202; x=1749312002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3/7b7sAur+LGqclPpSqvB9KECRV68HTQpr4XmjRfR0=;
        b=DpEJJfYJxkIsSHzTisW8US2gSEv4zl7ma3sew+1sk28zBycACq7fjkdL3FecfLlcmO
         shFSOEqOLa5e18o9ODrHjXW2QIrs214aF0eS9EXAcZfyNppiLfvhESsqnEFQRruWfTOr
         UX9Wam2xRrZSLpTY8FvZbFKsk9dWdNxkInK+vWbI0OVXT2h5xiaBCJ3wX3QzrhZM6ouy
         etiPLkcJv3CB0no9I7L9P7Gxyq9vMXRwx5vf33f0Ow7Ryn3hl2vrh/g84Ue96fGSjebu
         uzL5P3xKdjf/Wpr5X2/1j865o7YEWm0lXqmh2N2iQrlfgYRYQHvh+LdRc8dp40Mru+l/
         Lgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748707202; x=1749312002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3/7b7sAur+LGqclPpSqvB9KECRV68HTQpr4XmjRfR0=;
        b=vmI5DMj2K5ezeURkrA5sv1t8Q2T+ol6YLPiNW+BbGPcc45LJF3xW715/s14T+PivTA
         2b6SzoXsDTFwnOJVzUWVwERbDUxYwnID2/oh7xinYA91gq7J0CWW9CV5pReAYgrdbnmr
         fwO0itgzM0HgJdHmrLd0qubnlZyElGCYOdK6/UProyKtc5M4CQ15tUnEkbxLBhhBwvNi
         0DJPwKL9s5E6myogWaZcFRiwOUJc1r1j7a36O03KsGsS4PLZ2XrJDVAASxqpZYbZDqlJ
         QvuyQqM8QVlL46IecSVwdQduAKuk4b+F7m+dz1LPJE9TxVAm7+U3barccCKZpJY3il52
         Tf3g==
X-Forwarded-Encrypted: i=1; AJvYcCUgC6i+lnFCioYotBH0dZy9c+cCOa3Mf1VIBaqFV+UxiSfu4WZUpDPHgCjirDzb8Kw3d9rZwBT2B7BjtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5WwI5QybAvQJnRVAv+Faphc+mpl70byXuXNDSiwcz6JCURkG
	0q+nGLmuoMADvR2hEl5TfPODXEoQdzJZRQdalNuOj+1kyPMtsG7IMZc=
X-Gm-Gg: ASbGncvRlBCmo90iM7lVb3NycniAbQvMvHf3F575Nn3bnlQl9JSW3/Thq3U5DEXp8zW
	syHfQwzc77PQmrBmRuZdj3rCd3QkZ89FJMGastX4FYkrg5Xh1L6wpvHeScJ27uOzihZF5y4hH/d
	K1YZMbMmnsjZTharOgTgBqp5C5iKthkfaCW9QBAxqnT42X7XaEfghhjc9qW3nBL2AqPQRc7WTOE
	+OY57JWmRLa3l3LvPw/K3aTFkvvdqEj3vi5kCHz34hDbHi0Im7c2oyR/q6XIh/0pQKqZ70cPTz3
	6GccB7J1Ms3m3cYDqL2PSOPWGj1WvWe9DGKzElEZd6A5HmY2LEVVi7fBuS7deX9SUmeagL7KuOo
	ddvPljG+RO2LZltfWtBdwOQ97Tg==
X-Google-Smtp-Source: AGHT+IG24VPqGTUlEu40NhO7aglqx2+Gnxxp+tCh5n+1wu6jubU6cE/Nh3inPKaAhC8Cjn9YWQ924Q==
X-Received: by 2002:a05:600c:358e:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-450d6543c86mr24150645e9.4.1748707201605;
        Sat, 31 May 2025 09:00:01 -0700 (PDT)
Received: from localhost (131.red-80-39-31.staticip.rima-tde.net. [80.39.31.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb0467sm53630305e9.19.2025.05.31.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 09:00:01 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	SOUND ML <linux-sound@vger.kernel.org>,
	MEDIATEK ML <linux-mediatek@lists.infradead.org>
Subject: [PATCH] ASoC: mt6660: delete MODULE_VERSION
Date: Sat, 31 May 2025 17:59:49 +0200
Message-ID: <20250531155950.101164-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: SOUND ML <linux-sound@vger.kernel.org>
Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
---
 sound/soc/codecs/mt6660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index d16bccebae52..9415656f8285 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -578,4 +578,3 @@ module_i2c_driver(mt6660_i2c_driver);
 MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
 MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0.8_G");
-- 
2.49.0
