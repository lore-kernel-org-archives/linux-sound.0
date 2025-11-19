Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE93149C7B;
	Wed, 19 Nov 2025 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566239; cv=none; b=cLtKbRav/YLwdBKz6Y5LVRUj68mxkRHozSRuqCBITGGvsW8h88hWVSZImRwo6RM0nedPKti0Wl/ly4MuGnVQoZDJzVGUdlthN5oVZ/Y5LwcoLMDFq+st3ESvBzx0+bVNNAGYGPhAwU5lKeqwkG293L/35fc+S2nwwHONjBA5bb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566239; c=relaxed/simple;
	bh=EC4hP9MYFIaAF9vLO+f+J0spD9Tx26nWdJR+r1PV+3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qSvZtYOyaP4MnzJztyMHjmor+E466J5Vesj3Spq3V2935BYyxyDdOqBfD7xsIR4T8tJAbbozyCc2KWbbLgvwmX72/E7StxM9qQbFUBV9Xs2U5cNUtCXID/L34yCJBPhKfcHPF/fVa22q5RzwouGzBx38tTviDPNfaeXhh5trq0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnZk/lW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnZk/lW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4D7C19423;
	Wed, 19 Nov 2025 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763566238;
	bh=EC4hP9MYFIaAF9vLO+f+J0spD9Tx26nWdJR+r1PV+3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YnZk/lW6ogm8hPhv0Zq94n8X9yjuPHZ44zZ94gYe1Dio3/zGRJPhLSnM1VD8aK96k
	 YU2UmImIzlD3Ta92o59Hq2FleeoSncw9OaaRz5qk4yRtngc6N50QRRpAUeYilACgtm
	 o5tHmunePyRfQFiD8tqw+7s9qLuHAXVT8pkDXBUaadVdhW6PrQZl13bM5oMGENTpOG
	 UceoFestlhlJ/uMiPb45tBZtpFXBdwD2IbecXe2SQ+XFQTRg6DWpS4E5y5GhKpbTxQ
	 GacaGGsCDtlciyC/lMYhq0XvnatzD+ZhLbC2B2sLkL6fiNMYKbVje2+ilJIy9zYIhG
	 qqN0UJHvdr11g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, 
 "jempty.liang" <imntjempty@163.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251119101116.78676-1-imntjempty@163.com>
References: <20251119101116.78676-1-imntjempty@163.com>
Subject: Re: [PATCH] ASoC: soc-core: Pre-check zero CPU/codec DAIs, handle
 early rtd->dais alloc failure
Message-Id: <176356623699.2074882.4567136956236420130.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 15:30:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 19 Nov 2025 10:11:16 +0000, jempty.liang wrote:
> This commit adds a pre-check in ASoC to ensure there are non-zero CPU or
> codec DAIs. It also handles early failure of memory allocation for
> rtd->dais by going to the cleanup path, preventing potential issues
> from invalid configurations or out-of-memory situations.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Pre-check zero CPU/codec DAIs, handle early rtd->dais alloc failure
      commit: e2c48498a93404743e0565dcac29450fec02e6a3

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

