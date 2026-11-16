Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821913;
	b=GVQVBx7UYItZMxyiDriSc0G1eNZ5tAw7NHw3vvuBaxPFKKfEfq8AsSPOxAwYMmOKiGb/
	 +HdlJcntqOhKzXlMliffHzeR7jUJQUgbHkYjRI2WKUsDWHig8d+ef/KwH+jUxu6dgRJp9
	 TsbZzSbhKZnp7TfvhwctpVF1lix5zRIxKmlnuz+4oW0bkn2HLKm7jVo67TzPFIrvZAKA5
	 PgBeUAdH3I7QT+e8F3d2KHFWaUZh2Fm/jRCzve0ReqLAivkNE5DAmwui806cmzM/2k3oQ
	 grbwNELsBfILTx4A9WoiSPCsKSMDNfxwzp60DQX/lr6OK8hidHb3ehBhuGvllYaMO/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
	b=BbUZD+8i4UeTuPVyeinrVEZasKYGAAJPe6wszAeOZxhs/asAeiprmnour/8XVsC12Lwa
	 YN6ejF7Vhu/re/lM94BDJsUbnWmwizEsMCkRNO4BCxwstdmVY9kNiYeTZaPQK13ksnZL5
	 EGqbx0CDrQesKkTDbt3uEFDiNNTIUzkVD9jKr3i0zApTwIJXa73UHuxPX0VKPap2edGQN
	 LCqn731KNqFbxir7w/uA7GCQ+a5SO2P0XxHmvsIjdkNCz0GXyS5kgxBTR3Z+ZJlCkRJk6
	 ERUQBhPPK9jPKFT6r8Gvxe0yZMA3vDB1UDUoigpLgM/DWxNg0y+wgbf+C6Hy38zJ3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B59606A332
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 09:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B59606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso619700466b.3
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821911; x=1795426711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=UYpWc1shzf8kBKXESlt/rmRtpLOuJDihEpFizMS9pLPsKgILSIB2MQiINeMJgSACZb
         vThq3hMHZMZpT/BZSTNfPPdHQOLPP6iuQ9Ot42sHnNwrkMyw6NDbqq1BqoqfMNVS1iGx
         8CBbPn/da+IbGlMvtMTvt5bBAdXjFs+fnSzmDF+FVAVjM+2NvO5SydpJTLDE0PUei/1X
         X8sNNO1XFi2ozqqXwBKcIQhQ5GsofOsDc1CZ4WTQThrlDvA6cuXd8M6R/AfHcUng3vV+
         G8+pIWUKot8EbVPzXtJKnlR0hw6DOr0vl8TBudSZ7mcQqa6jjOkMtviTr7u0bT4LAZMY
         214Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821911; x=1795426711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=0JhaGQe7sem9SWCaezgMpSxpdMYisJ2oTrljch9gUtbPoW042J/sD4eCi3l8HU8I/k
         ZLFiffR2YHT/Hn6wtBrIMfw65a/7bIgTAZ2fKEmu4zSd9cWN6AfD6h97gyTw9PVnIiZa
         ep4PL9tn6tDlPJdfRIYMXytFAElZRaFoPbQHSk/EkHgeZB3cXTMyUxQOXxyJ7zmnr94N
         DB0kVnrK8EWPLEPQ4Id3k3LNrhBE30vqqUpVkmjscfW5bZCKPU5hiy/xo/4xWfsgFj5o
         Psq7X86jZGu+FDRhfbae9rZ8Xk4g8GE06lVs82Ox4jGMuYKqeT/wZDP+QS6bWHYcH86G
         EKjA==
X-Forwarded-Encrypted: i=1; AL+hErE3LN9oBuNVnGGcX4bq6H08aHC11MxE983CbOYPgxUaZP/TaSbD4uQF9ifUZxde41a0e2AkG7aB7Ag92w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wgKzL97OsC7uOvOcG2S5hGyNX5O/CMvgL1ZvHbz3oB4T+YcqM
	KSv4PBn7AD/DDuQmSTsIN0eZrqs137AFPKdrQEy1y9/xS6WhqrCiJi7C
X-Gm-Gg: AYBFou1RuYuyX9WYEw9Nau7mhrHfPQe/ZqaPBgv6NRm0ax3CiJUytMwlIfdcxsXu9lo
	YO6PNYp0VUyRH/e79UBiAwzImI3N4qdaEg/7kHKS1ZFw4ieouIuc6dLBeqokwJrhwdBeubCQVrZ
	jOMckThFygcJ8AREVZ3BnS4n4hax0mce9bGqtFsJysqx+ss7++ZxxmV8FZd97SmcscpTl6AuWTY
	325IsdGQml0esUdFigqfRo4xukeJVzvHg/xk8aLywVEWdE7TKwAB0fkKed2ilujuGBf3thO7m+P
	l3NWGm7CdgI4gV6hLL3uYIZ6wE6/ryy06ig8wZt2/Ki4U31ZoMNl2dSt/Oofd9tBnjmiZEHj+C+
	cY/FGWjkT+szhHP/jxfg7ylaK9rqP/jNv/GqwTkFvHkKTT99ol9RASxod6pKm60ncpWNofYVItG
	veQbEaW7gFJGZjKRbQSVlrI3Be3OgV5IoBMIVfeCrAN+Sq3pxDu5LrvT4iPTXBgxWS6v7ZPC9bi
	7UkQ+pNVMr68FFzr0q0pdTALDGYwLwQfUxGegq+epnfteyHH+l+WJB0CIKoh5U1nJHpqSl5Z5h9
	1IDP1icUiPqZvqKcPZPSMPcPVQk71b7czh9RxZ4wqL2hiip7r9MEGPqIyQt8VeZSM8yc7vMt6fV
	7a06kQpANZw==
X-Received: by 2002:a17:907:9349:b0:c50:4720:4aec with SMTP id a640c23a62f3a-c5096398b9cmr726615066b.12.1794821911427;
        Mon, 16 Nov 2026 01:38:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Mon, 16 Nov 2026 11:37:58 +0200
Message-ID: <20261116093805.73715-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This patchset is based on 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-7.5

It requires this series to work ("ASoC: Convert last few codecs to set_jack")
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-7.5&id=30b0682691a3709441146311a4f695b08eca567b

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 510 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 165 ---------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 344 insertions(+), 704 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

