Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FD8221FC3
	for <linux-sound@vger.kernel.org>; Mon, 25 Aug 2025 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756158211; cv=none; b=YVARa3QHke3/ppM8VEWAB0h6IHpFUFt+ko8sFRKnLbiCVfK9opNrr/Xx2z8pTb2yi4MSTpeOQxfxUEJu0Pc33rxOG4fu9RPS/FTU+kZ0dp6my2gFmtV/dMv1VGdVMQwfMuh4jR7gSTajM6y9iNnNhCEWWXwSRGcV8lFQ35BVO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756158211; c=relaxed/simple;
	bh=4iDF5xk6RE5lJ0/hJ7pQKNvLwXVMYll/RFR4l20q4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dVNEBx8OzVkocxyNSbXTBSY0eTp22hvDkExMk4uVorNynLinOe86noC9LIYGYAl1au9L08Pn+IE+nBKf4EXwKVtSn5jyTZvxBYwOse0YsIa9S1Tj2VlLZrVF0lxfitrTV8obHU7U4mVdLAfNqnnDWksB4Ixskkega0tTtJk6sOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG13Jxp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG13Jxp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63963C4CEED;
	Mon, 25 Aug 2025 21:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756158211;
	bh=4iDF5xk6RE5lJ0/hJ7pQKNvLwXVMYll/RFR4l20q4uI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PG13Jxp5WM28Y9Z1ofvJSEb+Fv8Lto9SMeZVIRVmxZ0c3SaMeZiM9uXNe/oxva74y
	 +kNz68dxqzXlmxOeFmRGPvA3Lvy9gRFOebnDOC7HCYk877f+hUncYc/PmFIk2bnjZx
	 sTLbBKIPina5pj/YZ017DLMVnd2umRZ0g6FcxjdoR7DdXYs1pZB2jDcbX/v/BYOc2E
	 aGBDFfq/hs32peRYmgYlVHjUo75oKN2UCWB5Tr/l+0XOwCCmFq17DL4CHKOjpK+ZjJ
	 U/MPY03XSzGT51LqKG2xTLHOMM6urRaaFRXBPRDK2BgOTbUqIyqcpaM/6Ohs59Wxqu
	 vE7Dm9vCKdP2A==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
References: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: fixup snd_soc_lookup_component_nolocked()
Message-Id: <175615820828.235209.12674197058554913080.b4-ty@kernel.org>
Date: Mon, 25 Aug 2025 22:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Tue, 19 Aug 2025 01:58:09 +0000, Kuninori Morimoto wrote:
> Because snd_dmaengine_pcm is sharing same dev with CPU and Platform,
> snd_soc_lookup_component_nolocked() might be call with NULL driver name
> (= CPU). This patch fixup and cleanup it.
> 
> Kuninori Morimoto (2):
>   ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
>   ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
      commit: 168873ca1799d3f23442b9e79eae55f907b9b126
[2/2] ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()
      commit: b833b412a522e58b790abe79b6ec46e8ba1f312a

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

