Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109558;
	b=hx/WKvB+1cFIyPERm/q1e739FgPasBUuB0/Nkh9xXrW3DUPiRAAjf1QgPnejo5p229WP
	 SQbEtuV2vvJaCoLiD6JZOR1U8VKY8ZXAFf+WkJF08vqkBqKqKXk6HrlMS87Bao74EJIOQ
	 NbyTicNIdBdPBLvjWw1egnIwAq6MfPqech6nDcttyIsz3N5cOnyvDzVzSwDYk5msjgCA2
	 BgTJgqYUrN5azn6+20ei6F8ux91W7f7HaCF3fwUMt98chdwinoUIi5FFQ/o8SY/1nvOPK
	 oiUq0OVHqsygnHB1K0pdrSuAI4yIuOxVEtWqyOANK5pAOcORvwWuPe0TgfXzsJYOGKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109558;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6NvwIFDtnUWic0VShvliO4/LNOEfHpEDMlS61bWCucY=;
	b=b+cCLmN1CexRI/19ui/AYjrAbisT0nRSMuwa5qYBoH80wZSTOGVMNpLKJhVZEWMsqWqB
	 AZxCeMgEh6vb/oNYrZmWSLTRjMYx+NInkT/E3WVZkey2ikT3umGG6W0Noay9AviUL9rUF
	 ROaNqE8e4mdlryKG3MDY+4cIE/d+qKS0RJI0KX/MSBcyQkKkqZLKRy0LT3zzmXjHh0lvo
	 BFOLf/8ZZlMXB+3GLrHagNK4KFQCtXRRewfz82umX2/rqo7vGnDGH99HqDhLGm2NRRqIG
	 Y+t5lUjRANlUXqZyUQZvdma9Qh+7tU29ArxKNdQu3WZNAZRpjFHJjniI8BL+2uh/7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0Vq0kxP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15012606A320;
	Thu, 19 Nov 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0Vq0kxP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09ED1F000C4;
	Thu, 19 Nov 2026 17:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109557;
	bh=6NvwIFDtnUWic0VShvliO4/LNOEfHpEDMlS61bWCucY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A0Vq0kxPt5sk+ETsxhBzdRFnmLXc5jnG+r6od2VKYweoxw6zXLriyiOoLTrnTCeKE
	 rVhlWccbbmT/K3mZ6/WmiM741PopU6LPMvtRloXxnmXGeLewFpiP1Pw+p6dA+/LR7Z
	 U0xBIC853ZBNV7qbOs9WywVaOFKrizgAmpQw3r9iS/Z/ybGVXC6CNEDiyVCp/04g1P
	 hMf8m5d7/c9SuE+Ib17ximSww6V6d1adsmK9J3Nx08uFRX+PfRhbgMp8Vsz5Cek75L
	 1cJ1ZXC95wRJDuzKnwL4fpopVLNZ0GA7QBXQ+2Y3AyAnp56hqGNVvmYni9YtUkpeFs
	 aTEgYTPqAUXCA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
References: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
Subject: Re: [PATCH v2 0/2] ASoC: Add the NXP TFA9865 amplifier
Message-Id: <179502708576.810609.3234367995086536656.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:38:05 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Roe1fKT4ybXwGCE3mBS1gMKrh77pl2c8xelhSiTYEC0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+G21SnyXNHr16H6P8qnz+5J4/yX/Enoln+uoLHpnza
 Yct363lHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIzRpGhheHvFd3JPjFq0w+
 97Rr21d2fbvfzum7zjcGvXtweMalk3GMDPOKvr7em366pUo8TGpBcmnnxaolzx8yrJ8kfttRYPf
 /lewA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 13:09:48 +0530, Venkat Yadlapati wrote:
> ASoC: Add the NXP TFA9865 amplifier
> 
> The Motorola Signature has two NXP (now Goodix) TFA9865 mono class-D
> speaker amplifiers. This series adds the devicetree binding and a driver.
> 
> The chip has no DSP and a different register map than the TFA989x parts
> of tfa989x.c. The driver applies the initialization sequence for the
> device revision, selects the I2S slot feeding the amplifier and powers
> the amplifier and its boost converter up and down. The register settings
> come from the NXP tfa98xx driver. Only the B0 revision and the 32-bit I2S
> slots configured at reset are supported for now.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: dt-bindings: Add NXP TFA9865 amplifier
      https://git.kernel.org/broonie/sound/c/93870738d8fe
[2/2] ASoC: codecs: Add NXP TFA9865 amplifier driver
      https://git.kernel.org/broonie/sound/c/3961e4baaf43

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

