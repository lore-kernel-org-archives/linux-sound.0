Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5632F770
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473030; cv=none; b=kdqQAR70GgbN66MKMiYAh9WUib360lKyvq2D7wzN9MC4sVkOQ4eFedrD5/I1mIVu+lcVZd4lUuzr16o13IS8aBTo3zWhRt4jsVp+IY5JISMEHkdMt9RVdF4bNMOxChzy2AlHinCfr8yzREgVdvvgs3osRwuMVYjpK6QvdgtuZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473030; c=relaxed/simple;
	bh=VyqP3VZAgWnhFWjdVVIX1d9v+tPYWsig76HGQUp/BqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2MXFOR9JgT4akcdWKM/geJoWQZlnRUTk7chgUidfqqfF4C9SjLQLbgUgegOSaYVjgXaHf4l7cSUkUIWyLrjc7OosUp5uZxJ2oqC3d4gRM0FUIuUJFm0bQgC+UyDHxZLr/5sO2v0EpI7WgY8HIiUQeHr+dsg5QoV4+IvOGYB9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUp/f3AQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUp/f3AQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso3147635e9.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 14:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774473027; x=1775077827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utrOkm1DkfYRDWYA2jLBm/PwG2f7DUWrCUOpPOfXwvQ=;
        b=GUp/f3AQn3fjR0Cau+i284YCpc/K753oVq9aC7PZKpjXcP5vJbHya2Zcq6Dw756uSc
         HSAMvFvJqzDCLb/RZxEz/Er681TnvkxUCT45swbw2Xb413j5Y4VrcbVI7wzSq+DiaTTe
         tEZ8I1qJzOSoKCb+oxOtju9838i6RObrDsc3SM+pyRUs6wtBiUplMtisy5fkKWac+vS+
         JFUoXA/apKaWEFK99X2hLcpFeJbQ1XLhx1OYQiunZvU5+huPHGBevB16gNxQjXaG6Ubt
         c36eQhExGWmF9XEwtBQzyaQv4yGkXZy84R4eM+jZL1ktztoGtXQnqraehkTLdgBvcF75
         P+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473027; x=1775077827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utrOkm1DkfYRDWYA2jLBm/PwG2f7DUWrCUOpPOfXwvQ=;
        b=egUNZTddTZvat7635cVjXa3N9Su9ITos4eGuezo7VSLcMY2AMGX5CptZD5yOQTmqdE
         4aXjdl3eZ+/tmlfLanpd5fqeLhgM7bZvEeArcXKqzahdXhCVgroTDEOKV1dcc6lhczw7
         Mu/11QbAfdBkLvQJKlwVFogeWsH8Za7YD56RIZH+hkIWp3IJlFrjY+0gnB57N1AYHc1h
         +kMIKOMWlYAyH/m9kUjkARQfJoPJqS5vXoXXRRyOCzreYv2ttUzMNwXsjkQj48u+oj4m
         a8VZ1t2buskk+NAL0EQdGiNU5F7tiRP0Vmd0g9iAoNDH3ioSkevqSpTxZlaPXCgP8b8c
         0TmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx+RUVQzyIsQtfKZWf03RucUZ6fI61ybnh4MXiqs45Zg74G77b5LmHOFAA8XhenPr3JXKwmh355zUR9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiV/tMV2ue0mVBBuVdoz1Bw5N56bZxoM2yuJruCfEyu3BlTGeB
	B2ndzoEDcD+G5qJkiCKYH9TuCE4p20WNjut1GbJV5Dxo30FfN+aY4J8=
X-Gm-Gg: ATEYQzy2ngtqBdKxBp5dggr5aE+LDeKipPcizOe4pDr3zIaYO+qhJKbhY2mbf6bsTx2
	iFzoTWjdBE3ttedH5xtHsWc9CCNsF++2HsyjTPD34Lj5QKm51PuYOvPdZgaJNgFOzwwJySxzZ1x
	Bx0IQPYjwpqY10I2cPZYkz/5Ysd0dSHwqEumCQjjMSrcwSPz6TI+siMkDdl/fcNdfcbJIDKT3N0
	JhXDiAW8d78gQvcR65x4SHXmyXmOAs5Jk+Xgcoe1bGeNqp+WwcuhHtjOWUedszRcl+vaxmdArXX
	f0GUbANeZ54Mb1uuxe4SEqTdrkcFscsSDVndmIo8ZmZL4HpvhnKDXgMUdX4cfH3WPpPaqDhVO/7
	okeGfEXPPW7TDBCps3HEmNrRD6ZZnDKOdwNyU/HLLIQKaIUZ/wfVtmxP52Tf8pkYB3gNolXGoPt
	cQeNulKUHBv9dtMwihCyekgdOJT4ZYywNR9cirBzkZ9w==
X-Received: by 2002:a05:600c:a0a:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4871605ce9fmr78661065e9.22.1774473027464;
        Wed, 25 Mar 2026 14:10:27 -0700 (PDT)
Received: from localhost.localdomain ([78.241.70.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb336c3sm11673765e9.2.2026.03.25.14.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:10:27 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: lars@metafoo.de,
	nuno.sa@analog.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v2 0/2] ASoC: adau1372: Fix error handling in adau1372_set_power()
Date: Wed, 25 Mar 2026 22:07:02 +0100
Message-ID: <20260325210704.76847-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adau1372_set_power() had two related error handling issues in its enable
path: clk_prepare_enable() was called but its return value discarded, and
adau1372_enable_pll() was a void function that silently swallowed lock
failures, leaving mclk enabled and adau1372->enabled set to true despite
the device being in a broken state.

Patch 1 fixes the unchecked clk_prepare_enable() by making
adau1372_set_power() return int and propagating the error.

Patch 2 converts adau1372_enable_pll() to return int and adds a full
unwind in adau1372_set_power() if PLL lock fails, reversing the regcache,
GPIO power-down, and clock state.

Changes in v2:
- [1/2]: No changes.
- [2/2]: Also unwind regcache and GPIO power-down state on PLL lock
  failure, as noted by Mark Brown.

Jihed Chaibi (2):
  ASoC: adau1372: Fix unchecked clk_prepare_enable() return value
  ASoC: adau1372: Fix clock leak on PLL lock failure

 sound/soc/codecs/adau1372.c | 34 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 10 deletions(-)

--
2.47.3

