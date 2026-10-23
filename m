Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830175;
	b=lMdV1jDS1NtbSwnu3y6cfRQU8PpGUwgq4oFyOP6P+An8zCjXTqubTlhGU/LPFacyOArB
	 jxgAnWr8LOQXMu9k2CX5Np9tqQiXWQ54EAEzVr9pxwTzJqMjiBnhEN4UIPuA11DBUDA5U
	 mLnAesZ3PLyKanu/3+E+T3kDSK+h5yha95uWLSy9PmYY8hmg4ix4m6mWjpDXOc+rNfZNq
	 YRJ8jvac1epoPN6LJH/5g16mRXS6LI53no/pIYX+3dYFhO1AilIc816zRLiIiba1KhN4p
	 /JNxdsgv2ralCjgrzodDNcnf0dL1URKcvG/g4DuYV0IMZ3/aHG9gWKn6+wyKs1Nwdaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830175;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VRcxh6zSQH0G8X3P32/wW4FFBoi8iLMvBF6s5DU9eSs=;
	b=SUsv0zcSs6gQMgH/+J35pc6JX5kpaH4yQQFXiDBGlPg0Ke4DfDAp+pzefWa0CznnuT4Z
	 ugkBiRX4+C33LG2ndwC/SjZeu0uuM6h5QG0y/1Rg1iFOaKGQg8zRM7GhMzwHuX1bbJAYF
	 fEPJOm81XCjnzvVpeGJC7xE4ZGf0MPluMfTXN16xB5xlJdRbKyOsbyMyzp5QtOj8+kjEp
	 yZuYAOL2bx0U+J4aprUS112LC1Ik0zhFuWQ0X0Ot0ZiLFC7jtnwTZBOX2NKo4/jamhQ4P
	 W1Z6wtcvivjKlUjwdg6GivYYGx8yhrTuJohu6vhulTWSZy6/U5x8nH8CCAxwj/mDg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWYYvid9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF020606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWYYvid9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884361F031E0;
	Sat, 24 Oct 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792830174;
	bh=VRcxh6zSQH0G8X3P32/wW4FFBoi8iLMvBF6s5DU9eSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YWYYvid9otLS3nhpiX9yUzbIQjn0W6BNfIppUJRRtPwoSQL76vy6gGG1N8GLmjpy7
	 Dj3AZ+FZeq1EnTxJ7ULNnSThfLSeXh9lfiO8P6zAcshD5qIP+WYPVN7tWAtVmLTu8F
	 lG73M3jdJm7xXvNYx2L3RKYyq9cMroppKjof6kM4eoH5yNJqM1XPJpqUI3S+nLoKdl
	 EnsnfSBErZ6XDXuZ5YdNpxD3dljUS9KgO0jEJhHJq9zX7m6FwM0GlBu8Jm+Eo+PkgE
	 G5jIte4F+oH1ckdz6TcZ7x2uLwSCBEp3k7xQvCoigT001YNG+Fm7AiLqzzT5abTCOv
	 56BX8Zp1TM6wQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C33421E1FC4F;
	Sat, 24 Oct 2026 09:22:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shengjiu.wang@gmail.com, linux-sound@vger.kernel.org
In-Reply-To: <20261019224724.236388-1-festevam@gmail.com>
References: <20261019224724.236388-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_utils: Tolerate fractional PLL rate residue
Message-Id: <179277772835.3909521.13044193561532724761.b4-ty@b4>
Date: Fri, 23 Oct 2026 18:48:48 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Xqq5tF1CXWrVxms89O1moLhNxcT/Kb1Vs5Rax6mgbIo=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGrcatuhEvHgi51OQCTqZJClSpOUPH1lnyFehP0oDjLYXpIuX
 oh1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmrcatsACgkQL+9zsLPQOImbXQEA7JbU
 nROp3DXXhvO0L9WcV3SstOHSGrKPNkNzDK2xhagA/R0l4rtWZaptcD+2S8WRL3RQUN6slBdF5NC
 GwhuPA2oK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 19 Oct 2026 19:47:24 -0300, Fabio Estevam wrote:
> ASoC: fsl_utils: Tolerate fractional PLL rate residue

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: fsl_utils: Tolerate fractional PLL rate residue
      https://git.kernel.org/broonie/sound/c/cc3fc99f1bce

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

