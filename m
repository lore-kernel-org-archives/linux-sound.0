Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C462D13ADC
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJQw+8B4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B46C433C8;
	Wed, 29 Nov 2023 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283982;
	bh=xE3VGxi1KqB6Ryu8SKT3DnfI6RZJEMWpiPFPbLEUaJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rJQw+8B4o0JRJzasxhOx6BL6G7wEOmMShOa7P7X52CPjxG+UpuIjothctHLusIKpO
	 yN3EtY0s8ZOMFMLVlwXFb1pPO0jtu5123YtgaRUfJfYCelWl0BUxBPDYVP7xj/F5YC
	 zm/sQMeAVKcI2wqUOqNyyxOvcMs4BwRKaRrz+eagDMdjmPehE5Pm/0HxLxKkV+hhBe
	 U8AZazyYfN7GiJzkR/Fw47uatZ6itVoyDExNyoLKbe5NfH6vyMXxTH/p76s/3tk1NA
	 kt2/M26m3nCirh8K2+a7mFydOyfJH8r5KnEmyyBAmNE8k6kffmnJa8q5JwPy2IOBy+
	 IOym8QTHw5Hsw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231129113204.2869356-1-arnd@kernel.org>
References: <20231129113204.2869356-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: update Kconfig dependencies
Message-Id: <170128398071.290371.14400360255122979323.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:53:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 12:31:17 +0100, Arnd Bergmann wrote:
> SND_SOC_IMX_RPMSG gained a new dependency and gets selected by SND_SOC_FSL_RPMSG,
> which as a result needs to have the same dependency, or produce a build failure
> based on that:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG
>   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=y] && RPMSG [=y] && OF [=y] && I2C [=n]
>   Selected by [y]:
>   - SND_SOC_FSL_RPMSG [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && COMMON_CLK [=y] && RPMSG [=y] && (SND_IMX_SOC [=y] || SND_IMX_SOC [=y]=n) && SND_IMX_SOC [=y]!=n
> x86_64-linux-ld: sound/soc/fsl/imx-rpmsg.o: in function `imx_rpmsg_late_probe':
> imx-rpmsg.c:(.text+0x11e): undefined reference to `i2c_find_device_by_fwnode'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: update Kconfig dependencies
      commit: 9cce9c4806a89439ea34aad2e382150d68c7ea95

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

