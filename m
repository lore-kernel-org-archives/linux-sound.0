Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC65218319
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 20:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731011833; cv=none; b=mokAWHpmiunLWge9oMRIbDi1G2jTmUYE9TE+Qc+YIb5f1uK2uMG+r1lBLjQN6JmLEUrtsXRoa2KQOUPGZS5CW8yZ46HcIcLzM/QSF45AjqLeZgzs6zTkHtnxBmqjJuv1cKg6oDP7GOLm410Vcs1dz7xUSsdXqyodG7d3d+Sdago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731011833; c=relaxed/simple;
	bh=6ZTUp/CqbIE8smwNsIOHRjIvYnGWDMwiFsyTwHcqeVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Efkhp9icxhW54W0XYV5Jt954B7LgqsJ3xi5uktyiYK8czcLg8PjBOBnD5wgsvsPnPvNlA5j174ApJb7MnrFP4JIxKYUzKDJobQeV761ODTEiaqgI6F9RElX1rwjAgGBvEkzW0L4pgC7uv9kJaIgD0xZOcWZBBPXWvTWhtIgg0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cV0/MGBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cV0/MGBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F18C4CECE;
	Thu,  7 Nov 2024 20:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731011832;
	bh=6ZTUp/CqbIE8smwNsIOHRjIvYnGWDMwiFsyTwHcqeVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cV0/MGBVzboF+oB6HaEoaKJ68dmET9rLbBgTFrPr+CjHfBywJOKG9U1K13bhOxBqh
	 sd9AJejO37Mo18pyl5K4Dhhtoea4PDM/286zCmVotu3/4GBjBv+U76fe8iK6IIE/pg
	 fhAOSJggtVoySpO/MecbCfSj50mH423diKljx4+odnt5dRC1Mg1Fl2Gi1OrlOWnqai
	 Tce4ChRRlPzlErgngU6lyDLLIk2IV+7/nR3EE7iZHyt04W2cklTxfdlLRINMNaHGsf
	 WYxG9nBlZxzGQ2rbtIe565ARF2DUqQnEUyzmc+QXsLmzTGfLJ8HDBkTm7awtwYLsHd
	 wKxprZ0SsOyHQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, fred.oh@linux.intel.com
In-Reply-To: <20241107134957.25160-1-peter.ujfalusi@linux.intel.com>
References: <20241107134957.25160-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: handle only paused streams in
 hda_dai_suspend()
Message-Id: <173101183103.257604.1380787731143921954.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 20:37:11 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 07 Nov 2024 15:49:57 +0200, Peter Ujfalusi wrote:
> hda_dai_suspend() was added to handle paused stream during system
> suspend. But as a side effect, it also ends up cleaning up the DMA
> data for those streams that were prepared but not triggered before a
> system suspend. Since these streams will not receive the prepare
> callback after resuming, we need to preserve the DMA data during suspend.
> So, add the check to handle only those streams that are in the paused
> state to avoid losing the DMA data for all other streams.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: handle only paused streams in hda_dai_suspend()
      commit: 7a117225b15b2d1dc021ab9fc36687c1e61ad2b1

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

