Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FB3D5234;
	Wed, 25 Feb 2026 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046404; cv=none; b=NsZjxwGfhnVbveAOFlSWtQHcy9xZJg3LgID+uJEuRiRchqxnRjKeZ5Fz1iiZJt5fETe25tFqdEY9PlWn/NKWB6XImZmA9BjJ0HuVZrhuih+Oz7NnV4++WBRC4oJS9Eq7MRrq4YLZnWE/0J7rBK0CRMW6GluMw/X3uDWQPhWvSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046404; c=relaxed/simple;
	bh=pNherhGTjklrAZQwwK9HzwwwCQDFd1wtnYPZ4OnviNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VoqMStHAggz1nYf4YNaTORpvS/H9i0zAimRNx4wZMpYPkWFPRr6nYiZMYe0E7zh2Ft8MBWRdTrC3N2lEMoZ+pO670kJwkTTq56CqtYralsLM2J0EQiQysO95wp28DLCHihCObQ5vZJK5cik7RUK4NMBMgMoSkhd6GyS+V2dad6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUM2RAyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUM2RAyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A7DC116D0;
	Wed, 25 Feb 2026 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046404;
	bh=pNherhGTjklrAZQwwK9HzwwwCQDFd1wtnYPZ4OnviNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NUM2RAyqHG29/PJpBCh/oBlBxmIvw+G7yVWN7mgmyqwUrUyhHuRJuBqBTvjdV/Dhh
	 xe4bx68kMCOR9CI8Z57Vy5802r4Jt46AsviqIqU1Uobokif1UxiTvBddSEXs3aO9y/
	 +Csij9PTBz1fL5qbom8bDUOHUmC/EV7P78YsgFFVzPRHGg2aLYcTSIIge0flSW6yD8
	 7cUcswt3LjRnTrwRi7J9h9CgUz+ukZgetrFI76B80aO3HDE2aOTcWD7zYHoRiGoOFI
	 ZwHP308KBKXsEhAiKDxfBQMEDxWrY44JbMDxEWX5fuW5oRqoymyS8RkyQodc+LDq/K
	 5hXaHmeGFs8jw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alexander.h@variscite.com, 
 pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>
In-Reply-To: <20260213150355.442609-1-stefano.r@variscite.com>
References: <20260213150355.442609-1-stefano.r@variscite.com>
Subject: Re: [PATCH v4] ASoC: simple-card-utils: add sysclk ordering
 support
Message-Id: <177204640220.168100.5342129851322856922.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 13 Feb 2026 16:03:55 +0100, Stefano Radaelli wrote:
> When simple-audio-card programs sysclk for CPU and codec DAIs during
> hw_params, the ordering of these calls may matter on some platforms.
> 
> Some CPU DAIs finalize or adjust the MCLK rate as part of their
> set_sysclk() callback (for example by calling clk_set_rate()). If the
> codec sysclk is configured before the CPU DAI applies the final MCLK
> rate, the codec may configure its internal clocking based on a
> non-final MCLK value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: add sysclk ordering support
      commit: d075cef4af6327a5de4bee7bf77591e3201e54f4

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

