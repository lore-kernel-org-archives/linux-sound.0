Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5011BD4F1
	for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842277; cv=none; b=cK7E07X7JZz0bR7vNpax0ufkTvCV/y6U4MOD88zysv12h3+6nsmHsXFvZb/oSA1W2f8Gg8G9eeGqdoPX661kbIXq9cx792+OHhsm6Xt9LGt3fL7zf1BmpDnKo1f5tRDEkQ+mv8IY/itZeUbkOG5/mHXAmBHGn5kXH7WogvKvpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842277; c=relaxed/simple;
	bh=4M47lHboXJvksRI+8r0rbo+xpoD0LUwvMb/ZgM6US00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y4WFRhoEZ1YDDMQSxv4qqZjv7pxjsugbUbw+pjjxyht3QDMN1wSae9b4j3PxWrlD+IY62E8mDPkP/nGMejckEowTI3DtSbDjyF3NQ2Spu0b0/lGKejagIvEnEN2UtxjYwqAhdi3vz2Tl+Pt2JHOOzb3FppLv1p75F2YxBhV9ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE1I9c71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE1I9c71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F254C4CED6;
	Tue, 10 Dec 2024 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733842277;
	bh=4M47lHboXJvksRI+8r0rbo+xpoD0LUwvMb/ZgM6US00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AE1I9c71gmYhkhysYUl7QSMpoddG8qbXOCxPb6Vw9ZsCQLUhia3Uzex8TCBw1dQdp
	 8jN6P/TybzoZNRVy7MpViOXyZg79ljplIlmOhxQV89BvDYrsHm4OLN3BTOGBrn2d2D
	 jKBe9j60H0nb4qX2gRXtLt3c/wPeQ/OHlWPQgq10fD9bqYSE4axK4vJz551K9pjhTg
	 vanLUrGlFngS7n12qPGl+6b1BbZjtD2pNri0mdkSmE+wquYBmskRXre3lxqUZD2hHw
	 0ROejBUlPV4MlaBt1IkIcotsuHwEmgCkwhOVBa4+s920vGNpEdYuIZQVULVNZWbHnz
	 fKMuwWzqiYPqg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
References: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: simple-card-utils: tidyup for Multi
 connection
Message-Id: <173384227596.64342.5958119638201451755.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 14:51:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 03 Dec 2024 02:10:06 +0000, Kuninori Morimoto wrote:
> These patches tidyup simple-card-utils for Multi connection of
> Audio Graph Card, Because of DT node parsing, it should check port
> 1st instead of endpoint. Otherwise, it can't handle DAI correctly.
> 
> Kuninori Morimoto (3):
>   ASoC: simple-card-utils: use __free(device_node) for device node
>   ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
>   ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: simple-card-utils: use __free(device_node) for device node
      commit: 419d1918105e5d9926ab02f1f834bb416dc76f65
[2/3] ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
      commit: 76deee29153b8313cc9629d3db45e56024b3dd26
[3/3] ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()
      commit: bd4a5c8d5356fa42a1d63b684d34cf58a21eb8f7

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

