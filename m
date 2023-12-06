Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA10B36B13
	for <linux-sound@vger.kernel.org>; Wed,  6 Dec 2023 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUHMnBj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E6FC433C7;
	Wed,  6 Dec 2023 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701868372;
	bh=EStk6AojKy4VrHDz7eSOQKX/7HbeZy7ZzJ/2crabbHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pUHMnBj0fpV+uqC8lC/kqLL2SDwI80ZQvcD8acliYpy+7Mx25yFwsyR8EnLmLATER
	 DJNzK3a6Z8osyx1yUzskQq8PAGIfJQHZqEg4ND/T9pSa4fMwrCj7MKAaWnpAKrnE1s
	 UPHRFLp/CvVHDqYRczUb7LpV5Hw+E/F3MlJ9gp4qmJ9f9BeTly+H68k3m5WnYKqVBb
	 ykdzlvyp/Oig+Mj/ZdrrYgBYjbpkvFSgGvqtE0ypoPsVADMwYAtCZNHPbyXv5TGVZq
	 fj3/ZeUSAb32tMlZ0DuJM3o8I5ghrDV8QYkSVwbz8x5hycvMQ3Mgjei4KI9vs2qQq2
	 ypjE16CzHOXgQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 cezary.rojewski@intel.com, ranjani.sridharan@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20231205135001.2506070-1-rf@opensource.cirrus.com>
References: <20231205135001.2506070-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a
 speaker widget
Message-Id: <170186836988.22386.11650594415666700683.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 13:12:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Tue, 05 Dec 2023 13:50:01 +0000, Richard Fitzgerald wrote:
> Hookup the CS35L56 DAPM_OUTPUT widgets to a DAPM_SPK widget so
> that there is a complete logical path to a speaker.
> 
> There is no particular reason to use multiple speaker widgets.
> The CS35L56 are designed to work together as a set so they have
> all been connected to a single speaker widget.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a speaker widget
      commit: 138a4e2a26ec73197e22fe64ee3957b1594eabb3

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

