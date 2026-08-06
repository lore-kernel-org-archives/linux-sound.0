Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0C386C21
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993718; cv=none; b=k0gpQSwD1koVpFk5IZenJ8vzX0oJaD0ip8sB5mVTDbQ+JXi92uImUYllf3XOJS/1fu3RBZQ2+12DcXMcZ5CBiUQrjJvzbI3fbkBz8RRjyN5eu+VmIQ6xaeqIsCn0OtrvWJavyszWNi2hpAxNgQ4fisD25NnkUI5virnlYQeYzQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993718; c=relaxed/simple;
	bh=c199YbRnccbqyfpzoYbQMtEkaCNVuYTgiuS40AqoNf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxT9a3SCcIvR92iI16uUshRwkOwgJ6htucjaFYRiBOtPYJEYUsTQ8yk+6LBmZJgBr9A2Fk5JuEDJD7M/sTbiGw3P2z8eevn4gjlT3b86ZCytnj2Rr4xCkWl7/67gEoRCELHmJLmW054rk/aNmPrHEaZeV0Fl7GFBuW/WXtb6Eo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYmZNR8O; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYmZNR8O"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847482584so426129b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993717; x=1786598517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBJSVLcuS698iPvcGBsGEqqGtyBuKd0ri3MDZGD+Opc=;
        b=BYmZNR8OUng/8u75lfU3f9sCYrEMYM3gdIcqMc2xh/sOT6eJEnfLqDFGOeecc1S87m
         bZejhD3dtgobQja5CYJbs0oXAtbmN1azrKCBFa/3r6bM/FO8Pk8jICJLAZejPsPHe/HQ
         IAdHYMV+FKyLTZji3WqknzasAZCE84XYKrMMQD3Gz/Xj4HklFc38z5IabcKahefsBJ5J
         XukPtPwR6eUl+likZHOZB0hiRW/P2U/C5qNnTgM7Z+Cni/oKNQHAg+8VHeobnamP5vlE
         cszaPrBC3oUvpsX40xvwIJHG0yzuRq/IiRJ+2ErYJr4HMdAxmrpuZ51xVbm3SBQv+l04
         q5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993717; x=1786598517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBJSVLcuS698iPvcGBsGEqqGtyBuKd0ri3MDZGD+Opc=;
        b=Bov0GpjG4suIDRQKJNvK/3Zn65x9gY/Al5yBln3sZkmAFT47YScclCQP5ePdKsZ5xN
         EdnXPwzRBAoq5HJDBnvkuLFWA5gLHOCWT/pv/1KvS2pcpSDhOZpzWQNcKxc4Bu5rmyKf
         6ZdI6ApxSLJbXYwt7dxMrvCsU2qiBss+hq2qnJgKVoeYir47ADdrwKflGhEN8v6c0nDR
         RkDNikERZZVOtZPoNholi68JL6FZANyAput8qC/ZS+lG3exF62Vf+MVivNL9lVA+Z2ML
         nkVIY7rkX4cl3bfEwrZNDqfonQ+DklKoFPlvE14VJxdAuUm23wfAAhnwgVGtY99UUkQS
         Bd8g==
X-Forwarded-Encrypted: i=1; AHgh+RrXxVVNemDO5naZtktEN5Pu83gP5PTzki3HkuosTUuKXrbRQslGX6oIOm/CM403FeZ7iRqOaYkntUKNQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUXpWFVlHrC8pyYG81GHjnqH7sx0o+14zhP8Zy3hEV5t9s/vk
	88tox6ENH/BqikiHMFezqex/nf9TfAvucAVslJhTQUiY6uKdmE/me/8G
X-Gm-Gg: AR+sD12DkxUTGNWAK3ymNhSp4NUTRPb2IHnzEAYfn+jg0J6ZS9Uo+1XBMzmlO8O3Zvd
	OTwp7Oi35L2EiGcTgQOzCPEOIvYYgfRk6wO8RiiPiALOUDEnmKkQBHYYMqk0gdjI6jcpwg5vyXP
	SS64pQBYR6gN0YXZUW7HZXQI3Na/Tf9Trp3lXer0vu7/8pahcv+c4TRIN7e2DIbRpmMOEI1LoIW
	y+NdKIDBqweXIFUacnsXi3v6minkt1Ers3LYbDsCP1TJpoCILHO+KJWXeWz29g6aiZSs2optVdw
	pVsnZgDBxCaqT3pOu0fhR4rnC4ZQAAQjIT9/886734TO0zD4hqXnogh/WJZ18aanZr5+ri1Dh4q
	0O2PbnYjxznV2jJU582CeFDezOSM+WEpqokkKNndiUHJ4FscbJuAR5CuEnf0XUWguhOMToFvxOS
	1dkKE4ZoUmbgjRU9QFs8zYHndA26Mz4wJACkAljB85yBI+vhNkEETifvc5GVnbrI7XfaYlT6JCy
	Sqo9OeJmXA+oEhB4bdMqnwELAvBBFZbO8HtEee8fCvuR88yPUQcBTNgOY4nlZU4WALFt5QUcdQ7
	WkP7
X-Received: by 2002:a05:6a00:1482:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84f47d8c4f2mr1960005b3a.9.1785993716736;
        Wed, 05 Aug 2026 22:21:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:21:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/14] ASoC: rockchip: Simplify probe error handling
Date: Thu,  6 Aug 2026 12:21:22 +0700
Message-ID: <20260806052136.21034-1-phucduc.bui@gmail.com>
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

This series simplifies probe error handling across Rockchip ASoC drivers.

It replaces open-coded error handling with dev_err_probe() where
appropriate, removes redundant probe error messages, returns the
original error code directly, and fixes handling of -EPROBE_DEFER 
returned by platform_get_irq_optional() in the Rockchip SAI driver 
and devm_pinctrl_get() in the Rockchip I2S driver.

Compile tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error
    messages
  ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error
    handling
  ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
  ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
  ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from
    devm_pinctrl_get()
  ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
  ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
  ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
  ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
  ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
  ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
  ASoC: rockchip: rockchip_sai: Return the original error code
  ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
  ASoC: rockchip: spdif: Return the original error code

 sound/soc/rockchip/rk3288_hdmi_analog.c | 16 +++++--------
 sound/soc/rockchip/rockchip_i2s.c       | 30 +++++++++++--------------
 sound/soc/rockchip/rockchip_i2s_tdm.c   | 15 ++++---------
 sound/soc/rockchip/rockchip_max98090.c  |  5 +----
 sound/soc/rockchip/rockchip_pdm.c       |  8 ++-----
 sound/soc/rockchip/rockchip_rt5645.c    |  5 +----
 sound/soc/rockchip/rockchip_sai.c       | 15 +++++--------
 sound/soc/rockchip/rockchip_spdif.c     |  4 ++--
 8 files changed, 34 insertions(+), 64 deletions(-)

-- 
2.43.0

