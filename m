Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115424;
	b=1SnjIZ1L92RDOnaRcKkglF5D0sy4QtoPqnM5l8zdcTPvtV80rKnaPBxMzZjMqLk2fFsb
	 5zfmTR0y9l4dz+pDRZpe+qD2UWAK5GLTwlYkEu+H+rGvI6EaIoZQqJ4XfqVi7uKNyHMNl
	 U7esHDrb8eRmbJ9/Z1TyQRUq7+4JcVJ8LlwI8BdoA9f27Zvc8bhGKKO5qeh4Q/2RTxIJY
	 Km1vnDOFdTSaJmV5ZdwtA1YI2RnUlWQMeSO398WiCgeQ8FdOCLaDxBkIy7Ji6DBEbTVi8
	 yK1K/wOE+lzzCNWupKhO1ATh/kjINVk8YoudEEhx4tOf3b5JXSzFmTgR7AuabY+Il5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115424;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qukOtTwYNeY65fV7GEd3+hUFNE24AN69HXQ89jir/To=;
	b=pjBvVrsB2/wil6NflXIZzTGTTKH8KrZ/ig7biGGeq7xSIPvrEdMPpSwtbJIprnQPkzdH
	 k+wJD3LRVOJKxlQssp7YhpB/dTLZmzLHUNbQovlbfvGTh+taxgiWb8oE5LCiHR5pRu88r
	 H8IRhD7pZx66lcnTklTWKJyMMyG+AhB3oLDW8AZoBFcgadsTunq5UwJFMehfxITJ9dfMe
	 uMPvNG1Ln3ar94b+TQWfBenTWWAKMvLkjaO5p87NAEp9vg81HSC2Ukxlh1eHxippnt3RA
	 2FqeOesjx3qiCoqjC0NL24xWbvIGP63dgPfLZKn1BXlekHFZXOtN2ge42WKp742voLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naJe9zJl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AF606A324;
	Thu, 19 Nov 2026 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=naJe9zJl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0AE1F000C4;
	Thu, 19 Nov 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115424;
	bh=qukOtTwYNeY65fV7GEd3+hUFNE24AN69HXQ89jir/To=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=naJe9zJlPJDbDr9Uzls5auFH8KkqnjthM6eaxXlB8hrSg+hQ8foeq0O4wSfSmyZFy
	 6XtXt9s6dTzaL72CUzXE1lWAAUjmEsXLrqcw58S6neziNlGosVZ2SLy6Dd/X8RBb+k
	 UtFhcuUi9hNmuuWtagAKPlPOTde5ayAeemBqG/RUnasBJj18MZh+vYZQwgtjkspv8I
	 qBRanuyR2zld1GAqteWK721ZZ82Mio95OPV31090Y1BOcmiJ37zKE87440mXfxhUYu
	 6m6A1bEL9tHjiQSzZujS0X17zKTOuwZZRjcme/O97XvO1mAD0JZxLH7VbXb98KxhMk
	 sklQSxtzurEhA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
Message-Id: <179509708687.116416.8043243616213914673.b4-ty@b4>
Date: Thu, 19 Nov 2026 14:04:46 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mNbQf2yq7zE9LqqFnCB2s6MtlcWOuguvqz25adVY+6E=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+e84RWsB8MiHt67zybwFHZLx2hNyZ+s1QXaC06Phdh
 k7mzX+EO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR458ZGY7V7/NXmP6t7Pcz
 jeWJO99/XyxxzWLnxNjWd84qE3quJM5hZPinu1fo7sa60p9casKbFnF18TF8zFX5vsRL30Lv4Er
 jr6wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 11:12:47 +0100, Valerio Setti wrote:
> ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
> 
> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: meson: gx-formatter: change stream lock from mutex to spinlock
      https://git.kernel.org/broonie/sound/c/0bd345a04dc4
[2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
      https://git.kernel.org/broonie/sound/c/e38a24552453

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

