Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620160;
	b=dg9cSaT+DuR3weG4sgStvMeuYkaFM234w1Zr5EBbud2LS1tNmSjnjrD+Hff++6d/r6W6
	 rPgMieAqab2cC2+kwUeTaNn6sOPgb1+Gprt9NJeVbJufYPTsigUYEXR84t+cbocoz9NdK
	 jV1s1T60o1QKWa7h+KQX65eloIC766t20UCeC8JvIJRgwLTe8M7aihjr4SgqmkyLiDkyD
	 JM+eZfDGhmi9ELR+bQHImIndKQJe8DclTuvMdyLRykGVYXG7x7WF/r72Mu2S0N0TzAWyM
	 nFLvWGP+CRfCeJBXkD0NG32O3PesW39ttQILXp8IcFXRV5UYccETlU78vr/5iTXJ2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620160;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wUq6hcM8zVmXTFc7T2Nnf9ayAnge5KW3rxW3QDe76Go=;
	b=h4FyZAfjVhho//4kBjFX49K/BFm18hMkV8MUDNfUnJFVta4ngfve5yPlrzxvqoseJ6Lt
	 +WqDsUcIdBCByTW+OYYb8eCnKgjn+z7CGFnYLtQwrs1LbfB3/6AUSMCBNrfUyfFzTgsz+
	 H+RXutmh1PQV4hrqGld8soASvWGNMfgFw7H4SRaswr59Y6OKhEDWX6SZVrnE05U3qtl3V
	 hOl6b559f1eTZzma990NMEw7EF7WcukXPbJWXG5feYKB3qKLa9z9LO4DXJgGQ9TsNPUX0
	 1EWF/+zkAFpMQ9ZG5rbrFe/U4/yzDr7ux7dNmUrlaYVzGaauD7evamnebtqV7KjRS6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4y0Ev9g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAAE606A331;
	Wed, 25 Nov 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4y0Ev9g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AA01F00A01;
	Wed, 25 Nov 2026 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620160;
	bh=wUq6hcM8zVmXTFc7T2Nnf9ayAnge5KW3rxW3QDe76Go=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G4y0Ev9gG1fRbAc5kNADvXAcD+WG6UmKQmvxrcaXvPuz+VngH5dg7M90vEzlVArey
	 StMRwmcVQwxcJLCp7NQr81TARs48et6rT8nkrPkntwGTcZNYXT2H0oa+pTVcKcYiZ8
	 ejwtKCc4E98YxnuhlEp0bDJzBZUEjSb334OXbW3P+0RgOhZAAQJb6qKkm2hk2cSGVv
	 0wsSbYhF1d5XVTMKkM+uNRSEPjjfxPtWXaSrNdvy9oJUWeRJOVoQqX8POEEWrMkui2
	 cwsBQLkO2Wt0U+mpU++uPuoJauTxPAyJDAWk8fWw/EU02b3o82eDE9553QDVK9Ejid
	 e7DkfIkf7jzaw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 doloers@hotmail.com
Cc: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <TYWP301MB008701733619289BE5A87111A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
References: <TYWP301MB008701733619289BE5A87111A37A2@TYWP301MB0087.JPNP301.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd934x: capture needs the codec
 sysclk
Message-Id: <179554445314.947306.14903395165984953700.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:20:53 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=broonie@kernel.org;
 h=from:subject:message-id; bh=i0b9Hbh1+Nwmk+pPqW+Kj/yEAVUK2yE1pPN/ZhVBWxg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/trOinZMKHDITbnx2jqf/9Y21+P8BV/PCyU/q4zoa
 ena/v5ERykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYy4ysjw7+3Jnu1w9877Eu5
 +e6fR6HTqVqnVzMZlSsLLPrm+hl/3snI8OO18Kd9K/8+vRK/JmehR8qUQzkGgiWCszZNdbr94HO
 gOwMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 08:09:32 +0800, doloers@hotmail.com wrote:
> ASoC: codecs: wcd934x: capture needs the codec sysclk

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: codecs: wcd934x: capture needs the codec sysclk
      https://git.kernel.org/broonie/sound/c/9c57b993ba3e
[2/2] ASoC: codecs: wcd934x: do not leak SLIM channel bits across ports
      https://git.kernel.org/broonie/sound/c/519d0ed450c9

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

