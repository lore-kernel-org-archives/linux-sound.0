Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD301B85FD
	for <linux-sound@vger.kernel.org>; Mon, 25 Nov 2024 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544060; cv=none; b=I1HzY4dRE67s8W16SY12kGh3yZ6O2LMZslca+7RkIQnU+bBBLSARdK3t97zoi2GQ6pRTDv4mmfzx8xYqp7cQKtK0on56tqmRFzk8bQ9TRb/YwXoexAvfnk1tJb9AMo2nqM9V8gxQRvKoDZni+BFEQEHv76GhZHHPFkr954qTRwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544060; c=relaxed/simple;
	bh=REtjjII8xDAfKDCpj5PHwsEYKtioLq32UlMmvuxkxGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eC/ksaPMlYaxa/cFQ6ts5UN7AtLrCJuM5BTR93OZwBE3rN6/k7uHQt9MsDomdh6XQ/u9mqztbX/pAbjeCPIGaS2pLr2FlNlPbn3e4oavGQuJekbfZgAse194/Gxt1hN52eTwppH41J0QZ5Kp5Xxz95xkjRUa1bgiB8+vglv7Pfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISff9Pv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISff9Pv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CACC4CECE;
	Mon, 25 Nov 2024 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732544060;
	bh=REtjjII8xDAfKDCpj5PHwsEYKtioLq32UlMmvuxkxGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ISff9Pv9hCRGSN4vz39HhvVLqz4SJUBjYHS6PH3eqF+/SiXu7YhOMPyM3hCt7hX8I
	 EFqXhHD0F4DdO+st/pSpfEonOQpbxFlrzenrCpjKvTKHeo88FXR3ac6ORbyFohLwAR
	 4OBQ+eelLsMmSjvZRLY1ujiBPcjnenkLQpwZdUFdMq/aDDk74zRjaUJcckAiNNTia0
	 LWCqC+PzSdsq/VxGO9cx23C4ws5DspXminUJL0kLAsKcGG/EPeOhm17z5ClBcyXbcL
	 9Rd5ilvmZlr0ddQxAd9SNAprBY4E4UdRSAO83P196JkK6GAPiSXFpRl/q3f5XMbIOp
	 bErc2om414+jA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>
Cc: 1087673@bugs.debian.org, Tova <blueaddagio@laposte.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, Jiawei Wang <me@jwang.link>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241122075606.213132-2-ukleinek@debian.org>
References: <20241122075606.213132-2-ukleinek@debian.org>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for microphone on Lenovo
 Thinkpad T14s Gen 6 21M1CTO1WW
Message-Id: <173254405872.44664.4835104843913013897.b4-ty@kernel.org>
Date: Mon, 25 Nov 2024 14:14:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 22 Nov 2024 08:56:05 +0100, Uwe Kleine-König wrote:
> Add a quirk for Tova's Lenovo Thinkpad T14s with product name 21M1.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for microphone on Lenovo Thinkpad T14s Gen 6 21M1CTO1WW
      commit: cbc86dd0a4fe9f8c41075328c2e740b68419d639

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

