Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523210795
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849096; cv=none; b=NqqfaAhkbrEB8c7V3CBdBMBACNxvaJ1QCuNx2/OuMKVnzT4KwsQ54oegbtTpJn2C/gkGu1KSHD3PJZDYfX5H+BYiNaSjWMC2cxApBaBDrue7Hh1PkzuZEBaE2VHI27Z6fNwMQkvSI/9kgr36q2V3O35T27xnQIXTZguxxfgf524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849096; c=relaxed/simple;
	bh=8ZX2746iEnZZdjgsRqIFPBNc/yNHELXAz8agXg5xBRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZbayjOjmfbwKBEk9BL/UhB3rTsnwrMY5CXh7pepNtekDlyAq7xLaL2jogCQUUeEGQapQWJJnHCRnozy1Xj7bXf2GTXxR6nsUKT2tG+4fdfAUVgBqiISbyhJZZbFKYI1khl+zCNX14eazo/yAJJBQCJG77hKaiqNMGGTuZtrG82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppQmBhNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppQmBhNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F93AC43390;
	Tue, 13 Feb 2024 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707849095;
	bh=8ZX2746iEnZZdjgsRqIFPBNc/yNHELXAz8agXg5xBRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ppQmBhNot4sRUn6q/u9hdvo/59BDllf35PIghHtl75WLQ4CbJJ70aFpMBmmjvP9Gr
	 jLVAb2lFZKgS8wLquwjo7yGhxkutjiocbDqEvEznS6T2kCjAXfB/t6uEcuLHbM3Wag
	 1g+AT7qLeLTxm76zXfApWdK6Mnw7DypQoJIjx2qf+InNqCJR18hDjettZrALZ79RYr
	 P9U05v1Vu0HH4XYnATkLPx27fuyRqFMnWGOhJ3THDJXRVW9pRXMjwX3f16V+y9BsHC
	 u2ln0/e0n3kcwurOT2oGk622439jl/JP1TEFvV3kKIG6iPWIskT3kqXNTf4CW8x5Q1
	 e//VLk02hFhxQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
References: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: pci-tgl/lnl: Change default
 paths for IPC4
Message-Id: <170784909406.647645.15136826851500401678.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 18:31:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

On Tue, 13 Feb 2024 10:04:16 +0200, Peter Ujfalusi wrote:
> Align the IPC4 firmware path/name and the topology path to the documentation:
> default_fw_path:     intel/sof-ipc4/{platform_name}
> default_lib_path:    intel/sof-ipc4-lib/{platform_name}
> default_tplg_path:   intel/sof-ipc4-tplg
> default_fw_filename: sof-{platform_name}.ri
> 
> Tiger Lake and Lunar Lake support is not yet available via the official
> firmware release, the paths can be changed now to avoid misalignment in the
> future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: pci-tgl: Change the default paths and firmware names
      commit: d463bcd7eb341b5b6e6d9263a3bce9f405c2af98
[2/2] ASoC: SOF: Intel: pci-lnl: Change the topology path to intel/sof-ipc4-tplg
      commit: b029482011bffd57319507c2bf4c5a7e06eca756

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

