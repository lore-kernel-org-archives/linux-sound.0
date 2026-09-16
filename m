Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA1034FF79
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534839; cv=none; b=You4qzYvrQ66zQnNvGegqOeH0v9Ep6hZDdktvKJnVTqWrn8YW52BnI+YTaRlr72N9uqT41yamTcSVyo/IbnwfgAT68XFxhzcoKPXGvkwUzTxhIzIXltBEoLogC4bEWvdx1qC3MMea16hMV4fiqCZfF0mb2dmXq+J7VzB2kOiUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534839; c=relaxed/simple;
	bh=ia/XtnRAaExPSbXuMXlFSKQ4MRBhm7ffRyuC+GlyLMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmF7+1C9QOVQzy/J8W2Z5hPi7ddTYnqaYMkTXtuW+uIQG9tiKI4Zzf/GvVkr0BVcn4kndzFNJcwwmLieS/tRn7DOIqmv1AfdcOGWZbWrNjZTVGVu25Ma8WkJ/n1OKA20YxU1iBLSpOtVlunIO8Zw9brRnpsdFYh2udTssetNHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKeqzcor; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKeqzcor"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso217014b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534837; x=1790139637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=FKeqzcork1z/YruVr6dJDKtcVYHE97sB/HAOSsldkDXdJlCg/GmBUSGir0PxsHU00q
         6tVgQJo8UJizcBIBZZ4r6zxQa4fhyHSADYRX5Wud4K+bl7ICkofdYYKjDB/O1QxzfHhz
         8fz0uLCMjbprEiGZDfTwgABpvVtYvn0SOx6whVJOiQiviR2yhnGHr04KOHT0d9LHrBOe
         ySc+SaOvH/Cs4zdiGF/DIvlEx9NvSMoj6Z76rvWUpOdqIXsXE01OK27O8QW8/leiZs1d
         3Yy3TYqOo0rqN8KXxBGQavPzD3MrQQHK8kaAcdvTro5fYcwF3Ntyl862/wjKulNd7eU/
         4nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534837; x=1790139637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iARb8n/qcGnTWsohfRgsSXvgkdWyuqUiUdH2ru4qCBI=;
        b=G5e+BO35gRNaO+CEo8rnV+yjPJpu6PTLdCip/1p08NSMVnnqmHw3mB3rh5p/op6Nql
         D4Bkof1KV/WICnUn3tWFNgEp5KUW/eU+kQyqM7Uv6YwAet4ZqaSRxLDm7r0GalY2hO5k
         x308IVG3mV/l5KSXWjACWQw45s/xAzZcpK+CHkceVciAZjDHEjF8V7iI/Jz+qm3XWXm1
         wFkpMR8+exwtkbXEdcXcGHChDFFUQjDiWzrbuT3VnaKOqFIfY5kj5enU24P86aZ8qanw
         boxN8CyT3gZztsc0TaO43S1/9/Axy4vLQsMHX6yfm2zlYN+UtYosB1vy9bOA2BJx6k77
         WiqA==
X-Forwarded-Encrypted: i=1; AKwUvBytEDAVNebk8XJyBxaUatsiampz9w3Kzc9OC00nmZc/MXQJvRMVI4qT2C5DG4wFiyuOyhJGYcvrIU38Sw==@vger.kernel.org
X-Gm-Message-State: AFuF++lY2mcf32xHkFEWd4BTCpcwg0WS66K8Y/i3+jSleW6VfnOWmC2u
	qxQQN8dPKDyLYwlFJTvupl+b2z+NdLr7wH96wjsM/zVF8+zI1HETliEV
X-Gm-Gg: AYBFou0qmh0hvUFkgSMSpqs6oC/kijiH2NlvP4lwMAtBT/KOazw6oz2U9D1sm7GH6qI
	sCwlB/pOdN4Ny2JxqweYfrkmuzsLvKUlxAUeSFJgxVC8SgWS1oTjQINgdFzz1QFR3AbL9ksqOgU
	yYx384oaSziqWJLjEbKpX8+0n9v+N9/B87ZkCgz5MgnI2UEbv8TjnK7aFy+q2+19rv1LP3Yk6lS
	vY6zhHd0yX7CGgp89os7avGfL2JGhR/flVrdnSKtgMjKyir4ULFTJ14If6J9tKOqHytaVaWFc40
	ajwemcP7BWztcHlYlB/nojWV9G95S93bECTrI6ZEKSjEQaqoJVjKKkO6343rXlMoQKshvAiRk9d
	8LpEg02OeJ+Tl3W9oYQCrme5INfcutpib7HG7kkEyFQQVAm3B3Ac0WZ+KTX339Q3pxeWAArFdbh
	KLDKwoohR9lYvFTl0Ukvtkrq3ZVyzkgKBJPz6BsKGZiEVZVTlKFnf9/MOCn46Bxtc/0zrNi59JS
	FZiXAYXLvqvgpHHNbfWj/Y7V04HJ4V0Y++1oOO2tV8bqFc4fkTtqS70u07F6rODTTmK5bJ09LKg
	LbOWGEs52ZMclS3h
X-Received: by 2002:a05:6300:6697:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3dd5f44a0camr3248100637.9.1789534836913;
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/12] ASoC: mediatek: mt8189: Improve error handling
Date: Wed, 16 Sep 2026 12:00:07 +0700
Message-ID: <20260916050020.14575-1-phucduc.bui@gmail.com>
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

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

In v2, there was discussion about checking the return value of 
regmap_update_bits(). While opinions differed, the existing driver already 
checks it in mt8189_afe_enable_top_cg(), which is used by 
mt8189_apll1_enable() and mt8189_apll2_enable() touched by this series.

Therefore, I keep these checks and add the corresponding error paths for 
consistency.

Compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260910125742.150902-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260914072842.24420-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the names of the goto labels.
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Restore the existing afe->regmap checks, 
   making the separate patch for missing regmap unnecessary.
 - Do not pre-initialize ret; set ret = 0 in the default case throughout 
   the series.

Best regards,
Phuc

bui duc phuc (12):
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 134 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  45 ++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  18 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  19 ++-
 4 files changed, 154 insertions(+), 62 deletions(-)

-- 
2.43.0

