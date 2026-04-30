Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276A3F164A;
	Thu, 30 Apr 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535249; cv=none; b=OYoC/1YWr8KkfCcTnCCtQvPtE2kwg+GI5T10xGiVSaSaYKdPpzRZEp78csVxyWw5HlmZR1bPDgn28ylmPeLvYxfztEtIFRyaJb3gCkiVovJJqC5JS+zkfOTdUBT5tMweLF8yHHCTARaj5VAhCm+bPCOpEUQb+bwzLsqbNKVBYtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535249; c=relaxed/simple;
	bh=1dDJdSrYJl71zYxyh/l2b3d1CEi8X58tvHfPPqiyPLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GI6eorWvpuzQUTFllW79JM9TcrNmyokIU6wiwuw7i0fiM5lVWPfo9PkcQ8cqdFo6keY7FLzOuUugJY+Bv0jiP95UHHo6ByRdc/egis096MRDpoq9R3EpbJoc5/rirfCqMK6dKShfqhpS/RjHsSRH4zzbsrwwQ3VaZxQalyU2ErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=MMSblQZQ; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="MMSblQZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777535176;
	bh=xMxuIbFO1jjs2Eq3AFVA27CFUfL6qUmxzwFZwJKvaw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=MMSblQZQg9Orv84MocY/PPnLUMbOxDQOnsl7otJ6dGfp71uVKChBYqd2QvpVxBxSD
	 TmA/J6F33KcAFOE7/T9WKq73EHm61ZY0Doli3xIEKKQ/FGYkPj4kNynVze4N77Jwsj
	 mFSlT8gy3Jy382ZhODgv9ji/ifKKMIs5eHiPLJe0=
X-QQ-mid: zesmtpsz2t1777535168t7983b19e
X-QQ-Originating-IP: xipOEMsToQ1N/ES472l+UPSJu6WL5L1+HEOULNxNTeo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 15:46:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13882637360357861190
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/3] ASoC: add shared BCLK rate constraint for cross-DAI
 coordination
Date: Thu, 30 Apr 2026 15:46:00 +0800
Message-Id: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNL3UyjYt3ixNxU3aScbN20VEMDoyRDi2TTxGQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAUQ9MHHAAAAA=
X-Change-ID: 20260429-i2s-same-blk-fe102b18c5ac
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777535165; l=2809;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=1dDJdSrYJl71zYxyh/l2b3d1CEi8X58tvHfPPqiyPLs=;
 b=coHx0/oKYzlvp8AhpYYNBlf273e2H/prnZwMlD0ZXPF728Rx4R5doUcYmrmFos5idCcfVWt0v
 RPR6aJk6++PCfy6mpc4X4DxKTjp9pb7NfGu1NY3iOwnH4kCY/KO3pj8
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ml7EYPMWxX+7IheoFVMj39A9yO49i6yLxFRVzC8d6Cpyk4MWiAYt17TV
	7TQfpH0OPWl0vIreFJpx0ASE+lZuy9bqYz47IxYif2JjjDA17LLuUpCdbhG1hFcIN+3zP2q
	H+SzymAj2G2pyOeJ8cdPHMJ31MOKOJ5DawRawdRd1z9EZx0SetS/jRVQ77qT6ad2AqtLJAf
	gxOfpkzyPTCAZbUeXpufbXupM39mYyUjkNNsyHIiln+B4/1AjDJAfEIM+Vncrjz1sADr5ua
	ZZs07E7o4DVe5DRlcwMxhe3KDZEI0YHlzLR7AsNtiqP8NiJ4H5jbjFoy9TSYOFYANyWd3q/
	MemOaJ5np+w/ZqKxfGFRzwEIpLeyI1p8p8CfdUiLSW9vEcsx/X60cKSwyvL75undB48LZ9z
	McCHGVsWNTHvhvvBRf+mdbBBkLPL8BjI4Ac6z9hjv5+uzsUShHg2Q+Cf4osiFGQwsha+P6P
	Bfy9b5EqeH+VLDM24apHApqaVY9ZqdRrn8GhRF5QQ6UUn+Co/Ck4TM2TwG3udW4z2O5ap/X
	k8K1O/4R+LPV62ywbVN5qgSo2348tiQ6S6SPZaA5LaJ6XGmFMmCyMr3ew9efUXTh2XVFM+6
	zHLQzsvZeiaP/VeMY5RnBZad2EeWgLC1PZYr608pvrFGk6e/p9VDTpIEomSd5Y9OHVoGANO
	Mm2gfKa8BPCyUfofUBQ3qMpWxjoe4N/Endci9B5YGmDaeNYCpRIG7gBNGBlE4OHhCtMBf0S
	vuQVN/ozVvayEDzS/UiszpipxIpV+i8n62t0HnzUvPKqDkfGTsW1coVkllVxl84oXpiVHVS
	vx+liXCjgcDUTsjaDvixgqTyaeezhOUF7TfR2M6BXZlrf7YwLlTDDNEgVCjMUIak8hroZ9K
	24EXuNCgX2KX282ZvBAPCJL+mEDK0QGpHtGIKiVxXCnqXFOQngAjmS6xl824cfeHKBGslUn
	NRwsQga3LIPfmOwJn5KX9KezC2bkxu4g4EkoD+fHdxUtpe1to92dqGvd1shKHLW9PWmkXJ1
	7zTTX+tKuIh36eamQUVJ2GCa+UkINl4I/86FS/0zv942L6zEFv0AaMo3ZOe6I3ccW60ygNj
	8TZ7eY6M2wg9KLmfKypzCGs1vEBpcvYaNLyP2IU5XrMHyscXnBIwy25j+c3v43r4Mplgegx
	aGJG3xKozVGF9MzLsEFUUMsgSUQrOY4hBMAnoXc/iyYRPCE=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On some SoCs (e.g. SpacemiT K3), multiple I2S controllers share the
same physical BCLK. When one controller is already streaming, the
others must use hw_params that result in the same BCLK rate, otherwise
the shared clock would be reconfigured and corrupt the active stream.

This series adds framework-level support for this constraint:

Patch 1 adds a bclk field and bclk_ratio to struct snd_soc_dai, plus
a helper snd_soc_dai_set_bclk_clk() for platform drivers to declare
their BCLK clock. It also caches the ratio in the existing
snd_soc_dai_set_bclk_ratio() so the framework can use it for TDM
configurations.

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
Troy Mitchell (3):
      ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK
      ASoC: spacemit: declare shared BCLK for cross-DAI rate constraint

 include/sound/soc-dai.h     |   7 +++
 sound/soc/soc-dai.c         |  17 +++++++
 sound/soc/soc-pcm.c         | 113 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/spacemit/k1_i2s.c |   2 +
 4 files changed, 139 insertions(+)
---
base-commit: db490fe819ac280fe608b23d98c54a5467ef2948
change-id: 20260429-i2s-same-blk-fe102b18c5ac

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

