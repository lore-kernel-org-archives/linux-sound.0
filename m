Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF642F39A3;
	Mon, 15 Dec 2025 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807117; cv=none; b=eKGVNtRQMUl7BaYsnm8x88AekNjACkYliWJaCa5SpLNmNMyUjVepTGgRszDSbDJUix0+Qe+vNlOolj6dg/rj5AfZnCFVQWEjmJZFlJUAJ8M4nBUy8buYSfogWNi1x0UjwgB07tC5xS1pv3nLKNkNbqnXE9hyMIbGgohETXqWesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807117; c=relaxed/simple;
	bh=gmgf0Td7Hj+aJEl6b2TgBZrGjjVbMRt1/uG/UWSmNOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EAL68OVJNlqcuuw+okXZlpcjGhZ3evuWH/WDbuA4JFDNuS4wgagezm6y03RL4KnLS5YEUqPrk5naSnLw1CjQvFqcUzfXWpBOCd6Kk8PAfQPZHiNdxO37/Dv2FeeJqaIxAgzcnTZDr/uzFfn6RBzm7zmoKq41qWBWWHJpABxUG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUgC0bAC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUgC0bAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E009FC4AF09;
	Mon, 15 Dec 2025 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807117;
	bh=gmgf0Td7Hj+aJEl6b2TgBZrGjjVbMRt1/uG/UWSmNOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HUgC0bAC7FS7GK6NPKp9JNvBb0ujhPjdqFQBunvpOjwAJTdwfB0hszNG3folnQ563
	 UKRyXtVkb5OXngRBuD3UszW2ON0EySiK3qqtwMmQXTTemXB2GjEqFxMnBxnH7bQ7UI
	 uHxDv4Qj/gmsfk6rR6cw6vqU4QFCb+NC/iJUVFP67SIhL42nT+8HrvDWmpYluoWZFP
	 bJ8U7FJDVH5hPQ84EpwIkCrexCzgmm9SOo4VFwGUCQOtDpBNgu0pbXASAT9pEEjJ2T
	 0qvGJZ/5AFkceHVzzUJg/5ELgNki3Mt+c4RfJw8axI02n/quNfPXwpQfgqL2gsS/tR
	 nuN+IuHCGzMfQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251205090534.27845-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251205090534.27845-1-bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: davinci-mcasp: remove unneeded #ifdef
Message-Id: <176580711527.161056.4648990111932948488.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:35 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 05 Dec 2025 10:05:34 +0100, Bartosz Golaszewski wrote:
> The enablement of the CONFIG_OF_GPIO switch has nothing to do with the
> "gpio-controller" property which may as well come from software nodes
> and GPIOLIB can still be enabled separately.
> 
> This driver does not call any symbols from gpiolib-of.h so has no need
> to check this option at all. Just use the generic device property
> accessor.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: davinci-mcasp: remove unneeded #ifdef
      commit: 0c1db366642172e85ee98eeed7c127b80eb609a3

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

