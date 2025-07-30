Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C4174EE4
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891394; cv=none; b=jw8UQRERH14XwsqhkgYuRdzYgh0wKuBMrXiEuLIWXOAxVdPglZ5WAJ6GVZwJfMKiWWmnqZSoA/SWO1Z+ZFajErsGOcwzjfYO0xc84T+Y9oi4dGxU3Iew6Xl9l/lf6dxTHke1weaWCOtVPC74UZk89m2fSM2pQzGutk9Fo8MYe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891394; c=relaxed/simple;
	bh=i/FDX04wxLXORMF9c2NGunme6vD2fMGNz2fBGZBjx3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t51F98P0Kz1zglTOmULsMbOwUBUl4xVaaRXwldLOsu2efvTgqrfdUHc4ziNGAugZgKSalEflXFD9J+XGksic4a85YXV0vPEc3vl9DCjg8h94nMSQ5AeSMJNvMkpJcVVTzoBuU2GTkBJBR0+4jnTz+OmKVGrgXOrLYt6VQmmQsrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAdM9RYt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAdM9RYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0E7C4CEE3;
	Wed, 30 Jul 2025 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753891393;
	bh=i/FDX04wxLXORMF9c2NGunme6vD2fMGNz2fBGZBjx3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LAdM9RYt0SxP1e6HXjZlWrSRJ/DPLFRK0tk9XrtjfXPh57imdD3RjAdGI36p1x+ut
	 kbXcn0LdkeqLCuc1RmYvB5ypf7HolATvBvPPTuz5iO+UI73jIIIeLb65FN3SHqcqrI
	 GyJkSdXmorI5Bb2lq9zPk7KDVkD9X0n8c+DJ/OUy0c0hIMeZC0BvLXY4aKl4x7B50t
	 ls1riiGX6TqcFLZ7vfXUQxZKnTsquo9LiPqqyp3ccEW3HNvpWheZlSztlU7LqIAiKS
	 J911WquTxn2rMroWll48t9tl8qCdeK/QfODOqn+ekpTKSoXLE84EUanryKw1c4O6cX
	 ZhrmBTeYnJFEQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250730124906.351798-1-cezary.rojewski@intel.com>
References: <20250730124906.351798-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Fix uninitialized pointer error
 in probe()
Message-Id: <175389139230.54882.17937441716269747152.b4-ty@kernel.org>
Date: Wed, 30 Jul 2025 17:03:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 30 Jul 2025 14:49:06 +0200, Cezary Rojewski wrote:
> If pcim_request_all_regions() fails, error path operates on
> uninitialized 'bus' pointer. Found out by Coverity static analyzer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix uninitialized pointer error in probe()
      commit: 11f74f48c14c1f4fe16541900ea5944c42e30ccf

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

