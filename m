Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137260;
	b=m6W+DJ7/6TbPUan67VhL3/mYEaHVIjRcNiJRrMoeDrTwEvsWjut8Jp69duEtlFvAdu1c
	 lqSsGQVMwglAQheQHa32B704FYcMD+l4Hv4UAeAi3pHBfXpoHMnkFOqxLDggh+TTmaznw
	 at4ZsIPXLjkZZnnbvyOdJJhyppDT/O6D5eRikfKFVFBs8fz8pC1trbvtQBadFMS167Hd1
	 SGkimrQ5Sp+9di4qm+p5D5zeA9bGVgOdBM15RKjmsTbRp98X2q0AReXOZTNbB/uOpZgQq
	 qxU0krKu37WEg16z2vPucKunvmhas/aB2hfZpIZmomGtHH0b2s05cJZtS76Q9vbBrSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137260;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=3vEXpbNMGlJGm4BnwQ4lp5jMm8fM/VQdxs6DaJ2GpKw=;
	b=g700TVleD5YnHKQ8IP7DdvuCewPBD2F2OxYYwf4ojUHac0FhUvgh18AmhcfYdmO0Boc7
	 gKqb+HvX2ezp1B2hnZ6avvSe3GMvb4ZCBPXIFsNCr14xL8aHkHvSOQOeHvTJFMUuKL9lN
	 iwMqa1hurLhCq+ZFngxyyPm+Syl64CnN5hgXjk9ZeALySr6o3/078xs7nRzkWGyK7U4Pt
	 vK6jRypkJGsrVhSvm7bl0lZOuasN79ZrXuX8OGxcMp0d22upF1ma7GjxMS8CRw/ae8hlq
	 qWvY29NtcpKDaceH+eKKiQcHZyCx4mGdRacrIiwC8CeofvlAAV1mBZcOhkU7ddUIsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2pdMRqa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4A606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2pdMRqa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95011F0089F;
	Sun,  8 Nov 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794137260;
	bh=3vEXpbNMGlJGm4BnwQ4lp5jMm8fM/VQdxs6DaJ2GpKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=N2pdMRqaJ5eyme1Os5+I6qOBOENGhh/HOLLnCo/EtNfnxACs3vOQ7qzLazK7JIAkp
	 uOKF77pTNgDdyjps/XpdDbBEaJH5LAAOWBtMqLJUziuXouSnWk2WMbnzQ0tqb+xb7t
	 nULCPCavteoPccla/a+itBrK7q2fyZKhfaOm4itudNlF6bQM26+nqXlOzrAWqIZBxd
	 Nj/XbK5VT1R8WTVoHi1ascJEY12CG9ymhPkcnCiunmyw7zjTWV54S7t99Xn0KNQ/9g
	 30QIHO0ldt9UpFafkYfEfNfgTdswOJM48a9dEQu4wgB6j7e2+3H1UOiOuPLApoqiVb
	 w/+fHs5qhL1bg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E722C2BF927B;
	Sun, 08 Nov 2026 11:27:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20261104024054.1508754-1-vulab@iscas.ac.cn>
References: <20261104024054.1508754-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: SOF: amd: fix leaks when SoundWire probe fails
Message-Id: <179406669638.3424803.12705427175548437900.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:51:36 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pFbAjdUy9vAJDiKU2YdNJTPIzIdBEo9gOaR+dfZuk8Q=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+xKzcJDD51p8teYtmHRcNuXPGSnHDVJ+aGT+nbbrIm
 TPzpHiqTUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmsriZkWH9j0me11dZiEfJ
 BE173nE9nkX99YQSt9InGaf/TvJxOZDO8N9RMsJaddPio7/7d6zNaru6hGM6z7IJ9322Pd07a7u
 570QWAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:54 +0000, Wentao Liang wrote:
> ASoC: SOF: amd: fix leaks when SoundWire probe fails

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: SOF: amd: fix leaks when SoundWire probe fails
      https://git.kernel.org/broonie/sound/c/f8fff272681b

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

