Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF293D6CD4
	for <linux-sound@vger.kernel.org>; Sat, 10 Oct 2026 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673541; cv=none; b=pB7d7CpjSan6gQegR+5TuORHtvwDpjHMsy53tZarfouqfVm1vo8x/ulZYWId26Jq0Z943NP/JxpeTOP8It3l9om8BEO8+nbv/cmggbrEvYqjAhL65O4GsLaFG59DLuFHGITo4lcMBvGFmh+K3SmTesY9Vt/VRAKJGuW8HmFSiKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673541; c=relaxed/simple;
	bh=cKY+GzJAN8ct5E/Oq6g7XqwfAF+ehbcbazNlzOc3+jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XSvsTgvwvg5Rkx+JcUat55g0Q6Ly2PzgwUHbAUUlwdI9teyGJy2EtVEXoNBK/vH8HGTLby+R5UyVRhSTy1xlhg3vzCOoJ/9ho/2RR0yhCkQtzPNojX1EA0Sf3T3BqQ/l78jXQDsdb9dsbDGSREwCHhwoMwtaAxlWeUu1fhZjr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcFAyU1i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcFAyU1i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21801F00893;
	Sat, 10 Oct 2026 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791673539;
	bh=rup5tkMkYi7r2xx6Jk92KFk0I50Kwn70WV1FGau34Wo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YcFAyU1iSETPAMZbKvroqlB4ThjgEew8zYLz5XaEKqpZmH0yKkg/h4OlUAbZe8bP4
	 mlOTnNWl6P+SSCbOrQxwrizthwA9a7TE2B+/uqAMUWWKifovg7+shkrlUH3ADUaJtC
	 OCdaeUW5XLlodIfLkvikfZbX8BC1El7jnfX8l/BdQmEUvrekVZFMP3vPDrobTZwogf
	 4r2S07/l83AN0isputvqmXSBY6iNjIqzBie4yUxmbDyS0rVDl2W47f8A6IXqoWQ7Ha
	 kOBX8ckgV+C5z6Hc9WkiMjUzOy6dEblxJToicIT41/aNfpBz6s569sO+hUIeJw7mte
	 yKx02WeADRg+w==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Zachary Huang <zuzhenhuang365@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261007193038.2473068-1-mario.limonciello@amd.com>
References: <20261007193038.2473068-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp63: add standalone ES9356 SoundWire
 machine
Message-Id: <179144532182.2423942.6249300174232633307.b4-ty@b4>
Date: Thu, 08 Oct 2026 09:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cKY+GzJAN8ct5E/Oq6g7XqwfAF+ehbcbazNlzOc3+jk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJOHdm/1bDslnlX16/S/cnSfFFPFxozZEyas1HL+WfY+
 YPWsr4PO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRtAMMv1lrPzeLm0tVsW3X
 PjrrYv0O9qqMgxM3O148yDmd83dh4jVGhtdqboXfm7ZMykpcPyfVorrmxLQuY41tHmxfyljfLfj
 5lA8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 07 Oct 2026 14:30:36 -0500, Mario Limonciello wrote:
> ASoC: amd: acp63: add standalone ES9356 SoundWire machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp63: add standalone ES9356 SoundWire machine
      https://git.kernel.org/broonie/sound/c/45c2b3c936c7

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

