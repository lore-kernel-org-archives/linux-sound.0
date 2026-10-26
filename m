Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012330;
	b=LVJEfj2oQ61syCMkvKaf5srTD9jzc8r9+46kZIWUQso7VY9w8tDqqVoVJpSibJYsMLjF
	 XOZVgkeGgazqaKSS8EFmTa8Lrz0IHyZnaFC1es1BAdQ5cpStw+PANFzzAQPomfJu63z3X
	 knT+c3DPZ1e3b+EwU4kpHkzyTcm5EEPlTfnj0cz1ZX29fnVpKcTQNQUD8yUGdBFjnzLY0
	 XKlbUP+t/a7RZj427AztQRvUy0kcp9BYU3W8gb2ujtbTVFCCpTWiW8H7Mi9jXKdAdHssD
	 C1VrksT9U+5wuiVRKfoOpHKfU9O0jK+iKBKgd/Q/+N7dPC29+QgXUorVpZG3VhBgVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
	b=lqpMJ5eEqca81TErIbb2/tR7dfxj0A+pbyHSF+oh5mNyrx2BCYaJjH4+xVpgHLM/XtuQ
	 9L/bq+Z3e8LnRzT3+cwtJPkw4SHfRGedRkOlEoSZXS2IcX0+TrDfvv2G7RMImpriCWyQN
	 Jw6u6aXS4nv3Ooc22YmNGwoG60SD6t5L26g1THydGWPI5NvZIMfThRvvYuN4GI+gcDo73
	 1769QJPCKxEL3Yx5qnyIRa6m3Lhhjy/whbk3YC0da7LnVuaHLBzS4nAXaWsK2an7QRgAC
	 avx86dzikc4l7BKOoS+wAi11P4JfvQI6pK0a2uukD6jCRUMDjGjI5B3Xh9AB1zm7c6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="WSQ/NSDP";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511E606A325
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A511E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WSQ/NSDP
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2045932a91.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012329; x=1793617129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
        b=WSQ/NSDPaq+fu90JVvXh2nn6dhS6asWvcgt5EMSrmsyz21mvtsMGK+9cpjlQLutBqw
         3awg7JBTWGxxFkgsF3HWiZKNtBmBkCXANuxyC5GtTcBw2xeqzebWI5arHprqM5D+QOf8
         190voOFHSsvN88y0Cv/gdb5eh1pI32QwDiezk7Wg9wIRZJi3IZZe/rR8qS0GIXxQldli
         cyBoMoIRYo/uTBt9X3bGBu/fHQOS/GWyRTIdz1z51p8GAFl+ztgA0JHJJ1VMcULfuef3
         33bo3VZWiAAAs06qLOlCzSmrS55VqVZLdZc9F02RHWkoNKtcCCejUs56eG/xhuS0z21Q
         aSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012329; x=1793617129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeh28SrrH4onteuX2bTowmkL8SoxLDzHp+MgXoVMSPQ=;
        b=rNtl6duy453I178/ZvTaYsp+O0pjEFIKrdmC5D+eCWd8qMqWaWa+IbLHiSpMpGNGsE
         lHsQ8e+c+8eZJxsP7VMbdEbp87TfLAjpqZqrGMFEegh8DFi53LjFAoLPQHh6kZCqHSSG
         9AKxBIZH4REmF8C+/Tlk9Ykig0WI43NG9ZZjikNpYsXqZDy8tp1jSKZJi1hg9+042mgm
         b/Ej4kasR5GUAz189zRiHot/Q9rZoqEtLydAS9FhLoDoNGDiK+u42Ct3GNIkHd6FYtlD
         2Z2L+HS/gbNfcMx3AofgSpfDlqzoTWZaRi5Lyu9nauPrDqzyNML5/zAq25E4YscZ0kW0
         AaQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWZP/Qh8WvJ+kQMH0mgfVTYKAKxroQ9nPIHElOSwStwtI6oQlqgkdo58S5LeUTvZ9QIMeXmoCpkKwkyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmJMJMBZZX+OpyE3HHKynQcTr2eQ94j7nqjPqGAsXnL0EMUNXc
	9MY3Pa8CdkscdZUWaY64L3KyY751DXbBt5Ys517ZMqZYStvuyXtDADiOCxlv8A==
X-Gm-Gg: AYBFou3UcGL3WDmeEKUHMFCQkVdZ3QKo+q5DJrFrL+bE9+roipP3WKHvBTQV95IfeBh
	G2/NHNC6PBN37TibtGx7dHMqkh8zoeZBe1CHWWa1v5hr9GwhJ07AjOa4+Zchge5z2x0LQxK2Cgf
	n0yAgNV0XVMc619KUlhtjU1KKnu7Z/AdZ+HnG5VCI8R/y9iCUblW9CVDDbu2f4dFoA1UoxBQ/Fy
	lT0i58++TtIGVlXm4bMGOY8o64eDsBARLgud6cS30JSIyZXiA312vrrRSsHr5eqZWDc5OLrfnkD
	k5XDTQ5n6njZN7K93KVyS7wd2CdBBc7AaF1x6nAUzoT/FjVgaJm19Wc+mutU6rJdTgA+/y90w8u
	MonjjGDknI9MEmw0+OoDdNu13chBjJMonOvcTi/jx5toJtd3EEaoQdKvGdUkZ5kt7HU7GV/tI+1
	Py9k3O4La551woZxlCbq9ybexvZZOWEmdRvlaBO86tNr+MC6UKoN09KzVU7R75c4aCWyMAOoL1N
	2FQulgZQuBsCXVKzzi+lCFar5lYu8s3dxS2gJlF5Wr69Wv9QDkithHpbJ73SaspkpHhIvIsTlPV
	IAa1U9V3mRCEzErnFH44scxSktP/E+O6cyhyGhXcUtinzjsH47a27AHyC93mv/0z1ZzQpyjYGug
	YWwfWBjm5bGJCN2WX
X-Received: by 2002:a17:90b:524d:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3adeafdd84cmr5386884a91.65.1793012328990;
        Mon, 26 Oct 2026 03:58:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: kirkwood: Improve clock and error handling
Date: Mon, 26 Oct 2026 17:58:30 +0700
Message-ID: <20261026105835.19052-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling and clock management in the
Kirkwood I2S driver.

It propagates resource mapping and clock enable errors, removes
redundant error logging, and ensures that clocks are cleaned up in
the correct order on probe failures and device removal.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: kirkwood: kirkwood-i2s: Fix error handling for resource mapping
  ASoC: kirkwood: kirkwood-i2s: Improve error handling in probe
  ASoC: kirkwood: kirkwood-i2s: Check return value of
    clk_prepare_enable()
  ASoC: kirkwood: kirkwood-i2s: Disable extclk on internal clk error
  ASoC: kirkwood: kirkwood-i2s: Disable clocks in reverse order in
    remove()

 sound/soc/kirkwood/kirkwood-i2s.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

-- 
2.43.0

