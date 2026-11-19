Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174762;
	b=VKzZAMB6sosaZx5xrnTf+dOsRhX41GJQ0RM6ia0QHXHED9QlmYo54qZPYy3W3+8UBMIN
	 z8onXySZ3YN7FlZr5qSZoRxPwFRgmVcCvzC9Uamf3RV56/u/jN6oPyUgS/F58EumLiuF+
	 mG22eZgWAqbNRd7uoTSDtWz9cb7cyG76/bP0PQ04I1QGmiIxc7EGK1c8DZT6n7yRkriTj
	 6SQKN5TsIgCMsPQpUhHXKJmEbmu4aewcJ5Cv6LZIPPLmDbboN7YW2cxHVuxPut5Cecivc
	 e11cOUROc57oFDBnWRE0chr26FfOgW7QNZ+7akgXtj5RUCRxUxf2yej5VNdrMY4yBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174762;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OtQivQqnmSInxEcGZbExtZbogiR/PjcJgBziw5rS62g=;
	b=abxHETfuxxPE1helm5SJCh9+9sQt0lU4ICEfZOVGUqAmau1/q1Ev8beTKya4K66wwMn4
	 Vo5TgEdII6fw8MQf0V1hlYz7KdvxssoQLngzKk+1HryoCoaI3LnCADG0wyiTkhp0s0Bc6
	 siVfopKXrzKMWHg1/QdzOSsCffK8h5jU4L0dpDYAn+OzF+DlgZqTqeaNtdnCFPuQr7RSB
	 QJkSe4yTeBe4Ne3xHtzJv6fa/RS0x8b+zESDXOr2Us5kWEMXTiZ0e3Pot74Nf1w5/B+iI
	 Ub4URvpBoiUV64l0qsbfioff4zDM1f1PkpcMr0Itl36r8USicBoX2WJp54BCZWHNm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kVHsc0o/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF85606A325;
	Fri, 20 Nov 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVHsc0o/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142521F000D1;
	Fri, 20 Nov 2026 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174761;
	bh=OtQivQqnmSInxEcGZbExtZbogiR/PjcJgBziw5rS62g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kVHsc0o/8MU4cGPxr7LNnTCfEesIpG9/YERDDuEpcXd8PTdQ5xOM+7jbog5YLIlB7
	 IMWw9S9W918COPICSAefbqr96bId/h+Rvze5udwO2n+vQDmBMWfpDPTO3CopoeCVUY
	 vJ8b7q4mrzW13oU0jfCMM3Kx4+R41SMZ8T1MomhnIF/U6lIELqCaNTGZpB4cBO+d4p
	 JpoqpJLFG/V1MaP3smkSKcvV7XLtkVt33O84QiS/QHfUXxITtXg+qaKWd5T5Fz9HYI
	 YMScuR2VdqgJZtU2oZ/PKqudxhdQTtdKsBscz1nEtH/CwW2HRhObkm4GBLIH3Z6Dxr
	 7ORZAiuIAr2mw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, david.rhodes@cirrus.com, rf@opensource.cirrus.com, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119075733.50138-1-zhujun2@cmss.chinamobile.com>
References: <20261119075733.50138-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: cs48l32: Release the runtime PM reference on IRQ
 read errors
Message-Id: <179510449468.116416.15496390683158627317.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:08:14 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZpDnaUnyAxxrM5tThINjs1DjzxQ5EJLUjkdmVCZEaRA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZDNOqeuN7HyR4PZvAt01uwaL9qV4Gi3ZM8RGMrubn6
 AjjEnndUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIl8jWNk2JKy4uP33V6+qXMT
 OffX//BfO+dMs7s1g/rDoFVHvq5wWMrIMF/Aunrr/s4gl3tfVFmPMqxnF3hWWDWXXzp1VlCvwrT
 5nAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 15:57:33 +0800, Zhu Jun wrote:
> ASoC: cs48l32: Release the runtime PM reference on IRQ read errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: cs48l32: Release the runtime PM reference on IRQ read errors
      https://git.kernel.org/broonie/sound/c/afd48791d4f1

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

