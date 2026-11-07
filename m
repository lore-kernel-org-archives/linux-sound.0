Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145435;
	b=ixFnH/N7ALtqFK75EjNs80dn9ecyCom+b2bvqONHuoPSiE5EgL2vuTPTcG5cPwyTvysk
	 cP+FWPrwTUiYL5DCWG4rdyOx87vMeW4W0qf4nU56qt4jlaMs47hZj+dzN/eyn3//ldaG4
	 y2rsHTVzt4wcUQmlK2bgVnLm/JZURMl48d/t//FMwS8Izh9X+zYqiOW5fiCHKldq+1BWw
	 QMX+JTTNpx6o5Z5D4X+a+55ju2ebPJrd3MfT1WOmSuvS8CI7LREdSfT+A45GRj48Y+4Tz
	 Q1bJX3zkw1XB9Hy7IGSH+2COmaxyyKpraKVnQuQeDq/XhBfM04CZPU+VpJBhq9cpfuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145435;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5vYRpUUK0O6cDElajPXUQtxaJSko4S4aSKBOxIdD3tg=;
	b=C1NKLIJD4es477iuw6/kFRzvky4DEVbU9FdQG3tVHanewBe/YK0T3gQANBxcPHPfapo1
	 hsSZo+JOfwpB6u5zG9JJU+dyVrkk9WQmJsI1rbAx69m1OVZ0ZpE7WooCYkjYK4snVpRUk
	 XZec9DCYe1m4lRkDUkIZHqnonHjf2g8wQ8XkXJUHysiQhAWCwOT1055GBoTW/nVp0day6
	 fqzEH2NwvJVLe8fCIpldfS/FPg+7/fmGasN7LNqLV43Th19z0Guw+KU1KNeUb+PrcAFkU
	 Q1KmzEhF0kq7S+vkqxV9qm/AJr70ezLvjRA4Gm9X7K8apN5q3B8LE7rOJ2pZKYaRfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMHKst6y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAA606A321
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMHKst6y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCBB1F008A3;
	Sun,  8 Nov 2026 13:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145435;
	bh=5vYRpUUK0O6cDElajPXUQtxaJSko4S4aSKBOxIdD3tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VMHKst6y0E0O/1kKG9d/WG8pXUZvELy6xdbScFwRPv7KooTsFAAPZ1Dzd8A1OXJNq
	 0zis1+6VQmp9LMWIV8uwkfxKW3iDB5C6gaACfxxJlObHVpP8UDe+bHeosWd8oyjGXW
	 OIiS+tBPPGiRGOPBrlooTJlMxy1y5ydSKK9PXS3nvseh8ZRdLXUlIVNQ4rvg2XE9L4
	 hKr30CNdIm1u2GIL8oDFxI1RBxGGlUgI0I15vzckH3ELU6GhZreQ6/TdLkdk8Zgsj4
	 2sFho1KoG7FlC0/iRoBkIEEh7m2cnXgQF5FAqGKkcXHEmF5QI5KiKqXCQQqM73AlYy
	 3bLBSUTCq9spw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E26692C7926E;
	Sun, 08 Nov 2026 13:43:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261104024052.1508720-1-vulab@iscas.ac.cn>
References: <20261104024052.1508720-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: samsung: snow: release the I2S bus clock if
 registration fails
Message-Id: <179406790195.3424803.7070445163976155667.b4-ty@b4>
Date: Sat, 07 Nov 2026 16:11:41 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Dwlk5fuft2lDiz25j2wid4EmBTMIu/3DNywlf3gL+50=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1Exn0Puqsur/9knLL15+LfGc7dzDJ/kf1n+syij6Z
 JXGKHL7V0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQ2hItTACay2Zfhn16saszMbzcn1GUz
 MWseqm8s6X245/o80We2pqdWRMjKyTMyPJ7uevrM/fbKELPFz5UPpzBwsldP7v6rkz5tmmzJrT3
 3uQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:52 +0000, Wentao Liang wrote:
> ASoC: samsung: snow: release the I2S bus clock if registration fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: samsung: snow: release the I2S bus clock if registration fails
      https://git.kernel.org/broonie/sound/c/9913e4bc5a2f

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

