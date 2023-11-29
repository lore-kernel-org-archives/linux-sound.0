Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F15C3C8
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIxjqBW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7216FC433C9;
	Wed, 29 Nov 2023 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701283978;
	bh=LliqbgxjKYpSYGdZMjsSOOuB0sDOwoVDfmuEIACbwik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nIxjqBW9nyiCjFaAlME1wSR3Du5UIqzmgUEWsOu7pkPvXbAOdftDqLXrbqPvxEzZO
	 VMmA2zKro4yZnCpdxLN7z4WK5JHyp5zYmFuBCMMglRLDrxuxZ3JX7DjtR16fX5M5W5
	 N4snDmoPhxUkIUojzVlLlJq8LRPEZayULrMEWUCIW7ag4KK9u4rEMVh/oepC9wLOSH
	 G9tqEIbyizebX86HXWWmEdh4Bq0FTimT/GoNEGBvm8Uw6TDLiyx68WsGuZDZG0hnXI
	 JOopuF5eGANQEFZOYz1pLtMqzkDZVzhaG/tDrqKHBx8fWqwVt/bP2NfNTLtaM58sjs
	 Iurym8X42Byng==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 baofeng.tian@intel.com, chao.song@linux.intel.com
In-Reply-To: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
References: <20231129122234.14515-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add module ID print during
 module set up
Message-Id: <170128397618.290371.4030404060053783635.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 18:52:56 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 14:22:34 +0200, Peter Ujfalusi wrote:
> This module ID will be used for module performance automatic analysis
> for different modules, module name, module ID and module instance ID
> will be combined as a new generated ID for current module, this ID
> will be further used by analysis tools to identify current module.
> 
> Take below case as example:
> 0x030006 gain.11.1
> 3 is module instance ID, 6 is module ID and gain.11.1 is module name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Add module ID print during module set up
      commit: 8f464a410944650adc8d75c7711d7d56c5506da0

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

