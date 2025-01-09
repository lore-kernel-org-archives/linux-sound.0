Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF118C337
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445999; cv=none; b=pz6xIWEYBgm0zupXGwfPzTJ6HeNDaPpU2RogjDckXADqRxv10u0AeTR7c7sKvNwdaW9MwqnDhK3Ja2w7UFin8rldqCOyG3PlJjOnBzCGBkDLO1+iyuOqPQQumBZnp0TmAJVRFLNmML2OTfrvAYRLGMdsDDK7W5Q0nyIBomsQErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445999; c=relaxed/simple;
	bh=wEcCWqu9QPqZRUBnzfQ/b//ewwBFNnWxlzmqQ2eOT1Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=enqBYnCB8EXn0JCGcFudrNaMcTuG3+gkxxiu5+lRNuD/eArV5GudOseig0XXreEyRN7YspTyMQK/fV2AS8egS7fQSEWGVPqjYe4XAkOb80wGmv8/rBS5WYgE7dyQd7Q1q9bPP1xsSZRbH1mbf+vXMyTKnueJwgvg1sTo4fFYuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5xSOO26; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5xSOO26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D6FC4CED2;
	Thu,  9 Jan 2025 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445999;
	bh=wEcCWqu9QPqZRUBnzfQ/b//ewwBFNnWxlzmqQ2eOT1Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Q5xSOO26iENtwi5vZArfab3Zy443Mfvnny46Egyuka2+TyKiZb7WMbLIhz2qFtbnT
	 Cr3zaIQMqkG30Q9XL1V5iuhKfNjGfYVZkUpWjsniZ5hRcSJmNtXJGatfba3q1+5V1X
	 rVVqwDM1SfKl+Ba9IbrrWVyPO4t6bC5uxqPUI1g7hltwz3SiZ1Gpedk6OZwSqYRiW6
	 x2KLzjIMEsI8Ym7KIac7U+DBtA4MyuGDirtSXImQh3f8A81+4tzkoGR+Rmx3GM+adP
	 9GAk1mW2b5VFFTcnftxRRYIHlPUF+r+VL3t2A0XxVUUggzldQEWEM29oVK8W2HWUCd
	 QKvC0fvBo+Mqg==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: remove disable_route_checks
Message-Id: <173644599700.563331.1302360801742162545.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 18:06:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 09 Jan 2025 00:13:56 +0000, Kuninori Morimoto wrote:
> ASoC framwork has disable_route_checks flag. Intel is the last user of it,
> but it seems it exists in dead code. So we can remove it.
> 
> But I can't test it. This patch needs Intel team's Tested-by.
> 
> Kuninori Morimoto (2):
>   ASoC: intel: remove disable_route_checks
>   ASoC: remove disable_route_checks
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: remove disable_route_checks
      commit: 61aff2da3e63a43f22e60aa1bc57026ce07d189e
[2/2] ASoC: remove disable_route_checks
      commit: 9c0e29b9957e407af6197ff1fb48f365a9b0c248

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

