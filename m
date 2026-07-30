Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D043CE0AE
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498367; cv=none; b=pQHvi4yicjrgVgP9N5jlnyn79k41GggOur+CGPW9tTRp3JdUu9hi+hGA5k+tOJKg//RoifQlwNLw9xvsuzISLFV8A2L/EWqzNNg15/WIXsqBY5gDArDf8+ybMTZbfvEgY+NyXYe7cbsjDY6jxM/ISfU045TU3qKKlO5cF7OJuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498367; c=relaxed/simple;
	bh=nEzxWlXyxoT9uU0y6LvDNHNUm/M8pMl/AKblRZlK+qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FbuGkiv1aYksnVGD3CS3jTFwyeVxXSnKSXnhwmykB4yT9uNEaAJIc9XmNpIMX4tK5G1SPZkYN/DvHTmBacl/jR5cfgRp4z0jj3p0m2ADghY1699PHqTRCCX91K1uYFeGD0A6QcSTaIZHQiuynhqB2C71x/webzWWKWnLLWuSK1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjziecOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjziecOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035211F000E9;
	Fri, 31 Jul 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498366;
	bh=P6vhrgK4nDWCDJrjHYPgIgjohHW7szSHCbcDVSEHuu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QjziecOZOWV6u5+NUh9G1YtgpXWCM3hulZLstfqxMr4pnwYeAyvu7JPNZHFKYR8uW
	 pLxTIKOvMKdpU0NhYpsBd7abXKFBvXw336ywYBL8NzQQ3Qi83rpnjvndpNfVmsWKe5
	 /OTQ9bD9htbW5DK3HKERRbA59mg13P8teRQL60//aE6JTrEOjv88OX82PFwRWr1YVy
	 7ixawsmHQ9ZMMwmkvIP5pehngOnmR/CxZcjvlvYJVTPiJz0Us46BhmahC5HczVIgRP
	 3wyiQl0lNVWIep5FoW6RqSL0MIndlA44ui0687gUSXbWosyZM07BbZWO4cbpnmr6JD
	 nuVwoxUHuZS+A==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20260729110057.342447-1-cezary.rojewski@intel.com>
References: <20260729110057.342447-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: catpt: Code cleanup and renames
Message-Id: <178544708806.556383.18431104219304582715.b4-ty@b4>
Date: Thu, 30 Jul 2026 22:31:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 29 Jul 2026 13:00:49 +0200, Cezary Rojewski wrote:
> ASoC: Intel: catpt: Code cleanup and renames
> 
> Direct follow up to the cleanup from June [1] and fixes from May [2].
> Patches 4/8 and 5/8 is what I actually started with, several years ago
> when doing first attempts in addressing the long-standing problem [3].
> With these, it is easy for a developer to move between the driver and
> the firmware repository.  A clear example of why naming is imporant.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/8] ASoC: Intel: catpt: Wrap the store firmware-context procedure
      https://git.kernel.org/broonie/sound/c/abc7daad426e
[2/8] ASoC: Intel: catpt: Drop redundant else-if
      https://git.kernel.org/broonie/sound/c/05d3ba625802
[3/8] ASoC: Intel: catpt: Drop redundant signature argument
      https://git.kernel.org/broonie/sound/c/f6c65bf0acc9
[4/8] ASoC: Intel: catpt: Rename module header struct
      https://git.kernel.org/broonie/sound/c/71d1229972e2
[5/8] ASoC: Intel: catpt: Rename firmware loading functions
      https://git.kernel.org/broonie/sound/c/e692a538a421
[6/8] ASoC: Intel: catpt: Streamline wording of offset variables
      https://git.kernel.org/broonie/sound/c/ae6540c4909a
[7/8] ASoC: Intel: catpt: Streamline runtime-variables naming
      https://git.kernel.org/broonie/sound/c/a0acf55be734
[8/8] ASoC: Intel: catpt: Streamline control-variables naming
      https://git.kernel.org/broonie/sound/c/4075b9d256ef

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

