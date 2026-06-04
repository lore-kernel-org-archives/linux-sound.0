Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10AD222590
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544169; cv=none; b=cCs9sTmqC73Ri0U2BQbdEvh5MoNC057QB3EfdsmUMTVhdPWzAO+Q6aT2oyfTalvgzgn1BjgaD8dSNi78jXw6liegaGeXH9dnHYvvYDmhKSHKFQJmt8rpq06thGSNSY+0cy6Q9si4CmbiFVrpDJc622cOBs4m3A6dfPfekUZjtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544169; c=relaxed/simple;
	bh=Gg05KyqMv2wJ0W2xaRPpEld/ZyF+JAuCF5mHqDhqo4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9B+TwPw8+yYXk6nP4X6cf8Wo3/peep/igH+4KDv4f0w2/H5trmfX6TJgWDPovJ/QXN3NLFxaEnP9CLgqlKBqQCPO/+VG0+uyPNmf1xufL6xtQP6TfJQ7jFxmHq6PIQ8nHtjR0LNEK2XnvXuUd4xEirzM1B/DTQs5Ya/2EGP82c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN8UTXjM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN8UTXjM"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8571db044eso149471a12.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 20:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544168; x=1781148968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4sGy0akI76XbwNYB58aYQ6sLn7Il/NliKwIUEuxnuMI=;
        b=VN8UTXjMe6KQ6npQMXu1oGxpzcC7WOlZk+bWuFSk2wVdOrCYlHlLMuZxgDF7WQ5SBQ
         01/3d2WjtuU4BH/ZIwnjn/y8rBzwdwFzf+aw91gskC5S5CN26LMIWmW4LwEztxahxiHj
         +d6in2OvwlRSt4bHMLsdfmrlgK2GiDlzC1M1UTNcVZ/tLhQ76UrgpoYmZB0VL/djn9KU
         ddYjnzphBYIWnBbSgJxqhDb+uMsOYJnuh7dzJc29INYWpZF1BHq6UqxI5EsTBjRJqhQj
         ajhofcRIhg0EEO984EM1j7FIf4aljH79xRu4SO+23atF95dbbIPlUI2uS8LM98TbDlDf
         osaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544168; x=1781148968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sGy0akI76XbwNYB58aYQ6sLn7Il/NliKwIUEuxnuMI=;
        b=mOESkBGAyy6VnCUbfbSW/gZzDWhsbqeZYc6ZtITg04C7BjxquA4++sY29KsZPxQV8O
         nNzGSUr+XcZJe7ppaa2e2Q3+h+TX7UMpyvVgg5RtDlaKpUreWYhR7ObmLq27XXV8Xw/t
         DoBGQouIXgNtbGJMGyIJGtXTsbZf7Vk5h6kzHdC1v4hW7NMLAUYJuSNpILXSDdcPXCnV
         iiO0HeEku3bAIo/HHfasjlEI2VQIkNHHXFKwa2t2t8zNYhS/15J8EvWLuwCxF1R2XKt3
         QM3t7xJgY3FuqZkaxjjUCGP2npiy1VTlYIQvYR4kJR6j2iYvLhSM/8fIm+yZR6d2WkPd
         TQFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8d9hV2uSSxTicC2ysEW8Dzrd8Gep7etHW2y70XEokZZ2oHMexDL5TxBA7JOmCSwZKvmP4ArkGrUvjFCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbt9+RPmlCqmY7r24iPBJ0TQWXFhw7ODBel3eU/Vi44Y23mdr
	LL7RkzzGsaOH8iIP5eAGpGpRCmRnlVoFt8w2/B2YndSN5fxJIy/NNTvw
X-Gm-Gg: Acq92OE/HLC8jVxA9mG4sT7/Q2G938w2Rnwo9MmXGTgzPXS029dl9fG9A1aiSRp1D3J
	I7mxF9Y2k5um/nbuTSy/04aHt8bgfcXCpHdBHnUBn+WJqhm96CXp6DWIHf09Fg2HJV5W50Sd1OV
	WjzFqNdvn0Fasb6q+JnxFKxq+Ebjz4EoQrkbaAwjHrt5LIVXRULKyuKHl92xIfC1MGityhYZUDa
	4Bkm/kyRIFoG7c700yHZSeSGOrLSig8EdEL37VVWrXJN2WwTcjAAPFt9qnmlA/yUmVrxQGq6/uH
	2/okVv6bF35MnZaLCetdbg0nea5ANIs7iJP63zcTHQHLXYdPg0HJ0fKKrgt+++gm7K72t2tW13e
	vV2GNyf2Lj5j8+A8YV6958JgXvQizyMUmT/XQ5JqY4upwtMG7Th5jMd7umRtyRjKUVcmYg5U0Mg
	SAPqenKFMbZZnPL0ydufEYyLro5Faq+mgQBmQSTMIGKym/spdNVuuSgPYy/4hf3BiieoW1
X-Received: by 2002:a05:6a00:b603:b0:842:6419:3ed2 with SMTP id d2e1a72fcca58-84284f2c206mr6902399b3a.33.1780544167919;
        Wed, 03 Jun 2026 20:36:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm5539745b3a.11.2026.06.03.20.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:36:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Thu,  4 Jun 2026 10:35:50 +0700
Message-ID: <20260604033554.96996-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts spinlock handling in the Rockchip sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

Changes in v2:
 - Remove the unnecessary err_pm_put label in rockchip_sai_hw_params().

Compile tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
  ASoC: rockchip: i2s-tdm: Use guard() for spin locks
  ASoC: rockchip: rockchip_sai: Use guard() for spin locks

 sound/soc/rockchip/rockchip_i2s.c     | 160 ++++++++--------
 sound/soc/rockchip/rockchip_i2s_tdm.c |   8 +-
 sound/soc/rockchip/rockchip_sai.c     | 262 +++++++++++++-------------
 3 files changed, 211 insertions(+), 219 deletions(-)

-- 
2.43.0

