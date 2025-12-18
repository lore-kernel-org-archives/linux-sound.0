Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC711DE4E0;
	Thu, 18 Dec 2025 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081872; cv=none; b=Qxjy9ctFTSwooU/yqBmIGrgErM8QdYfdqvgOI3L9MMXLmgYbJ+XEOKPkVYbrfgNx991C8ZX018Ta0YzX0RMTi/HJ/w6IzvKJVpPkGllaFjRwA1h1ic9KuSQj3P0fB03UnhHUZzoKwbEonpJF34JvI8JvZ+tznpAdXQg+EXGNzcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081872; c=relaxed/simple;
	bh=1Vjolpblxio2ScYCPsRcgwZAOJnaMoY8kwwNIwKJA8M=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X5ChkPJk9VIJ+44NgprNlq0CJu4JLb+W0rns6gYqMapHwEe9CwwWmQo6RFg4+xKr15erFtOg8n4bu74VJXdo+i9mIV77FTLj1zhOX1KGwBA5/bD/aMjX9AHvBqNAGMxhIInjJ6FKS4x190QIePYn8XquM/G4Nu+AHuqDRRLkGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPIIVxze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPIIVxze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D29C4CEFB;
	Thu, 18 Dec 2025 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081871;
	bh=1Vjolpblxio2ScYCPsRcgwZAOJnaMoY8kwwNIwKJA8M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fPIIVxze+3bGlxWVmt1ZH15j1wvPPz8d8aWrjB7fyQREW8UGiDQzq3AH0IQusMo23
	 lsC/9KmoJcqyqiCcn85PAl++JlaJvxEE/OdokuTc21YQNrXxniGhOK7uCbKudzbnSv
	 UfEVZI1SuSTT0mb9ru2Su3wv0S/IR1q2wLPbKdpbGMhU4B9gR5MGKs5M7i0HYlTPXb
	 mJBh+UqGeIaZ0/Zh566vHEqwCM14zmDEu7jGOfpGkCNiwHHWNAMfUDttd3wHJ/9WNb
	 0PAZ2nfQ5Nd+QAn9j+R1nfeAXeMPfxOGiCd6I6RXATV/2VD1Ddtfd6Urn0RzNuf8uI
	 OmTgPO8K45jew==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 p.zabel@pengutronix.de, kuninori.morimoto.gx@renesas.com, 
 nichen@iscas.ac.cn, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251216070201.358477-1-shengjiu.wang@nxp.com>
References: <20251216070201.358477-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458: remove the reset operation in probe and
 remove
Message-Id: <176608186982.237766.387212395125669292.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:49 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 15:02:01 +0800, Shengjiu Wang wrote:
> The reset_control handler has the reference count for usage, as there is
> reset operation in runtime suspend and resume, then reset operation in
> probe() would cause the reference count of reset not balanced.
> 
> Previously add reset operation in probe and remove is to fix the compile
> issue with !CONFIG_PM, as the driver has been update to use
> RUNTIME_PM_OPS(), so that change can be reverted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: remove the reset operation in probe and remove
      commit: 00b960a83c764208b0623089eb70af3685e3906f

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

