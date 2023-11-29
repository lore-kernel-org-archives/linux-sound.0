Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1A60EF5
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAArUxbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBACC433C8;
	Wed, 29 Nov 2023 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701292682;
	bh=zjroZ4QizTDpv6VelU2kE8o4muDeYZ4T2Ye9AJFVwMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rAArUxbtM+j4rCmKl3RWqtqa5K/gk6w10YpTrrq2tIJxQzVR02YtCZ4LIVuiCTxR5
	 an7aKu0isjep/gxN/H25zICbpcSqvDYZZrz0lEoBxTjIpqs5FoU6H+lX6cHSmcayZ1
	 Q/BWpIsXhEfnZ333Da0EMHD9Bz0wRq6Zl+N9sfaEUkn5jfnqXlKqeFHKdi3r2072Rr
	 mH/untkI4jNuaYKe31Jymkb559ETzqTFcfF4mCLDuIpWGnMVYMjUvW+tGVS1X457/C
	 mUmxm6UUWNKmMN4SG0VaTCHZ15CyM1Ww3P4DLfPGNZQSDDXPjqNSMsavy2RuEB/YUf
	 nzxaOL1Bgxl0A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
References: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: ipc4-topology: Correct IPC message
 struct layouts
Message-Id: <170129268022.323590.12416749966996283844.b4-ty@kernel.org>
Date: Wed, 29 Nov 2023 21:18:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Wed, 29 Nov 2023 15:14:09 +0200, Peter Ujfalusi wrote:
> The SRC and GAIN module defined it's kernel side private struct in a way that
> part of that is used as IPC message without making sure of proper alignment and
> padding, which happens to work but it is better to be not 'clever' about these
> sort of things.
> 
> The two patch corects this overlooked detail.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc4-topology: Correct data structures for the SRC module
      commit: 2cf4da68a480f999ce1327a23557fad7b6dd80dd
[2/2] ASoC: SOF: ipc4-topology: Correct data structures for the GAIN module
      commit: c7095d154ddf40b6221118a0bbf30e68d78460b3

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

