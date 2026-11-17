Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003128;
	b=b0TxN/hKyHp8z3zAaTx+xq8CMC6Ok+tLHkaHRG68oFTr80cnLtFnLGm4kDXlYDoyd3ua
	 8qtc3rgMVAwrcnZPMgqBc1Pebb4egq4emSd3IDoByafAwFact2LUkHtNDA/i8ILprYaiz
	 5ZYzJdKyF1eeG/uQhE9D5u3EIOgQ0gGuH+vHoxsCfjgFN9f6DEwl3/R1s1kDGyeMNM/d2
	 8VWf/imFD8znbw/+pGcYKLNc3m991cj7vyG8UfyufZDhbPZjR7a1mYPt3FWCtlCWn65ok
	 Aqx1mG32WFP6oa4Ab9//Z9KL8JryrR+hSBZG7+IUyiQGWVX7u+weqQ0mf6Dx9KxSF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003128;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ceeo/ntELrKUitdM0OHqKpT1WoY/7+qNt/bG4v1anlE=;
	b=ik/vSZOKfZyzchjJWSdIBqxXtPTbOgyk3AC5/D3ECJpg7qRdk3MoOVsi2VAUM8YRS8XL
	 s6yQZimyNrMkNLdnjfrxwbWKbkuesK0fY+/MknjpMJjkqEwLodIEKVXgzv/Vs/+d894EQ
	 fC0f2m/IbLSyiRR99e1+6YFENJoBlIiQf+CJcwv5JX+kWghK400J9AvEPkGs9pdR10XoT
	 gwsjE6I0T95XGAs3+P6+FfViXbsjnn+PL/3r/UC7u5RulEq0BzGm0sJ2ofe65pIuOyix0
	 Xos6jjyoLY4PrqbQMo13m+RYIbaREx6UDmqmnMGSh/a4GdIWfbGbndVWuMkQzp8VBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4ze9EIb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D8606A31C;
	Wed, 18 Nov 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4ze9EIb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F931F000C8;
	Wed, 18 Nov 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003128;
	bh=Ceeo/ntELrKUitdM0OHqKpT1WoY/7+qNt/bG4v1anlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h4ze9EIbmC7wuluzCjXPmQ/bB2idEoWMXH9cjcYyun4Jjtmi1A5cSIChccDCG9IZP
	 HIfzzdmdzUF/I4VaFh7qMTpFGttrcvND9q5JYOW3shrC7nQmLL/UbgKXqt6Hjgculm
	 9/o1NQuc3FlRn6rp8ooq2p18XM5RS5oKfRjuz7dsnjgBnW0FdMzLYXk6ADqBBZC7TI
	 WENw+UIZx4CuMLg0ObQsATUUS8EgDKJz4SxEx1npH9xWLHs9GL2mTDix1dYrBbuG4q
	 XCMoHT2z/1BxbrN7xiS2Wz3cHR+Ggm7ntYyNqoj7OxiUlvX+iep6xpOz/99BIb2BvT
	 dQdpsao9bSqwA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] ASoC: codecs: lpass-macro: manage clocks in
 runtime PM
Message-Id: <179495450703.2707353.11141992622291494884.b4-ty@b4>
Date: Tue, 17 Nov 2026 22:28:27 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CHbFh/AiN4hAaP8cOsMNzLRWYGULx4EVga2AtppxHNM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+TvqqJDep0uyKcM6pCUGdgg/82V4xcrOb3BJmZd/68
 9jN/hlRHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI6W9Ghq3KBxZKWKrP0W+v
 K3+2+kWvY0Kvp/OW5Gt7PW7tP3456hMjw3Xvcy0NMwVMQv8sVrZUv2njmC3Y2fxht9KlTPvP2+L
 fsgAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 28 Sep 2026 16:02:18 +0530, Ajay Kumar Nandam wrote:
> ASoC: codecs: lpass-macro: manage clocks in runtime PM
> 
> The LPASS macro codec drivers currently rely on the PM clock framework
> to manage their clocks. The PM clock framework is useful for the common
> case where drivers only need clocks enabled while the device is active,
> but its lifecycle is not a good fit for these codec clocks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/5] ASoC: codecs: lpass-rx-macro: manage clocks in runtime PM
      https://git.kernel.org/broonie/sound/c/80ba2cdbe084
[2/5] ASoC: codecs: lpass-tx-macro: manage clocks in runtime PM
      https://git.kernel.org/broonie/sound/c/8af1ecd5b81c
[3/5] ASoC: codecs: lpass-va-macro: manage clocks in runtime PM
      https://git.kernel.org/broonie/sound/c/7b982a5e39b1
[4/5] ASoC: codecs: lpass-wsa-macro: manage clocks in runtime PM
      https://git.kernel.org/broonie/sound/c/0feec3d75d41
[5/5] ASoC: codecs: lpass-macro: drop PM_CLK dependency
      https://git.kernel.org/broonie/sound/c/acff34eebdc2

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

