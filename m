Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D62EF653
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780514401; cv=none; b=io4dYHoYEL0SalpRCSNUDBZ2MW7ZZjxof67pW6S0S8pJZ1WMw+ckafn2des7gG+0wovfPvpS2Yjx4svz83DoZ7YkcaS70z40jwG8nIRe+DxLtyLn5KGxWw+A8uNUvG27B7OkphLNs+zVHs1S8mJM9qN2e3Y/k+PoUN9c2LpbMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780514401; c=relaxed/simple;
	bh=GZsEjBORihSe5Bp8bAR+rNmPdgfaLzpQdr+FfbAUjrE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ewJiT4COz7LtyAGSIXqWFmPuaMUA7mu3/4OwF8yZGb6aWpG5k4papX23zrGJukFpARXHNsut6SdddAom5tsFNzFa8HJpaJOukM7xIttWo99oZz+IrxpNezbdj2oMfhWPkdQmqT4GHFwcVCK5l0Jos9e57Le4iJSUSsWmQ4PjQrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQUjmVNL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQUjmVNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772901F00893;
	Wed,  3 Jun 2026 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780514399;
	bh=GmK6AvOHSmVOaNnGG+cuxMadAqXKJYRIH6YzYsFxvjQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fQUjmVNLJNmF8QOshzYNvaOtffD2t0uFFbGc3fMEWT6+20GEaZlGzJSrsg11viQjJ
	 9l1E40gSrYqS/0HfaLNiPabrH8iuDeUL2yd3BFeOLRezVqY+A67DuhOkK3dCTYlqyG
	 4wFTgEiqQ9+EbGZcKbrT+3g0FvK7oYkkDvGYPn3xCxbM5SsaA0i+gi/c8EeXd1aW7L
	 cuBSJ49BjlJz1r+hiPHN/HQsBuyeKymC1WdUIXaF/EdhFWuzJ7cVAmiOXs1ogN/d0U
	 /kgDe/xDIfDak5/Nt4QOP//zJVcEgquQFk6DWMZ0ay+gCyUkrr3EYek9P7mrvxYtnc
	 Dv8FHEKejePIQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
References: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: amd: remove unused machine
Message-Id: <178049461050.10172.8620264364231175924.b4-ty@b4>
Date: Wed, 03 Jun 2026 14:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GZsEjBORihSe5Bp8bAR+rNmPdgfaLzpQdr+FfbAUjrE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIH5dvmJl869gvVbwVxWeYTDzE5/g9ozpD2AhR
 /7AJVWxARyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiB+XQAKCRAk1otyXVSH
 0BynCACE3xdVcqS4b7sXwCgytXO2xqJ/oJXtkCnenzZYQFArc1O8XubcxQCwBp6vsnK8QmWlIAb
 NSORs5lc3Xam9K00YtwhyxKV7K5y4JduoayF9tYQIo/vg+RtZQ7MT97IhYXCyuYAq8laFCS7Osn
 YJDJT1mB0rVUr9GripgulqdoqeUIO9rOibgbp6LkA4n/Da5OIE9hY91iO1oN3gOvbpsJv4SVl0R
 7irC4FT90hAP/XZXeyTTehn+E89r8Zqt4O0hDmqChf7rQ8WRaQhF6PjilIP8Hl2MXxaf6td1UaC
 7WXtuuUg+LDXggfRpTO/r0u+ltfjCtQXM8MaiCr6ohTDUReA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 03 Jun 2026 06:49:31 +0000, Kuninori Morimoto wrote:
> ASoC: amd: remove unused machine
> 
> Hi
> 
> This patch-set removes unused machine
> 
> Kuninori Morimoto (3):
>   ASoC: amd: acp3x-rn: remove unused machine
>   ASoC: amd: acp6x-mach: remove unused machine
>   ASoC: amd: ps-mach: remove unused machine
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: amd: acp3x-rn: remove unused machine
      https://git.kernel.org/broonie/sound/c/f6c87ba6c37a
[2/3] ASoC: amd: acp6x-mach: remove unused machine
      https://git.kernel.org/broonie/sound/c/7cd04a6ad6c3
[3/3] ASoC: amd: ps-mach: remove unused machine
      https://git.kernel.org/broonie/sound/c/b03cda915623

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

