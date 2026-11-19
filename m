Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177128;
	b=5As03SkliAcCPx+O+Aqn1v4DHj5aDmYOkTZTjU3BbJrnJljuHUGrSaxQj12oo/6c6pc2
	 5J96yU+MKh5HhwqV8c5A11+Z3eva9n3n4Txc8flZ1JCwL6TI91plQlqAY8WjwizpcL+LZ
	 B46KFFprDxP3/AavPfbWV/xoZMw957Ft07E7LFwWcbwY8hHUmkS9FjUEerwkZV7u7q4ZW
	 1HX1nf/ayLuvJVMHm3ec/2efiOpgYgLLUGNf+X5Rv+4aPkpea7xn3wgDSitfa3Rh7yTRB
	 JBZB7xRsTi0IIeI7guIqN6Sio4zQ7KxE76tTy3fJvWZI2DulLfUWwWHvMq7AomnswiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177128;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cA8saSYay4O62VLhItjcTnPnaKWV/uIH+1+8IXsCJuU=;
	b=bYs1ZsEuuGQW7hkJnNVLiDoUKmcKsoI7wxZ4xNreCUAlBn2KcV5MmG4ZYLL89BOy3Xpq
	 r2aCZpZ3FNZJiRt7fMweydaiZA7Z0wLmuBl7DhECnMznmWpiprRVw4/HTUdd+9DVnDnO1
	 FbTGnkYGdEoexMktD7wl1NHeN8DBILWF7otmplUfsxyNvIEAOwNq2Bcakr5ABOsEXG8Vs
	 2xhLx4ZEffi16mE/1NgLY1CCccQ8WKnzxj+vEag805iv+TqRRO+Vf4mihbYpDxFWiuFgw
	 lIW+ESoThpNVpMBbB3ycdQJLhmkgkQ9JnwOqtvISwvtGLadKoiLKONSBH5lxHV4RrbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeCTTP4F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9418606A32A;
	Fri, 20 Nov 2026 12:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeCTTP4F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E05C1F000E6;
	Fri, 20 Nov 2026 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177127;
	bh=cA8saSYay4O62VLhItjcTnPnaKWV/uIH+1+8IXsCJuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XeCTTP4FWXT3t0Kn7Pi1xq8HViAEJ5FWX0qXxFkvFgUlnVx1c3bdsdeXh4YImotyG
	 j7MMWThHSQAyn7YO0K6vL4bPpz7HD6ErAKrBJScnrgAPoBoRjjgT27W6znzPMPJUzz
	 0wfCedgnAS+/xcLQge5ZP2Uv0OCtVqe5oC72LzVRyGELrFFB6jgFRMX+6Ymuu8qw61
	 a6gl05msN62ARQvUAdkMp6OS+MjWcXgmXmdCgOb8ZKehsFczHbsCSbXGFzq/wVdxBE
	 0Fa+EccjRxXjt4CrahoEdJNbdMKSXnQ8HemjUiWK3J3HUKlEEt5VJJjLx0KzYGqPfC
	 qmXntngfxQqMQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: fsl_asrc: Fix probe and resource
 management issues
Message-Id: <179511198046.116416.8935610392478261011.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:13:00 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m5L1WGT7TXUgQ6jeBh7IUm7S6AegHVPNO7DGGKjH3yk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrBbfu3hl2pmnj7oDYw8s41Jd/e68OP/2o8vWrag/s
 zW36aXCno5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBM5GULwz/tc8r55tHVDpdb
 vy7jtzMRq1nOP3Xz3lX9cW5vV3E+yHjAyLCZ/y/PzXUVa9NK5/6I/ahYIXZ6feb/teGn3PPX7vh
 rJc0MAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 12:07:21 +0700, phucduc.bui@gmail.com wrote:
> ASoC: fsl_asrc: Fix probe and resource management issues
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves error handling and resource management in
> the fsl_asrc probe function. It fixes deferred clock handling and
> runtime PM usage count, ensures the IRQ is requested after device
> initialization, and moves runtime PM cleanup to devm.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/6] ASoC: fsl_asrc: Improve probe error handling
      https://git.kernel.org/broonie/sound/c/c41412f46219
[2/6] ASoC: fsl_asrc: Fix handling of deferred spba clock
      https://git.kernel.org/broonie/sound/c/a16853bece06
[3/6] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
      https://git.kernel.org/broonie/sound/c/dcb503f01380
[4/6] ASoC: fsl_asrc: Request the IRQ after the device is initialized
      https://git.kernel.org/broonie/sound/c/ab7cfd1b36a2
[5/6] ASoC: fsl_asrc: Use devm for runtime PM cleanup
      https://git.kernel.org/broonie/sound/c/b4b22bdc2572
[6/6] ASoC: fsl_asrc: Use devm for m2m cleanup
      https://git.kernel.org/broonie/sound/c/0f8ea2391e29

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

