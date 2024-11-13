Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1F202F80
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731503004; cv=none; b=sM2b9YYJMd4rZFb3wl+IPYqsd954tohH9kFaGa57QN2jOQy8UhdatdO9rfJvQquMWlIOEYEsa5jzoBLtTNM253JcqnpowUvHXl6hmUstGq98RbRXlP5RpIstA4MoZCjuiDIeYVy/QEl5PzyIqlyx/HBfatUigx6KuE+b2k+ADxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731503004; c=relaxed/simple;
	bh=aNFOVAKOlR+hVAww5Z0y4gTuSYH3cqMlOUj7S0VQQoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oVWpPza6Nc1xC88R0a1JWFZAW3uFJo1wL2mT10xV8BA1q4Ndo6EXQqeu7nv36xEYbZ0L3dgarJYeuChJB+xa5bUbS7MexXtoHa/HhbO29NwfL1zRcfj/EoHmGMdy29MKsxFGF37CXQPKfL/ai8X4xXRcaIx9a0V10l7+gXpebcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDYHGQOY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDYHGQOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5102DC4CECD;
	Wed, 13 Nov 2024 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731503003;
	bh=aNFOVAKOlR+hVAww5Z0y4gTuSYH3cqMlOUj7S0VQQoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oDYHGQOYNuSQREHUIXE0Hip/ujOhXiBZbBvSegIF6CTyngr+47CJlW1m2Y02k98hz
	 oF8SCuFtodCrmcChj5LN5o4q9U3UCw+nO6ocUVWXMLui5tX3FiayVLlCqTT2SXh9AY
	 96dDJNL/pVEps+jfgYCfXkOO6iQ4R4SM74yApkJriZdN1fyBBO/a5vR+ENfOqFifrD
	 eXua+GOnj+hcETVI/Clh2KEvR7yNDt/H0ECkp3saV7GFu8JscII7Q/DIVyeOhnP30g
	 dpiaABz0Os5l1BlS6YGcEU5WoD/HSTIRNjbBLOb4wBZVReZsroOSaJcB3ImnlUvRtM
	 bltRnVf2Mm/GA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87msi5maz3.wl-kuninori.morimoto.gx@renesas.com>
References: <87msi5maz3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: care simple_util_dai for
 dummy DAI
Message-Id: <173150300212.429793.7812327806660265122.b4-ty@kernel.org>
Date: Wed, 13 Nov 2024 13:03:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Tue, 12 Nov 2024 02:39:44 +0000, Kuninori Morimoto wrote:
> Simple Card Utils has simple_util_dai which is paired to snd_soc_dai,
> and assmus that CPU/Codec DAI and its paired simple_util_dai are same
> order for CPU/Codec
> 
> 	simple_util_dai[0] <--> snd_soc_dai[0]
> 	simple_util_dai[1] <--> snd_soc_dai[1]
> 	...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: care simple_util_dai for dummy DAI
      commit: add2332795a648b62fd52356001287c015a59e80

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

