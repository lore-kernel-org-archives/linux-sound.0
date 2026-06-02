Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284CF3D6690
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395395; cv=none; b=ah+LGroEKpi76vbReP04ddjFC50Be/PnuiqBwpFDP9YJK+nQxp5BIUMgRIU+yNlrc5QyPRp0avH9p0g8LgIQy9dchXYElDqNwaxJwLmCHwLqFjR+Gcn8+eiA2WDURgcUqIkNNnlD2JiAEF9W2SZA6TXmOEcsmSm8tARPzf9IL54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395395; c=relaxed/simple;
	bh=38/Zl5XdWU3WE6drEyc9KjDkqO0LDYBqDFG4G2evA7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WG9PDdSxTCeMMZf8V9/KkcZnDPSky+ekZTGuocSsI50OVoPbbZXhI5OR7tqYfb6pQSQEEBVA27hQg7mWwSHm2JU5j5S8fQUmxzFRAvWVslyAb+RZos1DwHGdYpO5LHhzDQysgDe2k+5FcYc/rfY7eXhnlOroCyeIreQyroPMhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhni2arO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhni2arO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so16308985ad.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395393; x=1781000193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=jhni2arO+NqIV/BXipl433F7rgNA+dpqyOGW41L9jXjB14DeRFMZ3tpJq6NLKJfXQ3
         DzHhIYtNZlWKINZuJ9+/x/xaQuSPkVKOht/JjAAG4q+nV5l/sJChrfgScgiChVho4eAw
         BDe7ikPBudgqNmWJZ6IL8Lg420Ueq5inE6oti2YSa+C88lKGciJDZBCfK0dmegFGYxeY
         X5awYn3K34/GxisN6n+dDmNLxpvxbImDb+R3AgcyWp8jzo/bS/yOAZOtMV0PZrPULivD
         6zl8ZaYkln/c7s6I9lg8BWrTnXGs8i1JU3g+HpVBhb0xjaIYGvrfldhAgceSjxbwVQN7
         G0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395393; x=1781000193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FJlifkRqPEqQqgwEVL3qsdnCft9gZAAhkwAUUbqYm4=;
        b=WoEkXsfrT/fM9h4n0HCmQ52mS+GGFCLnlk53t5RSXrSYclL1UCawfC9COMUkG82ks9
         oKPPtpiTPxSSXyiIMxnjNFeiWP7DhfiUOVfJhXZkq/VXnfj4zNE4I+p809l5c+5r29T0
         j+MyRgvWgcoqwzUr03/VhcBtEBn2KMfOXzhBt/hM4E0J2JN3KGx0iKw7LDaDoije+mxt
         4xY33h0W4IdMxXcZnLzZX49nDx1XceGBbVe6mnK+HUmWyEVJSaSizs/9UQEswnXF01CM
         nEo7uB7mskg/UGBeiAhHlxkUjW6ZFnDM/gIJya/LxlMM9DaKmACObXt9/mm1/5gGAb1V
         C0gQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TTTB+MSu1uUTXVNCQo/BDpgiOX6JK224v4mvL09h48cyGmcX0O+L8jseOazuuawF7KFn/BzKNvf+l1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAxY9l/dRvKzAB03uORt75NfrVPwhzbWA7uza2iTNehwVF4eH
	8NryO9TSU7kPEjnIkmDwZVos8daPAZRWlxJ8/eKMS+yQXRD1EN4anY8X
X-Gm-Gg: Acq92OHgOQOAvyjO+b/gcYm2MOX0yGccFH62WZ7YNYbUleYL1fan1aCK3mkUQxULiLO
	4Y8GQom9PANdW78r0OjjialcrbKRvvLhQqBD5BeecvG4EbfBWlVTcDjwigy+vxaQHedKb1sQ7HV
	ZzduS4fTYIextN+EaIgWWuCuJc8pRVQoJ4WFT5p+ktTitc5qdqgU4FQEjvR7IEQ3h3inW2pNJie
	MtbihIL8krEJTxYGjj/fxVOXHYhDlyOn+khPrjyOylA4gy36IdWGfAeHTTjV/WGEqQV6DqY/uGZ
	HlLHm6svQVrVlLFC/ooz2lVpxNW/6aosg3/xTjWf0rkxskTvTNh1MEgGVbVtl9EG0A0aIc614aE
	hKocIsbQlHzQUUTwoiQawKjWxH2asMCl/sHe9hCNLMpd2EJ19i9eVHEYL12Wvrd/4uA16Zq3cDR
	v2De2q7fnRobSc5N/VWexCfH/VASYB3wS5Wh2DjtaGo0fQTbW3Kk6ibiHIeNwe5hvSIOah
X-Received: by 2002:a17:902:ef49:b0:2c0:db23:4c9 with SMTP id d9443c01a7336-2c0db23074dmr97094065ad.20.1780395393395;
        Tue, 02 Jun 2026 03:16:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/5] ASoC: rockchip: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:03 +0700
Message-ID: <20260602101608.45137-1-phucduc.bui@gmail.com>
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

This series reorders the runtime resume clock enable sequence in the 
Rockchip SPDIF and PDM drivers to enable the bus clock before the 
functional controller clock.

It also updates the SPDIF DT binding clock descriptions to match the 
actual clock usage in the driver.

Additionally, this v2 adds two new patches addressing issues reported 
by the Sashiko AI Review tool regarding regcache sync failure handling 
and runtime PM resume status validation.

Testing:
  - Patch 1: Verified (dt_binding_check passed).
  - Patches 2 to 5: Compile tested only. Please help test if you have 
    the relevant Rockchip hardware.

Changes in v2:
  - Include two new patches to handle runtime PM resume and regcache sync 
    failures based on Sashiko AI Review.
  - Update commit message based on Krzysztof's review
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.


Best Regards,
Phuc

bui duc phuc (5):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
  ASoC: rockchip: spdif: Restore regcache cache-only mode on sync
    failure
  ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in
    set_fmt

 .../bindings/sound/rockchip-spdif.yaml           |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                | 16 ++++++++++------
 sound/soc/rockchip/rockchip_spdif.c              | 11 ++++++-----
 3 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.43.0

