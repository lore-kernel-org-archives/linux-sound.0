Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789030;
	b=hKyQ+/v/yUY6KiD0xONiaw4KeuzB4KJHgK8qe4pugvAeAr+ACLAz7IUwiGv5Z6A8FevD
	 JNBb65DuqEaZRHMIdbJllGJREpBVYrTy3LEJ3s427AxThX+d5zn1jv9Lim9DT/EwKaNN9
	 9d6dt5mC684tB1vj39Om4j1eJ1usjuLw/Lq0kvUtyN+mX1ezWpyfgxuSWIW5DbndRogSU
	 sOHsjpORmd6kGgxkjBiX5MQfULsEz7zZGmkZ2sewYnXVVRFt2MwdJy+EZDomtskS6C9je
	 9GIp/442sLlTytiPQwz7TS25Omrbbjm2Ps5JnoE1kgGuJ7jf49jhezW4PVU2j+qzLPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789030;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=IIZsm9nSrfcDJNQ6UJ+L0ALkXvWsQSBq6eu2iPLZ9Hs=;
	b=KO1q7Mk8bX4padCdANQUDBgwIL6McLG1j/wQCdnzF5INTq3Ql5LQWMPR0RKwMTj8pPPG
	 JuhXfpHOWMxvtYQxHcrwMtcrTb1JSmR30MDAby8H3mdiiolH5mGi1OcKeBDyLJ8DXXCWb
	 OfbJ/DtXrB+hBEoHrGoaoMaKMC362Z06cTQCw7sYkR12Pi7ahwx1fEJd/XKhpAstdh2d4
	 ydNfdQlbWxsgP2UKE+j+/Xz3P1+7UKT05VQXiCc6CQyeHqWJVvEGu9fMp5/eEHtVc8XXa
	 Y6QV70PReVNLNS6692m/djDtfx04p4OEBJaR8cDLcsYO9C2fatjEZYOsQ6v/eqaqBXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpJtY5b0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD5606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpJtY5b0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1BD1F00919;
	Wed,  4 Nov 2026 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789029;
	bh=IIZsm9nSrfcDJNQ6UJ+L0ALkXvWsQSBq6eu2iPLZ9Hs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mpJtY5b0fMuteQhm97YIpr9ScbBBmslwbNSMk25LksnLzzDCeWJ2Z2Q3OAwN44Syi
	 a9xyxTWht/GJU/O4Hu2SEv9JJOYY51erTKQlfOe/4O/ISI6XGOblWNtgyJ188qzP4W
	 Iq9rzLCCCXcgNff+KWqVDvXRnSg0jFy139cTJikYu8CsMXXuSd5aP3NLohICPVL7kX
	 yUcvUjWGUiWzOA492vg3CI3RsKLXDkOF8ckA9syJGwTHOfOI7rGgvUa9pQzrhg4ZND
	 HMdRLA/y5neaDbqQEn1OZQ98YP5eJnuYbotPDI5NQYLVkAWnNINW7SQg9t4wELorTZ
	 gPa2TzCnp1TOQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E67C425D8BD4;
	Wed, 04 Nov 2026 10:43:46 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Qianghua Wang <qianghua.wang@senarytech.com>
Cc: Bo Liu <bo.liu@senarytech.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 alsa-devel@alsa-project.org
In-Reply-To: <20261103070150.115136-1-qianghua.wang@senarytech.com>
References: <20261103070150.115136-1-qianghua.wang@senarytech.com>
Subject: Re: [PATCH] ASoC: codecs: sn624x-sdca: limit DMIC capture to 2
 channels
Message-Id: <179372836634.2270148.12592297178524380653.b4-ty@b4>
Date: Tue, 03 Nov 2026 17:52:46 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HIYlLAkJqdrxgNhdSStAzyVh+B+7I45KFL4xTkR07aQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe88Seykp52LosQX7Bku8c1yyto86u/57vq1Ggc6Y2p
 cebdWZ+RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbCfIPhn0bK0VNKj/qWp3MG
 r9l/O7qo2Mg1XfXH1W/cf78cU+rrvsvIcO/nu8V3vDb1hdWfNJzLH5eYeL+y4eujtUZsQQ/aNi+
 dzAgA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Nov 2026 15:01:50 +0800, Qianghua Wang wrote:
> ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels
      https://git.kernel.org/broonie/sound/c/b54a20b671e3

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

