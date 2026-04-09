Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6015242D89;
	Thu,  9 Apr 2026 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772198; cv=none; b=FJdZvLcApKLBgXsxZegzCeoLjbeYU7/CdKL0E2ixg4fsLYsYfTfemz9HPSgJn2dUHGtbzQE/jWgsdDl5hgo5gx86adGoAZjLth5qBXy6zETHQIwCb+bMxgrImZvaWi5aTHw3ZHuVxn0d40lEwoIUCLgco9DS8i8uK4PtgfWjdPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772198; c=relaxed/simple;
	bh=DqAQ00bXAECO5/y1t/3SIEc/fsjE3FVu+Xjf6Pfvdds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LZo/G23jCgxBjUgwfNju5FSuyJPA7t246NO/XPqZMPLBKNkBzmwwcAgQYz9bWRt+nJ4kCXegUUVHF5L1f2rTUUaX1SHY8rNpKyf5L02bQSvCgcTYt6Yc5PeU40mxT3Kz2M8MFXT0wMCqA1E9d92H0PhSV78OPpUbNdGrce9FmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy/W+nlk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy/W+nlk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6B0C4CEF7;
	Thu,  9 Apr 2026 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775772198;
	bh=DqAQ00bXAECO5/y1t/3SIEc/fsjE3FVu+Xjf6Pfvdds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sy/W+nlk78lStKycl3Y+OZLnqB94rQ1jVOp1amc9/mwKsTUbrRqOkbsK7zcOi9oGn
	 WYl9W5g3XswmZb/dV9XDC77pn2zShI9zTTXrLnVPoWHsHErRNzXjwWFzMDTpYurm5u
	 H6ySPDhGb3Dn2+tVcLiy9GOCsKpD+DdVm3M3Sa8n+2c5mS3scEtvLnjtjr6aQgMez5
	 iCk5lFLQRm6V4l5Nd1hXgSEowW1nFFvpMrqbjfBGHhHUfHDIOy+dKllnbChmAcUwHN
	 3tTkGoIg2VyLimOA5jjHzb74JqT2uZEiuzDwCm8lUhw6WyeIhFeZItk+3xCf4En/zy
	 w63VacVeAM/2Q==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, aravindanilraj0702@gmail.com
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: Fix MCLK leaks in
Message-Id: <177577219559.1062739.10392728146313003975.b4-ty@b4>
Date: Thu, 09 Apr 2026 23:03:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Fri, 27 Mar 2026 15:29:59 -0400, aravindanilraj0702@gmail.com wrote:
> In three Intel ASoC board drivers, the EVENT_ON path in
> platform_clock_control() enables MCLK via clk_prepare_enable() but fails
> to call clk_disable_unprepare() on subsequent error paths, leaking the
> clock reference.
> 
> Fix this across all three affected drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
      https://git.kernel.org/broonie/misc/c/a02496a29463
[2/3] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
      https://git.kernel.org/broonie/misc/c/b022e5c142ef
[3/3] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
      (no commit info)

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

