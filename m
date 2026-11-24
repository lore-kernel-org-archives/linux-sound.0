Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540653;
	b=l+mSUjka8koH7EPICgdJlaJ0I/c72g++R6iFpPVsLDXPZoMDY5XtBFgfqbap4GnLZqcW
	 nD9nTLICqK6JWCmJND1DXuj36aKm0CNo07fWvHivTdS19dxAjpQnooB8o1+efQmaNhYtQ
	 JtqBOpnyoxZu9afJj2d2Etgk8zU0FXL91O0w2no977k0zCRPt/zuLv4ZHw+2Ah9PCJc+q
	 8j8Zrbpzeqx5JC1q7Lm6vJNLQx2uRdQTstPSAKvQwabXlprtQaqxx8N8qH8NjuCf3C7pO
	 v7A6NkZiTcPm5Q4NkXgV/zViCoMaPJCL4LmwYVtR2Zd2+DTBA1PqkreegdA+orUG2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540653;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=D+S3KjTvS5Hh4ofeEbo9KpYeFiSIbJUwRtHJpF7bdl8=;
	b=tgRqADPJ6C/16DWT6t3poDML5z6N89QGABWEK1c9O4B0ekZMlCgey4HSXGRsDNOdmcLM
	 IQtGxtmyA9XXLawkCfjb7qa9eCMgNkU8x96+uHfAG9lF4CHVrVzSPYsduAzuFAj2oItmv
	 XH/181kW9V4o2e4j2Tvu0CHCkN7iFv+JpDO/cd5LLL1YibTiaCHKVtFk4ow9cGDJ0BN3z
	 mTqNSD1ZS3Iww3W8Q/70yMJ6DuV6Mnnhn0xJ0OpU+W6GrDu6Hluf4JHwsUc6CV4aK0wmp
	 qoSht5GaK6Zrpx3Vr0Pu1rFz3fR7JfRG5oOEm1hKajOFbfm2EFZOpg+lgGfoytA/kBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4l0aby0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC0606A321;
	Tue, 24 Nov 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4l0aby0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373461F000CF;
	Tue, 24 Nov 2026 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540652;
	bh=D+S3KjTvS5Hh4ofeEbo9KpYeFiSIbJUwRtHJpF7bdl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A4l0aby0ZJSD8rCACmwIIL5jD2O8jyVGLd7H7EvVsel/3oMQAS/5FqI4AltwIgMPA
	 pLeMCite7QySuC2QMdGlM5Ht98vXX6uRYQnbWe7uLG5Px0J54r9FzmhvfyRxV5oRvS
	 PULkdkbJUM31/4vUDtJBWEzqUgZGhCHAGLUwodSerUIAc+nbRqRujAFP2yp4Ez1zEB
	 JJ9EwTFaFxqmTz99+syxx2Pnj+0pkbY8zohTF6j7dvSPLpx/A5N15DtYgvlXopmiBR
	 vOQV/Nr3I+MFFOYUczokKz9uudC4LWh+8QZHdWsg44gUjkYxqmXGQtmrMw+hzXnz4M
	 cJ9VKkKYOsSpA==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees+treewide@kernel.org>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117025335.7455-1-phucduc.bui@gmail.com>
References: <20261117025335.7455-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: adi: Use devm_clk_get_enabled()
Message-Id: <179553017744.264265.13989874159226501033.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:22:57 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4ApCx7zLYW1czTq/DYLmtmR7Fvu+SScvrEibfQjdYf8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZj63UKjH2vvnnRNpNxqu3p605w1QRztsz89Ota0tWr
 3hv8VPlfEcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmwn6B4Z+NV4pKtL+Q2ttj
 U3e+6zn0iWnSodfLgiKFTmuWXH9pvms9w/+Kzv7/h+0PejgHRx510J/bMYPt8+31CVO+P2aQubL
 G9hQvAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 09:53:33 +0700, phucduc.bui@gmail.com wrote:
> ASoC: adi: Use devm_clk_get_enabled()
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series uses devm_clk_get_enabled() to simplify clock management
> in the ADI AXI I2S and SPDIF drivers, removing the need for manual
> clock enable/disable handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: adi: axi-i2s: Use devm_clk_get_enabled()
      https://git.kernel.org/broonie/sound/c/cfe3530f721c
[2/2] ASoC: adi: axi-spdif: Use devm_clk_get_enabled()
      https://git.kernel.org/broonie/sound/c/8bf6b562579e

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

