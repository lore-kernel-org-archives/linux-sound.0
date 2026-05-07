Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9F13D4130;
	Thu,  7 May 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149985; cv=none; b=CizORk37+PLyXOh2mJ+RbpPQzKJMkJVClYkK29Ug5XaNlFkbYC3x5vUpH+r8zTRw50h3vWBvEJzvNQSjRTytchID89qZAYWtxGZXIVCqFBFjtTNGTr9KBIi5oynJtd4UE8JgKAobod4mRkfjJtYunpUjH8/vUEMZbT8BPKDVCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149985; c=relaxed/simple;
	bh=cv2adx8Rg4J05JSCVkpK9fVN6nGWQyV85tXuSPLQF8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DI0wld2hvapBZxonkwQmbo7UZFxvLNPjiJ+Dm4CmGnve0ykoLpFiii338MrZ3TvTzKGt4NjhY0yfqOXhn9OudJKy/b5mkREqcQFzQDUT1DtuzO+Z+o+j7vogoX1f8lRrgQCl/70QhzgI+Q8/PiF+uGWbCmn48SIg1guz2ehSrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=AcUtWF+i; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="AcUtWF+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778149918;
	bh=HMxdC70uHV4fxLbpX1dpPLUxU+NKK8HjnIfqpV3YcOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=AcUtWF+i+FF9qYF1tf8blbsGrkj8jlAjJ65GRPcN5PthT3f9Wstz0h0+HKL+NKqQw
	 +emEpOi0r5PDhpNqIeIV5OzD+PvRf38K8qWE9FRclXa8vxGJ2HuCbUzTNtX/4yyJob
	 8e/ZLqzYSCxMFX4XzVzjY9bZL38R9r//ZXzcmue8=
X-QQ-mid: esmtpgz15t1778149911t24780b90
X-QQ-Originating-IP: /AW6x9TJsEakn5lu2t+rQL4bqA3sOv9DptrdcSatRoc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:31:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13817591298618918627
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/3] ASoC: add shared BCLK rate constraint for cross-DAI
 coordination
Date: Thu, 07 May 2026 18:31:41 +0800
Message-Id: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBBFf4XM2pK2PCKu/A/Doq2DjAIlHSAYw
 r8L6MblSc49dwHGQMhwiRYIOBGT7zbQpwhcbboHCrpvDFrqXKa6EKRZsGlR2OYlKlRSW3V2mXG
 wTfqAFc1H7lZ+mUf7RDfsjd2oiQcf3sffpHbvl07kf3pSQorEqEqmaHOVFdeGunGOuTcOWxpi5
 1so13X9ACrlLhvDAAAA
X-Change-ID: 20260429-i2s-same-blk-fe102b18c5ac
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778149908; l=3376;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=cv2adx8Rg4J05JSCVkpK9fVN6nGWQyV85tXuSPLQF8E=;
 b=X8U79HASwCdRUHtoMWNb4xq8p656tExUqi0Pnf7GFG2DlzeD0LTY9/rb157pj0FNd3Le+1138
 TBchimRgOFNBMhDIpRZ8WpiZ/IlWe9j7L9GI3UFTtUnlC8z/7tTjBn3
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OJyXPBiBBuXg7/d/ortqhEWUh5s65aIrgjbi7XjyrE6hyaSLjv+XfBVn
	gzB9+SKFfPPUu91dqYYEXElFP82n3++HADRQdzXksaDBQdkbKEYdE3T/57N1GnXlLQIrFkp
	y0MLNNzFspdIaSGA3hK7r8QuUkPUUHKImjIwyepdDUZ8tUJ1cpwpgtKM4ve7pvxx67Kf2Sd
	sVPQwgaibPGUwnA/W0KjvXnEQ832PvHZsOCq7y1D0QIKUp6IXSSJ1FgATaZeUOGB+SYHM8Y
	AYf5aYm8jej5fNZDuv0By/R2Y+pZHRGDOmUpJwXi8V6yfUF++cS7UOeKd6QT/yWu+NB0fs6
	0j0mIdnfy0I4bqrBuq39Ipk/Pp6m3+Ws9SgsuhNDqHUOfgyp6C5CSywMyToUHNOSYYwq9TU
	G7cdq+CEkl4NC9ufnwGGcaBorR1pW4joFYXn9/uh55RLMPyO75oJGctlgjboq9KDraepFla
	oJ+tqkWXgaCPhlUKEG0Jufc/92D0JSPjIAn44Mytxrna2QDVLxPrdTu0yZ7ZnXiIhUyCSO9
	Ge0EM+0KqWGIepH91Cg5Wmux3EOeCSxB01wmHsvMaDoWhL6voyHohVVKDSxJPvYngB/p884
	w5vkoNq6Koxh/mgR/fWCURNcMW8PrXeDFkYYl1ttgVRESbKqvTPGu08TFNgvnmD7imoQx3l
	Zx+wKiq+EQvORTnNn8qdt/FnjiYC8v+6StONwJkpoHwBQ+qaIp70dId13wKQUF7XAnwSuB2
	vJZMo6RdTNzCP5xbCM+uu9baF5dkPscCHRFMMgr9QkOzrRh0X3rPXUsxB/wn14UH1aTEYDt
	05K6sWtMgx/MRC08yZyiHYu6z2RT9oJc4Tag8elGTdSKli7qGihjuonEUHduWLBuAAU8k4h
	esvLUFI5Yq4A05PFBJriR9BWKkGQ6kV+jwfwq2FA34K28sfJqvsrXXSls2sYrFqiuVIja/B
	kqL1oHoq4n09/fYGM6YZ97y0cUO05fNOCHsRLu2/PQeVgffQHqX6pCK92y4U7JcLhw+LKQ5
	UAXDg3zvIaq6EjVQSBc52dBov4odX2MoU0V/QYd6sZGeP+1FKZ5CJcbk0UFt6JvXxxw8Y7R
	i3YxWoWicU4+YftDrtS1DPaeRgBLfdIxeIwEB4BFRv6CGBajmbrYbgIgMtTAm+zbHbq1iXI
	qSlNEuj/+X2MVw5T3ZIZr36OJA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On some SoCs (e.g. SpacemiT K3), multiple I2S controllers share the
same physical BCLK. When one controller is already streaming, the
others must use hw_params that result in the same BCLK rate, otherwise
the shared clock would be reconfigured and corrupt the active stream.

This series adds framework-level support for this constraint:

Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible.
The K3 SoC uses the same I2S IP as K1 but requires additional clocks:
a dedicated sysclk_div, along with c_sysclk and c_bclk which are
shared across multiple I2S controllers.

Patch 2 adds the constraint logic in soc-pcm.c. During PCM open,
every DAI that has a bclk clock pointer gets a hw_rule registered
unconditionally. The rule callback runs at hw_refine time: it scans
the card for an active peer sharing the same physical BCLK (via
clk_is_match()) that has already completed hw_params, then constrains
the current stream's rate to match the established BCLK rate. The
first DAI to complete hw_params is unconstrained; subsequent DAIs
must match. Two modes are supported:

  - Default (I2S): BCLK = rate * channels * sample_bits. The rule
    derives the valid rate range from the current channel and
    sample_bits intervals.

  - Explicit ratio (TDM): if the driver sets dai->bclk_ratio
    (e.g. slots * slot_width), the rule computes the single valid
    rate as active_bclk_rate / bclk_ratio.

Patch 3 wires up the SpacemiT K1/K3 I2S driver: a single call to
snd_soc_dai_set_bclk_clk(dai, i2s->c_bclk) in the DAI probe. On SoCs
where the BCLK is not shared (c_bclk is NULL from
devm_clk_get_optional_enabled), the rule is a no-op. On K3, multiple
I2S instances share the same c_bclk, and the framework automatically
constrains their rates.

This series was prompted by review feedback on the SpacemiT K3 I2S
series, where a vendor-specific fixed-sample-rate property was rejected
in favor of a generic framework solution:
https://lore.kernel.org/all/afFqgF6ZRwYdfUmL@sirena.co.uk/

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v2:
- Only store bclk_ratio when set_bclk_ratio op succeeds, avoiding stale
  ratio on real errors
- Hold card->mutex during rtd list traversal in hw_rule callback
- Link to v1: https://patch.msgid.link/20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev

---
Troy Mitchell (3):
      ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK
      ASoC: spacemit: declare shared BCLK for cross-DAI rate constraint

 include/sound/soc-dai.h     |   7 +++
 sound/soc/soc-dai.c         |  18 +++++++
 sound/soc/soc-pcm.c         | 119 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/spacemit/k1_i2s.c |   2 +
 4 files changed, 146 insertions(+)
---
base-commit: db490fe819ac280fe608b23d98c54a5467ef2948
change-id: 20260429-i2s-same-blk-fe102b18c5ac

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

