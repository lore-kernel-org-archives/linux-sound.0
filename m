Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175971;
	b=DsbFdW+r4MKOKffIg/X8o0Re5xhcJSfVVFMnnbd2oNj74/nIINKKvP5PHTnnAcmS/lab
	 yDe5ncRTVT8Jvstgs+LoBnhDvfBmpE+yIAysDWMrK4D9L1pmhXtE6/ESanLZ/OaM+ZN5u
	 4/LWqc0glUu5SQwUgyOgZFEDyEYsogbD7SelZJB6ebv52iGoI6BHIPQaFi7Bri9rF1BJ+
	 /DnXYdOjS36e8XbA+XK0648pxvCLejNUCQM9aSq+UwTfcE4ua0LXuFsi0RWJjc8BLCRdc
	 VRAV2ShnWn8cbmX+Mmu6CyTduyDgWVXFOzzZ9ZcYI9XalIIr6epg6BLjVtc554FAs0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175971;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PbYxkfpt8wcMk+D2MC+1poauRr02eP/j797NX0ypwdg=;
	b=rr8YHaC5OCGVizU1xKOCDk87ETgmktni85aSHpgCDB6Z7UJvzm09iRRjouREMTQ9ubdv
	 iSaRcnhtWABB/rG6wMGeAD6Oid5D6Cr/jRIqSlUn7zTfy1Bf1ofLvcZHC5InEIgkhs2WT
	 gj6WUZ4gfpjiEVlY55aHL7Fb6PLTYLApdFJFGdKVAl48UStKO03oxrA1FfwVum0JwdPTB
	 2srF7xhSrglaiuUwXqJk01UctXupQ/DI7t4RkyE6p+wSFRpWS3qSbP7QC7petaL8iziDI
	 8OJntYu/S9miB+rBGCfoEnG5u7UYS6piCMo+my0+L2y3DB2i+W0nBqA7Dy1g2cOu0wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kph884j2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7EB606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kph884j2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F351F000ED;
	Fri, 20 Nov 2026 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175970;
	bh=PbYxkfpt8wcMk+D2MC+1poauRr02eP/j797NX0ypwdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Kph884j2/8FLBSlEBhE5xCYwhhgy3/qFFakdvhIj4STMCWotf6aoBKym8m8a16BAQ
	 mN0tl5fa8ckIcI0CrxYynDAV4etgcInZ3ncb3e5TnQAiFN6y6YK6i7nAZJeWFuN2e3
	 OvBzKWXa0GXBxyn4td4CEvibodKCrJ8jKEDvcQgICJQGfSh8M54p6UPfMpncgrnD1V
	 8MMVbGLJMmhc+fmwLUkV6BSaiVpDhw4I5Fw43kZM7vn0im19JB5biZs1GqwfZBe+ZA
	 4qSQ4gBex96KX2K+KrkKDiG0yTywHJtC/AFOHjbt6hhnFUCEzNKdgcGgSsIKaW3Hte
	 mGUc9eU9RWbTQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: use snd_soc_register_component()
Message-Id: <179509462828.116416.4022703883300507841.b4-ty@b4>
Date: Thu, 19 Nov 2026 13:23:48 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1613; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hEi08EQiqtRu7sugXtIXIqjKozr4zrcyOhWH+2HGcvE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZzBR273+nJr10fd9534OudYbiX6PW3ph2+tT13YqTv
 36V/DY9vKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQAT+bmF4Z/ZmorfIjlXd5c0
 ZokllHH7cP84ab7z/tL/aazJzDzcEu8Y/vCdaH8alDFjqdRiEdGX3NuPLTXkdnxmMHfyN+Ed1tp
 GB/gB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 06:01:05 +0000, Kuninori Morimoto wrote:
> ASoC: use snd_soc_register_component()
> 
> Hi Mark
> 
> I now posting v2 of "ASoC: add new Component functions"   [1]
> and Sashiko reviewed it [2] and pointed that some driver is using
> devm_ version register(), but is calling unregister() which can be
> issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/3] ASoC: mediatek: mt8173-afe-pcm: use snd_soc_register_component()
      https://git.kernel.org/broonie/sound/c/a5c99a470e4c
[2/3] ASoC: stm: stm32_adfsdm: use snd_soc_register_component()
      https://git.kernel.org/broonie/sound/c/72f71a56b5c9
[3/3] ASoC: tas2783-sdw: use snd_soc_register_component()
      https://git.kernel.org/broonie/sound/c/64ef28a65e25

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

