Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FD306497;
	Wed,  3 Dec 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773654; cv=none; b=bWjwfNlrsF//Okt/lvs3nl6ZzwDr4zcGrav80L70D3n8JzgxGbovLWZkCgmFnCi5x8ZiIeMLgvo9D/rkdlVE6I3Xc3TFjZ3gKb1S7sTLZ338nEiwfN+AhK2Gxf1wQFyAZ75F5+Ctts9shpFGYMsVF+Yg2RFmUuvDQthD4cbV77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773654; c=relaxed/simple;
	bh=heEwWGYaT6SNGxBWgFrYIuACgmsZuCCbIJrxQibpcqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N05ESPQlIwGz8ojhWX2PFu/9XxvohP38TmiAzljF5dEZmIph6FnNpEMM44anpSB0OWEj3Cvx/PqdIbkkyPJma/qpm20ML7Fcwc8FuV8VXAmDPh9r2jEVOiwc7ZBWvNWcLYCciEmDawg5HdeQPlG9eMS3imdUx6TjVdOGM2AV1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9pLrSHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9pLrSHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFD3C4CEF5;
	Wed,  3 Dec 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773653;
	bh=heEwWGYaT6SNGxBWgFrYIuACgmsZuCCbIJrxQibpcqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t9pLrSHtmoNs3ktOHnroaQ5XFE56xllTUiICQVgbqdkJipVDLRhrM5J4AwbfIuWNq
	 eTHob3DuktZAGL1q9KCbN4ROG4Jyh4VVzucHP9V750CWfuRCMmPjgMywxLCNwQc4Sm
	 wEhmbqQzL1CCrvuNLuiUFYWfrNCfTQdKtXfUB+fJi6UetLw1MpzGHdJwfv3jwwYhBU
	 Et6WWfaHGtNe8w2e6Co+xmUO4BtCzHvdmv3l9ngsuCgtm0Qg9BUy0qnd0VPgqnV9c0
	 S8hyUrMaFatr/wVrEoB//OcPE6hxE6tbbAmJ6t+zj5IOoOuakz5sjhemLaY6J9zdfh
	 I4ipQSI22eFZg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, 
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
Message-Id: <176477365049.48347.16119915786526806162.b4-ty@kernel.org>
Date: Wed, 03 Dec 2025 14:54:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Tue, 02 Dec 2025 23:26:14 +0530, Raghavendra Prasad Mallela wrote:
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Audio is not resuming after s0ix
      commit: 3ee257aba1d56c3f0f1028669a8ad0f1a477f05b

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

