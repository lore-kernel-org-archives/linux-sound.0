Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403619D88F
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606055; cv=none; b=D/DoOmlPcQDZroYHwhaAvy/OZ6EFbiOY0R479ax92m4lm9xipDVEC4rEzMhE385eQLbhChOQkMY4ylarHwsGtoxhmHeM4ZleRgsDHoZN2dS1nPvaJ/I2N7oE+WRjpZsAaTEX8eFh/CLKnuDtNkAE4/woIuiEyKONeBcUELl07Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606055; c=relaxed/simple;
	bh=3H0weuPNSSlVZDJ7SA8c5erRyMPv0gzKX9yZqcx0+sI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lIwKYNObPdLfDCSxI8RuyYu8PtpKViKSk4x9oAZp6k9/lAhYfrlJm9pWyUu2ehzOmrphSjN64qjxrSK6xafkdqL2cJOcN9Yrwa8RSy+yOYIxluCCb7vPoMBpeYtzk/Mkg94vV3gpr7G5Nlr04kFp+fV6YxBf4AFOtDhuYFxKjXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Baf3bFEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Baf3bFEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1143C4CEC3;
	Tue, 22 Oct 2024 14:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729606054;
	bh=3H0weuPNSSlVZDJ7SA8c5erRyMPv0gzKX9yZqcx0+sI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Baf3bFExT8OU7MI0rgJWGFjuxsfrdPRtUxlIzsulM+bMnfizKl6pKlpWaQ+X+HeTn
	 CotFqgzHF94CCIj3McTD0eTNO5ePfG5b01EuITqbiMwbCbRmB4F9UYPcLfcNXVHqSB
	 dQH3qe0qCReus8oTgrQ/nfXNENCBzU5IJFlDVga2mg9/xUVMImu4vpGYj3Hq/+pebb
	 J/dZfryq+yaAhQPk8QZvvVBnPh0VX58Vk5xunKEM946hU1a95z15ASEIvHgpdqG0K5
	 kvKxTkHEUh+k6jjYbVX1g7lTCpIAnXtOLRWG+1n1jKGY2M4OcolBGebHa0frsgiI95
	 8aOKO2YggYa2g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20241021-adau1372-of-table-v1-1-6efbc7946957@analog.com>
References: <20241021-adau1372-of-table-v1-1-6efbc7946957@analog.com>
Subject: Re: [PATCH] ASoC: codecs: adau1372: add match table
Message-Id: <172960605344.41803.17410969493660628007.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 15:07:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 21 Oct 2024 16:00:49 +0200, Nuno Sa wrote:
> Add an of_device_id table for both the I2C and SPI drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: adau1372: add match table
      commit: cca8824838a59aba31e182525175e5659c33034f

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

