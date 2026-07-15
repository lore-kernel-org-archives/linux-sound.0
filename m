Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2639CCF8
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 05:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092299; cv=none; b=H4z9MpJg38NfKj8VTzeCaOwEg7HPGbNK2iPvQnlvDnmUyOOShanmQ/mfxjQlretzKCNy5MrK220l3BktwMuM7cJBtR4f0VlOthOANjcJzeWld6Kk9gss6bG83we0QPjJ/g5PkTNXZU4uLP4qmYrIFMj6thyaGMb1G/gqznOG+8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092299; c=relaxed/simple;
	bh=wLfOO1NjrRiTtwaGm7JPjBb+fKmIip65GwFcQmhK/bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEKzpAZeiHZ+Tq8FN3FJLR4VwWqOizFgg+NBYAxKwfWkhNqwNSdI3goZwor9+rnfecYNc3byVH1wQjMs+Sbb3fyxWFHrw+OND6C4ZevLtcxZOCKI/q9YeakyuZLYKCa2UBMP1+3zi6RL6sozi+X2AKEOvHJOgcauq5+AXIBTvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffkm6Une; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffkm6Une"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84830c774a0so1291582b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092296; x=1784697096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiWrcvhaZMjOWMul2Thf2vIaA7D/1tD3CdUZoRhlXBI=;
        b=Ffkm6UneWFj7jPceXiW/2Hg3Y8IZmnBZtTl96DS2N2wk+d26tvcOB+Sz3wa5p06qOG
         FK5QJvFAeMuig14DIMQjYZrC+q6xbu2QJke6IlYklwL2DqqUjatFahYQJL7gTlOZ224p
         86WcNVwBFDS2JnnjDDesnHuPcVkDmarQi8STdLy3gUIm63CIc1x5aRsEaln7QDziLdsd
         E4TqlChM7LvOVKgKSHsRpwMAHvAktoXmgbZgWOGHDAEjTTz4tv44sXwZfWCovqzy9vOK
         VdwTLAKSHeGyeX/r4rU2dIClYtFgTyb5anW6H7iVS9TJ4Dyhv9jL2wWJYv+AmGGQ2VB3
         tYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092296; x=1784697096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiWrcvhaZMjOWMul2Thf2vIaA7D/1tD3CdUZoRhlXBI=;
        b=ffMVc7e/vv1mWhEhz0AZGozxBmHXgzyRwY/2fnCUa4bEDeq1H60sRFSjokXSIItSfR
         catuowiwV4x9I/cuUijyR0g+/XuWW52eW0cpjpMANMR7EYO4fEQcemfHk6mDjcgvj+pr
         dnWqAI4WvhC0rkArlffDAn+tFLAlPJggQILMBqV0XXdpPXcxk9dfL2ptBgYLDnM1QSMo
         lW5q65UTu3g5uOMOMlw9TwOTC7NoyVxs7J+Xhw8WuvXEg/wvXYhaL86b/cZpzWIzPEVC
         5/5e4dOgawDviDR2NBqVhnhlEeH+9hKV0RNgUT7dsbmZ62mAr5B93TXQ6Ep5b5MsV9Xm
         u4SQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHvJaqQdTKA5XMdOyEU8xnwdkinnu0Ro7grYCg/Nuli4lLvZ5famuVPu0NSpGQVOF/0ofy8pa+vEVJNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTCG2jK+wMHSvfT0XAsSCdQKKNfaN4MzwVFqZlIIR6GHqJoTcD
	t01ul+iX1gYow36q60jNYyvxyvj436r/y1SEaxj2w5bNTT9pmzHux0VG
X-Gm-Gg: AfdE7cm9lzXF02VLRn1YqAWy6wDeFN4M49g55LlA/MXWE9u/ysO7KiJonBIuzgaJf0q
	zeo7GanJw+HfkP4IyJUQCYhKDrtFkkKue6kC7uZi/Sa2Va12IMBdj2dOuyRFVaQPSjmSeVynO4p
	7r0eGoqxdqAHNd2CMuiS+IySjFH7FNTUxoYHvLBfiS4CJYhEwzJy3b2ArwIs/srUpiKUzYERvtn
	Ef87c4yaHQ6HSE1UYqszfhkywWybz5MAWN8ibWSFD4yr73o6flqhiiXgqt0q4gtfnR228E/1LGO
	ZcZzIaJ85LEmOLdLN1KXtyDAhYEyX1ZZvDJvMYKRl18q9/z6dgc2kzF4bU97gFQl+yMn055d3cG
	/eGEEd1sndHiq4D6zO1ID19iQg16KKDtPApC8/M5m2M5ihjh+IGQC64UBxMPn2p9gocD3Q4YAwJ
	503uUUXSCIa3PgglAOxvIKGFqsOXtaVLFmk2XMoRnZsNu+W0Y=
X-Received: by 2002:a05:6a00:23c9:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-8488986df61mr14464978b3a.74.1784092295808;
        Tue, 14 Jul 2026 22:11:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: tegra: Simplify error handling
Date: Wed, 15 Jul 2026 12:11:11 +0700
Message-ID: <20260715051115.17385-1-phucduc.bui@gmail.com>
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

This series contains a few small cleanups for the Tegra ASoC drivers.
 - Use dev_err_probe() for regmap initialization failures.
 - Return the original error from snd_soc_add_component_controls().
 - Use devm_clk_get_optional() for the optional sync_input clock.

Overall, this simplifies the error paths and makes the code more
consistent.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: tegra: tegra20_das: Use dev_err_probe() for error handling
  ASoC: tegra: tegra210_adx: Return the original error directly
  ASoC: tegra: tegra210_amx: Return the original error directly
  ASoC: tegra: tegra210: Use devm_clk_get_optional() for sync_input
    clock

 sound/soc/tegra/tegra20_das.c  |  7 +++----
 sound/soc/tegra/tegra210_adx.c | 12 ++++--------
 sound/soc/tegra/tegra210_amx.c | 12 ++++--------
 sound/soc/tegra/tegra210_i2s.c | 10 +++++-----
 4 files changed, 16 insertions(+), 25 deletions(-)

-- 
2.43.0

