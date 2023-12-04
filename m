Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64D31727
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIrkIvfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41C4C433C8;
	Mon,  4 Dec 2023 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701718225;
	bh=Xc/MU6W/EB84lggpE5Bjsxpht9lSHmzC1hC1M4lx884=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EIrkIvfJx7lLroPkfiSuyIr8ejNpLxRnXsF1yGkl2Ky4cpWXvctPtw5qtC8x/tGBU
	 X1cTT47I6wpCUUXgc1QA2SwXe23rgU2OFeACkr0kP+6AN/4K426O26H9ylO5kUnSBa
	 9ZVnY2WFpD3x7ZE6SG3uGEkx/4scop4w7MNQ5ecCx1qsRbCqeV9PLi5MUKxKvp2Nv6
	 yzTLdNnKS8noBJ1k/YEwQehbTEzrRH1AzzVAwWqMmcoDu5+M77rvWo6j9Ej13HaadR
	 hPH2tl7zbQwUTIWXYcwhEy+gmmwAe5H/olgiVQRrxJQTdIo/5T0D6m3Ceiclh8Gkve
	 I4HmfmbAMP2dg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231204033549.2020289-1-wenst@chromium.org>
References: <20231204033549.2020289-1-wenst@chromium.org>
Subject: Re: [PATCH] ASoC: SOF: Move sof_of_machine_select() to core.c from
 sof-of-dev.c
Message-Id: <170171822243.157597.14987594819577549531.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 19:30:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 11:35:47 +0800, Chen-Yu Tsai wrote:
> This reverts commit 014fdeb0d747304111cfecf93df4407c1a0c80db.
> 
> Commit 014fdeb0d747 ("ASoC: SOF: Move sof_of_machine_select() to
> sof-of-dev.c from sof-audio.c") caused a circular dependency between
> the snd_sof and snd_sof_of modules:
> 
> 	depmod: ERROR: Cycle detected: snd_sof -> snd_sof_of -> snd_sof
> 	depmod: ERROR: Found 2 modules in dependency cycles!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Move sof_of_machine_select() to core.c from sof-of-dev.c
      commit: d0ae9dc48e24f5f704abcbb2dca3e4651bf0ff59

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

