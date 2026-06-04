Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4647CC63
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579068; cv=none; b=NzlLKz7gnEJfFmHUHzk5w07L2cuIjxuAN8j/D9NR5xT3+jYek5sAqucQwH2IahnFor8L/JcmriBsN1pVVrQ3IqOyTvuh26oQTtf9986BXONKVtfcyBLgC3RTOCghVUAUvKcZ5u2YdmRk3464lTxN7VgHa4FdriFITlQ9pLHsVhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579068; c=relaxed/simple;
	bh=okc7g/O3qa/NWWmoRHj/encYADRdxuFj1KsMBSrJIbg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MFL1rdYo6nU8kRMHPbAkbDoleZiou5SkQ5lXqYkodyE9rew+e14o78TBIPUSjIVrlhCzus2BcGC4/X959Cozkwq4IPpEtXG1qlSRBJa4S6tok7kSZwIXtphEMCqxXbgNECuRBmd7etBaIswi2blaC1lAycweGIU6eVspEqLulEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLcSgQmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLcSgQmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2CD1F00893;
	Thu,  4 Jun 2026 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780579066;
	bh=Q7zZzLXU3f3I1ovJX21dkGMx7G/dUo17cpmucbP15Io=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=cLcSgQmVIFJtABAwOIEwOjE3KHzaPdeJfAdMC1vX+mruW4bhW4iWICMi6bG7UmYLi
	 kVKTSJcV/XEydcgisGCsuPITG3ELHBJdy+6L/5rPXuEvWcnH4uYZGjG3nke/lO+Inc
	 tlvMGbsnWtHR4doc7yZUsI4hNtpAUXTGvRLFC+KfMXjoakHG1GHVvXt9vTiVLaURLe
	 sk08gwghNTFhep6noUBlfX0udZAo8+J5RD5IhGWy40VlyFOX4JsaDKGuqTYXs8E4dQ
	 NKAtHDUvAYGubNTgYB+Ws4P4B40xICx1F/LfImsg6gZ0IbNNCJkQFUEZAoAo7W70wJ
	 OJ8RK75kppSRA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4tk2weh.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4tk2weh.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-core: remove card->dmi_longname
Message-Id: <178056863153.53724.6388307663613029198.b4-ty@b4>
Date: Thu, 04 Jun 2026 11:23:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=okc7g/O3qa/NWWmoRHj/encYADRdxuFj1KsMBSrJIbg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIXr4demy8ht90pSO6RTHxM3zpmJjiEG9KNrEs
 wf3iNwWxv2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiF6+AAKCRAk1otyXVSH
 0KSbB/9ELldcQF5gH10yuAs8bFfNDZPtpZdCHnuyO0olTW/ZZPMk7dK6Y6PnUtggRFFKuIA44W3
 WqFPvUF4evfTqqqNOp9ebmiTpPjOwCbwIGwCaFf3W5nsyI4E0JmMyOTTim1QO7hX+hfM55UunH1
 rCHoSs65HjjPpcpDmSxe7ymnL9NDfneHP8ia4HidBJaVgB3AXssf831fz1lvkSwXXUk2lxhOyzz
 kQGw9n1nD0QNF6ZyLDt0GMHMgc9v5YugWaZ77mlf5Km1zzLxkBJXgJST7UP5DN/6+l+4vne/wEs
 sPxuxNMKNbbewwH74kB0LwLGjPwrsxQNbwCets/SmMvTWq9Y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 00:46:46 +0000, Kuninori Morimoto wrote:
> ASoC: soc-core: remove card->dmi_longname

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: soc-core: remove card->dmi_longname
      https://git.kernel.org/broonie/sound/c/66c75c7e0498

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

