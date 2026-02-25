Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A03D3D06;
	Wed, 25 Feb 2026 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046419; cv=none; b=fBfx06/rgz8w20+XkjQPhEmRK0DFQG/KN00EYvA+zLLThGxweIvzfIff9tAxEbS70WQMNSLwX4bM8Yi2jE//cZ5ZvPcZUPoHT339CdEYB1Cy0ynSpJk4jYy2TRt2JkWVjWQv0QO1lnkisVU/67TG9camh0uV8w5zyD/mm2JrGNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046419; c=relaxed/simple;
	bh=/FEye4rNjs8Wwq+Ua5WTxJydlL/Isd3Pr3jCUPwBu80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uP9XH8EAW0Nchj0dyUDMSEtWXc7muxAegc0iMcRTQHON52OA3vbU5ccrWy5jdLJCyPHj27rJDdG7WjX4qCLUwadmj7Bq5KrFfmewBcjScKNJs0mf1GHXjQPUVOXYExBcI5i4vubIIg9jn0yKLzqxnJje+wsf8ah7qMD35mxnsyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/vNyNym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/vNyNym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1CCC19421;
	Wed, 25 Feb 2026 19:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046418;
	bh=/FEye4rNjs8Wwq+Ua5WTxJydlL/Isd3Pr3jCUPwBu80=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s/vNyNymqlMwFlvWvx3TPV4M4496/+jkOZ9y0zaO8mYpuCTXSag6opKK95xFUBSiJ
	 QWjpeKwrHA3ani+S1IHEYtkyqw8ROGrdG08gR3golJquMblvq8dEuHbjR1QlrjjdnM
	 iB8Gy5QV0d51KozQvHkTJRLHNYVWfzvNIeIlBtwXGkLShpL+H5tVdWcWACP9IoAWI0
	 DCDfD1Sib1qQmJLR+HjvfjlqonMLcqLl5rcLg3WGemz9GMvm4ihkXbcOnKmAwuGlnX
	 5AkREe56wDbTjgZmPLNommD57eZpOk+ZgPTd+X6amUhRDun4pXLL9Lp0P2cXSuwcfu
	 NyaaIEpSM3pRQ==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: SDCA: Initial support for Cirrus
 Logic CS47L47
Message-Id: <177204641724.168100.15814746388493184771.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 23 Feb 2026 15:02:53 +0000, Richard Fitzgerald wrote:
> The CS47L47 is a SDCA smart codec with UAJ (headset, jack detect) and DMIC.
> This series adds the initial support for the Cirrus Logic CS47L47 codec.
> 
> The soundwire patch can be taken separately from the two ASoC patches;
> there aren't any build dependencies.
> 
> Richard Fitzgerald (3):
>   soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
>   ASoC: soc_sdw_utils: Add device info for CS47L47
>   ASoC: SDCA: Add CS47L47 to class driver
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: soc_sdw_utils: Add device info for CS47L47
      commit: 80930d81c4b0753ba2ca750708e4d2fcc0627dc8
[3/3] ASoC: SDCA: Add CS47L47 to class driver
      commit: ada32396f90951e12465224c04742607ca56a982

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

