Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C72D59FA;
	Thu, 27 Nov 2025 16:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261376; cv=none; b=Ot9frdDze9o8gyp/6Gl7ONO0uwmbsiU9HGAPnVnTy7mJOGQpnQFhHDgwOZdfEg4Rdtplvagk6KDnrxRvRjarQuvOkK2je6tAy4HmFLIuljVwOOateZGmM0Ts8jdnNqa+snTOUbNLMJk5ldnOGCNfrDhovTzN/4F6vLNZ/FOF0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261376; c=relaxed/simple;
	bh=rACZdHS3sKS98Qrcuh669b5v9FhGpkPps1hKA9aPdr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z82QO6UEF1aTHqjBNMrAnxLNKUDKGDpY0nZWTMvN3kM5Bs1u9PiCdKJbdz1szGbvJSUWkxwx9D/Fejge11MmQJilIMq6pnAR2yvvX5QtkqKH/4bm5Q3ku9yQdxVXnQ2TdetmL7hm7QIcwOd5ickeLtRxq4XrUpOxrGcfoP6RR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkUJjU8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkUJjU8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84603C4CEF8;
	Thu, 27 Nov 2025 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764261376;
	bh=rACZdHS3sKS98Qrcuh669b5v9FhGpkPps1hKA9aPdr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FkUJjU8MJJcuQ33lG6amI+0lkMdHD0INmoLpgbANSvE67vJ7LPoOLTQdyEYUoNT79
	 zff6tQ2EublzYFq3Fm9z6Q1jFNmKqAge6SMg2u9LnOpyyqdHpS/nsppVU+hLukTKpe
	 yOVjZEBl6dA6+s424lSq8yE9YUyPMMgU+Nrj6aFljENCvyqsbnvbjWg2MUsRUy3/iH
	 aM2rRfURNusQmEzABGfLKpqo5FtCFhh5HxzHgvWFh5ghnc1mlzivGznbej0jDlcObc
	 HwWyQlOoUzighbYjYzEKCWrlXLuXBPtfcAChR+d8dBL5OItXIF1gZFX1gVhsB8Jzzp
	 eIahRnn+RU2Rw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20251127103947.1094934-1-rf@opensource.cirrus.com>
References: <20251127103947.1094934-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Use kvzalloc() to allocate control
 caches
Message-Id: <176426137528.95122.10728874044259284349.b4-ty@kernel.org>
Date: Thu, 27 Nov 2025 16:36:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 27 Nov 2025 10:39:47 +0000, Richard Fitzgerald wrote:
> Use kvzalloc() instead of kzalloc() to allocate memory to cache the
> content of a firmware control.
> 
> Most firmware controls are only small, typically a few bytes. But on
> some firmware there can be much larger controls for coefficient or
> model data.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Use kvzalloc() to allocate control caches
      commit: c45d5d9803a4fb7d3e7f590094b7a2abcfe74ef6

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

