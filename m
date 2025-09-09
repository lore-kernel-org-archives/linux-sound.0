Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5631D392
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438628; cv=none; b=fvOkS5pFcg9rqK4v8sNPWerG7s2UHmx6Xgm8/GKUWV3mGrnaFCxxWHavBizqT8lyHNTjhUpvG7dBjuFSLCB2ko4rqv+USWEzopxlVg/lHD/hze9/8IFnmzIe33SIgr49uR5KOtSz3CXJD/P6BGJWzyX737dEUbu4Y+nd+Gy3A8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438628; c=relaxed/simple;
	bh=GxjokJjtumWfHbe5GkNmN3M8xkTGcvI8iuNxmSyF0KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d0HgEosDULjtDGXJxh8XrLzynPSfEWS4/5rvNhJ0IojzUQzmTtIPTM+wJODwNd/13H1+dtiHJu2DbHPNTbBgebqDDciNbNMPBCff7YOPWZ51OWX3ezpSm7yDdCyWzhptnaC+baN+cdfJwbUlPiiNOOrtqwmp7drA3FCppK60ggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5Ga8lsM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5Ga8lsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC3FC4CEF8;
	Tue,  9 Sep 2025 17:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757438627;
	bh=GxjokJjtumWfHbe5GkNmN3M8xkTGcvI8iuNxmSyF0KA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P5Ga8lsMk9m96QzzdKsBzWEz6TlPdiPj3Rym2ovTXdSYVdYyT/AwjMYmlrIh4ZXJL
	 GeHhHs+Z69+wLN7FeAhWtdXCgAg7cXSjdguoKf8jdY5t9el3SS848m76hJK2JZHQ9N
	 q78JVWvd/qp3aLhC95C1QomF4jurPR3oIExqilhMBpMLXCV5uZbBk9zsKrkgWSsA/H
	 YTYpA0x9lp3BcKHLhsjIHeJ0ecJqkbAqSXzadnA1wcYB2fuAmV0QGiS/2Zz8qsri95
	 KJKom+rDTOCcyDsGjfria0dCRuKJIjQ9NCUbq5aiO3m4wFbNjFqs1MnTG82LXd7brp
	 9IC2pUAuQfATg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250902171826.27329-1-tiwai@suse.de>
References: <20250902171826.27329-1-tiwai@suse.de>
Subject: Re: [PATCH 0/3] ASoC: Intel: Fix invalid quirk input mapping
Message-Id: <175743862693.300420.14705810864194949240.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 18:23:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36

On Tue, 02 Sep 2025 19:18:18 +0200, Takashi Iwai wrote:
> This is a revised patch set for potential OOB accesses when wild
> values are passed to quirk option for ASoC Intel drivers.
> Unlike the v1 previous patchset, invalid quirk values are checked and
> corrected at log_quirks() in each driver, instead.
> 
> v1: https://lore.kernel.org/20250415083144.6588-1-tiwai@suse.de
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: bytcht_es8316: Fix invalid quirk input mapping
      commit: b20eb0e8de383116f1e1470d74da2a3c83c4e345
[2/3] ASoC: Intel: bytcr_rt5640: Fix invalid quirk input mapping
      commit: fba404e4b4af4f4f747bb0e41e9fff7d03c7bcc0
[3/3] ASoC: Intel: bytcr_rt5651: Fix invalid quirk input mapping
      commit: 4336efb59ef364e691ef829a73d9dbd4d5ed7c7b

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

