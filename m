Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5D20E704
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660893; cv=none; b=KCUSh9CXj1RomSddGE0N983JG9O9U8WitbjzSFyGbUD6Uo6dLLdmXFRO4pEvAeCZg4oh3pKSe57z96RZidNzt8BJEYOd/qrPa1sef5L7yIiyGlL/c3U5dybbtMuMc8v7snsL4/D4WivXvYuO724Uyl7GdAkFHsL+rZCnxvhatq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660893; c=relaxed/simple;
	bh=cO9vQTqpHVobB2TAK7gdO57gertQY8y3me8rxIn/uRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gvfjvpJZ5QM/bAdTJqeupzpKYMxVZsLeu2RTAH6CAm4vvyTwmE5Cf9LBGB6p2AeC0QbeLM9Xiy4s8YmTu7n9kgktj3bLMuGiCo34PBoQc5vH2cVDF6KCTn+4nZQHHDYsKlaAADLfZZh03lDMU2x324x60g08eWNoziSCCk5KBMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGihETtr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGihETtr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6593FC4CEF0;
	Wed, 16 Jul 2025 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660893;
	bh=cO9vQTqpHVobB2TAK7gdO57gertQY8y3me8rxIn/uRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qGihETtrYV9cCLoplUG/pgR3jkthS24rjMnvturOrQba4ALlSrwz+WxWgZni3lK1X
	 c4tRT9xf6Kabeh2zvdjtdVE1gXNN1oxedSw9eg/VeeU+Z+2J2h5/tqbBMwNfh0a3jk
	 r3heJe7+p/wOko/D9/X0B/sFciLvWLeGVQLMvmtxotifxBrUAzqLdmaQZ684YBpndH
	 tTjRwXgIbeyxU1RfsoSNh5f89jJIz4l8GubgTxv6UaNGJCkYncO7BkPj/KpDlSY5En
	 PfaxTvd5cjec7auhS62FC76JQWeVOvq5UOtHIUn9WnJXcZlqcmqKHZfPV3ImwIYCrq
	 RND4fZ39XGKKQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 dan.carpenter@linaro.org, shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
References: <20250715151723.2964336-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] SDCA Bug Fixes
Message-Id: <175266089005.17737.13667592331155056358.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 11:14:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 15 Jul 2025 16:17:20 +0100, Charles Keepax wrote:
> Some small SDCA bug fixes reported from various sources. An array bounds
> check, an uninitialised variable and some memory allocations that should
> zero initialise.
> 
> Charles Keepax (3):
>   ASoC: SDCA: Fix off by one error in IRQ bound check
>   ASoC: SDCA: Avoid use of uninitialised local name variable
>   ASoC: SDCA: Update memory allocations to zero initialise
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SDCA: Fix off by one error in IRQ bound check
      commit: 3f2e4c11925ee24a34853b0d608ab85df2430555
[2/3] ASoC: SDCA: Avoid use of uninitialised local name variable
      commit: 71562278a189af2ca202eafa0ab71a9b68469207
[3/3] ASoC: SDCA: Update memory allocations to zero initialise
      commit: 15247b5a63f506125360fa45d7aa1fbe8b903b95

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

