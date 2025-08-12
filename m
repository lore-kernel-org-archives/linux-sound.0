Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4027EC7C
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015824; cv=none; b=LVH6v1C6qMaDnNilzKeWlBCKAAxNAa/pesJYSztXGYBur+5P5482eWROUCG2208fGw49zgn89BTOdWKXvEb/aVy1heDiEoWNP208qif0OqqPZ2FYoGBUFN7NcnCIKvknmmAcHD11KMZI5kNfZ1MEqcLLj+dO2LOJyOmxfeDZwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015824; c=relaxed/simple;
	bh=zYqxIZThjJSMneij8xZf2a/Yz0223DzDnHCuumji2CY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H96VVTEBIFUmB60gqEN68M3/mZ0xvAOxzv58oUxWzjWhZeXHGy9mf+MVpG/+A67eLMVAelViXEaWteMV2RJVFyz7gjU9FREwZcK+OssfH44wYSIK4VsnAeDjcIkwi1lrOHhdoBaGd/yzlFfnD3L9ExGT6Pe0eap44b7dZIho8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFPvsXBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFPvsXBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6B6C4CEF6;
	Tue, 12 Aug 2025 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015823;
	bh=zYqxIZThjJSMneij8xZf2a/Yz0223DzDnHCuumji2CY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mFPvsXBJM/v+/82jsv5GbGjsJKqGodFCQGI2zjYh+jUNqCpi3XCaM4NN6puSSPrsD
	 lv5kK9z+7sFXqTXbbPbPURLQPmbMmBy8SEs98w9T3L2nGP7mV27mcTYvzy1uowiUp7
	 /rQklkL+1Yi4QsDg3EPbn2dSmfOOI272Fb9ESItggkfBwqiEBIpYRCvCEkeAwOED9r
	 rHE6gGZ5LBoxbo5zhwv1UsPN6A+ICzIRE4cF3SZGvCgqmoit8HlFHwgTabfx8a6YFF
	 6ZsfSjrMUG521oVPSV45FHm2NfpKUTWxE9EaCnMxF0t6S1wpW/eI9uE5fqB/uVZkda
	 D6rDfLl/tSHQg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250729130633.310388-1-cezary.rojewski@intel.com>
References: <20250729130633.310388-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Conditional path support
Message-Id: <175501582264.192378.3652969856137595817.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 17:23:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 29 Jul 2025 15:06:31 +0200, Cezary Rojewski wrote:
> The code presented here is a lighter version of what was initially
> discussed in 2021 [1]. Later, we've had a more general discussion [2]
> "what if the feature was part of the ASoC core instead?". The discussion
> turned towards leaving a simplified version within the avs/, so here is
> the final outcome.
> 
> What's removed when compared to the older [1] version?
> - conditional path priorities
> - conditional path overriding
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Parse conditional path tuples
      commit: 8bcfcb3bd3e38b8f3bb7e5eb3acb4120500994a0
[2/2] ASoC: Intel: avs: Conditional-path support
      commit: 595b7f155b926460a00776cc581e4dcd01220006

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

