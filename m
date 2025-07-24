Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7F1DFE22
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753394762; cv=none; b=dBY76JSeYRvmWal18s+BlZbhTKpN5yalTJbEwZ/Y3d/r8jgqsGuRG0tW/oDcCM4eCgMxd3aW9TT0yKXUtWxn9RxRxnlU+Jt+6//2CVOvxT/vxFyU7Od9MzFXZ+1i+ob870CTvZjg9Wdz34tTHCmrza1hUmydT6WlPAooa8CcXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753394762; c=relaxed/simple;
	bh=33PCHxvnwJx5UYKIbDSxub1STxi7jdoBi7Ngg9ah80s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dxB9YoDTwJIqnfgJicXjX/BWpRV3l8vh7Efyc7tEMLUk5XsdySUQdXLRBNoj6Lz3CPb9sbC/SUq+vbpNR/igiDcVj8ygkYnvvwSlI5vdhJxdScxmbViknJH6uFH9urU3rTA/BnIEQNWN3tNgMfonaiI2jdLGrHGTqS6gmi94YA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezWnh7Oq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezWnh7Oq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EFAC4CEED;
	Thu, 24 Jul 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753394761;
	bh=33PCHxvnwJx5UYKIbDSxub1STxi7jdoBi7Ngg9ah80s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ezWnh7Oq3fZED7DBxJp0I/nqiExU4ry1lh4VHOPganm0Zsh+GeseBjL/YKKv4zH1n
	 JJzNw4DZLu42T9pY7vNPYg5IKi41Hqek3M/oE2p9/Cn1+CwMVN6WrXBJt8L0V5Grqk
	 OUHFWf4dgRs/7Y3EEO+SPWcx2xC8M0Et4xPhhtIqh7Qwa0VS5QcRtdgrWb9BVKLr/k
	 57xur4wI3JtN7USGhbi8wEE/IKd3K0Gfm3BcSS9+mKisPeqmnB7CWh9wZ3T+7VPdX5
	 myqaO1m/pVSFQ2sPb/QFAZ3uba7jvT47vDsWO1yOlC0Eht7ormCu6cvTL+s6Enz5UH
	 QbH9JfA3SMmdA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
References: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] More minor SDCA changes
Message-Id: <175339475973.170068.13571627167670291471.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 23:05:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 18 Jul 2025 14:54:30 +0100, Charles Keepax wrote:
> A small chain with some patches that seem to have got lost in the
> process. One small additional bug fix for the regmap callbacks, and one
> small feature addition for the control parsing.
> 
> Charles Keepax (2):
>   ASoC: SDCA: Fix some holes in the regmap readable/writeable helpers
>   ASoC: SDCA: Add support for -cn- value properties
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SDCA: Fix some holes in the regmap readable/writeable helpers
      commit: 061fade7a67f6cdfe918a675270d84107abbef61
[2/2] ASoC: SDCA: Add support for -cn- value properties
      commit: 50a479527ef01f9b36dde1803a7e81741a222509

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

