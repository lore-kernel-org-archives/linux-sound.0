Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE73DB87
	for <linux-sound@vger.kernel.org>; Wed,  6 Dec 2023 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtAIRmca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66AEC433C8;
	Wed,  6 Dec 2023 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701872591;
	bh=hHfPa8Rt9tJMup0l2ZvHJECRo/PimYmb7PCrlmmvfFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VtAIRmca8xHjl0nzefshtOs3dU5kVk3/xYharXrVC25g2gR1a2ieu4yXL4hTaYvsN
	 yUn0F+Rt/XscW+HTWmT57dE6xAnv07o6P0wn78Tm80ubpqgqdFaeVAWz2Exwa7mQ7T
	 Y6S5rVb7EBop3myeHwox0DZk21LcrNR3JRfgSECp7j0Y4zYFlEDbH7zfWF0fHJbNBy
	 KhnOu3v4O3XCxdH1jiG9ciY7dtDpJJ31Qd75qqaKKoHsFdVsopR7f6s0UGEmKebVe/
	 KfbV8/4QVfXTvzxwF0HV7KjafdltuWFbXzyruS1AW6VeP9H1FtvCAXUvd/KFWkOQZ4
	 DU+dQSOWSe/SA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: machine driver updates
Message-Id: <170187259039.34804.6016758824683403737.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 14:23:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:41:55 -0600, Pierre-Louis Bossart wrote:
> Minor cleanups for machine drivers.
> 
> Bard Liao (2):
>   ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev =
>     NULL
>   ASoC: Intel: sof_sdw_rt_sdca_jack_common: check ctx->headset_codec_dev
>     instead of playback
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: sof_nau8825: board id cleanup for adl boards
      commit: 528ee84f0fe08788b2e72aad7bc8a13dd2a169ca
[2/5] ASoC: Intel: sof_nau8825: board id cleanup for rpl boards
      commit: 996727aad856e55f6e65fdc6093281e51f0534da
[3/5] ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch
      commit: 486ede0df82dd74472c6f5651e38ff48f7f766c1
[4/5] ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev = NULL
      commit: e38e252dbceeef7d2f848017132efd68e9ae1416
[5/5] ASoC: Intel: sof_sdw_rt_sdca_jack_common: check ctx->headset_codec_dev instead of playback
      commit: 70a6b66d6e8e70966274cab2fc9ee75fd60e36bf

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

