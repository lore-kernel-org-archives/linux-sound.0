Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2418E37D
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863023; cv=none; b=LDRO82uY2Smm1P651XyxCtTjhlPcVXtNY0BUbIPkmkgMmKKFNgaEFvxstUqzFiYtk/47SX7wswO9Doh70fhzwYPjumLDBH0xubPfjjI+hikaAZyU0Evy7Vi18e+k3E+edpN5MU2vzmYh3X9yWOEM9pjDK6vAu7MY8GXvpF25PUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863023; c=relaxed/simple;
	bh=sRbKgCvj/m8u/8xSZPOatGpZeMSLBvJbKDCWAkpqg/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mjobxrz2tA5pR+y778iW9yqC94OvFP79oGRflp7mwxgJ/gbLOv2WD25zRNb4EEC+X2uJwdCh/PW4/8nqnb/A9N3WK3IvUNjgjJkoQ10q/7zb5NvieMC/+GU559M0n6t6YDgkaX+UzgHKfXIK3RkwCF+3S+6bJk9vMgZLyO9KSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv0EDeS+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv0EDeS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E2FC4CEDD;
	Thu,  6 Feb 2025 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863023;
	bh=sRbKgCvj/m8u/8xSZPOatGpZeMSLBvJbKDCWAkpqg/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fv0EDeS+bEJi5Wqz+4v2Aus+iyE4wEyiR+HRhc8f7NlD0z8WoUmXaJyB+EiM/w8jB
	 AzWX6OZXGozbSYyvJjJCXguBZA8r6p3oDNkn+QZthYW0gcWcHtADOv0EJu2UDVA90C
	 IPebvfxxQ4klYvcM6uvi6+700i3o6Vf1XDv2828gJRD33clyfTWsFK7fJNKxSr7ykG
	 rH/2WqdcgGjrVHleusOfO347xz1EIz94f72wPLY3pZuZVa1bFBjlv2dFIUniaOiH5j
	 h7YD6fKZAXz6U85EcvLt4BBMPkRcFWVeJqtZDzrVvyGeITOctbONW6v54Z1EW/wavp
	 0MknGu9Mbh3wQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
References: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: rsnd: adjust convert rate in 1%
Message-Id: <173886302226.325569.4473858404011590142.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 00:20:16 +0000, Kuninori Morimoto wrote:
> Cc Shimoda-san
> 
> Renesas Synchronous SRC Mode has HW limitation to be used in 1% rate
> difference, but driver didn't care it. This patch-set adjust to it.
> 
> Link: https://lore.kernel.org/r/87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rsnd: indicate unsupported clock rate
      commit: 796106e29e5df6cd4b4e2b51262a8a19e9fa0625
[2/3] ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
      commit: c3fc002b206c6c83d1e3702b979733002ba6fb2c
[3/3] ASoC: rsnd: adjust convert rate limitation
      commit: 89f9cf185885d4358aa92b48e51d0f09b71775aa

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

