Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137259;
	b=XbqOKy1V5dpocv9Fqk9ZIG+n9QoGSSMBzLeOMkAyekar23eY7yS6lz8RAH0ytljv5/Iq
	 /JHaKGgrmgcCwRIIRCBAeFD8FofLh4LLt1OWwQDU7h10nef48FfuDPvw6o5WD4h9ZQ9DW
	 1b2E1WTnAIn3TrPUMLNxdI1Fnt9mAynAtSVSBUN1rbdiNYzoPVJasV0lvD/IYlxv6FH/v
	 munHA7Sz7X/w8ww3vXkkr3umYAPJ76V5Rea/nevkW3rnUhoDU9T0REIx2F0cW+EJr0Zb6
	 YnxuJpd9PdRuKDAagc93JOyD2fEZz53HAus05Z/i7NHA3L9UzurGYHbG75E9hZmOnHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137259;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WHdu694/rSsfz0zb/WtzgEfC97QAEZZSi3ylqWgjwJ0=;
	b=KrA+niTUNp1i1BR7WPnHESTs888zpn4KcJzWaPYl75+KSnFiyXSkLmuwYudyvk5pQPsu
	 Y8KVCRfcOTGAJMbz//pHL0uMpHb1Qx94jVgnhoZkMsyvgIxfrxNdGuiVmCPrgiGBYxhty
	 SyefV6wTSTbOGEk1NALrAqe9YUoCzPpGE772hgfpE6hiiN7+BTPkHs5IJSVTYdoR77dWy
	 9YiLirh+ItD3HkceGuVfvx8CaDijzzsG7z8U5BobPepmg7B0adgmb31LM+m8GUVIeoIBs
	 qFyqts420ATp4uPpapy6+Ir3OoqbbHnQ1R6q07SgH7KKvi2GAHxb+1ISsJNW/nO16Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEf5iMpI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2870606A330
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEf5iMpI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEC81F0089F;
	Sun,  8 Nov 2026 11:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137258;
	bh=WHdu694/rSsfz0zb/WtzgEfC97QAEZZSi3ylqWgjwJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IEf5iMpI7ffwD4xCTgFsAoNjFVBFiQ7jesk+1pFoCMoFeVAGUaGB61anNJjkmOjgJ
	 3HxnFY7d3m5p0mlH37XqG1yln+8rhmSOjl7NjhuMa2j8EhEafmhbPFqsKOyli5WYhL
	 iTGSGjkngZfyfg5lsS7QaXakDzWjANF0vBdDWeny0jEPgZCZtBivbj/3ZUNN9ucdUV
	 0vX5JWOxJWOWYQULN4TJf1A2kRM911zonu+IILZLN5CVURukyg78pZ59UlpoOWOXyH
	 DYS9AwW5LWPbi8O0Ncwhmgt0S/1CO6fzEpE3lsLSQKMA/0MxqIgc2hI37+yQykaVR5
	 MfIuTjeEb9HQA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BEED92BF926F;
	Sun, 08 Nov 2026 11:27:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024049.1508652-1-vulab@iscas.ac.cn>
References: <20261104024049.1508652-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rt5677: register the GPIO chip through devm
Message-Id: <179406656528.3424803.17276040210336009457.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:49:25 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7OZyLkgABJDHCdzaaXrkuPf2cW1wpjrG61fT+Xt8eTI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+xKwICp3IxVNgFHbUYLXZoeNffvDlbEj2e/3EPiDcM
 GeijmF+RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbieY/hr+wZjl1Kp9Z9NDCf
 te7Znpcmm6Y46mYVHZ6xYk35j5unNO4x/I9tEK78dXqmo9QHxTsThbX8hBvLdH6KN/67sqLsvqX
 8f3YA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:49 +0000, Wentao Liang wrote:
> ASoC: rt5677: register the GPIO chip through devm

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: rt5677: register the GPIO chip through devm
      https://git.kernel.org/broonie/sound/c/e7366e6b65f3

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

