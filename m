Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029F1DE4CC
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391913; cv=none; b=dNV+s6nr7h+icJPMgPjyz/At1g3TkJkvnQxXlNL29LX0S7z5M1HUKJTDL/UKNVNlIs9X8uPhZeJvuGxK3RGZ5usGgtPpotEA1rJOih/HI0hRtpZ2/iIWNyp1Y6ZRVSO3Ru/+Ufpg1XXVKU+IIOIw3eBN0lRENouDmD2gtTVUDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391913; c=relaxed/simple;
	bh=9r4lgL2sInxKXsJRAoc79I41tuRjI1KkmiuOHJNwcJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wulfs0F2cYGvyBzkBPSuok2iiLHMy4aoMOqyDF/vtxvwYr0D6Esa1nHB4AGpbxKf1Aji+1hedC0rgIgr+wkLOpoABZps69NI1zEzbQVBUNkCNNmzqCwFVhT/bxQ04D57dMm6Gy1ndkIyiTqtukMDdo6EaUR6JvWYp360sV0Fv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDGjXA4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDGjXA4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD08BC4CECC;
	Tue,  8 Oct 2024 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728391913;
	bh=9r4lgL2sInxKXsJRAoc79I41tuRjI1KkmiuOHJNwcJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oDGjXA4d4yVMogtDSez7aznc8u7SqreFhzFuf6s1C34Q9lzF3tlKWL/+m0YmB1Z7i
	 GHt+L3A5nuX38y80corkOMHKG7MgsO7O7tCdHpGRFUisGl3R0FZQYBTL4XM9KOz9yx
	 lz6Dl0vgejXrNyPeEaR5lNrE38wFfw0AdT/Hq8v14e+G1K2RAV3YX/tG+sWpCMCOr4
	 aTem7Fjp71MhPhnSQ9Zr9Nf/fN2LKudWzxSSsrhpMRjQwfOLYjS6Cl929XMnWZvG7/
	 2HnsLUNGnvrxmM2Q1codernY4vVVmEukpDAlPkBLGqCl0YPQiqyJ/mIdFO0FUbbX2w
	 9vc/mlV/T7dhw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20241008083758.756578-1-amadeuszx.slawinski@linux.intel.com>
References: <20241008083758.756578-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Update stream status in a separate
 thread
Message-Id: <172839191060.2607981.6736152278011038099.b4-ty@kernel.org>
Date: Tue, 08 Oct 2024 13:51:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 08 Oct 2024 10:37:58 +0200, Amadeusz Sławiński wrote:
> Function snd_pcm_period_elapsed() is part of sequence servicing HDAudio
> stream IRQs. It's called under Global Interrupt Enable (GIE) disabled -
> no HDAudio interrupts will be raised. At the same time, the function may
> end up calling __snd_pcm_xrun() or snd_pcm_drain_done(). On the
> avs-driver side, this translates to IPCs and as GIE is disabled, these
> will never complete successfully.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Update stream status in a separate thread
      commit: 0dbb186c3510cad4e9f443e801bf2e6ab5770c00

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

