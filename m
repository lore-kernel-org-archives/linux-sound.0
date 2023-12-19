Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2155839AC7
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5Fso2ZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA685C433C8;
	Tue, 19 Dec 2023 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009211;
	bh=mX3mXPFqXXqC4VfTi5VYr6tit84H9mmIsAtrlGk12M4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X5Fso2ZCkdNDxjJZZapeGbWEXbNpXHrr/4p5/ujJt/5RtrF3t8asF2x5nme2jy1N5
	 7KTgrcZAY0pujvMa6oG5oJ2diHwOt6ruMB6o3odVE41XqPwh8IrO7+7SfOqrtGT8u4
	 /cylYGU+K8WdpRjw0P9hVXKMYYpkMB1CKj82MX5R4jiY7+m+pbk7Ranq6/qrP2Yicu
	 O3PL493IODo8cBQJcaygpw+7fAUN7j6f2Wmuzmm3waVPt5geVqDNWMv0Yoz3G/Q+fI
	 7SolOBOKW9RNblTRIJ8SKVjRQN/vovtQY0ezs6Usd1iBwRiKwqqnwW4Ilmfaae6p4F
	 fVbRINzxgN6rQ==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
References: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: don't use original dummy dlc
Message-Id: <170300920760.125466.4732601724586976464.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 01:31:10 +0000, Kuninori Morimoto wrote:
> This patch-set try to not use original dummy dlc.
> 
> "Empty" dlc might be used on Platform, but "dummy" dlc is not needed
> for it. [PATCH 1/5][PATCH 2/5] removes "dummy" dlc from Platform.
> 
> Now ASoC have common dummy dlc (= snd_soc_dummy_dlc).
> [PATCH 3/5][PATCH 4/5] will use it instead of original dummy dlc.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
      commit: 7465582e0b18859d3681192ec2ccf22a81370040
[2/5] ASoC: samsung: odroid: don't need DUMMY Platform
      commit: 56558d6ab8c09c416bdb6d72b7e02894539a882a
[3/5] ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
      commit: c2dfe29f30d8850af324449f416491b171af19aa
[4/5] ASoC: sof: use snd_soc_dummy_dlc
      commit: e8776ff9ce9f5a8a9d8294101fd2924cebdd2da1
[5/5] ASoC: soc.h: don't create dummy Component via COMP_DUMMY()
      commit: 13f58267cda3d6946c8f4de368ad5d4a003baa61

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

