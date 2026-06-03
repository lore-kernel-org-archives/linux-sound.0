Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB326ED3E
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 03:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780459114; cv=none; b=Yc42fDtQHgI3jjrapKFAekW9H0n2brKQ+buKtMim0cmNySaKYrtQUnhjJNwNUG+rI8QYrM51vK1izSvc0ECFIy9LhfT8d4Xg1ni+tasiKTje9szDc+Iy0xcEHbFLUFKdTIs7pakN5BLwyL7yOzsPoIVS+foJshgrzMdXNrNuzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780459114; c=relaxed/simple;
	bh=yxrf1oUiCYIzBKh392eNF0a/muUCk4H04S9L+gnQjag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGuro+CLfObGSsJt3QMaGPNvlVB2H+zdd4KM9iWMguZKdbZrrJAOMdC2KQ+YzswLjUICF0dn3a0hRTrInRopM1wkl7IrXm2/d3sWU/BGccjC2w6k0jGcvylTFn19gkRueVFqW7eSBnvN+sR+hoEM/4eWFihzE2b6bGXs63hxqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwLGOK8H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwLGOK8H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf125989f2so39975575ad.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459113; x=1781063913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ygFXPwsJQO8ymWnjVkYNZg4lOorcqeH1A5jF0msXE=;
        b=hwLGOK8H5yXMtyLOVinQBxMIBm6mb1+40FB5WsJh9hr+3pMC4RSjDCOGcEgwlwj0Kd
         FXh8TIE7IunkPrW+Je4Voz+dlz0yBqLbMdbbllSRiwlmqsbHCXeMJuvJWAbOMFD1vmAX
         9Gj0PUOWg6ebJwK/6Ddi7pIWoSRR6x1BhCPojTPym3QLqEzrb3osP74G/L1R4rQtAGDb
         76m2EDypm6ZW9jQWsT+JHuh5OIOPCWZN7OY6XNwT0L6kaKlzxlMPup9wWwnLNxBIrRC/
         1/GMv1L4PE6Nc2iX+bSu4CvUCbfjFira6p+cLCz1dQGjMAxT4QA/FDn9b415/TFrOAfC
         1qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459113; x=1781063913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5ygFXPwsJQO8ymWnjVkYNZg4lOorcqeH1A5jF0msXE=;
        b=AwL5amBNi0aal2DxbW/OGiFMUot5EyBLW4ae9z/J+vEhbgt+Zx2SzEv7yuUH37zlLV
         RBF7SShyJJdsGNOxn4oioV8bZ78yeAfLvGWrFwA8FHEm4D+M3D/WR/lKN0Vry0we86PH
         wNN/Htgb87p+/DhYhrZrVVdtGHb7jU+tBQx2k9TJ6EZXpNEO8ADCM19Rrsm6CyOJ/wUz
         hbP4Y2uu4nKJAltOMuxxGszdu3Hj1gN2O5rVc8k7TuLewNGBNOt03Ss/1asZoznwofw+
         g85ryXW2mUCl3Uwyrqfs+OJz8KlgQpeCqsd1ia9KzhBLiWkBEhz4x/MYmzuhEVtw5xag
         xanQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DmfAMavaIjnFcEFViz5hHWwFPj5NHBkuHnU8hDwW1XsYIzZyEQL8mM7O0Bj6QXr6cm19LXTXipnxcsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBGdVk6DvUcGm1aoop20Zl4zg2fXoNDpJLmouHWixiUX3mmdFh
	GjlFI3WNdPJVNsNLwcqugEN0lqhF8C8nb/KJmfosklYAEtEjd1HSZTWJuBwTNw==
X-Gm-Gg: Acq92OFj6FvVQg5LjePSOWfeSstj5APS0lgo5xBob744zAtcXIUXcG+sAMAc4kJddBu
	ceERd9PvH/Gxw4Vx74WA42ZSVbAr5jACXRXh6XNh8rjri+PZ1iOPGi2/AFI3aW+mSrXuxSAZget
	gMeH1IT4ouscU9xcg8qXTgHpbP1j6+ixfr2HuxieNJRRFVMPE5ehjeh/saJseq/ebUCcd8L8i3W
	bHoH2+fYaKfAUwi2StLApbopUBjnrXtqLCvyOEBzriXLmdMTnHjbT8veJnufECVkjfovZMx9njF
	Hu15wS+x1Rvv/c9iSXOiUR0y/8WFnlhy3icNDcuGjerfHdlLo54XWsokzUL4ZjKuCI5jBx1D9S6
	XoWEVTQAKR6JSHCQlMwrnENaarWMHdSuA/vFMMuHVQ++3VoOIOkV+mTwiCRzWCLGFzzjfLAmY/G
	gN5qaC9Y32eLOJEiqTzNjPFYsoUToiphj1I4dD0tjQg//0Gnp1C1WH9gAde0KW1sjh4ylM
X-Received: by 2002:a17:902:f785:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c163d8ebccmr16632755ad.25.1780459113142;
        Tue, 02 Jun 2026 20:58:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:38 +0700
Message-ID: <20260603035741.68893-1-phucduc.bui@gmail.com>
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

This series converts spinlock handling in the Rockchip sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.
Compile tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
  ASoC: rockchip: i2s-tdm: Use guard() for spin locks
  ASoC: rockchip: rockchip_sai: Use guard() for spin locks

 sound/soc/rockchip/rockchip_i2s.c     | 160 ++++++++--------
 sound/soc/rockchip/rockchip_i2s_tdm.c |   8 +-
 sound/soc/rockchip/rockchip_sai.c     | 258 +++++++++++++-------------
 3 files changed, 209 insertions(+), 217 deletions(-)

-- 
2.43.0

