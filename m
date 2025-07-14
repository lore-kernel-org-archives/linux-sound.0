Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3201253B7E
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500551; cv=none; b=uxE6F1bshy+nhzYHE1QPmIyMwjZCH/8+kgmuREh0odMw9fRTodOjuqWsyi9uPKdwhtPcJMjLuSfZzzi3I37uuhIPAuZiMNDpbDtDaFPgsfjLlg4/sF7Ee30EO07AHAjKZ82Z3A0ashkrPb1WakbKiAs8vbK4mPry3RYwUL5lF7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500551; c=relaxed/simple;
	bh=iUMSPavhVP1lxfPFzCYucX8r8KPCIeazdyqkmrxrnpY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jssg5IK7guLAfI12Vp+GKWl03czz41IJEVRfK6LQB+PfzHoQU/oOMrFAu3EKGJpzGLOj+YyN5eSjiJ4SxLkleerUrW3H57s9DS5hMvVpLVyxopj+ea53Op+TDbAi0ptiPhU+lfcmrUYYT9C16FffUjdEbdeTN020OqYRQdieAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt0XdZFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt0XdZFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE712C4CEF0;
	Mon, 14 Jul 2025 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500551;
	bh=iUMSPavhVP1lxfPFzCYucX8r8KPCIeazdyqkmrxrnpY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Xt0XdZFZd9UGxC00PDWbuQ5yUj/RWUMTwPjQiPKafzx/aWVOcnT9gZOucGhaJW87Z
	 ijzOX0ueuyLC/Zk751YXNn0NjHzn0hz1Lia28zh4Iy47wX1FDrsD3hr/GcivpjveFl
	 H4aCSGIRFps39eUwbkJlJGXkRaXYLyGPo+1VMdZUzdWeA3MS0ZcLnN6OAcylD+eJH2
	 UWBjxvHf22aqN1ht6FIelnr7j9C4xC86ZJdHF9wcNX0RZTWN5Ow20j+EJTYoIWsQHO
	 SwS71IWNlGJxCC5t0wv2HO/yHRVKZSe2D16Ij5czunZYzIGYRyQS4XrOjkiem93M1p
	 r3OkiaH/aDGjA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej34g5d.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC][PATCH 0/5] ASoC: set bias_level at if
 snd_soc_dapm_set_bias_level()
Message-Id: <175250054953.59912.11034261165939984995.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 14:42:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 11 Jul 2025 02:26:06 +0000, Kuninori Morimoto wrote:
> ASoC has 2 functions to set bias level.
> 
> 	(A) snd_soc_dapm_force_bias_level()
> 	(B) snd_soc_dapm_set_bias_level()
> 
> (A) sets dapm->bias_level, but (B) is not.
> I think we should set it on both (A) and (B).
> I think it is miss or bug, but Samsung is the only vendor that feels a
> problem about this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-dapm: set bias_level if snd_soc_dapm_set_bias_level() was successed
      commit: f40ecc2743652c0b0f19935f81baf57c601eb7f0
[2/5] ASoC: samsung: bell: don't set dapm->bias_level directly
      commit: 88f60cb4b8c96241d86a68da57dc5b52488240cf
[3/5] ASoC: samsung: speyside: don't set dapm->bias_level directly
      commit: d2f423a4f4ecabd852c5ee5076596399488d4b75
[4/5] ASoC: samsung: tobermory: don't set dapm->bias_level directly
      commit: 4421e455d2c33a86cdb19f3a0854a59de1542321
[5/5] ASoC: samsung: littlemill: don't set dapm->bias_level directly
      commit: f00e06296ba3f0d8440030afe8cc2258758b7af7

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

