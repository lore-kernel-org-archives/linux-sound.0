Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4ED20E70C;
	Thu, 23 Jan 2025 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631765; cv=none; b=urpSEXsd1QR/CjwyXyxBKwO6eNjjbNCXcAgOP9wn/WVXY6Vo20fGHNeFUsK2Zqlx6EVmWiCJYoHjaUiplsb/7r5nyKMyLndHragwuO05eWXZQ88cRWRFjLOaHB+dj1oL2RpTN/Qo/Of2LE1HgsUB4F9ZLj5bQoOC1dkM5Gs9xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631765; c=relaxed/simple;
	bh=vjOG4wyus65GPBBh5RK9OeRmCNILRdBqj0Mfd9xnkqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cIzM3hOVOLm4DuRD9Go+furH3Jy6mBP7XS28sUBPbZvDt4Ad8RC/yVAdTbodjZve/YDevbhp/TLbKq2w7OpeoJLILHUa80vPevVMv7LWKtoenSJ3Bfrr6+n5XUXgQA6fDLxH0V2To/QLgsEnJzJtH1nviVRWha5hmDYuvfOpSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwLVPDUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwLVPDUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EFCC4CED3;
	Thu, 23 Jan 2025 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737631764;
	bh=vjOG4wyus65GPBBh5RK9OeRmCNILRdBqj0Mfd9xnkqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iwLVPDUkKIP79UsOJfuoEdLQxcVqjYG+E0RaWBqsUbNDcSk+hJ1yuP38T8XduYBto
	 Qy+3axJYpXo5RIkxWuCQzgHO4xtX6IGYZWK6ae3mhUZh7AWp5L3MQ73MC2Ly7t5vPG
	 kAtnpjwRD44DFAbX2TpHaLeADn3S+x7YpGjOlzjyA4+3LQBE2FgHfWgyC+5jrIEDOd
	 Oqvj/KrF2DzB2t7XlLREiORz/sNyt6tJGkOmEvr3i6JXCwjDHXlthnef4K57Qmf064
	 iggYjeyTsAji04WEtw7kkwUkvvRdaTalfDDEcviy+eLmPYZm0sRntQSvFJjp2n+f6M
	 XFoT6frAexXjw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250122065330.1423248-1-arnd@kernel.org>
References: <20250122065330.1423248-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER
Message-Id: <173763176258.25036.5970364833151878810.b4-ty@kernel.org>
Date: Thu, 23 Jan 2025 11:29:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 22 Jan 2025 07:53:17 +0100, Arnd Bergmann wrote:
> Randconfig builds without dmabuf result in this link error from
> the fasl-asrc driver:
> 
> ERROR: modpost: "dma_buf_put" [sound/core/snd-compress.ko] undefined!
> ERROR: modpost: "dma_buf_export" [sound/soc/fsl/snd-soc-fsl-asrc.ko] undefined!
> 
> Add the missing 'select' statement.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER
      commit: a2cd92185db0586f2136feae84d98cc54580f381

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

