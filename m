Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC845F1CA
	for <linux-sound@vger.kernel.org>; Tue,  5 Dec 2023 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQjA7fHv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DBBC433C8;
	Tue,  5 Dec 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790872;
	bh=VrTjP/8gYyEMO3jyVF7DcYGRyaUSJW4xFyLJYI76Xqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jQjA7fHvoF+bTk9zCM4qmqNPNhrw39lu3KnBt+GGYpFiWrE0GOwQ+DR0hXr2sj3U4
	 tmPX/TG68/XowiREptLGUGcQ/Dpe4fTBkQpybK+1Va4RthkrH6ljWReDeMDsgornhD
	 dUwgyZVT24RzLEML41H4ITDgKPsy8qBvsebL/fMYIYKxii8Lis7tjdZtxRqUv+AMgI
	 IRVDJsl5yqcMqa1Pd3HJIlpZmxf9TgwkTtdQka2TpXTsTPgbeA0MLyWqG1tzayS4a1
	 knvMb/l7iwjs7MV4b/YvSuZ1HSnldmu6nlBF3ZekumNuENeN9CHqxqSPrPJGF0oO9W
	 8IRD3dyukhXXw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Chao Song <chao.song@linux.intel.com>, 
 Jack Yu <jack580304@gmail.com>, Rander Wang <rander.wang@intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20231204213721.197785-1-pierre-louis.bossart@linux.intel.com>
References: <20231204213721.197785-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: Set lane_control_support for
 multilane
Message-Id: <170179087052.845405.6795700435755059161.b4-ty@kernel.org>
Date: Tue, 05 Dec 2023 15:41:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:37:21 -0600, Pierre-Louis Bossart wrote:
> The RT722 SDCA codec supports 3 data lanes,
> lane_control_support property has to be
> set to use additional two lanes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca: Set lane_control_support for multilane
      commit: 6da9a662154c8d55fd39820ca882d0646d526e53

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

