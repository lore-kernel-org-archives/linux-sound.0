Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655431FECA2
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733248265; cv=none; b=Qpc/15CxHcWxlmSGaS7aEbqvdjNllAvmMyfWX6rkPwTBT7oZg6ev1lZWpWBqLcJsAoiLYHNl1gEMlEo/HdQshGRxQczyxBhybsqdnncCkhJ+fBzKzhAEYf+n11i08gm1JB93Jx7Otwd8LSU0roSJY1W/OuH6L11AY/jfOJhWI+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733248265; c=relaxed/simple;
	bh=ufPUf30c82X2AwXcoT0hKQsIMbDDC8zQtdxEawW/jg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S+kVup3yJoSDBIkuOb5bSYs+CyMgIuW6b6kTBoyRZKG7sJa3q1nYWItd93Xs42d+uiMZkJY/gR5wu2/PfpuyamF4nhv7A6ombCAc7oS88yzrb4VCyjFleroY4W+5Fryw55oeM2bDF5ZZ7XFY5hU1Yr1WEaOFY97ps1MjD0kq5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekBvTnX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekBvTnX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD204C4CECF;
	Tue,  3 Dec 2024 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733248264;
	bh=ufPUf30c82X2AwXcoT0hKQsIMbDDC8zQtdxEawW/jg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ekBvTnX3xNc4T1kzsDxuL7xrXIhMdy2HBMyk+nSTMYiiL7OaDzxUvkHPxc00YUd8K
	 hHSO4E+tuGRygCv6lOL9iBRrHoL9aMtf/2Bqm/zb/cTReDDfAavTZ2AtdfdpvAOMou
	 UcGUM0p7XTiIvDAE5h1/bDiOWNl3x+cpVaxWbbGpzv9/+cBQQD4BnQ/ey2BlEy+HfX
	 JAcpHFaGFFVz+TIJw4IeJXyGDenwy7//IPoQ6krM/bko5US+Bas07DN8CtrlEh5KSJ
	 3O0fhdXKcqMnVhZBmOyjxeQ06p/S4tl7q/xIaP7s+LYBzQUDPFZYL8HQ0t7ihUeRXm
	 DVxLkfNMuiu2Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241203104534.56719-1-yung-chuan.liao@linux.intel.com>
References: <20241203104534.56719-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Splitting cs35l56 SoundWire DAI into
 separate playback and capture DAIs
Message-Id: <173324826339.459040.14094846078131617564.b4-ty@kernel.org>
Date: Tue, 03 Dec 2024 17:51:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 03 Dec 2024 18:45:32 +0800, Bard Liao wrote:
> This series prepares for dissimilar aggregation of CS42L43 + CS35L56
> speaker playback. The CS35L56 SoundWire DAI is split into separate
> DAIs for playback and capture so they can be routed and aggregated
> differently.
> 
> The cs_amp driver is also updated to enable different TX (capture)
> slots on each CS35L56 on a bus, so that the captures can be aggregated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l56: Split SoundWire DAI into separate playback and capture
      commit: 5547e7ca122081d0603d2d7e0fe81a7c551f1e11
[2/2] ASoC: sdw_utils: cs_amp: Assign non-overlapping TDM masks for each codec on a bus
      commit: 484c997e03cec04da6f69c2c17e854b22aa0f98f

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

