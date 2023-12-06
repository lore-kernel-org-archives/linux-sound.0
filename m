Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DCE3DB87
	for <linux-sound@vger.kernel.org>; Wed,  6 Dec 2023 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMmaF8rf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BFDC433C9;
	Wed,  6 Dec 2023 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701872592;
	bh=u9Lpc4u+LkadaX2Q3ITww5Z03baWteYYkZnQr+AKd3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rMmaF8rfxo3mFgXqEoXSk201boxbH9pMx5BfOM0Ny2WHcdyH8fEoY0Iwbk3WyRgaP
	 lLdPLMhc5yvvfLGNu0hRN5Rr14lTTZNBag1I4gn+s0uSyzkDBPrkiQLB/JbU/y4feJ
	 GM5yxrJ68EVJfc0ZbHYYknAbOrlIJvoujbCXrd9ltd4rH3OjlIIJRBYcgb3TPnjqnN
	 1XDsRlgGIg+Ib8sBbqRvUicUAz+mUFMq6+HB/quxMWxlHQrc9n8wJhODCEACR9JfVN
	 asSkYWoYdvL/zEKUCCaDrrHy+UA0kikD1irnEiYm0qzUCMLZIKSl3liWWLmRvwgnc/
	 VcvmidRWnhnmA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: topology cleanups
Message-Id: <170187259154.34804.1799747785610622552.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 14:23:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Mon, 04 Dec 2023 15:47:09 -0600, Pierre-Louis Bossart wrote:
> Header alignment with firmware, addition of new token and partial
> match filters.
> 
> Baofeng Tian (2):
>   ASoC: SOF: align topology header file with sof topology header
>   ASoC: SOF: add alignment for topology header file struct definition
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: topology: Use partial match for disconnecting DAI link and DAI widget
      commit: 2f03970198d6438d95b96f69041254bd39aafed0
[2/4] ASoC: SOF: align topology header file with sof topology header
      commit: 6c4df324d78ceb6a3ebb0d42243d131a424c85c3
[3/4] ASoC: SOF: add alignment for topology header file struct definition
      commit: 8ec56af3da4dad008ab10115eb4cec34836afc04
[4/4] ASoC: SOF: Wire up buffer flags
      commit: ebd12b2ca6145550a7e42cd2320870db02dd0f3c

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

