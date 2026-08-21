Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488C1D432D
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315388; cv=none; b=kY+Dn38BK3tyQalreNeD79FgC5ENI+eI5i9dX8m09yeTQjK7pFR2rBOF5tRX1ljuRjDiS/KeUwmsgoENrszX5SxpSHPFMHWT0Zia8gUM0Nh0h5UevY5PDkHQuEkDUyAQcUfeH+jgG8c931oxxUoqavrRmNkgVyWWwIqzeY9VGlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315388; c=relaxed/simple;
	bh=WLEzA35Bxm3mdA/jZetvwStM9V0Z/hWBYi64YXjF1IA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SEGGvz1l0PkXCo4oko3skbS6f13ON5L0eE9HzmE5fW+uHnEtL3FxEGlIPEsIFWWLGG5nJNJnjz4iUia6pDwcOW/ScfLyl+KkZ6VtIe2XsJCup5vTl/C2q95GyiGPI2nZITv+k1J1rDuUfBCcKsH18VEZz3hWhD9gxeTztZ0GrAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJL/E6IP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJL/E6IP"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84864086bfeso260782b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315381; x=1787920181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=jJL/E6IPfWBUlWSm2XHx2VyoV2tSM5VdYbz9RkmndOTVxz7ohy1Js3/qm6Fx6/Agnl
         hNR68+Nhb4c2JsYrwyGdangMWhUPBE18XzGd9/RbtoOnz0Aaom3JF3oAmkTDM04O3jyg
         pr3P/vV8ZRRYJkJ9sMpm4rzvmdO424mHBMDGNBmenR2QgE+rN2uz2R8nOi1uON+Vyrr/
         bjnBsF4vqcTSuMPaQNGnsACTLv2QgYHIxw5cMtz5bSTZiReQulFoMyQaTeZs3yzP/f6A
         1Dtg5CzfC3K3msAip34TD6njCqwY4ec7/Gx/0NPzyM1bGwq744q0DkR2zh4X+jmHN3vJ
         BC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315381; x=1787920181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhjxC8meyqFgoC6xgU71L58Qnwuzn87ityQti+5Ixag=;
        b=tZfwyOZQBC9Dpieu9poLjw0H1wnVjCke83jqdAEhOYkaFY4cR83IwUravYbGKm7lJY
         fANk9jFgfJO5uupSzzp6G9Os0rTE5swQ4IXQpWiMSRRFsXoqen3nWOk9tMAV7fhAR/4V
         UZlNwVeUr2o73vk9Gp1nzHSSCs2KNp+dfHDYN8x0Tj58vAMnrnIb3ef4Th0WOZqR8P0Z
         /laWpX/Jt2tfcy+gBUhHqpJ58pqYX0Q1wwJUFHGGC0D9WY1jj43qanKQwp7kLWw4Svxd
         3hfGi81f+d8AzqiWGdbD1yC/qQ1GV2NFlM32B1oy3qNfS4ujTCFg2Mx5xaqYJQO4z6Ke
         ZC8A==
X-Forwarded-Encrypted: i=1; AHgh+RrPkOgr+/KGdusdmSRV5QWG5P0r7ec8BRm/jNeFw0FSYIKtbeia9yiu3Wc+m0lTq0b/1eLpn+45uOhd4w==@vger.kernel.org
X-Gm-Message-State: AFuF++kv9Caz+sE227uqCQtADU6JDeqby5KZRHgfvgGEFqBCHRgi2+mY
	a5xNaEnFB/kPeESYVOAvxORYg4zJvQr25YOGO0C2Hlpgx2eQnyOO3EPb
X-Gm-Gg: AR+sD136NTbXYKc+1N75DZuiwm5RdV/DuQDBJVfuyeKm+7le/pr9MNyjY2rk90aQR7E
	SkxXCAlzp1b7NJe/SeAQaYlLNo6gTGRalOjTJVklApT3qlURzo7WZtMcb20fKTX+VVZihSf0TW8
	FmaOPYuDcAQggPAHCxDzgG9BT1KuSgz6LVwvqrkgbHA+Qs/G56Qv6VTHWVjOeGLhq6A6UwDcQni
	jQVME9IMmuPPTwjgV9rsK9BbgqQJhvZJtTqnjZOpT7+FbvR6olY5Vc1xoWS2QP/R/wowQhYi5fl
	NEmR5eEkyQqvnu7ymmn5DS7At+cMZCYOBUD/R2vSlunaC25nGhq7MJV4KuXQUtWOndAfJoE0ilL
	3tUG90Zr6+J7Lo3IwHgg8SW6kekIkmySt5DOYhSnMGRtA3pNjGf/uZzDFf5gw9W4anJ30BcCSgQ
	lmeGSiAz1SQs15HBxlS4cFAuM2B0eWA7nEGX00Ql97OwqPNBmYfSMeO8gy6zzUdJX+W0TCiRX8n
	yDY1RH+kTIh4o3+qUSF5YVNJA30T94GIS0eDGwJC+FuiEq7meJ0tCFSeInQ/2XX93nGoscr9nG3
	u0lM
X-Received: by 2002:a05:6a00:4397:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-851f9bb6a9amr10190094b3a.2.1787315381261;
        Fri, 21 Aug 2026 05:29:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8183: Fix clock error handling
Date: Fri, 21 Aug 2026 19:29:24 +0700
Message-ID: <20260821122928.41343-1-phucduc.bui@gmail.com>
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

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 25 +++++++++++++---------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++-----
 2 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.43.0

