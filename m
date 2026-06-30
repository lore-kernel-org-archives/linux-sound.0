Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406D45BD5F
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834556; cv=none; b=ZKqvwI+JTQi79YBKZhBblI/UkULF9vO24TaU9cH8ACRgHhQXJ0yb2e1negIMgWGOsvkzV3dIRfEf8N0gzbn1/u52iy6z01W3qqOndcxfYPP7kQMV+jnNhHCb2BfhTnR+mPBD+Br2e7Xki2xSnSjOsWvMBlJr+jRV+TXNxA9aoYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834556; c=relaxed/simple;
	bh=ZHfIXNp/3oL9lzIf90tN+miQhgFN945z+DyQL79VcS0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QOyIao4/ph5Rws/pfeQX0ct3zgXVtE3ohzTkVF69dpQleW3sCxQa3EjPtsGReGzzHffjskdrCTVjM2BMtomYo/p9GObRshgCrrHV3nbwUT8OLwSQ+uYy/8l0adL8tbEzCHKLAJ7x6R5vMKcy0+CTsGY6BgG1aQt6IIpRtw7gh44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2UJ17ha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2UJ17ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04171F000E9;
	Tue, 30 Jun 2026 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834554;
	bh=CA8f8z+VhnnPbSNZ3z30AyJesdz3kbwxXEhqnBwTcOE=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=l2UJ17haz6WtV5nYBRXcRTYuoiWQWBV0ARz4UfEP0JIokYrv8fq1w4W11YhqHX1QF
	 Nd0BegBXBD+QvkXXkkGrwdZ1RvnU0v9mIzdIxhlVYvQWJss/AR5DkXt19SkI/ePy6a
	 xmRStAlwpefUe+uVWzNLkNnmKvntO68jCIVQzlffzJ6MY3DGSWu4NY12HAdMRSAw7+
	 ayTpqsNZ4fctyhu5eP0o+YWeABs0qHBHEuKZYIDIr5kiNioZzQrHsrDSELtV1kk2jN
	 fBfErQmFLmvLwBbhBs5ggkFfJaa2OMDP7wl8rreBE6wq4UkxSjid5NxFhVZwu0rbdp
	 IoqvZI8uBBWTA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y0g2ds7c.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0g2ds7c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: au1x: psc-ac97: remove unused chans
Message-Id: <178281877758.79320.10146839462388973791.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:26:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZHfIXNp/3oL9lzIf90tN+miQhgFN945z+DyQL79VcS0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+V4+DHzygGOIgh9u686oaIk208ek+bhDAPg/
 FGo0jbo7Q6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPleAAKCRAk1otyXVSH
 0Ng9B/90lk0OK67IrpbywSOe1eo8Z8OuJevRDV0ccGey2e2Uuip0B83PTtfJDs5kC5AEJoTP5ze
 xVc0l8DQlgVPFhq28c4QrrybsgZf6O5X3l+X3CbP5lG1EKukr0vEPbhx1ZFm/s4D2h+dy4PdDAD
 KgsQ+Q+oBX9o2ybjpJHsPHIKqTTf+o/ZGf+4B3QGCR4vaxK7knRJ0V83x6Y9j6lRwwDRTP+BZJG
 CJ+tFOQPh7KqBub3q2oorRDBMdgySy7FKBMDcw6TkFOEc+tTznHW6LmqwaSB8qmNeuhBtIN2Fsm
 qgX8K6J6XmekIYpNzFF8sIy8fEUvwW370ImnZv8TEygqU2eJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 01:08:07 +0000, Kuninori Morimoto wrote:
> ASoC: au1x: psc-ac97: remove unused chans

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: au1x: psc-ac97: remove unused chans
      https://git.kernel.org/broonie/sound/c/b2133ca33e66

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

