Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209D335555
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539915; cv=none; b=d1RNhl3XL+tW7II2eJX6nn9M2NJ+3Jm/7NLaje5o+CGCRDhrdBQ+OYNucgMxWTWFBlLtxCbN/vMYpZCE0weTbHQB8NwRB07el55SnWyewGcxaUl1Q1SWSdKAYki/NvgzALsLOXpWrivGAkEJR2Ns0DXXhgeUDCLGiliy7k6CHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539915; c=relaxed/simple;
	bh=gALJhGlZNnSEMpB0RTOlG5PCw+UPQkhleN2tgMSnsto=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ox2OlGyYZ7ib1+6qoKiTrZEA+lY8GdgL5B9qekIrKmaTa9b/o0GgtPV7geirtiTcDCliXpa4tMlvOOkBubmK6wQpVvLJq3Bl6SePGgo41FUcG6x6FBfMBCQbBjF5nCoAOORlsaPkFyWdwYyxWDSHJAE9Wt6IpO1nnGH4F15m6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQFcpt0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQFcpt0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EDD1F00AC4;
	Fri, 31 Jul 2026 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539914;
	bh=ijb4I5dimCIAIrSuTOQgI0Jp49agS2HUqRWkUxuUI30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dQFcpt0KLzQEmBV8iAdYaoDxo5cHvCU4oCe+Qr2FaK1fb7WB5s00+kpdNgfLRTZUo
	 wk7doQxd4tx30Ucei++9XPDpsMktUMcjryynBzJovOJe5jMcAE/AXspOXwvBMMwlx9
	 qG+yz7LDyOHGUMRR6djY2Ol8/qIIvCTsGw/fsinREK+q3L4LOI1uRAc48vWrqLuCBr
	 dzxt7Fqhu0QeMsjKpOw015bYVWbUAO+xnb8v0UuREbzvjigWdbNLth1csRaNp/bPKC
	 VKCW4zbuti/U9goHCwWgPnchhVXJX59hf+o/9GGdgmnG4/kpftQgmCzVcvWCAkDXt2
	 6QlfqLQGTO6hA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
References: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: hda/mtl: Handle powered on DSP
 on boot
Message-Id: <178552636275.353541.17404393156342573074.b4-ty@b4>
Date: Fri, 31 Jul 2026 20:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gALJhGlZNnSEMpB0RTOlG5PCw+UPQkhleN2tgMSnsto=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS1I10lYACjZt7d4J6szGzNG1o1Nj19eHxr0t
 8k0JctmwmyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tSAAKCRAk1otyXVSH
 0GJGB/9CrcXpRASz9gH9g7SfrCfz+kIFafGlz6UJrhR0w4wpsktjXykfoANH3sIU+TG+aQwflED
 NOT40hhwYSb8UoAgd8H2hhIH+1OARyMu3u4jk89vkxoLEMChTihyuSaCbEhv1qAPCc8fcXiMRbZ
 d4sXIVd7/GQx91m6gWD+N4WDioEIdmw/7bCn3CRUiu/nfbvh6W9PM+HcAJW9Zi9P9cOyI5fCPtn
 yhqILN/ViuvtTkpWgCxE7c0aFSXKOJ5ZT70kVdFS/GOL6PgTuuYXvZSXyWM/ndhsHBsN+MOuG0+
 zoKXZQdV9TZ/Q6j5vVYD+20U747o2jg0XcN87Pbc9AC3RQhq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 15:28:55 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: hda/mtl: Handle powered on DSP on boot
> 
> Hi,
> 
> It is expected that the DSP is in power down state when the firmware boot
> is attempted.
> If the DSP for any reason was left powered up then the DSP boot will
> fail since the ROM boot sequence might not be able to run.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: SOF: Intel: hda: Power down DSP if it is left enabled in pre_fw_run()
      https://git.kernel.org/broonie/sound/c/7b51d4c4256c
[2/2] ASoC: SOF: Intel: mtl: Power down DSP if it is left enabled in pre_fw_run()
      https://git.kernel.org/broonie/sound/c/31fd7a0bbfa4

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

