Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113E45030
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113542; cv=none; b=XznI+POr9IK82clpkGD6XiCPZUVnDVR/PZXgI9JOGwL2FZ3vyyXAcnHvsOd96gZ2/uYjS7KcXTM4HgAR0FtFGMN7i6qQwJksyEwab+p3EvigenGwdyygvRsMpejWVzbl+fmWeCkkcAXdWzohOpUA/3fvFmkWVtkPUKOykZ2CIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113542; c=relaxed/simple;
	bh=QsRR+QkcQnz+CcB5BiL0FhB+Lkjx7vr/PorGDV4G7Fs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PVR0Ze/Q3yxYy1wbyPPkT2ieVICRMUwfAYglhuAp3mrp1Ig7QTg7mPIciCKMObk40S1XNUVGP+WdsWiTua/NTcq8ZUeUsCQsbxWKp77N9lFTLxodKizB/GsccZBp58mHd8OU1foKBpZJOB0+ac29uCdxBl8wJ7tQNhKjI/F2P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pggm54G+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pggm54G+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916F1C3277B;
	Thu,  4 Jul 2024 17:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720113541;
	bh=QsRR+QkcQnz+CcB5BiL0FhB+Lkjx7vr/PorGDV4G7Fs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pggm54G+30JWgXgOmjWhEMkylZ85ZrQ2guzoMflYeiVWSyioQytE9QbI8F2p8zksv
	 cF7hrVZIG6ksUCchvtggjv+pyaQu2aKJkF3Nn7Qfv3wbjgNRMac6mAOwLQPzA59N5Z
	 hKhbpej1rFD0Uf7YRvuwHXSHfeKcah76xWUzzU7e6GTvHQ1hFJ9xt8V546LKR9pMB1
	 UBiT9UI6tKDimcmOlZKiwfJMdfKNjYtTHqljYa+HdoGPGGhVs7Z/xXyuICPy021uiz
	 102Kiub4IhBGNT2OtvijwNt14Jqu6lPAv64vFxMsysBMyAWAeWV1+wckfjqEwd7vDv
	 oygMBssMoMXPA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240704085708.371414-1-pierre-louis.bossart@linux.intel.com>
References: <20240704085708.371414-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: fix null deref on system
 suspend entry
Message-Id: <172011354031.90743.5979596814986431326.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 18:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 04 Jul 2024 10:57:08 +0200, Pierre-Louis Bossart wrote:
> When system enters suspend with an active stream, SOF core
> calls hw_params_upon_resume(). On Intel platforms with HDA DMA used
> to manage the link DMA, this leads to call chain of
> 
>    hda_dsp_set_hw_params_upon_resume()
>  -> hda_dsp_dais_suspend()
>  -> hda_dai_suspend()
>  -> hda_ipc4_post_trigger()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: fix null deref on system suspend entry
      commit: 9065693dcc13f287b9e4991f43aee70cf5538fdd

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

