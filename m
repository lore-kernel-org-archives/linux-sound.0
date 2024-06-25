Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2112116EC10
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 14:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327247; cv=none; b=qnf7rKP19GfYdPGNs1cBb7qmZGRK8bKh+yqAvLv+oAyDS8qxWixY1okUzKfBCD4HSaBzc+ruOEgnymm+rY8EC5azmsttw9Mf2g+vYg7QqGzihw62Ib6t2SONqTqvD1KRPpnoDJECgT7OAGq1F/5y+Cmai18ZH9MfIVYxRlFmPFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327247; c=relaxed/simple;
	bh=mdZiK8d9QoIIdJ0nYm+jl/RjMRCkckvuLLtabM4OezU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KU7ELfARqqPHbHKWTCWSzyGBouKGpPTJ5kiY76qzEEjf7krOjY9C9Z8PUBeOThpF8q5K+NIKRhMFGmpP3KjyG6CxzI18tNvbqAo4OGjyAv47BgVB22ki6gw1tT4DfIsjaxh3XDw91D5NShlr/u95gZDmqMcJNEhzXM6Vd1HAUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRRmEy0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRRmEy0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF7C32781;
	Tue, 25 Jun 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327246;
	bh=mdZiK8d9QoIIdJ0nYm+jl/RjMRCkckvuLLtabM4OezU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CRRmEy0OG5O/5UcinGwWCC1am/MuTzcmoS4kWAa/isyivL5B9Zw0VO34h9X5ZhF93
	 mDtQfKVruBtOiwUH30uK17u58xvaFacqawac6qhia0Jkq59+Gj91W2oBjwDlo1QBTP
	 uVnaBFzirNKu8sypqRjyAHgb0BnwtMrpUO21S7VALFYNsZx/BKk8JAIPlYpbJx5FmB
	 byuK7+/Ch2wck/CRR0rVVKOM74ebOrQukn4AIL52Po++rk4Ss6kP6s5kp4AkwI10G0
	 VjalAGTD2gf9YDyDcTpceFQV9i0QXWCqcuMD8ekU3Ut0ihG5kvtrSjNf7oko+I+UW8
	 FH+pWE/eCdQuQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: boards: updates for 6.11 - part2
Message-Id: <171932724503.283378.14511701134846780263.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 15:54:05 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 24 Jun 2024 14:11:15 +0200, Pierre-Louis Bossart wrote:
> Minor additions and cleanups this time.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43
> 
> Brent Lu (1):
>   ASoC: Intel: maxim-common: add max_98373_get_tx_mask function
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
      commit: 65c90df918205bc84f5448550cde76a54dae5f52
[2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask function
      commit: e364ffceab9252c06388727250d7583d6e0aea87
[3/4] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C
      commit: 92d5b5930e7d55ca07b483490d6298eee828bbe4
[4/4] ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43
      commit: c073f0757663c104271c8749f7e6b19b29c7b8ac

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

