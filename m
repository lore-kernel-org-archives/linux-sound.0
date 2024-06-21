Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2FD28399;
	Fri, 21 Jun 2024 12:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972153; cv=none; b=ZHRxR2wpWTvju5LcHNJ+3m5ESJqa0bmCuWklEJZoSLzj2k9hTiw3RilP/zKBIgiWqJ7sXkL4gHA/AC5TctojNwBJHzpxKug/lH5N2Y/RPAAjsZGDi5dlky3onXAcZunxYtFP74lez/Hk3HnExP49Sr0cUWFIRrpyJZJ8XtlXeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972153; c=relaxed/simple;
	bh=rE8ntxNIM5vaTaumZmp3qsqdX3oe1BdkEBjRraySjMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GQroqBZrENnJYHPbVOLWmLtf+UYxJrcMihkd5OZ+WvGgmya4+KC/0GZ5nbfXlNE3IY7I7bWbyMmK/BrDIKH92gZ06K0Otz8lt3d2//xdjPTALe2vmB2tKJrEoIJetMkBvU7RL0GghYmsW5AOFyhJBWujl/pYdjghUASUJq8e7DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3FRhXl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3FRhXl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46864C2BBFC;
	Fri, 21 Jun 2024 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718972152;
	bh=rE8ntxNIM5vaTaumZmp3qsqdX3oe1BdkEBjRraySjMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y3FRhXl8cs1YgSR5JVrW/YQdZKcFQQl0NXj8PkGQEOJi6s2eALFoiOOF2lNYis6mF
	 +us6FwSsxNyXwncLAPRmxTN5EE51/GIQ1OVmDLQAz/pNSaLCye16mSylO+xYNhJnrk
	 9aI8e4T5bm+9wgROQnktthu326NyAZSezjo12l6eNTVp4qdesDqnDo1d3CgaLxEXMG
	 yCbsm//WFIH2RVbX/e15v2tHA6Ko8n3CN5G7Gp0Sb/CycpFeYFEkJRHPeM7OFaUzYJ
	 RLo0t4bfryHFYpcDjq91Ad4MEhY1ZCPtfUXfPYJm+mOD1ZX+gdoB74/BHGkBvNl+lJ
	 PC/cmal4zBy7g==
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Beer <daniel.beer@igorinstitute.com>, 
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Shenghao Ding <shenghao-ding@ti.com>, Shi Fu <shifu0704@thundersoft.com>, 
 Takashi Iwai <tiwai@suse.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: add missing vender prefix on
 filename
Message-Id: <171897214898.79912.13208484267678405419.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 13:15:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 20 Jun 2024 00:32:39 +0000, Kuninori Morimoto wrote:
> Many Sound yaml files doesn't have vender prefix on filename.
> Add missing vender prefix for these files.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: add missing vender prefix on filename
      commit: ae8fc2948b48f001514d4b73167fcef3b398a5fb

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

