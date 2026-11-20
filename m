Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196639;
	b=S/M4qBNa0hiWMjpgySg54CbjUK+WIrYODb7Hy8jA4jXHfvTbNzG4hhdNyD6I8dd7Qt3d
	 opE0t1DzqO2SZizZ0oRMmEVmnh1rB66Yg+WpNzUYDazyxwNBSGxnUzNrhoZqLXb7tZccP
	 Ch8DNuZLX87fMLyfLpilSr5Q4NZWo1/TlysNNHYO3gm+yXZZpjfWC2pQWYd8PVwbh+yzn
	 WuTMq7pRRvTfRw1V4bw0Y2W/t8KyHwbUEO+45iyvu/cufKHA+SX3K6DrsMirz39oncz+O
	 Uf1AM6fCK4pld2WYVHx9ZNpI0c8ijJ/SKmnt46nqba50jUYN/QqlKLHE6QMpQWn758g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196639;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xat0mH4UMjxmPRzKNd3e0XnLZwP4P1uMlabaEm86BqE=;
	b=kt/3mQv0Z0ebaP5PTTseroyBc9qI7QsVmGwpnjlILh6eq7FU9QK5fWxuWMgT5B2r3WHg
	 xcdWvGXVM0FYIofex9f+c2hrO5iJFTKFF4Y+NGpbKX/eRrBjC4CGgiW2+x0KUA3D2l+Q+
	 2qvTKkS6RTS33kzbYLkI8xpI0CRoSICUZ2cLTnIg3hMDT9TADKfMGF6wqcGQELL6w1dl5
	 F023/oM7+XYvmGQ54GmpcLViFUopiLUGUfRDDwNlvIjb5JoARJKkeXoOJsyCxIfu40+3x
	 AqgvapHNkCpxTnbnFCyMkP4zy7bc4bIAT/RsUBqMWhjVvQ5krhelojSthebibJFTgFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2yehk+z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA8606A7ED;
	Fri, 20 Nov 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2yehk+z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806E71F00AD3;
	Fri, 20 Nov 2026 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196638;
	bh=xat0mH4UMjxmPRzKNd3e0XnLZwP4P1uMlabaEm86BqE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=K2yehk+zF0NETZVxwSIsQIUmU95o7SfgWlZuZx7RFV21aApbwDR3LprOwvVVf3Pkc
	 +oUtPFq71jL5CZdYZI8QEoL7XXZJHMfFqNf5VdSm65y8rgN487yybM2bzetZkD2FAQ
	 AIpl9VXFhsRbx1UGcawdzzcLhINCFO6vFS0mGk/CwlX+ib3zmmvaxrE95/TttiFzbi
	 V125oXol8cGLMJTWdfAGajESnfQDvhPWwEdfFOpa+M66seY/BSBXZQl/vcfy+CuoWO
	 rfbVkqd31w23owUQdQp7migxQacU8KCqS9LCyG/GiulcNaEpL2l4xN4CLl833UgcHr
	 2khwVcPMVJwjw==
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, neo.chang70@gmail.com, kchsu0@nuvoton.com, 
 sjlin0@nuvoton.com
In-Reply-To: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
References: <20261118084214.527804-1-YLCHANG2@nuvoton.com>
Subject: Re: [PATCH v3 0/2] ASoC: codecs: nau8310: Add NAU83G10 amplifier
Message-Id: <179519003077.6016.13854568103739443276.b4-ty@b4>
Date: Fri, 20 Nov 2026 15:53:50 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=broonie@kernel.org;
 h=from:subject:message-id; bh=w+ngpUDZBZVs+uIe3ql7UJZ0fyaMW6XlFX9OldcDsmc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZ2m7Fv8qdsWW93YkZE45tf3+3bons9qZNtUkhXA9C/
 gmY8Hw06ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEltUxMpyoXLis96yHjuv5
 H++3x578fvPKJeXyV3Z7vymyh91+cy2D4b9L1aWJR19Pce59U8P5dv0fRpWmwq+uK00sIxlePp9
 1mY0TAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 16:42:12 +0800, Neo Chang wrote:
> ASoC: codecs: nau8310: Add NAU83G10 amplifier
> 
> This patch series adds support for the Nuvoton NAU83G10 audio amplifier.
> 
> The NAU83G10 is a mono boost Class-D audio amplifier with
> an integrated DSP and I/V-sense support. The driver supports
> I2C register access through regmap.
> DAPM widgets and routes, TDM interface configuration, and DSP firmware
> loading.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: nuvoton,nau8310: Add NAU83G10
      https://git.kernel.org/broonie/sound/c/27d854b5e925
[2/2] ASoC: codecs: nau8310: Add support for NAU83G10 amplifier
      https://git.kernel.org/broonie/sound/c/8aaede9ea8ac

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

