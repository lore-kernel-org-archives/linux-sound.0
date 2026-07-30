Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D8322B87
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498370; cv=none; b=YQaDdnXUXYmpU5ObisCPImS2jbAFHWPxD6Lo46qM/AiZmBQIFwCAQKQBVeFDuyDsBOzrxv33LiyrqtfeloJD0VS00F10doyTM9RFJiJbv2dsIvs91PhmzCS7/zm8U3rJRrSC+pgOS3sc/mXpuCkzuhWJGK8sfxPaQPnUk12huXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498370; c=relaxed/simple;
	bh=e6XkrYkmb3el4t+IYF9Zqir2QtrMnPY1qkBLVRuUsXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WxvCwULIUPMaiE+Z2/WdDO/XEME5b8BSulhVISMpqhpirqiLqL88CkfdkmgvKRK+hnJaVTAE3q2JqcYIrgXhI6jSc56nWNgT7N1Jkg9q8aUZEGN5MMSWLNhY+7hT7/LTeV2HIql3ObS13vJYcJxi1/I6Tdvs6aemJCaN7IswKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCvKjuI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCvKjuI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0E71F000E9;
	Fri, 31 Jul 2026 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498369;
	bh=g6lmMGzyX7JWVL5Nh6lc3UNc/i1E6LtGY3b6GXhe8us=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JCvKjuI5VDpg2xvcSMn3tGIWPQ9VJqyLmU320aspCPvFvjgoE+b5B1uQ6q9UTKlAK
	 F3PhIm5VGZKeDfPL4R9fIPX7ocj56j6t8IP0fENZ6BSLG++wcCPJZy+ETZY3hd/9cu
	 b+XNGNozmS8SU6bg1HqPV++U5/7rZFDDy3Mmbge6CI4OyRIt0d2Zc85OzZOIY/8Dzu
	 J70PmCklK4Hm2MfmMZaRUDPNOu7M6ms0UznX09cdPY63shog4yELRGVdODsC0z+pHa
	 6RDSOet25a0w5HDXH5TAvz1kHZ+vPXd/jDqrWuHovYPGh+5djXtbzLugCrERKaFELT
	 Ir4bF6FIMFz3Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260730082444.4828-1-peter.ujfalusi@linux.intel.com>
References: <20260730082444.4828-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4: Add decoder for RESOURCE_EVENT
 notifications from firmware
Message-Id: <178545151039.556383.7988614420630920385.b4-ty@b4>
Date: Thu, 30 Jul 2026 23:45:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Thu, 30 Jul 2026 11:24:44 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4: Add decoder for RESOURCE_EVENT notifications from firmware

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: ipc4: Add decoder for RESOURCE_EVENT notifications from firmware
      https://git.kernel.org/broonie/sound/c/c50ed4627e33

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

