Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF31754B
	for <linux-sound@vger.kernel.org>; Sat, 10 May 2025 01:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841777; cv=none; b=gpsJcTIDOzx4K+iZDqRiIypVhgoSCSohhRsPCnCpNlr3iymdpAv729h7Wb3uqtrHdjvLkq2NV5zBIM8FzTBfjot8+sxnEsolEBhFUqNx4YVtI5jDGdi1G/gCm93Jktn05dYCwPJn/XHAP+gQ1Ow/3wz58VFvKauTOPNibNQfQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841777; c=relaxed/simple;
	bh=RQLVFY4UMEUvInWU91tV50n2Uj7V0fK1qynG6D+TPQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oFD0YfSkUYn0kgnPNsBLUljPOuj8uUW0OJdKX5KR6j3zKLGJYi6f28m5jQ6ObqouvWoRNGbT/FfsT/4NOQ44ZYG8LLAJMx28zfpiXui1cINz644lOLhMyN3l3iFnp5Nvky5IKiqpt32eFQoudbWr2OTsp1jCV7PawyYNBbUGRFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQMZTX2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQMZTX2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0677C4CEED;
	Sat, 10 May 2025 01:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746841777;
	bh=RQLVFY4UMEUvInWU91tV50n2Uj7V0fK1qynG6D+TPQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HQMZTX2lG55YcF6bHSi6oZmvRLhBZ1ZkDHxsyJbxLiAVlqQsNG1gVFji5YQ8yVomN
	 RuwNjc1TxIW8HPOHSUEcVL04RjvUEdifRNWziLVEL2x4vknQ3sdDoBE00O5MDjqZfP
	 ACXMx+moDCXOpRHqb82abWq/PGERy5ZaQBSKnszENU+LvLjDYFnas5PEA/NIXo1rpK
	 wLwDsV6CMQu6rbZvYg1nseIUWq42t96hhPCTmVpaQZtv/NqPZQD3nQSgLvKWe4aOTy
	 /ONKZVA+KBYmSTO5zc3G05BBEDmmO3h2WBfAFN186Qy02blIIRjsx1rVWbwRv6ucMS
	 c8ZdQKBqgiIXQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz6qpql7.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz6qpql7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc.h: remove snd_soc_disconnect_sync()
Message-Id: <174684177656.47320.10686072876193200378.b4-ty@kernel.org>
Date: Sat, 10 May 2025 10:49:36 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 09 May 2025 00:36:52 +0000, Kuninori Morimoto wrote:
> There is no snd_soc_disconnect_sync() implementation, and no one is
> using it. Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc.h: remove snd_soc_disconnect_sync()
      commit: f4358f17a62e7a42f72b02d8e8fbd6b760b69f01

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

