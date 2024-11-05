Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782DC17E918
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823954; cv=none; b=ube/FTrtVWoiEDZqagHFeEqrBo97SXhPeVEVbvYhHd2D6osv3TO674U9GsSmA47z0skjuPagujbMBvwuNyhrJZbtTSbOwMQKYt3Ab2O4LFleDlTrazZDU17EMDGF/b0dvDKacYhDBGC0pwK91eFZnDyf/ZmyZm8f49NpTUrts+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823954; c=relaxed/simple;
	bh=pT4HSPdIoVxZQ2g84UDny+l9ZuggKtD+yfJz8lI5p5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DnEAzEgIoCoe14ywVHOPvRZvrZN09so7LDK21HST6nhEG4S2RvarORhkVmJpNhFMDTnIeJAlDp3iyB72cdjJe8UHPTjQTzggOSvgEJHDRV1awd4YgaXzbz06uTQvE3iIocaJiQTk2h84H/1EJk7sE++CjrUSVU7iDYEEaiC6MwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQ8PEW0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQ8PEW0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83168C4CECF;
	Tue,  5 Nov 2024 16:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823954;
	bh=pT4HSPdIoVxZQ2g84UDny+l9ZuggKtD+yfJz8lI5p5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sQ8PEW0nptNwBZC5qgtYvHeJytsPjQPpXMHtHY1dJvs8qI+Fpqh4d8uEWOBlmpGZS
	 5e/z67x/DxVZMzIL4Fhl38mxSSxlAdEsCSPJsT19cCNkrouLcEH2s4UEP0EdYIZP5H
	 ZC5Iu8WfHC17ZUgoSNfBi9ly216Zc8njX3i5Li4ahTmDkzZTv49WPLNlefNKI6HRiK
	 bB0tNz5vdlLTQhI+BgGdW+LrUYkragljEPk6RHGt0MDpsN7k5OLh19QAAXYHZoGoJO
	 LcTfmaFRW4IecX+XCWPoC/3yB7zJ6/y2pGPRtrVDzUpNZ9aiXlKAuQU6xlT9gtGE0X
	 ZHy7zBaTodgdQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ikt2a41c.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikt2a41c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] MAINTAINERS: Generic Sound Card section
Message-Id: <173082395325.73479.16416074055770135516.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:25:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 05 Nov 2024 01:00:00 +0000, Kuninori Morimoto wrote:
> ALSA SoC Sound has Generic Sound Card (Simple-Card, Audio-Graph-Card,
> Audio-Graph-Card2). Adds its Maintainer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: Generic Sound Card section
      commit: 08a3b241adfd90361c16c3e92f5275b816a73f04

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

