Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A4224AF1
	for <linux-sound@vger.kernel.org>; Fri, 27 Feb 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179181; cv=none; b=e00tGMDjD7q4MDCIJmrv9BUNcPAxuH5CSeuw/XtIfZHQEtXE4Y0SQKH0Apr2662aedbT+XNy9JBPpmO0OMPI/oSxxMPew5CZdR7/cJe9YdgF+VkGza78yAb9Kt8DaeRKjkAfV116+LsMZnvLYGKCTE2HWZoK34yMffuAJb0AfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179181; c=relaxed/simple;
	bh=KbfSlCXXxhw83iGO+GNGCmTkTZUE1Qzz+iLwbMuewd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h0tYP/DAbEDKI4kzXwcVGWqMIIrWTrCkXO9Nv3jSwelY5tmdDFaocuZ4hnUmuQP2CYnUEDf5ghNzhyejkIsWOnxRrnEmwxJ9w6TFTsMuJs7nY9WDBrlsmF4cYXfJ7A0NvhFs3yXvN7whvs+PbOVLhgS1btqpbNkgC8tgoA6tTYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cs6//vpf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cs6//vpf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CF3C116C6;
	Fri, 27 Feb 2026 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772179180;
	bh=KbfSlCXXxhw83iGO+GNGCmTkTZUE1Qzz+iLwbMuewd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cs6//vpfRg/gwc5i/eLfeyX+d4HwPmPoYyIL0YVTljCixrLIfeFpOFxXkhPYGihT1
	 qPdNbIr9b6rp47NXFiWcbeHwk4Tw+f+nq8JAGrR6jpooxUaKOk+UT5HyXMzEJL/yod
	 77bTX3ytbBqEM0YQUi9IGqqmTF/IJdDK1Cb8swBvUZ9MIQdZfW4w9+yanpNY0iAJoO
	 2XFRI9nO8MSbjW4CdnWIpY96+1cskMrvXjE3kgws3sKfFQHLPmF8XpbtpVMn7mHOcx
	 BL2TQ0Etf7qWdFrtj0YZd0YnxLhL6K9BgOhMvMeY9HWGnMhs79mLDkIN6L7NQzxK6N
	 Mps3Ny1n71QVA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878qcfyogw.wl-kuninori.morimoto.gx@renesas.com>
References: <878qcfyogw.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: remove snd_soc_pcm_subclass
Message-Id: <177217918013.62764.10897228181507208115.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 07:59:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 27 Feb 2026 01:17:19 +0000, Kuninori Morimoto wrote:
> enum snd_soc_pcm_subclass has added at v3.1 commit b8c0dab9bf337 ("ASoC:
> core - PCM mutex per rtd"), but has never been used during this 15 years.
> Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: remove snd_soc_pcm_subclass
      commit: 2974aa42e6696a1d95b727d677dc01a71af5b998

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

