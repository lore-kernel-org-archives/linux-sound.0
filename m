Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527743FDBF8
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524731; cv=none; b=ASmUaN3pnBsMNQbOT7ReeSc6gH1eInaZywyEtgdL71Zi+dOPKywCtj7/cZwu3WS5EuQhz8WvrkMkF4p+XR2kvQjIZWTeTKQlBRNSzPwUZSfwwu6ir68gVIGsuYJdkjkZdbneW6Am9inohT3S+6S0Hsb75PpyxPEQ5f5/aswYPBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524731; c=relaxed/simple;
	bh=hDT6SsWVXv051drBBLQfL1AKF73QYG6UGvdLTEQdEpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hSLQ5gK8kS+fKz3bwIvMBnODoMnL3G3Gd+mkrHcIzfTv53cBwvVjZM8n/KAusfvitL0e+wfd7ysgXrzwpPhKjL4ZLOklxCqlBe5117sfPc2Ae1YNEfYq7KtdvH4FQVHlIAWuEYCAgw82EKQ8Zj232hptKWmEoIebopNHXBwTQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9baS7tM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9baS7tM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso619960a91.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524729; x=1787129529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVscmLxxxkjHHqv8gqJE8+q16IwQqZ3TyerfRT+WpMs=;
        b=k9baS7tMvtC5m+gd0ybNbv7omrLI6cK8VasEKZRSfblOgA96/TxQvCu86QbecufRtp
         CBF/AvIbCBgu/Rx515NuTxYx8vTgkbV5RJJHi26R3dYVkN3EGIsLyZiLEjnrKItS2GFX
         O0S/qjV8Dejz4Uj6coKKkzgC/ixuTen7Y8HAeSYBrAOKUpAcjnglcpXSxcz7zqXdH9xV
         XBrQpTPcQUnQDN1hKl0+fav+9xLLANfSUJBsaEK4W0EDlLjgub1ylstatENh9m6VY0Po
         xvQtLbRvc+yryh4McgJRV3cRrV2WgvXdZYIGioC2yXix6qJ1UQcSY3+Q9WFGi5GNENaT
         U3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524729; x=1787129529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVscmLxxxkjHHqv8gqJE8+q16IwQqZ3TyerfRT+WpMs=;
        b=WS1GE0kU6vbCowJ/UoGkvQUyMhswvcVu44HW+He+EwKkv7N0zdN4w8KOAyJ+O1TtGo
         MXwmXQl35IbIreEZfragayPqSUPu2f/Hc7S/RkSUssGxJyv/UD+3Ru6yYe09K/DYZ7OE
         2C3ZpSr1JUYqOACOssM92ICIWxRH0eV3bK1c+hSYs1PqenyXKASfGq+x2sHSEj7SJh1B
         dkznJyuLw1v2ZlsFz3juz/9WfeAmRsaiCqzX1S/dMW8cGQsSMXhdPrpHcOTl86c/NNrd
         Q4XyEmSl2CpLsFcdPf1l2L8xX9QADPQjtnr+RMtiFPMVO6UnNYMY2hSdWTUoivCxtV+E
         RDaA==
X-Gm-Message-State: AOJu0Yx8K/KJfnkTDegh+71XYdp74CUs3ilB4uy3IB86+VzSfjBRSmD4
	ISytjsMWe6MhNmfI2lcCwXDSj9H8KAqdT1iKR3tVW8haniV1Yq4NEQmK
X-Gm-Gg: AR+sD13l4wr5eNy4Lq0kEzsRvgdzB/lRRlf3RitYSOt7C8kcnYU0Pp7ZN7M0Nf7bfh2
	A+tj1eyU2fEMC46NxXROU66sAeYfeIxlfR7+eQoc9LHUKBqW0HpXXb53Vg5+3TkzTovH7vMAZkm
	Ifk5FXaV5mlXWCZddNtUBCZxsdquNzbfiP6yNFXuJtCr4zacuhm4EDuRiA9SHg7DGX8hmquKsLa
	liMRL/SKVoiR8P3dNn3ZN3793TOaMfHSczITyBDH57ZeD+VtOYRq0B2Wu3eSRJ2Wgo533KHf4AL
	mGQTWpLkP2i+te9ivz26ZKyIBmRdWjd00zLSBtWbtZYLGQ+usIxF+4D97XV9ldKED9boXoH7gGf
	psvJdAT+9Db+X6dINxPkRbIjl/KbMPhmgh4dKXXc1DGalwKQhaGKWKY7/6z6RLHt8Ve5jeWqwIK
	uuuFX8saWy/UCGzhcssgd/7qBig7fVhyAb6sokzZPdTWo1ibknChVg5Qn9pMCZ7wvLcvbp/RA7Q
	Gc2ByNp4EVGYC1spU7AczBV1H6GRVio3OurEFTY9JTxQyV4CcG0VWTDvhjifgqZWVoXHjWtT6Xj
	kdgJ
X-Received: by 2002:a17:90b:5623:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39301457de9mr3598662a91.7.1786524729581;
        Wed, 12 Aug 2026 01:52:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: samsung: Improve probe error handling
Date: Wed, 12 Aug 2026 15:51:27 +0700
Message-ID: <20260812085133.29658-1-phucduc.bui@gmail.com>
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

This series improves probe error handling in several Samsung ASoC
drivers.

Preserve the original error code from gpiod_to_irq() and use
dev_err_probe() where appropriate. Also remove redundant probe error
messages where the called functions already report the error.

Compile-tested only.

Changes in v2:
 - Add Cezary Rojewski's Reviewed-by tag.
 - Update the commit message.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
  ASoC: samsung: aries_wm8994: Drop redundant probe error messages
  ASoC: samsung: pcm: Use dev_err_probe() for error handling
  ASoC: samsung: pcm: Drop redundant probe error messages
  ASoC: samsung: spdif: Drop redundant probe error messages
  ASoC: samsung: tm2_wm5110: Drop redundant probe error messages

 sound/soc/samsung/aries_wm8994.c | 14 ++++----------
 sound/soc/samsung/pcm.c          | 19 +++++++------------
 sound/soc/samsung/spdif.c        |  8 ++------
 sound/soc/samsung/tm2_wm5110.c   | 12 +++---------
 4 files changed, 16 insertions(+), 37 deletions(-)

-- 
2.43.0

