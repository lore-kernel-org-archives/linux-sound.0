Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC2A204F7E
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273426; cv=none; b=A+FlLUu3v5p19GK2OZDYzMtLRGyHecB0wvcH6t+IYCS9uerqbe63eTTP48MVD/FzhmpvhZNWhrc3PmDbyod541Syr1DqqsS0ALtflzezSEqi1Xi4OEZACEgUEHfvqanR2HhBFDObyYdedufcCLn5ipX6IWwjp1GJX5a/QVNaOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273426; c=relaxed/simple;
	bh=cbQ6Gm69o6l1e+r7+XLVr/9a0an2CctZQcG4McWXC6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZLrCaiBDHyP6UqC6qY+DP2YSpYUJbZaNo1R0Rvuoz+ahMLd/ucWkOsD222jngHWtreKpB67KsGlttrIVvm6C3JY7j9lw4AIPoybkGjT1T5oaWe1Icn7+naKe10BDLcmo675D+JUge46GDNoztEFomT4704n/wNBPUS9jncXsA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agAML4Xv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agAML4Xv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5390FC4CEC7;
	Fri, 18 Oct 2024 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729273425;
	bh=cbQ6Gm69o6l1e+r7+XLVr/9a0an2CctZQcG4McWXC6A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=agAML4XvpnimgEyQpwkGdlaSS3/Vnx984Q3Quv1Gx6SLTT34sU38RPh5Z9AD84mOc
	 KozYhZvdwpELXJe5c8M079lVeYG3jtIaW1LDqrlC4fA3b5Q9tRUlU/gNiI3EErPlED
	 8JJwM9N3rtt9O88mtQ7+sWyo0p5ZXjbid7uXSg5A98H3KYH0ZRUntZyyJ2Du3ZOrub
	 Lxd75kj8bB01mg/gpzw7GctZN1IZsQs5OEh/+QO5GcdfGtacKkP/zYpibmFaBspMoA
	 oChtMnU7+PoVG8HCSRcd1L7N8EaruVh3LV0VvpLqlQflo8kIwFdwYhq7GsZUL2VVfe
	 N3K0JwI1uJY+Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cyk0eso0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyk0eso0.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: makes snd_soc_set_runtime_hwparams() inline
Message-Id: <172927342507.163659.6611103031533833069.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 18:43:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 16 Oct 2024 01:35:27 +0000, Kuninori Morimoto wrote:
> snd_soc_set_runtime_hwparams() is now doing very simple things.
> We can makes it simply inline function, without having EXPORT_SYMBOL_GPL()
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: makes snd_soc_set_runtime_hwparams() inline
      commit: 0d3039f4d2f4a79798d97f2ac1a9656b055b561f

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

