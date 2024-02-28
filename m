Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1126EEF6
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709137057; cv=none; b=b7lESlbNZDyxAwDCY/p41gTwdk63ruMncQMDD5wDSK3Wkk6SSyzpcuYurw0QxfCH280n6ZHtudv64F44k1c0nzPj8VCFU6R7y0v1V3tRZIuBZH5WRVlkIwt7qjpLXE4WBnsJeDOhAgE4mXtIHzWDf2WtJfaFDE2KsWSQdCFNPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709137057; c=relaxed/simple;
	bh=PmM61hjV6oCH/+dkJYcHAIQRhvcosfrQk2R7yprEheA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cQQjFD2LP233+o4zViSeJqrZ13I6pE7rfA1kIqrxnTFBRi2RLna44cocEMTOqorlMFl1IJnxZ8Y9/kvTy6MpYpy6xt2Mydo6vHaqOP7whoKEJWraFh6QgnAwQU9oUIckDl+JNA3qu1ajq0bYGIeIsqbEYYz7mzbw2d0G0rEsgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JD4UaTng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JD4UaTng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D8EC433C7;
	Wed, 28 Feb 2024 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709137056;
	bh=PmM61hjV6oCH/+dkJYcHAIQRhvcosfrQk2R7yprEheA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JD4UaTngvn7cOtOTISOLgRJau1AxyY1T9AF+F/YtfckIRurCGcSw995AGz0z0QBPq
	 lxqJ0SoyOjVAnyanUCEpQ7XLFhqkhArkN3M4WM9A62IshYexUqNP6qVV2Ddtsiti/y
	 tY26rCXyxHIvU62klVi1dtZtgbERVx0WPQPJh3y/oBBNmdOoGeC0iiEA13Q7andrTk
	 PpY07dUJKD4b65vtHWKBmCSMwIVIgwZu3VmbNeZ146pZH85jBM7s+RtUKkfVjTo5zv
	 cuq9htU7P2uiRFodN3/JHJeu0g7xO0JIbtamW81SiDL7oh4YeF4PNgUOrZ+mq680Cj
	 JQYZwoKqtks2g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jiawei Wang <me@jwang.link>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240228073914.232204-1-me@jwang.link>
References: <20240228073914.232204-1-me@jwang.link>
Subject: Re: [PATCH 1/2] ASoC: amd: yc: add new YC platform variant (0x63)
 support
Message-Id: <170913705529.499200.9430202660111378174.b4-ty@kernel.org>
Date: Wed, 28 Feb 2024 16:17:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Wed, 28 Feb 2024 15:39:13 +0800, Jiawei Wang wrote:
> The Lenovo 21J2 (ThinkBook 16 G5+ APO) has this new variant,
> as detected with lspci:
> 
> 64:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
>         ACP/ACP3X/ACP6x Audio Coprocessor (rev 63)
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: yc: add new YC platform variant (0x63) support
      commit: 316a784839b21b122e1761cdca54677bb19a47fa
[2/2] ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
      commit: ed00a6945dc32462c2d3744a3518d2316da66fcc

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

