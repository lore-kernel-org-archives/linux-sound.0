Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45D158DD5
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 23:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712705648; cv=none; b=p9AfYL1+ayS2MZh4V3MkWR0Bmt5LfwKkGZZEAd1mEK9IIp9SvX50p8sRW3hnFMIva02q/VhvTfZsuh89921lZGYevLURobYG9JNNotCMo4bT5ZBUaJWwP//pNWkDVPW6MR1Dv3jy8OKYjY5GXn7s+2P+Y1Z8MACLUeYdHjpi5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712705648; c=relaxed/simple;
	bh=GGZPp2CVjU917fj2XiVdNr1qQjyxhB0WLyitW5028Ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BFpBTeGQ7oNwHpkSy9cZCFgBmVzut/tHHK9Uj+ShrX7kofmpyXHlo92MifTj5+Ek9JICBz1brmryvR3XXHsBnB/UBY2qcedKX2iQnT92xj7T6sDFnQvS+mDYftpZqpWd7ZBSbyfo5NyX0xmc3nfY5J4viY2ISDL4Nsrxo5QqA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzUWHUSj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzUWHUSj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3576C433F1;
	Tue,  9 Apr 2024 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705648;
	bh=GGZPp2CVjU917fj2XiVdNr1qQjyxhB0WLyitW5028Ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jzUWHUSjzJslHISZMW2z2Wrafyyo402ieqWA2FJnkOFxNMR78mr4vx98Ea6USAJQ2
	 +L6ny8/LhwkDuLMKFwQTLHH7SPg+ts/lgfnPrhIzVommQEJhUAN5nDB1srz8Xzq98K
	 MGAGAiEOz8NFHNIgoFU7LJKY+D8pdiwEoO0LJCUPCb0ZnOG8fV78n4yRkJoZpIK9fz
	 thmY8dTYv94o0yxDZHVzthewyS56tQbIJrtSPApHqlHu529d13DAvK33ggHUBJGqVV
	 OwaEonwnALbm2nhhweWh/bHaSipqZH39ickUSuY3azE3ghaIPywOPhFHCQGHlWWzu1
	 H9ikC1oecINFw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
In-Reply-To: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
References: <20240409110036.9411-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: ipc4-pcm: Do not reset ChainDMA if it
 is not allocated
Message-Id: <171270564645.199334.1684630890281076233.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 00:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Tue, 09 Apr 2024 14:00:32 +0300, Peter Ujfalusi wrote:
> The current code will reset the ChainDMA on release unconditionally which
> can result the following error when the CHainDMA is not allocated:
> 
> ipc tx      : 0xe040000|0x0: GLB_CHAIN_DMA
> ipc tx reply: 0x2e000007|0x0: GLB_CHAIN_DMA
> FW reported error: 7 - Unsupported operation requested
> ipc error for msg 0xe040000|0x0
> sof_pcm_stream_free: pcm_ops hw_free failed -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: ipc4-pcm: Use consistent name for snd_sof_pcm_stream pointer
      commit: 965e49cdf8c19f21b8308adeded3a8139cff5c84
[2/4] ASoC: SOF: ipc4-pcm: Use consistent name for sof_ipc4_timestamp_info pointer
      commit: 36e980050b0733829e4e0f97b97f7907ba9f00bb
[3/4] ASoC: SOF: ipc4-pcm: Introduce generic sof_ipc4_pcm_stream_priv
      commit: 551af3280c16166244425bbb1d73028f3a907e1f
[4/4] ASoC: SOF: ipc4-pcm: Do not reset the ChainDMA if it has not been allocated
      commit: 7211814f2adcf376b8db6321447a9725c33b6ae7

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

