Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151C481B3;
	Wed, 18 Dec 2024 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538622; cv=none; b=C9IdHqx3w8XTrkibLMPN7xZC9g9b40k80JFdZHyW/NxemzYVqcSE2lukpojKUYLf95TKmgadHTJs7o+Yy0AV61KVIt+wfJiBRefzphebOh/ONJKH6nlS0iYMFlt4heji+QY8trqv61e7oqC+On2KAG3sm/WYAb1ABKuP28NDNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538622; c=relaxed/simple;
	bh=BSjJenF+XRqlaTBDLIJWNQGcwPgU2a+Lsli8go+Sy1Y=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RoVFn1pt6eUB4NZOBK07kbfnY21H+YpsPfMJ/gzS+vk+zmRdvLyz0mkNuoLRlPvyjg45wBuPB9uK+RrcK3ab0L35ue5VE0IZpuGtUqTnzSwl0/Ch1MsY5ZngLKu8ZKsQmHGGrpMN/fwuDpKj0ipcarIxfpQz7GqYYg3qh2P5Hgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxsiXzBo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxsiXzBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4D1C4CECD;
	Wed, 18 Dec 2024 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734538622;
	bh=BSjJenF+XRqlaTBDLIJWNQGcwPgU2a+Lsli8go+Sy1Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hxsiXzBoUKC3DY9rzKpOp64KhPSZTIwcTfOPG3glHM8Fv060Yl5Vu0Ch55GKlm0A+
	 6S6Jd5y4AZW7R0JJKF7b3d1ziXpJL11D/FEjChIuDHLmH+FTsrUoZmaHxDhMob/vXD
	 tSHUxAHMg50i6O8F3xwHpSXaQszPksfdak1XLF2Nzekvio/msKc0s8j57OHYp4cM95
	 +r8dbJAfZnd8s+X76uc16pLP17efDB03ofmezBwTk4lHG+XQ4DiwYVTy0vzzZK7UDa
	 NKU6loZUkt6M2XQZ3J0DYuOI9DO5awNt98Fmheu+/M/TWnhN39fDtwSflA4TgOztUV
	 tM3kqtY89NcTw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
References: <20241218024358.3022635-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t
 type
Message-Id: <173453861976.133517.16034496659333958470.b4-ty@kernel.org>
Date: Wed, 18 Dec 2024 16:16:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 18 Dec 2024 10:43:58 +0800, Shengjiu Wang wrote:
> Fix sparse warnings:
> 
> fsl_asrc_m2m.c:360:45: sparse: warning: incorrect type in argument 1 (different base types)
> fsl_asrc_m2m.c:360:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
> fsl_asrc_m2m.c:360:45: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:361:41: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:361:41: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:361:41: sparse:    got unsigned int [usertype] format
> fsl_asrc_m2m.c:365:45: sparse: warning: incorrect type in argument 1 (different base types)
> fsl_asrc_m2m.c:365:45: sparse:    expected restricted snd_pcm_format_t [usertype] pcm_forma
> fsl_asrc_m2m.c:365:45: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:366:42: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:366:42: sparse:    expected restricted snd_pcm_format_t
> fsl_asrc_m2m.c:366:42: sparse:    got unsigned int [usertype] pcm_format
> fsl_asrc_m2m.c:595:54: sparse: warning: incorrect type in assignment (different base types)
> fsl_asrc_m2m.c:595:54: sparse:    expected unsigned int [usertype] formats
> fsl_asrc_m2m.c:595:54: sparse:    got restricted snd_pcm_format_t [assigned] [usertype] k
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
      commit: cf126261d5d3b8767fd9c838ffe7213144d05147

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

