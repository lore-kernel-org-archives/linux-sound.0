Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0232939F
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153377; cv=none; b=UMLXQO2guw3+ssGHxslorGvJt289MaAyPyhI69XBbig167pDZslrgOGm8eSFrhXQwlwy0Ugh9Unt/5g0LA0rOfw0/CFI5KSf+ShS2wuU230AnKDuwQSo4f6bLws+3oobzrDkoqp5xwikXDB5ADJ0qJVMPbKS/qRAsAPCJYkJwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153377; c=relaxed/simple;
	bh=k+4Lk1SPWdrtALXmRB3VQ55y3w6rmizkgsbsoaV2fig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PLJLOi7pL5Fjr7V+h6C70EsieVCqQO/EknNv8IXdWmSZQUn+D7QhmmZOJa1D6YvSDRrpyXTGwbShuN9+bRTt6YmzEJQb9RQ3LoR4uAVof/aFalgiBSumtHzCH37wmCpySSVRgOXX2khxNz+tMNJDmTBjPcj0NJdPYqIlRXn2/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMONaXY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMONaXY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0206C116D0;
	Fri, 19 Dec 2025 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766153376;
	bh=k+4Lk1SPWdrtALXmRB3VQ55y3w6rmizkgsbsoaV2fig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sMONaXY7XyEe/juvS2TgPfjodw/ICm/hmiJ/OaXFSGt1d56h3pLiEZN34oTiXg1Wf
	 ulxITcNUaoPyOeX39RnTfsFRbpUYYYbDs501RkDTcRrCmwbJZQo9FCDuutWeZ69e1X
	 iTzceNxIrdnPRvYwOmkhhnUohgvns3K+GdXkelo55MphLcqvl+CdxB57cV1e0CVOKU
	 zk+9VIaWugdqcJ/mvfpZHRF+dkr1lddZcEjkX15KT5sjxd7yMPxLgewEHAD4vELSQk
	 pYFYKKt0ZAfI2GvXXxeNSQi9P3Fxa2d045dD24DKjeD4+U63/drvOtMX9w62RsmvoL
	 5UurKs2gW1Ezw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
References: <20251217110433.3558136-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: add support for TAS2563 amplifier
Message-Id: <176615337558.412520.749138488969758639.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:09:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 19:04:30 +0800, Bard Liao wrote:
> Add support for TAS2563 amplifier on Intel platforms.
> 
> David Lin (2):
>   ASoC: Intel: ti-common: support tas2563 amplifier
>   ASoC: Intel: sof_rt5682: add tas2563 speaker amp support
> 
> include/sound/soc-acpi-intel-ssp-common.h     |  4 +
>  sound/soc/intel/boards/Kconfig                |  5 ++
>  sound/soc/intel/boards/Makefile               |  3 +
>  sound/soc/intel/boards/sof_rt5682.c           |  6 ++
>  sound/soc/intel/boards/sof_ti_common.c        | 76 +++++++++++++++++++
>  sound/soc/intel/boards/sof_ti_common.h        | 24 ++++++
>  .../intel/common/soc-acpi-intel-ssp-common.c  |  3 +
>  7 files changed, 121 insertions(+)
>  create mode 100644 sound/soc/intel/boards/sof_ti_common.c
>  create mode 100644 sound/soc/intel/boards/sof_ti_common.h
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: ti-common: support tas2563 amplifier
      commit: 331786db1b464fae42c36f53d6901d1d54975e04
[2/2] ASoC: Intel: sof_rt5682: add tas2563 speaker amp support
      commit: 02e7af5b6423d2dbf82f852572f2fa8c00aafb19

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

