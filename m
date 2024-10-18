Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6ED76C61
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287039; cv=none; b=SuUeVEyAx4Pl9Z91p3FKkjrHt/Rwdm85EQrWkcfPR8Dj7B13YUEpGnNgQHSOhOwvwY7v/Ca1Sm7NTu6gtWsvFwPYSUc2ClIu/Ss1CR/86oiYk9gLon5TSgcYK4M7TwTHZru2igwPEO9dyASK8ZD8HuPpkBlzF8K4G4mXY6N8tIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287039; c=relaxed/simple;
	bh=6j38h6qJREC/2fSXqR4+0FmmmVdsczDO/Zu/mU2rBuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Moh2j99s7Kd4d3Sm/lS9OD4enig6c3AXMJ39NbvkIupkZWx4wk27eV6lH5B125WB5laP6sxyLORV93xttr4SWlFhkPrRl0s4mvVk6pz33l4ClQm2tCdwq8UvuV2zIWZfifT2wt5TgQlYvqtgEIIxKVFYShFD/YgDgNuWs2Pyzug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOjAFynC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOjAFynC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD12C4CED2;
	Fri, 18 Oct 2024 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729287038;
	bh=6j38h6qJREC/2fSXqR4+0FmmmVdsczDO/Zu/mU2rBuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VOjAFynCNeqmBVMOWYOI66KrPJEvEkrDJc9MrRbSXTqBjc8ta68b7TQhJF8sLWejr
	 2oFo/He3QKKKKbEXplqstRYYWXxguR8ye8WJuRxMRIo7LHUtyelmls2V6e7JQoiUfk
	 +nlxMht02nrGLD4vZM8XBmb1nZwLdO54S95nsaMmbctfVY3CcFjMkxwgVa5pBYBzIF
	 ySA9Zkjvz2IsJ8XKt6q/8894EG7Y7NzdfZ2Q46PaZ2PFTyqCVI5wh6uJkzQCXc+IqM
	 ZpvkZuYJMkMB5X0MHSwdjsRWDMUPAgn5xTKk7OUOi2CL9j9kXnBwXgeXdAith6+ueE
	 3AYV7TNUGuonA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
References: <20241016030344.13535-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: add support for some new Lenovo laptops with
Message-Id: <172928703735.212383.18386411310380643193.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 22:30:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 16 Oct 2024 11:03:40 +0800, Bard Liao wrote:
> Some SKUs are using host DMICs rather than the cs42l43 DMICs, update the
> endpoint structure for these SKUs to remove the DMIC endpoint.
> 
> Charles Keepax (4):
>   ASoC: sdw_utils: Add support for exclusion DAI quirks
>   ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be
>     ignored
>   ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
>   ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: sdw_utils: Add support for exclusion DAI quirks
      commit: 3d9b44d0972be1298400e449cfbcc436df2e988e
[2/4] ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be ignored
      commit: a6f7afb39362ef70d08d23e5bfc0a14d69fafea1
[3/4] ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
      commit: ea657f6b24e11651a39292082be84ad81a89e525
[4/4] ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops
      commit: 83c062ae81e89f73e3ab85953111a8b3daaaf98e

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

