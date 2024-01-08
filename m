Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9EB52F63
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcHa7rZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECA1C433C7;
	Mon,  8 Jan 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704728923;
	bh=2qSZ9mASfAtI1ftwWTz27togVHEdCR7T79H3O+g3GJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GcHa7rZnrHmn5Zuim5zV+sGvCoU/4DikeZ1cBhhowQbqgUJB8yQzabsXpB9+dTOAB
	 cvf6Q8Zg5ere4UfX0rfxN2ei5JQkSI+8AETtLbl8/ri0N/rzhDpp3PIsNLTr7hxrpj
	 qUg5+QO8jY3UgU8VR2fndTEQ85kscstGIGsIlS7QjtWkM2/TiLDjg+sOh0odOXsmel
	 ClGMvzrl8S4wepqb/2nPkzlEU7hnGfUSIzQuGqeFAyrHPGBgr2mLFv/sLr+ceyj6PY
	 F8PA2iwjhV2LXa+u5NmHF4qcxbjcjzE4pRvNZ7fMgrhAzp8NVIuB8m4VlWKuTQZiXH
	 FquHLjFpA47kg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kuninori.morimoto.gx@renesas.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
References: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: bxt*: Fix regression caused by
 COMP_DUMMY changes
Message-Id: <170472892107.39584.7010867901345096730.b4-ty@kernel.org>
Date: Mon, 08 Jan 2024 15:48:41 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 08 Jan 2024 11:48:40 +0200, Peter Ujfalusi wrote:
> We just noticed that
> 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
> caused regression (NULL pointer dereference) on GLK machines beacuse the
> drivers are using the codec name or dai_name to find the link to apply a fixup.
> 
> 13f58267cda3 is sent for 6.8, so these patches are going to be needed to be able
> to boot these machines.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: bxt_da7219_max98357a: Fix kernel ops due to COMP_DUMMY change
      commit: 59b946ea30806064c4ac78f0ac93642655dd4f2e
[2/2] ASoC: Intel: bxt_rt298: Fix kernel ops due to COMP_DUMMY change
      commit: 3ec71290db4de298b67659ef2bc2a8f84cf9537b

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

