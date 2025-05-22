Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E71EEA28;
	Thu, 22 May 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913383; cv=none; b=T6Gt7rv/QSUnDa7qlkG57WiOHp6/5tro8Y9Q6Ub3nckW/j2yA8ppcCqELUevO76D/JxxmviUJ0EUGZAXUMqVoGNmO4iVnnLJkt77VnqE5MgNpiOuQwTB3v2k8ziUpWY+VkP7Io72VkZj5ku8mXX3DLpTxAv01bMqlT5Z5WYtyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913383; c=relaxed/simple;
	bh=hgEYm1tyCyXjwPS9ww8T2i61C1AXnYlHbSlQgXs1Qo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TWxvppi7Qw/7sf9jfAgnTsDY5/j57buGeawJwNABGVdcGzVNBAqb6nR0VbjOc0e5hRU1P7BE6BdNiFu/NEScWHPkgbNsCiME4hAK62k7llBKJWkYaVeeDCcT34AKQM8onXxGVQk8ViTAcQiZOvzq8HMrwBCyr2JCjXBiacco+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4VsoGCw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4VsoGCw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68BEC4CEE4;
	Thu, 22 May 2025 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747913381;
	bh=hgEYm1tyCyXjwPS9ww8T2i61C1AXnYlHbSlQgXs1Qo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q4VsoGCwLsj0yIr1IYaQyJLhouFNhYJFC8moeWlJRn38pEh+D5f6CYwwpdayblupu
	 RgKYhArJ40fKGlzZPu2tfDnwBeMVzKw/SnkDyiMu37jDorEaSiGtD7SKro6lmltMEE
	 ry8adFa3CzCVR/PBhRdlT79q/421rqJOpzr6c9KYi1SoRR+fneZTRRd/swwGblynvc
	 IKlShnYaleJLUDN8C4YaLSpbOMl2OyLfVzyvwc5QQpLzq548XRDM53clTKtCayL+FA
	 nvfC6uk2+jIX37fKdV65u/fhA2jQfiAGvy3+d3ZEovVOu1rYv11U1ZvvSUvDzmVrEK
	 jIwPpnw5y/g0g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <875xi4axln.wl-kuninori.morimoto.gx@renesas.com>
References: <875xi4axln.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: audio-graph-card2: reference
 audio-graph routing property
Message-Id: <174791338062.54177.10228606863411975443.b4-ty@kernel.org>
Date: Thu, 22 May 2025 12:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 13 May 2025 23:40:20 +0000, Kuninori Morimoto wrote:
> audio-graph.yaml already has "routing" property, let's reference it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property
      commit: 396639299e95fbb915c6ff12cb42391f04741ab3

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

