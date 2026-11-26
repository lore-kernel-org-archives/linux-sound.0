Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733940;
	b=EAHvuvK5oREVkfCP02XDffFphJuQZ+oBQwPJ1n5xQCbqy06iG6hClXAsptkE3crzseM+
	 9QsduK4Zo7sxDF3IzuSz9/zXvdLWLzWm2Cf5wjCfcgpKgdyE8K+JpB6jLVBQSTvyYQhaS
	 VSOcP/R2zZHiRsHz4AmBa5U0izbT6N5kBnakejlXBZgTjqGS5SBs86v1B1V2PFkt0Z+Ss
	 jpeCYU/rWxvnMV05ivTcWWryi6h5Z7PYdDRR+t1fmNsW1NsvsLlf2TyclHawg/pFwjjIw
	 Of3j5WRmU7gKp03HpjcbhmkjdfQiSrhF05RPsfxBjQi8K+9gTq0ErU7JqRY6aPSAKmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733940;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eQ3XZgcfne08OZRayaFimVT27JBgjtpxLB8nQ0J/qqM=;
	b=JgZM87VEt3nhzzYVSTZ+KZB34eU45Jd1eKMHAtcN6zFf30zSzb9Yp+Yh3rXytjVgVbfN
	 mHI4JitDpcX5P4fJdqUDMMkGDvo36bwo65174P8tV6gJ3aOxll4TKZpzXyz+Xoo6iCRsq
	 DlSu2UGw4wNZhbSHph0SlwMBE6DVxlJYALCAWWlABJ3lIGGimIcTuViiD2Tm9C1rRSbCF
	 fgcs7+8XrMRtOOFuwEBhWNGR7ta4s8W8ZJYEk++khw3YiBQv8kSO2pWTkzsyW8W14u1SB
	 G/s0yNI7Dc3KU3vcslZay9bRu+e5eJZmDc/ejs905wIAUIPzQgvGZDSae4JnSeH7I6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgXkPu9A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D2B606A321;
	Thu, 26 Nov 2026 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TgXkPu9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4991F00893;
	Thu, 26 Nov 2026 22:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795733939;
	bh=eQ3XZgcfne08OZRayaFimVT27JBgjtpxLB8nQ0J/qqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TgXkPu9AB3r6g0hC4oWCUEQjM3xgTMNLEA6Q2nz1IdeklKZ7CXC5gfHgAP5F6sTVM
	 boKQgYnLDB+DrE6DLUc1M3vKllpolDebR19FixggIj2nuS8SVlHQ8TMv3tAywv2ilz
	 jexa3FYTPbvjfqA1h3hzF3l6a1aQjeW8FuMXjMoNQ1ltQZ96SZ/y4Bd1mhad6s007w
	 x+eh/jdKxvUpxwwjRClXJ4IjMZibSGDZV7852C8z8NnPdR7duGcY2nXAiG+HMWpK9U
	 kBIU50uqu9TLLkDNWtDDGVg9ZHco9SDXMLcEGwRZArVyC1eaQ47o02DqGIGbIxX/39
	 PpCwh4sdlVU/A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Gerard Marull-Paretas <gerard@teslabs.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261122093419.72135-1-gerard@teslabs.com>
References: <20261122093419.72135-1-gerard@teslabs.com>
Subject: Re: [PATCH] ASoC: dt-bindings: awinic,aw8738: Add AW8155
Message-Id: <179572344828.838304.1477789304494424188.b4-ty@b4>
Date: Thu, 26 Nov 2026 20:04:08 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dN1XoFfvDhknEOK32ZaxBQfLA9V+Mi3UN3do4aJB6C8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5dm7wCu02Feo+btBhLnL7Uqjr/m8LPn5lEMjVfSr4Z
 tLRL7ctOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARIVeGf3rlr2LUrizbsHV5
 Ucfy8KPuzbEuC5t3XVs8J1fn/fsLP4sZ/mceaWiRun7Ow06C49qssn85p8K0ue7u4pQNn5Cfw+T
 4lBUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 22 Nov 2026 10:34:19 +0100, Gerard Marull-Paretas wrote:
> ASoC: dt-bindings: awinic,aw8738: Add AW8155

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: dt-bindings: awinic,aw8738: Add AW8155
      https://git.kernel.org/broonie/sound/c/f3ea554859ba

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

