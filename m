Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E0269CF4
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497002; cv=none; b=N9+YbBBvStkz2cOdqKrdL1sTKebHrzm+TPc3nWoYIqY9mViFn/GE/ejagg/4He2gSCugLKpbTLlO0dqycOnysMXHFkeZKw0AhL8/GYyPg9JWGAnZtT9XGW+SU6/G6NMjq3qBftUssI/0gqS2bm1SOGMSlJLxte375s2zA3RB5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497002; c=relaxed/simple;
	bh=msXFumifpKrfITlLM74FoPhtbUT8zuxAexgCeyqgWec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QYsf+pOnYD+kAWELudH0C9HZcxBC8qvcYd/5z5Txd4rGEdWUURjOOAPYEgmj+0F6cvtsiZpPG6Wbuods1orug1HZ9+8Bqe5ycePYbNLGlB5ygFjN3stFOR6SJTOc8Xb19wFDgLMXHYA9PlLmApDAyWcyL3AiQaUqkh+05LhAwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMy8nfda; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMy8nfda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9102C4CEDD;
	Tue, 25 Feb 2025 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497002;
	bh=msXFumifpKrfITlLM74FoPhtbUT8zuxAexgCeyqgWec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sMy8nfdasNLmOjBAOGlX5kCoNAwWMSJOcTG9C5RTaQ35hCCdqndIDBTLM1DjZUF1O
	 hI2Nw3d9zy4lRatUwW2TpHLeZHZz6e0RErqKdOL5lMHZltDZfzr+/qD7KU+XjoYtBy
	 MfkLNN/KSiAOAlV9cnOrpyxCCOMR14ol+ybrhppVmxoY4GaGkJwavDmGL7csr9AjWI
	 qxeEw2oZlPnUjEcd7DbSgsluglX/QH+rmVtXxHaxJbIyflSNRICZfTb1Yf2jL4pD88
	 rX0eiKmhvjD2tsqr6qSGfs/o4rv+6mSXHmRGUc6k1O1OTu1Jkne8fzvHuoEAx9hH3I
	 RoMpJtCf+PHnQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ikp6vii9.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
 <87ikp6vii9.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [RFC] ASoC: Documentation: DPCM: use inclusive
 language for SND_SOC_DAIFMT_CBx_CFx
Message-Id: <174049700147.77394.159298885947887381.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 15:23:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Feb 2025 01:19:10 +0000, Kuninori Morimoto wrote:
> In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Documentation: DPCM: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
      commit: 5a09e179024e76afdf9ad3a6ae767b4e06884ea8

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

