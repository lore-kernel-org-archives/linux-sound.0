Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB861FBC8C;
	Wed, 10 Dec 2025 02:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333112; cv=none; b=QQct4nsKSZe4yymEMvRAr+4w4pQ2af3DflBY6HhMkMkBI+839+Ij06CeKec3LY1GeD4P+z6EPfT8qj6Eg0RD6VmYtXfUejmRaeduP4HjLFhEuoI38Z6dkzPKT0Sdy2ZYAT8AlKozgqlno4LddVSL3dDWrrNHUFEbZLkGucBV2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333112; c=relaxed/simple;
	bh=/uxoRzbJrRjPDXsTarshYtHtLiesJNJtU9NUEQj7nQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eePx0aovDBHH/aDwdNDIgtUjNfqta7uURol/HEat6FZ0wy5rf4lI+xe7mQGb0AVEJRhOPtzrMSxGsDHLA6YRqw44J+LGD3fmm9lhX9Ii1c3ytS90HxlvpNHRIZPJbCLBBiFcmhlfCvZkXULGw8aR+wm9439CVeSW0d6tYd/s2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMm0aZ/P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMm0aZ/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5D8C4CEF5;
	Wed, 10 Dec 2025 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765333112;
	bh=/uxoRzbJrRjPDXsTarshYtHtLiesJNJtU9NUEQj7nQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WMm0aZ/P2PC4Il8Qg6nIopEeYmDJs4DWHoy2ukRi+hIipW0ZqB5F8wls9K9bwbS6c
	 1NO/omNrCbg/AbHkCg1+7v0Txt1U9SOZBG5drF8qeBmobU18CxeKdBcmrApScD5jpo
	 Bs6yeRZMc0XcPhj+FfZYbGMkp5AcZHkyZR/BtnR60ERzXHP3HS/pPE2wqgmOaK7xdZ
	 6drkvjOqJ6L0gZXRsXFAGvLUe5Y9hYmIpEca2OfkzD6hEQacOAIdp844Tspn7vwZtn
	 R/KsC5bV2eeHVplhOjR7S6R6uS2psCrXmG6a3qyIC1XQpeoduWSiLexFJJGMNxAzPW
	 DLveTR48fFJjA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, 
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20251203120136.2591395-1-raghavendraprasad.mallela@amd.com>
References: <20251203120136.2591395-1-raghavendraprasad.mallela@amd.com>
Subject: Re: [PATCH v1] ASoC: amd: acp: update tdm channels for specific
 DAI
Message-Id: <176533310879.649124.15118877289373769932.b4-ty@kernel.org>
Date: Wed, 10 Dec 2025 11:18:28 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 03 Dec 2025 17:31:34 +0530, Raghavendra Prasad Mallela wrote:
> TDM channel updates were applied to all DAIs, causing configurations
> to overwrite for unrelated streams. The logic is modified to update
> channels only for targeted DAI. This prevents corruption of other DAI
> settings and resolves audio issues observed during system suspend and
> resume cycles.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: update tdm channels for specific DAI
      commit: f34836a8ddf9216ff919927cddb705022bf30aab

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

