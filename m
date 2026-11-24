Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619344;
	b=3zP7vAhk7LcoFCYQcLgGSiJxBG9dWZrvEGsgRCwESBHNR/BlZSAuHvCzRwZ7WAl3Tdno
	 gJ811AvCl1Ekc6YZ3icO7ZSN3OA9JZNWAFbYjNI7kvHelz6xmJ5fCHDfLyPp2BbqwPU3g
	 zEpvUlN8m56di+slwVggi9AxDHPECaTfC7h1kSpb+8ND4psmYYZqh6fCTpNhMsQ6BkdtP
	 IUBqitY9K3a6MFKwwKz16yiaEenYs4YESBbBZs4lRkxPjQgH8M068WyBUx/MwFU86Nr2w
	 AN4QufDCAfICUQ+VZ/Av3WcIBSZuvdQ0sV4PsunG2DubwuA4EHyhIeNngDiXVmsUKTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619344;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VxkvXx0QISvNLm0dBnZhh05AEh7aJ0O7sxMzdveYPi8=;
	b=sXh1RM8L7b3of94910jgZA1349bs5A3Hjumb9F+VHy+dIlvHXTAKQ6LwYqg21y80Mqli
	 AsutZMHhkzD+5wnRGPeN+sRac+nXHKMTKTRLquGhSK5/D1MKYuV6aK6jab4ULzh6FTIro
	 Wv+9apWLBFdxRVLou9WU3jFQdSqyAq22pTqmTorQ72dpy4lBaVI6llKo9ETIra9KMiDZL
	 fFrosKHkqVFff90ojt2mXZg1/vKb9YOEQe0IypFAixTD4J4ssKNNDJOTswPtmDD6H5aRe
	 vBfNHBoPx03N5cKM0qGgNxNrKabV3a7l7UEMITkhWxGRY0SzHiHEOiuYHwFA4RbU3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0yyWPWx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E6606A335;
	Wed, 25 Nov 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0yyWPWx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFADE1F000C0;
	Wed, 25 Nov 2026 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619343;
	bh=VxkvXx0QISvNLm0dBnZhh05AEh7aJ0O7sxMzdveYPi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I0yyWPWxPjM27BBLQSDI48fY0YMwGW+didwmG6X8uqGOXsTYKEhOM0L7k2S9pg6qt
	 GDQnxeuYlM4lOO9oxBBWHQMWkqUKzo42k4lmAmHaBlcZXTxyRXFYS3pX9AVhht1xCu
	 VqFfybpu84/RtExttjFShAIcxUbaawbFJJ4EKxihEiCV7yf7SWc25Wp11N8gJV6tDm
	 77NdS2MkzyL+RhD75l+zlhgpv2oieWlIY37VwSkIW9U2OwpBTPBV8AR3qRK7D0646e
	 hjp2b0PjE5vvcCJ4dt5dh+uhJtn6OF1oDOqTKAQA6+1Z/45OtcUsqp1Vde0Oh6vRBr
	 lgvddDG1V6fhA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261120110441.2163567-1-rf@opensource.cirrus.com>
References: <20261120110441.2163567-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Prepare for SDCA Companion Amp
Message-Id: <179554423078.947306.5902845909561904278.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:17:10 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LOlW11XCaReRLoNCyki+m0iMwWty5eLynXbWKztMGuc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZfvHESFU8vnV5g4jtlotbl+UYZh7+73h1J2v0Vv8LS
 UJqThx7OkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR0zKMDI/1rEz/3zWYJ1a+
 yuPrur+rP75rjP2kyxTwbM7Ebfwb0ssY/vBsdj54wXznXJ6XyZyhJh3/vpS5rXlxhlvr9932H0H
 pE5gA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 11:04:37 +0000, Richard Fitzgerald wrote:
> ASoC: cs35l56: Prepare for SDCA Companion Amp
> 
> This series removes some unused legacy implementation of the SoundWire DP3
> port. This old code conflicts with the actual purpose of DP3 as the SDCA
> Companion Amp output.
> 
> 0001 and 0002 are the two changes to switch the code over to being suitable
> for Companion Amp.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: cs35l56: Remove SDW1 TX source controls and widgets
      https://git.kernel.org/broonie/sound/c/f52668f474f1
[2/4] ASoC: cs35l56: Rename the DP3 DAI to cs35l56-ot127
      https://git.kernel.org/broonie/sound/c/fc7de4450478
[3/4] ASoC: cs35l56: Eliminate trivial regmap patch
      https://git.kernel.org/broonie/sound/c/0c690c80941f
[4/4] ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers
      https://git.kernel.org/broonie/sound/c/406541bbf4eb

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

