Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C526F296
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569341; cv=none; b=ATsZt7ArAR9XxPJ/PcVyGkfPBYyd6LJDJ3ZuWHjioF4ZkSj/ZjaWR0WWn8Ly3g5Ei3qCOIf+8sI0WcKspjbbE1Ty0YSMozfmbV9seVz1FTjjxPZ10SIFCyAUNS/UYHanJqDJZvT6spoGU5B+HfHRsRPQbVUia7k+UfAAl5a6rOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569341; c=relaxed/simple;
	bh=wJFvF+IZl/yqWjbvn4qnA7ef1fZgcfbS7Tpmi6fXBUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hw20v1EFhlB02V52YUzr/dU7uYc12rNrgX3mBSPrHhuLZPTo3mvTcVutOH/obMWzr4nQNzy6StMX1vvseGAOy/ZF0hzqiJetkd/MMQCRJQWNfFBHnvVG9YTpmr1FoI6wt94hASq0QmQezQbpEpJqvQJ3TXV1NTlAMSw1DlsEQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx12wdTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx12wdTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B882EC116C6;
	Wed, 28 Jan 2026 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769569340;
	bh=wJFvF+IZl/yqWjbvn4qnA7ef1fZgcfbS7Tpmi6fXBUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zx12wdTpHAPQ3xuktKFrkyLR4PhO8oflKLzEJn9AH1/22TaAfGxPMKSdNPRAiuQOw
	 h2MsZ7UIm4UGxef+Tb+FOoLgMMiDAKijKSxzsiz2Lc3TUW6ujhynCoeRwggQ40vcCd
	 wlaqY0cqM5UWzKeKOg9fQ7+igUR+TlH0OrunA9HvMVFB61Ks2Smeq1U6p1alFzzIT9
	 zh0wyaJdUn7mRLp8l6pZWhlD/4N230e3Bcu5ua2YJwmcopr7dGD/kvQTCDh8cfV3bi
	 Ycsruxc3DsRx8rm/vQrYqZJbe8XTawparmgCfJKJiPIAQv23slthcwR3kLUMnQDWQT
	 SrzBWbCIn3rtg==
From: Mark Brown <broonie@kernel.org>
To: Tagir Garaev <tgaraev653@gmail.com>
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260121152435.101698-1-tgaraev653@gmail.com>
References: <20260121152435.101698-1-tgaraev653@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: Intel: sof_es8336: fix headphone GPIO
 logic inversion
Message-Id: <176956933950.1515833.1194554623832941196.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 03:02:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 21 Jan 2026 18:24:35 +0300, Tagir Garaev wrote:
> The headphone GPIO should be set to the inverse of speaker_en.
> When speakers are enabled, headphones should be disabled and vice versa.
> 
> Currently both GPIOs are set to the same value (speaker_en), causing
> audio to play through both speakers and headphones simultaneously
> when headphones are plugged in.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion
      commit: 213c4e51267fd825cd21a08a055450cac7e0b7fb

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

