Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193051;
	b=P8sLk4i44wsMSFvHBKuchNrVuCl48Z7FfXnwxrxi/hAKc+vKE/gYJ/hPDAFqMGoWVbiX
	 5/u+WcX1i2ti9fWocipdEBGu8sa+NgmjGV6r+9+aiaBlWzflb9Q3JKnTsUOk1sL9GA2BE
	 +E+No7x/mKgEn1ptopi+BFvNof6j7nDuLOtP9VU4KxKLaLB9IZ2mvPRxjCEwl8fv9ozMJ
	 Kx0RU3vAJbugR7BVEaQFj2fJS3dcE2/UqmcXTTpDHha44PvmX4GyjOUtuTOFij7+OungW
	 YHXmb66IeJN9TU3Z47S7bXPIKNt4fQfh2/E4Bdn2v+iXzU2XO7mNwJ6HfJFM+4OXLvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193051;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=muOyMM4tBGa8o1Glo4zMSPldaLPuNzEu577/jxDjA58=;
	b=sfRCgUq40FUgjU3FXDnZScEe39+pumCoTgRN45UeU8w+mgy95PZo+5mEVdISoadg1ZQZ
	 9PUBM6CK/mMpZJDQqnen9RMYPOiR343JQBGmyBg32w+MyjOXVJIuvA6aVohdvL08AXdPb
	 QMGqJ+BIgStD4w6v4XR2b4XpPl6/L5FonYUgrrkq1qGWlQ2dC/JDvLR5f3bjAFFYEly7b
	 nEbKMti8VQUvPN3Ms29KSr9jreaRY65AoVKW2EhqnrgKYKTrwRaplfOMYnRhOkWXoPcf9
	 argjbZK1jlldgwHKLtgTzthrPS7mkbpUv6ZI/YH4OWB2lhUd/SusIs9M9uc9M8wRkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MY2ZerGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B10606A33F;
	Fri, 20 Nov 2026 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MY2ZerGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9261F000C6;
	Fri, 20 Nov 2026 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193051;
	bh=muOyMM4tBGa8o1Glo4zMSPldaLPuNzEu577/jxDjA58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MY2ZerGvNJh7NzD8YriAopHPbodyOMaJ60KrcqgWbHTwx1vOLUE//u3mH/GMAP2KU
	 KNC08sO2rCdJ7Y3HXEEZOOQlaUUkU7BfZuRha8Zrhtty9ZYoSyUYUbqzGzC5IllT9a
	 9paPW2KYR3kSJIwQc+aPWHInuv3zbXh6s8rKTwUMa+ncZbrw0clm+vGDP5nAKlcAmZ
	 jwcDRL9JjKZmN1VbM0MPBxrCMvQ7L7ty4mDtmdF5LnZbaW+5IKUlCQcWdGWWttcQxk
	 0KiNaz6wsi2PxReKccsP8PzTN9fEpDUWK/kpL0n9Hpg+PbFvJTVWSrsPycV9D2FsNl
	 sDEOKLk8D+5Nw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120-ux500-asoc-handsfree-gain-v1-1-56379df0a6d3@kernel.org>
References: <20261120-ux500-asoc-handsfree-gain-v1-1-56379df0a6d3@kernel.org>
Subject: Re: [PATCH] ASoC: ab8500: Add AB8505 handsfree output gain
Message-Id: <179518654497.6016.12233932109137524077.b4-ty@b4>
Date: Fri, 20 Nov 2026 14:55:44 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=v+54QrLDrUF7PasmTHHSD+jD7uzKsdnCCkF75tXpqoo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZKm6ox7q2eT0M4pxd8rTkjYO1SNGG746z7s7q6bu5K
 /PKgQmRHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI7v0M/9NPf/ZRFHnpU9l1
 wOfcj+CI04GXfhjkxH1/3+Ab9LxtoRUjw3zBpAipyuZ/6caRRrOEee7wycq4yOWyGt91eWSS/FS
 AEwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 09:41:37 +0100, Linus Walleij wrote:
> ASoC: ab8500: Add AB8505 handsfree output gain

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: ab8500: Add AB8505 handsfree output gain
      https://git.kernel.org/broonie/sound/c/9fe20364e431

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

