Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5A37E5F7;
	Wed, 19 Aug 2026 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135043; cv=none; b=IDusQECjxp1r/cdkNVX5dNtZ2sEarISGgnKRof5NMag/s6kf3x5ZYqqAWHUWw7GZNhMQCfvn2BT86Cv92POFppQkFpvrd6r4P455aUSkjCGeqiT3gihQIu4MiAI/UnbiMEvohW1DOQT8ZzNEgaTVS1P0uB2Ms//Zyz9wEZ5lkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135043; c=relaxed/simple;
	bh=HrdVyTUsugAFtIZAefyMeMmo/CBn92B0hArud1ycK7A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CS0uUJG4iYngrZdxh/fW+s9kkCUztcaJvW9VsVxr0TRywE3krdz3wOJ8cNMU+srJsUWJRxIJ2AkJN+nRvnGmOsACVwf2t5yxJfLHStyzb3EbsIlxE2LJWDrACsA1kARonn4y8hnIe3ky0M+GchzXlGvkPfDt9ZYfpyzyZlJrXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMjBMSyZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMjBMSyZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA011F000E9;
	Wed, 19 Aug 2026 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787135041;
	bh=bw6chI95O4XLTT4J0rXxXwLL8Q6F+qna440e4FnGvWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XMjBMSyZ5jDG4znmKtGRrRxVjD12422BnJbp3h5lJtJTxRoKsSJZdJclEiAHTVDCs
	 ET8jHnV4tfbPByjpte59Y55n++7n6UqGgwncu7YrX25qYPKWuqAnp1VbA5M1HitX0m
	 DXOL9HMX4Rh9z9aJPZ5RNmMe6UzraA4AE+boX6G/NvPTntva7UB2wXLOKqeAuhLBbI
	 MtAGD36CTg+1fyUXLMu9BaotfKEKG6J/0XqF3cQc+gngaOqqDvtSWhinLmRyzKLQMj
	 LD41ZjbcuBK5WOApltRYX3d9ZrUKono7qyq6EuG4c24EAkprORdAv9i34uMYrmcb1h
	 JMpJj1gbVjIjQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ASoC: qcom: Fix AudioReach TDM review findings
Message-Id: <178707749832.154835.1280611777044972037.b4-ty@b4>
Date: Tue, 18 Aug 2026 19:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Tue, 18 Aug 2026 14:16:51 +0530, Prasad Kumpatla wrote:
> ASoC: qcom: Fix AudioReach TDM review findings
> 
> Address review findings for the recently merged AudioReach TDM backend
> support.
> 
> The first patch fixes a typo in the newly added QAIF clock ID names by
> renaming the LAPSS-prefixed identifiers to LPASS and updating all
> corresponding in-tree users.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] dt-bindings: sound: qcom,q6dsp-lpass-ports: Rename QAIF clock IDs
      https://git.kernel.org/broonie/sound/c/c41ac86802fc
[2/4] ASoC: qcom: qdsp6: Zero-initialize AudioReach module config
      https://git.kernel.org/broonie/sound/c/9c9fb79f9769
[3/4] ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
      https://git.kernel.org/broonie/sound/c/0a9e00d5ebdf
[4/4] ASoC: qcom: sc8280xp: Fix TDM hw_params error handling
      https://git.kernel.org/broonie/sound/c/8593dc5f052e

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

