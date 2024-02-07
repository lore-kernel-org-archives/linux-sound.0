Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C37FBAE
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707319417; cv=none; b=b4KL0kGg60slJRuu46VjoEaC95ObfZdY2UIfag9U6UTwVlG/WrctsLg+AMNTgbDElL8G41ZTewoygBivsbKKYNA0eFRqXBq6ynw87yzME9K4vOVAcBME16DI85Ku4DGiyz8RqZRdPL73ZcRSxk5u9OBdqKCNKGF8OwgxpvgDEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707319417; c=relaxed/simple;
	bh=vCIUvcs2yJHC3pfB3WGhxcNTY9rCr8WkfWcd1WjOEK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U2OQDA2bOXnzAYODHCWqXSRFEGBwa8Qdqw3cTHDzo4sAILrD2HT9tQZbo45US99VH6kRupICUB5Yq2KsKDaBqyeeI29/yhmeiwS/hzlAhf5XGAprY1Vogt5DI4fO9j+sKzW7/oGSzJ/bWdIhksaf133JmwIFhrYG4qmPofUWKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr5j9RH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mr5j9RH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CECC433C7;
	Wed,  7 Feb 2024 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707319417;
	bh=vCIUvcs2yJHC3pfB3WGhxcNTY9rCr8WkfWcd1WjOEK0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mr5j9RH/VKAgsbrhCSoaG/FBWjJzRaRIYlRje6KNcFueNqWa0cU0srhbaj6vgGyRT
	 MCXLq1Xe9x0hp6xBr9/aBMccyLzr4hsdMPhJzyGHecLSAdTHUbN4QfFdGFohqRhU8t
	 h9nSX6fmvVFGqUQHm8vBStLg+Y+S0OnbtXni3ovHe+uf7VwKiYdE0xOMGhhql+L2ov
	 qgMGzfCt5b59PraNxoj86R4jW/ONM5VWyABPMXIReVWb1+fPvH45f3/oH902s1XzHl
	 fngQYFsyzf/ChvqmZv6z3xI7GvWuuKye4OgwZzQWzsLr4SlhnbSKnEtQqugNWMcH3M
	 PvdMaZOM3Is8g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
In-Reply-To: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
References: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: cs42l43: Handle error from
 devm_pm_runtime_enable
Message-Id: <170731941619.1063747.5587451866450239802.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 15:23:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Tue, 06 Feb 2024 11:38:49 +0000, Charles Keepax wrote:
> As devm_pm_runtime_enable can fail due to memory allocations, it is
> best to handle the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs42l43: Handle error from devm_pm_runtime_enable
      commit: d1722057477a3786b8c0d60c28fc281f6ecf1cc3
[2/2] ASoC: cs42l43: Add system suspend ops to disable IRQ
      commit: 64353af49fecbdec1de9aadf2369d54fc00f1899

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

