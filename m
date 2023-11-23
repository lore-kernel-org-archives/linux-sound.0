Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738373E485
	for <linux-sound@vger.kernel.org>; Thu, 23 Nov 2023 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ut51JJ2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9510EC43397;
	Thu, 23 Nov 2023 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758802;
	bh=EvzPaWl4rEWWAqN92zDuxih44+QveIo6CQqfvVtHmxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ut51JJ2B31MOyFR3mR2gsVC1yQJUTnd2mInxrcNp6lXSoTIHMr6anHzBixsognlP/
	 ATUOchYc+UKMA3zGAjkvppOWxiokiEu+uYPaPnrIONO3YRtkruLyAPzVSPfE7AbIC+
	 9lUSCrewRfLkLgcJuUdg7g/PTXgt2KrVVWoa5opbf1RM6E64gBDR7zT+JWZs5YZrhP
	 K2P4DYJMZ23yHKAv4XGHHdTH2RgRZlq58RuieGmAJDlewM/gSB95zR8oInLZOGVoco
	 ls0t1bfjcfvhoZi46iN1OJXzxbMkEhK8YevIhDGzFxvEDtJZX+2Go4raS8IAfTKBeg
	 SX/kMRMjp42TQ==
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
References: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v5] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-Id: <170075880043.2448402.15081787699005605640.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 23 Nov 2023 09:06:58 +0000, Maciej Strozek wrote:
> Add a polling mechanism that will keep the driver operational even in
> absence of physical IRQ connection. If IRQ line is detected, the driver
> will continue working as usual, in case of missing IRQ line it will
> fallback to the polling mechanism introduced in this change.
> This will support users which choose not to connect an IRQ line as it
> is not critical to part's operation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs43130: Allow driver to work without IRQ connection
      commit: fa91703dc2e010e48a230dc92967cb5ae23f8680

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

