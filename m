Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611468;
	b=wYZ9oAK17uPZj/SZlE4NWf+NxVOdXAPlwKJ4WP76gxKQDxJkF1ghAcEN4wnC1K+ThA3P
	 j5M6g8IqCK26sqXyy/+xRpDzL7C2fqhQAf1wvoTst2PqKVojhG4JjwJfuX8QfJwsB9nrE
	 leEK3Obc/a70p+TbPsG9mMo/5D53UsydfBBuQYgiWsT0P3NuItgGIthIAr0itR0wtWZA0
	 wnnjDMKXgHRSNc7BtlhmA/58WnWozbNTp/5cXlWb5lBHmRSd3UyD9Fcmu64dbPLRKY7t8
	 71YBptDCn1eNxFexo2jdv064MPkib3S3TLjRGiRkZ8YtJ+b1HEVU6M7k4/+nREoKHVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611468;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pN+WMg5OdtJ5FqqkCyGfoQ3zDpzy1qYDS5+UAVUSmFE=;
	b=LBtzdqeOIQIcDooz3KnmeUF3mBHRRBbEweI+RAbV2SwXthQvTOWlv59felHLheJg3CtE
	 GrejSCpU/Hpj6nYM6/s4iv3rm8CTdvLA6m0/WtO+H9EoT2uLd6iw9u4HoLr0wxm0L94lg
	 44sUGWOewWrHue2AVPWoh15WhjRAHxUpfzUmG6Om875bGvg4jsqFQL0n5/vMg9w7tep8K
	 DG/a9uFBOuNNkSyHprdf58xigswZXXynq4Eax46Fthu0CM7sbHpOthZn0CbaC+2evOIEg
	 PsAWWcxzvrqBqZgB4ZeRS0OtQctEpCGDfX8Z+YqYeXEEqzaOV8DH0H+hGt4sYM9SJ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9SZuU5Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138B606A323;
	Wed, 25 Nov 2026 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9SZuU5Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC421F000D0;
	Wed, 25 Nov 2026 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611468;
	bh=pN+WMg5OdtJ5FqqkCyGfoQ3zDpzy1qYDS5+UAVUSmFE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=S9SZuU5YIq5a6IcWO+gmVui9ffodaUsLelR8+D/a+otw5FeDM/KWs4EuHa7Gzxcav
	 r4mm3VKJWmSJ2NIXMVSBVCXFDiCIp72BXJsf9u8ORgAotrAWQDpD5ZsK1feNuBqMUX
	 Y4hj4Im82GmpGAlsQ2o4j3GlsrVXJ9L0dmjcW13EwCOyhXbDcY8064gqGLByQypWoD
	 Nj2SWTrV022n62kqcSrPYQrym+XpcHi+pM2vTIriM3LDwcdRqi3LrPGBrdXdEdXhcP
	 u/2KhIk3eWZcwv5tUt3AKL7uwskt4S+oV+YQd64cHZcJkO8gWFvRTw5Lu5iYnjRvaV
	 uXOH0SWt9p1tA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20261120234640.169279-1-ansuelsmth@gmail.com>
References: <20261120234640.169279-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v7 0/2] ASoC: Add support for AN7581 PCM driver
Message-Id: <179554365554.947306.10589371499291682651.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:07:35 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=broonie@kernel.org;
 h=from:subject:message-id; bh=htsnF7W7xoMx8zOF73xpTEGZESxdJmz+VpSBy9lMFKM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZbnvsm8pp1eLUpXTvx0z5vUqn7NLXZOgcrFj/26d55
 c1863NLOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRDWkMf8XLufvWOi1cuSV7
 99uIN/UyxjFRc7/P4Z1wbMYluzPf2Z4xMkyOchZvZfS9fN0+XlRVvKVvI6PumnhLHouulc0Ln3v
 +ZQQA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Nov 2026 00:46:37 +0100, Christian Marangi wrote:
> ASoC: Add support for AN7581 PCM driver
> 
> The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
> supporting playback and capture at sample rates of 8 kHz and 16 kHz.
> The driver configures the PCM bit clock to 2.048 MHz and supports
> 8-bit and 16-bit samples, with up to 32 channels.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
      https://git.kernel.org/broonie/sound/c/a9d5245fbd16
[2/2] ASoC: airoha: Add support for AN7581 PCM driver
      https://git.kernel.org/broonie/sound/c/a0c2794fd7f7

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

