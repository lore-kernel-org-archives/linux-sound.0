Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE7331A57
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198368; cv=none; b=nBfSePsS1i5Ey4JtvTdEoRlh8iKgugivg9j2UTDLbui9Z2xijbeQjJKMO2Z8Trcq5sleNTJof4Q5Hqa35GZ6xYjbcrhCZyheDFoxx5BNlCqcawlvhDWvorm7pA3hUBVm9z3xTMqcSyhaczUPgjWhzaBEYNtPVztdN98VqN5keLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198368; c=relaxed/simple;
	bh=HWp+w3zWLT/STA8qJtRJUsPudz8/gv6NAGmdGdKJKRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnbX2mMGex488/7Meapq+7DqeUopuOUgMujbzzNakeS0F6IQ4TFH6Fv3c+pD7ZVZbaMD3rJSO+wVFgbHT4YRN+eJFSWbiHqvbvmgpdUizQRT98N0SDB/m0lZM1OjVJywwwUrZyt3h7fFP4kKqUrjEmc66WZ6sRPZZ7gnprC1aOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNtFc9BU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNtFc9BU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a2c90e383so89213b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198367; x=1784803167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nTjXyXh6ilqWafAhwi9/ETtAnvPu6wZfnYV8+FiwGAE=;
        b=JNtFc9BUsuOkgsF85Ojus+GdIDCEulWB3CMbEgbqXDtkNiizqWZvGItzuhOLxxqTY4
         s7olNUigBSMtYzClZywB1p2asNYcK71Sko/YBZOOG5/weN7nnqH/SDfoTr9MIP/qMWJH
         HOL/nPrz5jmWnT8Wf7vlGxjClajrZYDrUZXJdRLBbPDgfQs5JxyPqDVrpPOzMSyUyOKI
         wh4o6d1693geAsRiF5Dh9McWIDdHOkBmbB31WZQ0Z8cQ6cwfkWuXnUKasuJJHQYTiSE7
         xblhSDy8vj/1OLGq1dNJpYOCkTKyHtNKyDMkCICWpzgKH/S7d2Ky6l263s5mx8qho4Y9
         pEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198367; x=1784803167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTjXyXh6ilqWafAhwi9/ETtAnvPu6wZfnYV8+FiwGAE=;
        b=Z+8Zt1+3g9bmTq4AFbaqltlAwlhP9FWbfH5YPkwMOlTjw86qnIM+1NfF1nOegMS9UI
         gKL06RdHLrcZVF7xgNCNuK09le29+bcg7uEaQAAu3TNeHGxKwvIIIT4ghYR0GhK/X5DI
         QQ5eJGzq9xS4i3fkM9/yGvYOPgIkeSADktcwrXHU3e3zkCeN3TKrwDOpjchu3Nd8ZLg9
         GeD2VZIgdTvgL6eV7A+DJtZJeQ+1OlwSuK5C1ncJpZP9uE19Yy8uYWS1kPu8K/20cp7H
         2wsGer+ySJFRm63DF4/V43fPMmHSo2TgZWGT7o///TvfWQf4dVo8w+XhUSO3qqbA3F1f
         pPAg==
X-Forwarded-Encrypted: i=1; AHgh+RpYW7kdLnFIe1BSunDA+Y9Kk8Pb0m+BHMxvTyxNT9ZQVQk5ZyIOjUe/biJcmwCYp9Etvn7ukIYxP6BOiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTpH+I8nAchYy0J/cRPtDTniPQiRKgIleO7sCfvZVNRodIqyvp
	tdMy++8bZmQNf3z5fx7VXS8Rhh0rdf4XfCGdIHM51EQ3+WgfXXch3dmP
X-Gm-Gg: AfdE7cnnE/Ac0rJuGtD52gavcGc3EnpipeVqsTPK70yHnw/xjD/XqYSS1R1g6HXWKj8
	ZQOPoESdtWFk6aDsnoxTvZTKOdGwHvSBTyGVOUHRolSQjW2kjHkJ8AFuJ7HerbEN9wPiU4AmS5f
	Sq5WXOXlc0PLgBXZ1EnYqhAZOHszsOq6zetMDfR2nRv37GPstBx4VVl/JXeMO7xESWAOpMTIWLB
	31BCjW0ATilYQca5s39FixoQhieQReZw9NIoVrxipIDitvJpVggSJ7y95+xMYZs198qczlAoY75
	gzzMGSsAwiLe9B5hW3wZPQn8RCATbHfl8yrfK6ecM6MUZifpMkB5dvr41Prp0KRCWDLeABnEZf6
	kxssKHORkkeY3XX1GKgLMubhWEM9DryE9kEFC33yl99g8d15n8N/f0NPkBwS0LqQaGn+CH/XQdF
	ttUkSdr1xhFuFtV6LEpyhPoyXhdZbvRc65Bh79
X-Received: by 2002:a05:6a00:f0f:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-84beb18b699mr1948890b3a.14.1784198367073;
        Thu, 16 Jul 2026 03:39:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/10] ASoC: ti: Improve probe error handling
Date: Thu, 16 Jul 2026 17:39:01 +0700
Message-ID: <20260716103911.77652-1-phucduc.bui@gmail.com>
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

This series cleans up probe error handling across several TI ASoC
drivers.

The changes fall into two categories:
 1.Replace dev_err() with dev_err_probe() when reporting probe
   failures. This preserves the original error code while suppressing
   unnecessary log messages for deferred probe errors.
 2.Preserve the original error codes returned by helper functions
   instead of converting them to -ENODEV, and remove redundant error
   messages where the helper already reports the failure.

Build-tested only.

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).
 - Remove an extra blank line (Christophe).
Changes in v3:
 - Add the remaining missing parentheses to `snd_soc_register_card()` 
   (Cezary).

Best regards,
Phuc

bui duc phuc (10):
  ASoC: ti: ams-delta: Use dev_err_probe() for error handling
  ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
  ASoC: ti: j721e-evm: Return the original error from card name parsing
  ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
  ASoC: ti: omap-abe-twl6040: Use dev_err_probe() for error handling
  ASoC: ti: omap-dmic: Use dev_err_probe() for error handling
  ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
  ASoC: ti: omap-twl4030: Return the original error code
  ASoC: ti: omap-twl4030: Use dev_err_probe() for error handling
  ASoC: ti: rx51: Use dev_err_probe() for error handling

 sound/soc/ti/ams-delta.c        |  4 ++--
 sound/soc/ti/davinci-evm.c      |  3 +--
 sound/soc/ti/j721e-evm.c        |  7 +++----
 sound/soc/ti/omap-abe-twl6040.c | 15 ++++++---------
 sound/soc/ti/omap-dmic.c        |  7 +++----
 sound/soc/ti/omap-hdmi.c        |  6 ++----
 sound/soc/ti/omap-twl4030.c     | 15 ++++++---------
 sound/soc/ti/rx51.c             | 28 ++++++++++++----------------
 8 files changed, 35 insertions(+), 50 deletions(-)

-- 
2.43.0

