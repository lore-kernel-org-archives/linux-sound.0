Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF639ADE
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8dZ/l6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B202C433C8;
	Thu,  7 Dec 2023 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701951179;
	bh=UJfCLWvjaeHxoaivKdYpO1tpsskZ6FpSSxamVKiasE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G8dZ/l6Z9IZjQ+2DP5+9K5RXxEmH9fxYzcEe9AoRNKZv4bF9+GvJHmzxdCTmP1tvM
	 ZzjkDo6Jr7WDY1OWm+XlP/6LCfSoRZPfR6qgfTBAgDrxrb7+b2Od+KYoy7z/SgNbSU
	 oeZy4KTYtVRQG6NeiCz2raSVdytX8jM+zM70UHfp6Fv5WU7Raad90OSZCqIkKbPeaz
	 IMN+qMy5L0SK2KMXmPevZ7F3lkG3BZPkdF9v0g4Pw7kYGbdyj2ln3gfSx+idPHbhZd
	 equqxlAKq1yZ/ElST3Bj5jY1Ls22NrbdftKsvonhSeLW7+59OeN6PY2eP7DK9o07gr
	 z06zV/biXLt4g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Marian Postevca <posteuca@mutex.one>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/7] ASoC: amd: Add new dmi entries for acp5x platform
Message-Id: <170195117702.26874.2167949057088662653.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 12:12:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Wed, 06 Dec 2023 16:36:12 +0530, Venkata Prasad Potturu wrote:
> Add sys_vendor and product_name dmi entries for acp5x platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: amd: Add new dmi entries for acp5x platform
      commit: c3ab23a10771bbe06300e5374efa809789c65455
[2/7] ASoC: amd: vangogh: Add condition check for acp config flag
      commit: f18818eb0dbe0339c0efd02a34a3f5651749cb84
[3/7] ASoC: amd: Remove extra dmi parameter
      commit: e12678141835c539fc17a2318ec4017a845935bd
[4/7] ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance
      commit: 671dd2ffbd8b92e2228fa84ea4274a051b704dec
[5/7] ASoC: amd: acp: Add i2s bt support for nau8821-max card
      commit: e6a382cf7a69cc80e57978bbf0c7a674dfb09621
[6/7] ASoC: amd: acp: Enable dpcm_capture for MAX98388 codec
      commit: e249839bf33f3f9727d6220536ed5c7d4f5bc31d
[7/7] ASoC: amd: acp: Set bclk as source to set pll for rt5682s codec
      commit: ff5a698c0ffb08eee9c1ce0dfc79c91f273122d5

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

