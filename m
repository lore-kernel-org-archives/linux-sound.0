Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CDD3D0D2
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 18:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRwJdccW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C28C433C7;
	Tue, 28 Nov 2023 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701196875;
	bh=3LSdrdBzxK1UTbEjFrEvygTknsH1KcNZjG9t4Rlj+so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NRwJdccW8HfeH7J4aChUziBQm1D3npvb8c8KBNFS60O9abCU6h0oJWesGHG/9fFQA
	 qkNQ5uE/JDn9hqjU+PaBNIAJPndnlGa9mUkPuIH7opkO3ASW33LLot9uAhvKzB84mz
	 HGH4PNXl3Y7ILGDP0nLl1fg0oTPLuJhJysRCbjTNdGHhJn8RtSE2972H11Nru7sl6w
	 gZ+Lz6NDEXh0lTmpKLYUradQOK+DyW6EKlKWyYKLK/fDGa9tlbKoibDbl6Ky2KeDT4
	 ZWnm8HE/clonYCEJakbQEJf3MoODM6tGmCGELzvOjRW/fDl4r/pGLBb4/K9qdbifvT
	 8Cs08R+c4ULpQ==
From: Mark Brown <broonie@kernel.org>
To: Kamil Duljas <kamil.duljas@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 sound-open-firmware@alsa-project.org
In-Reply-To: <20231116220102.2097-2-kamil.duljas@gmail.com>
References: <20231116220102.2097-2-kamil.duljas@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
Message-Id: <170119687331.105147.4721107892667611752.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 18:41:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Thu, 16 Nov 2023 23:01:03 +0100, Kamil Duljas wrote:
> trace_filter_parse() allocs memory for *out and when
> -ENOMEM is returned, caller function, dfsentry_trace_filter_write()
> trying to freed this memory.
> 
> After this patch, the memory is freed in trace_filter_parse()
> before -EINVAL returned. In caller function removed kfree(elms)
> from error label
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
      commit: 8c91ca76f44804868d12aed20ebdbc2f89aa7d60

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

