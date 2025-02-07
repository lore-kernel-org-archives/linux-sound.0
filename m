Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC092236FE
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936966; cv=none; b=IUz+Yvm+fn5gb6qvCo12mJrfd5L70+GSxd0ikcmatWGrLkPt1Cu6rLqBXcOOLRzjDG+SI8lSTTUnK2yuRIDeOSJy5k5VupQ0nZ/8anxH/TVayONU8+oJDbFuHlmlrOAZ5aINSi+1/F1LGqBbAYC8Md1opxE4vYxDRsYG7UfNDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936966; c=relaxed/simple;
	bh=dLTnl+jogROrVLqx6fZA0hxsV6GraWAYEay6sqQU3tI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cmyf/yBzKF+SBTqGIr04gpAO6ijkOA+MjiSaj4n6zFFS/7/L4KezAdaxaH2s/x009GUnj0r0gORL914uEyrnFoyP5XR3IcAmYaVd0xF2Y7/A0w3O4VhBhJl9T5Kqv45enksiJLkDFL8iztlEhyShtdHASh8hjPSXlDCTj24AGFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8fnFcA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8fnFcA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D24C4CEEA;
	Fri,  7 Feb 2025 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936966;
	bh=dLTnl+jogROrVLqx6fZA0hxsV6GraWAYEay6sqQU3tI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z8fnFcA7BhGftIeKMOh65/azvFjqpJ8h/KCpOeMy+jTHY7lybpSudncJJkChDFw0c
	 7YmGGzx/ROjAH8V5IQmouOQCTNrcChqDbVyCq2SB+Ffq68rPFTHsXyngXGqFAtpOPH
	 W27PT/kN4NbCFnLydSvTUPdp1ndjSiC3yQ9PLAiYSMTgcOCO17QeQtplvlW5vFApsj
	 mD8ZsGDtPqtTQZY5FdXfnPTkkDZsWRMsPBIT0FLnsCpbZYodbxZ11roqEZFFaupvzu
	 fYyYOjyoAoZ8qlaJSqkv9KgsIHTJbdWf4Fa2tJPjhuuJ0o/XqT2sMB2J3Ok/57GWyd
	 jNZ/4Oc4J5uNA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/7] ASoC: and adn use snd_soc_ret()
Message-Id: <173893696580.35212.14356916262860766725.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 00:13:40 +0000, Kuninori Morimoto wrote:
> Each ASoC framwark is using own snd_xxx_ret() function, but we can share
> these. This patch-set adds new snd_soc_ret() and use it.
> 
> checkpatch indicates that ENOTSUPP is not a SUSV4 error code, prefer to
> use EOPNOTSUPP. So this patch-set adds it, but not remove existing ENOTSUPP.
> 
> Link: https://lore.kernel.org/r/8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: add common snd_soc_ret() and use it
      commit: 943116ba2a6ab472e8ad2d1e57a3f10f13485cc2
[2/7] ASoC: soc-utils: care -EOPNOTSUPP on snd_soc_ret()
      commit: 062b7ef6b103dcbcb3c084e8ace8e74e260b2346
[3/7] ASoC: soc-pcm: use snd_soc_ret()
      commit: be61cd4242e4a53f5cf989ee7573121d041444bc
[4/7] ASoC: simple-card: use snd_soc_ret()
      commit: a0ef5b4b101424b8a666ed56bf1717dafe2d37f5
[5/7] ASoC: simple-card-utils: use snd_soc_ret()
      commit: 2d7395b23dbf4c2d60be49b73e4c4705fc446662
[6/7] ASoC: audio-graph-card: use snd_soc_ret()
      commit: 74a0ca4c7f19f1b273d665b3b53f7ae8af879658
[7/7] ASoC: audio-graph-card2: use snd_soc_ret()
      commit: 8d83282e53185ec257a4ce08812e8fabee2c7212

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

