Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE037A83B
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030494; cv=none; b=dXNyux8fzSqCvpASCzbgpq9lehrUxdVs2q+ILShN9CYkZcvUSO+QGh6JoipufYfp8Jb3q4K35VHCWt1Ftk1NqXXLSsHU1OdZ5OeYPFUomDBNBKEHEW/XJISM3IaCMzHQcN0QVbQe5DtTRTw3R6Zizz0twHM9wEynuIPSv7Xlh9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030494; c=relaxed/simple;
	bh=8mPJP4CUJJxKbPHlRyCtrMLkf2EcQjUHuXUOJ0YbvJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjKFyz3ysFnz5kPA1NE09dKUWjW/6gfWh5m7aQFjI10WRisMly3wo2plKClRtNW/WSk1nmAx7E5tYfH1BJ3Jl3yJhSIHeiy1G8uH6WzlfNHHbbmwEHKQlT6/YU0NJ+QCym2HfXohKnMLJDjkJY4t8R0IpGhqf/ac/aRKCyhrqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDrptby+; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDrptby+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381216921aaso4516119a91.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030493; x=1784635293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCSg76TmTtyL6iisRv3lwPjTYEGjpeBnln7td+bXQKo=;
        b=TDrptby+CSAchs1lbha7LmAe8W4XgcT+sVABBvHRH/POvGPW9U0iB4XXuOwbAwC33O
         g0T8reYT9010uDCshRkgZ7z3CZzQBV1yUs9diBY5YFOA0LpueY4806h415kkEyBpQTH/
         aqF+0Gq/w0ADtvgZ1VcExpT7ibGtEFnaB5kjhUs18LreU+g4D+ll02RTzz9TXfEG1Xw8
         04BSGde+377hA8NtrVkd7FcKpLXVJjC/ii95Y3TkcCjk20/W8Hlzu1ypqEQhpJztm7Pr
         cIrbBkqJ6DA8KljWcrI9zolH5ciB6QZFuIEdcOYMdEy2Ajl1Sdzrxwfff8HUPSkBfMGN
         u6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030493; x=1784635293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCSg76TmTtyL6iisRv3lwPjTYEGjpeBnln7td+bXQKo=;
        b=NUSb91bEudh5hjI0/GKeMbwYXE50R4F4BYzGsOjKY0Q+q9psspQPOdcuMnMoc3Wl1n
         mPN4nNOtSjdae2brhJKJ7fCkd+IuRroRtUALhJzDgOnODhuX3YxxUcv4Wz4CbSZGNQwc
         selHanI7zKgzhFpTx8zw0U+F7qEuOTWTWCINTzEJk/U1Ngkb4tnqjJ4fOlwhAhbdk0cC
         VTsnDh2e+yvlp86X0qGFolWzFEwPpZMBt9f55tX5vW1RAImLIkr+zXUNdg25OYDQ+q+v
         QyMuX420wBi7lBZGZaonXbR1OS/nNThwykv5OBUC2nxnC8VNl0K5NtsJPRG8NCKTBaO6
         SJcw==
X-Forwarded-Encrypted: i=1; AHgh+RqMGRAdfNS4m1pMdE2VHYR9zp9EOtIvy0t8/r+ETd7+C6M0V0wpK5JOKkjj3MziKyNGHMGSC0ExY8RMiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjloXnu9wUvv2IeITUVRetxssdmU954biq6zGRqsej0ns9wYhX
	LblK5wLGtp4e5SPq51kThIa13SEc4r4f0jLZuMLnJ3UlI9rAwIOMytlZ
X-Gm-Gg: AfdE7cleuiKaasVHUH4jfj5znnxnhdJBaK+FN8/+QY8HsEnVA3OpeErHhe1L1UizsS7
	BWiXL/06QHP9opD559+4Bp16481rWLva9BC9GlBpMakpVlltWBFarLooHMtPDE+MmCzxf+OGmQN
	35bg1SGFsENrbGSmuLdbInaLqQ7k+/G1PDnEN1CMA8+061MM7s7wUglXgkot9Ry4Xc5J1e4dBM2
	rltIZ1fOreagSajmNC3SPKiTLn9XgS1geBRh+fOW6D+j5CQGiRPSyeswlMaswhX4m4Yvuffmztl
	rYIMyHB2PJJY24HLu/R6FCgmg1ytKDUW8sCgCQf25Hw/x51zTFVX+yiBsK2On7rvsJCR5ZYB+wu
	oLn48Om7qxSzfmk5Ut3U85EMER/LlLYDzBCPfZanTdUMaJeSKHo94yWw5chyzzQdwiboO8cYl/E
	I1lBr18ypEsM0WS/iBKTD/ahoiLZ3yTNq7XvUdg+51SaUB39Q=
X-Received: by 2002:a17:90b:3e8d:b0:38d:a8be:a592 with SMTP id 98e67ed59e1d1-38e1af127eamr2162753a91.19.1784030492735;
        Tue, 14 Jul 2026 05:01:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: ti: Improve probe error handling
Date: Tue, 14 Jul 2026 19:00:32 +0700
Message-ID: <20260714120042.491712-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series cleans up probe error handling across several TI ASoC
drivers.

The changes fall into two categories:
 1.Replace dev_err() with dev_err_probe() when reporting probe
   failures. This preserves the original error code while suppressing
   unnecessary log messages for deferred probe errors.
 2.Preserve the original error codes returned by helper functions
   instead of converting them to -ENODEV, and remove redundant error
   messages where the helper already reports the failure.

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

 sound/soc/ti/ams-delta.c        |  3 +--
 sound/soc/ti/davinci-evm.c      |  2 +-
 sound/soc/ti/j721e-evm.c        |  7 +++----
 sound/soc/ti/omap-abe-twl6040.c | 14 +++++---------
 sound/soc/ti/omap-dmic.c        |  7 +++----
 sound/soc/ti/omap-hdmi.c        |  6 ++----
 sound/soc/ti/omap-twl4030.c     | 15 ++++++---------
 sound/soc/ti/rx51.c             | 28 ++++++++++++----------------
 8 files changed, 33 insertions(+), 49 deletions(-)

-- 
2.43.0

