Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F97356A2A;
	Mon,  2 Feb 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072519; cv=none; b=bdaov4ITxoB+N8L6ZzZHaUMKC8XVK5fhyTOgR5GThAPJIXjKC2mdeLQQLCPYSA5gAYWcGIs31g3xcyBFxu+e4paMrOinsppBe4XzM/n+FBidXxArTaN+xBJr0HPyJu8OqR3NhDGJuSDk+kWMx5BsbAEKrzxtR6IUEU8287ifTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072519; c=relaxed/simple;
	bh=VAeUYaho8JzBu/E1SEtLDObDlXFEuX4C56jfXZGc4Wg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AvdO19gu4JHNc5BfBA+AwHWbGOC3x6xJqkaFffKafZxOn2dS0N5bC/a8IrTT57HiVEFmWf7HmuwmGtf7frbiV8VR1HZkx7Q5WlIAoeWUh9SOU55/NDW3aybkKsYAq/2tbRNYQ5Oi45m1X2SStA0tJxcJ8rAym9sgijA6cxR/fQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3NqS7NU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3NqS7NU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C43C116C6;
	Mon,  2 Feb 2026 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770072519;
	bh=VAeUYaho8JzBu/E1SEtLDObDlXFEuX4C56jfXZGc4Wg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3NqS7NU/8QlO096qb1H18le9yrBTtJtPR0HYwr01eArYUUS8rS6nniNw3R+7KP27
	 OXsmbfYs3f9ouU3Vs8hgEbqVs341d0jFAU1Oze7whU+1UUakukyMYvq3/XP6jpBp84
	 2uhhVWN4fwM9a1a/d5dnYxbr6pIVktafVqOmNd6GbBrSI4jwde45d5VOYYSA6N+O8q
	 gT0AdA9p27nuVvKcwe3QTIar3JT8/PBqTh3z3X6AMuJXVtq99GIDjVtubtteCHGVHn
	 uslplgxgace+Js28oj4omqOBaRD1wM19s/mk/xaeNaWyOIhqZ42HPlb+6O0FW0q0z4
	 S+LZwIGhCDqrg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260202095432.1234133-1-arnd@kernel.org>
References: <20260202095432.1234133-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: rt5575: fix SPI dependency
Message-Id: <177007251728.963821.7932888500158940860.b4-ty@kernel.org>
Date: Mon, 02 Feb 2026 22:48:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 10:54:12 +0100, Arnd Bergmann wrote:
> The rt5575 driver fails to link when SPI support is in a loadable
> module but the codec is built-in:
> 
> x86_64-linux-ld: vmlinux.o: in function `rt5575_i2c_probe':
> rt5575.c:(.text+0x9792ce): undefined reference to `rt5575_spi_get_device'
> rt5575.c:(.text+0x979332): undefined reference to `rt5575_spi_fw_load'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5575: fix SPI dependency
      commit: 1db63f6af17945aed7497ce34a5648add0c1b6d9

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

