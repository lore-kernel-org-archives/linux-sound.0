Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FE36C5A6
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656340; cv=none; b=pfltUVhVO9jk8t2oVBr4zFCUP3irY9SciCF1SOvsfYKjFBcRj6A2Azhwc9/1JN47PhkCAscYZZo2296WfRVZde85xUjqTtaA4zgNhuin9B9xVMXo4JDWgaZM8Zx5UAwRiDeqzYEwnkN4RgAOV+71V7F4lUjEFa+lf8NlX4Shhvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656340; c=relaxed/simple;
	bh=Hhj32LDYxJYAw3i9YQZfXT47T7P08amGqpUz9zCHHGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SKn6hYeE4zTpRZWb6pVYtP2R/a4T33OBv03urqlcunGNsomlqRtj5HATAiU6iz2Z+G0guIEmVM7eXJxJXB6dw21ObEqBYpoO6BYdE5lK0dJzaayLowAv5X0j63gRnzX8ygstgWaOz4ylrKrmYocdDEPG3XQ8HqceOPprt5rFgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewktd0Ix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewktd0Ix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE4EC4CEF1;
	Thu, 20 Nov 2025 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656340;
	bh=Hhj32LDYxJYAw3i9YQZfXT47T7P08amGqpUz9zCHHGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ewktd0IxpJf0KsNtN61AWms8B2yfAoh/ydjqYbGgnQ+QBijb9ajqF6+5d2l6Xu2cj
	 r0GQr4JKOFcTpGjBXvDrK9zJnntzXQUir5MUlIK/izhSq9qtpAx3i+bmvMHJZNZuwq
	 XoITYaGoGp1YAXo9Oworz3euJKtOMlAaKFzU6lstjeros6vQmdsaS7ZnUi0ZOIHnyC
	 vjLd5qWgfGHppjITVL9E0DDKg0K1UcLs/3Yk8IisqZWdH9CdE4x/mp/7Hf2qs8tDCj
	 45CVsU6vmlBcHUbhNLok/deAzruANRgL+oCGR3rOb+f7RhA1gaAKsSDi+PGZ0TVUaW
	 t5CKoEbhqWQmw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fraasihe.wl-kuninori.morimoto.gx@renesas.com>
References: <87fraasihe.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
Message-Id: <176365633985.66643.16369264462567759742.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 16:32:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 19 Nov 2025 05:23:58 +0000, Kuninori Morimoto wrote:
> This patch converts below functions.
> 
> dapm->dev					-> snd_soc_dapm_to_dev()
> dapm->card					-> snd_soc_dapm_to_card()
> dapm->component					-> snd_soc_dapm_to_component()
> 
> dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
      commit: 041e502d4ca66341696fcf54a76f3724b80f0b1f

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

