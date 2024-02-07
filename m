Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3A1B7F0
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707330056; cv=none; b=Mon01/xNbFBv0gRz7U3KMC3uKdbhZnNDyON1QVHLwuDUjE6PoD0AsaiCBGQb/0/Bts4ufJFkIgGt7940kyNQsVW/NL6hpazAWBjF64ze2t0+Gt1UHGHbonO15nb+Sgu/vxl7CMSYkJ5cowJH+prvGyAWUV6hqem9JIYodY6jxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707330056; c=relaxed/simple;
	bh=LjIOymK/Vy7FWS4jPhrrgivRkilFwO4SrSSN6Yk03O0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pJJztFET27LpQNuL1BTgZPeTaMnWj7aVOKr58E4Glo7UdLax7TKLdsxkSWfw3n2Vh5HRsV/tA/z00JFpvmUx8awxWEa+Jo9+YAD1Re6/w86yy5iLWPBrsuDKUnNydnJefK6GHhHa3Ezi+r5vLCscvEktVq62vM2EDONfyAY2oho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4B2I9D2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4B2I9D2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FE1C433F1;
	Wed,  7 Feb 2024 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707330056;
	bh=LjIOymK/Vy7FWS4jPhrrgivRkilFwO4SrSSN6Yk03O0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R4B2I9D2oMeFxgpEY8JHVhpzgKwGXmaytr3RXBAbpdg2bPNlM+xKKtviP0UL4A5aX
	 gnSdirr8I40o4fhtDJzPXSJBugu7Ry4dYBLZCj9z8D2dYjQOmNdcpqvZZYix+GL60v
	 KsOMAi8XtqlpTpeYOyTZjRqtRl1Mz2/gXWsDmU/xCFqf4+8RVfyflRD5nBmo8F47P6
	 OfNp3YEM+aNayezAsQwhmxC7aF+Wzlc6V3behshMS9eNX5rw8K4C4hEgUUhMJMyBNS
	 jnVKllF6S4QqS/2BK7Vlcit5s39ye2RbShBUsDEJyWvyBf4y4VuXhMAZhVD6UO6l7w
	 6wdoLNAYdCLDA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240207112624.2132821-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207112624.2132821-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix dynamic port assignment when TDM
 is set
Message-Id: <170733005311.1096695.171681514834542195.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 18:20:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 07 Feb 2024 12:26:24 +0100, Amadeusz Sławiński wrote:
> In case TDM is set in topology on SSP0, parser will overwrite vindex
> value, because it only checks if port is set. Fix this by checking whole
> field value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix dynamic port assignment when TDM is set
      commit: 44d3b8a19b91cd2af11f918b2fd05628383172de

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

