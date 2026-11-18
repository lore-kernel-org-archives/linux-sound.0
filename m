Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110757;
	b=cqZXHk9Dhb3kSuDE5VmVjQ8HCznOa0hRiVzfjgQJ2q9vbCTAAVXS78FqhFvj4OyipdJm
	 JNAJx+TwJ0Ggsr2bLEW6hTCiOuU47Gwd61xs6hCnHxFb1JwugrGkCWYkFR0xxt6v1cjzA
	 neaSZGnHft4FDW/39BzSuj59VgrZemK7UMyInV1IqzHQr57rVDDp9idbZTiIjL0mMGqf/
	 iiKG+0XnAmr65ABUYVAV9fM5tnTUymxZrRE02TrwkvqkhWNQO7I1brF+xFTroNZWUqLdH
	 dx4GaQu/OaMJ+GLfzOm1b8clT46Y7zVFs4y4EX6DvNEbggCHKh0NZfDlkR4QDoEStGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110757;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2PIgSFGZIOA7RCocQEjv8m60+BoHOv5Uk4uIIDHFGZc=;
	b=ky72HTh8FD72FRqGY3m7y9krYW1BUJp4PeZzcb7sl3FZTHKZ+TcI+iSKVVk8Lma0Czh2
	 MivKm7nucBt8F+e1tGvdX6V2DDdEga17uyLddEUMWR78oO3IMdIM1pA3jtPM2TcLw9+fK
	 dHi6SXFYJVB+Y8eoUQPfUcu8Jqzf2brWpANt9M6iGixr5xcgTZaRgXShl3IkirvgIyvDG
	 67twkrdEKXm9AwySEQ0zCLfyBYWJzUyL+Y6GdfJANMZnJRaCRZqpz8XewZkZ20mJaorpV
	 q3zDH8sGu5n/WQfyq27Lr3KaizLnuj5jN8ZYx6iBPAOngrYxoIkVPaTvolZI2G8X1MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SH+eTjrm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0190606A324;
	Thu, 19 Nov 2026 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SH+eTjrm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B351F000C5;
	Thu, 19 Nov 2026 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110757;
	bh=2PIgSFGZIOA7RCocQEjv8m60+BoHOv5Uk4uIIDHFGZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SH+eTjrmj9v1S3b736MuPBFkDpWNZfc3vuF3MX9ObpTPrJn310dlWG+d7Am4Md3p4
	 DvaiNfFb/wy1z+84c6FO3BY3O2qo/PDW7GO1rpEUySNwaPr6ol6881S1oWE+0jGwAE
	 4GSKvOl5kkvY3MEzp48VhT9ay5ID96cKPBAuC01KBef7o8svRUPJR3q88KoiYmZOo5
	 dweoGq1WX7zFv72DuEId5bOqkLAYGMXW0/I9WWn08fK9F9sF8Wt0iBJAmOCL/BiEuv
	 gZYkTUqI4+ZmO3yC9C4MXA96dZlmc22GQQiTv85EnCGbKDsmOOLrupwgSS092VpuCR
	 ZyrCMnndfWMTw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
References: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
Subject: Re: [PATCH 0/2] ASoC: qcom: Add the sound card of the Motorola
 Signature
Message-Id: <179502753783.810609.2343542801510355835.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:45:37 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2fg8Q7J2dXp3QwM6Z90qmZl51rG9Op1l5flEdiXHvkc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+myd2WM0slukWO2jhtsvO+u66PZomU9dIK3LIBbw+H
 1F1o+FJRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYifIvhn/rnLWGvX/Z+n2J4
 IPpIWdGM60f8M3xCDjK3u8oFr/p6SYnhvx97liM/85OsmKCzpem8iaWXhMve5FmsDUu7t3t+7QV
 DZgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 01:50:27 +0530, Venkat Yadlapati wrote:
> ASoC: qcom: Add the sound card of the Motorola Signature
> 
> The Motorola Signature has two TFA9865 amplifiers on the senary MI2S
> interface. They expect 32-bit I2S slots, which the sc8280xp machine
> driver does not support so far. This series documents the sound card
> compatible and adds an option for 32-bit MI2S backends together with the
> card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add Motorola Signature sound card
      https://git.kernel.org/broonie/sound/c/f107e9a0a423
[2/2] ASoC: qcom: sc8280xp: Add Motorola Signature sound card
      https://git.kernel.org/broonie/sound/c/6d6edbcd6e3e

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

