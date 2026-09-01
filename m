Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E549B20E
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286878; cv=none; b=NfM98k+2OFkyPgDapHjXUHc1wXgz3TVTMt6Sq6aygEfEfUuO0MjGwd/7XtrqQCPvnpbZYtgIaHe1+7oYdeEGxey38DSsDYOPgU0xvt0MutWrIwnqaVmx/I+DVL5hfRMhEX3Z7bOpw5Gqe/0Twje72GzxzNgQuWb4nr53bJSAcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286878; c=relaxed/simple;
	bh=7ispvR8vEMxAq/T7jBeHCcqREnXQ/CvvsIitdibZm6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IZlronUnfg9EqeJUczfpsJn6kqRj1t3fIbp6Ku2oz6mLRKOSafM5UwvCURFGtuDHhbVLrKhDJ8TBE5ZwiteCMh0k3J+RyroIEkHDSlZ2FIxq74X0TETpCbenwvNvmsf83kLv9Nash9MOnbPayw2PNKm0Za8VYLXdzN5g52wopUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWSBW7ot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWSBW7ot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EA11F000E9;
	Tue,  1 Sep 2026 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286876;
	bh=5scDOeM2qhPa4KBftGLW3kUfb5n5M+Rr0Iipndghb3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oWSBW7otqLwO4WDhCg0R8ft76iewOaChf52upowxk430FPWy6epOT9KSQjHIvrhPh
	 McdyTswaX749G89LB6vFwxiUjzVx/YCOVyO4eVoFevFr2jJDdJZiiOHQyMZEAQbLNl
	 Zp+Ff4eKTDODmVyekZQxLwOhwwpIrBZqC/vOSMl/e1anxz/S1zcJJsgP2RF0l6dtDv
	 eYzR4rfW73M0YWgLarktfqyQVB3bub6Idbfl1pefggKoJmhN20cceSfRgS/NSp4THV
	 jHR+WYCsdFFInhLGQ3fvKBsx8eVjGRL9Un70l7p4n+0FLloKwwlLTzqGJ4qeYM2M+Q
	 +d+Eg5N+6zWPg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Qianghua Wang <qianghua.wang@senarytech.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 bo liu <bo.liu@senarytech.com>
In-Reply-To: <cover.1788230065.git.qianghua.wang@senarytech.com>
References: <cover.1788230065.git.qianghua.wang@senarytech.com>
Subject: Re: [PATCH v5 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Message-Id: <178826652682.33904.8839852166083364252.b4-ty@b4>
Date: Tue, 01 Sep 2026 13:42:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7ispvR8vEMxAq/T7jBeHCcqREnXQ/CvvsIitdibZm6Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxeY/6F15F3SAFYDJbkswva5UNN5xtoNzwm0z
 aw+0rWaa/yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXmAAKCRAk1otyXVSH
 0LGTB/4o8hoPGVeNHAlUYNZBVbHcGdxStFdOCyCGIGxMhS/Rl9S3aI84UgK2LJZ7r8wCj5SRwD8
 qTTbkrE66fLSsGxk9muiECfqHsRZJ/X3jOZ4YVTw67emPQwFxRfdVfOmfLEcQiSOOe2AcwVS9XH
 oj6sAU97lnCk93i5ZogKhs3uG37yGUJ2VFMGuoosduurktuJaIXJ/YGdYXA6JpogLe9OyuGO1cH
 EB4UpNHD9/HfrUzMmyLUK7Pqgnm8wQ8Mil+8Go3exx3BpbYX50/8gpLBUpOgyB5Jq8PHL75VTAB
 Z888uSyfcYfbuHIkSAL4tW4+6u4M1KUXlNLnINn8bNyZ7EjT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 11:00:46 +0800, Qianghua Wang wrote:
> ASoC: add Senary SN624x SoundWire SDCA support
> 
> This series adds SoundWire SDCA support for Senary SN624x
> multi-function codecs (jack, speaker amp, DMIC) on Intel ARL,
> LNL, MTL, and PTL.
> 
> Based on current sound.git tip (249bfb5d8897 — Merge branch 'for-next').
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
      https://git.kernel.org/broonie/sound/c/12d9c9f8679c
[2/3] ASoC: sdw_utils: add Senary SN624x helpers and codec_info
      https://git.kernel.org/broonie/sound/c/77272ecd96d7
[3/3] ASoC: Intel: soc-acpi: add SN624x entries for ARL/LNL/MTL/PTL
      https://git.kernel.org/broonie/sound/c/32f9c551a91a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

