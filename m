Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259679;
	b=vY5OoNR5kaDIs/gv4RTHwFDM4tiMFoVYqJv3oYsughFIc+nPDYWN4m6b4w7uXEnkX78z
	 Avv7lZdb5eubMZu/DMp0a4F3NrJc2Q9Q7qntVK46kaErhNLy1FUqfTTA+yaB9J8C3IOVf
	 Xudi1UzHSWaj9HhAr0a0UgqmmlnOWLeBfX9X2D0IJBGumlQRnafzWq03i8aSNhHZyMYCl
	 IZxyz0jcbO6nXcci6PhLcAdZIcUDA5wc7Q5VDe2W/aiTMmD22nle4yFY2MaX8X0+CggMz
	 xwSj+IvvPcaLw7upS6waDrDs3T7oA0SJHt2BxMR09EWxhapPFeI+0i4QOIxiZ4w3v3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259679;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AB86i4cu8euWUMWjAB6Lfkc9xmDdxoNdBQVnHVCZjk0=;
	b=tfR+9WO0xtFkZOuPEwRe2zAX/ZLnTf401eLWScWlV64ee20k/ht7z7oHvWf+DuDAXk9i
	 X9CAkz3KDhiSPwW+CYkhzTHxmLLypjWFs65FeTy2IN7wsVo0tpZESIzc5v6xlVMo2kOTH
	 6Rf/sNDsDJATQjd3e4sx/MEt9ZXM8kl67+XEH5kVlSHVBuKCKKDKBjXl1vPtOkvlFWm1l
	 1mcV+I7XUu5M+Xa5cJQiihWuQUJBzvANP2S+JGg6934IR8Wijgy2O2Uz10NtMpGHozLy2
	 Kx42ztAzGVe0ze9OFyl4boUadllDAQR7iHMrwin3vR2NnSq4U5mZ5ADkBeAtdxvwRJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkusKSIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B8D606A321
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkusKSIC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C081F0089F;
	Mon,  9 Nov 2026 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794259679;
	bh=AB86i4cu8euWUMWjAB6Lfkc9xmDdxoNdBQVnHVCZjk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RkusKSIC+E/83lqeT3QGMrkXGQV5vQMgIJvzCZg7hLZRaWFOVjFcQlnobfy2g6OwG
	 LHbMjUIHT07B6CQvkTOrqT4UtSci3iZJLDrGdgSdJeFQU44/n/p2/sc4upPk3eErjX
	 saNh6xKkS3O++aQDi8ZCT9bw+8cxFV9Ny6pBzRaTOt4nWqUtMuz1vZwgf1yRwgJ7Qp
	 EzLAqEvcNqBfL/b+8kHAQnyoYemYAf7QSMaVF9G2K9dHLWTJbSzNxj2C652NKabgrm
	 5Sn7CqYXrY5VeGtLVeJ9Tok+X/0ZFsENkmVIOzsM3V/JU6QvOqmVWlXvY2OjMV4Sv9
	 NT2Z1HbCy3Rvw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 596EC3021B12;
	Mon, 09 Nov 2026 21:27:44 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Zachary Huang <zuzhenhuang365@gmail.com>
Cc: linux-sound@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhangyi@everest-semi.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <179398129782.44051.2897523393297405157@gmail.com>
References: <179398129782.44051.2897523393297405157@gmail.com>
Subject: Re: [PATCH v2] ASoC: es9356: fix the capture gain dB scale
Message-Id: <179425411562.3711751.7891062764260923779.b4-ty@b4>
Date: Mon, 09 Nov 2026 19:55:15 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ARxPqkL3qZxyzRwZRqKSUvJ0anD3nYU6yocAFt+8pYM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+WV3onsZle+5z4BkXcc9DorN+Tchs11NmfPO5pSjmy
 1Y9Dv+LHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI8kJGhkNPiyZ9iXSfMjlT
 ob8sM2WJwM1/9lpha6wsn3yL9+3Oi2ZkaNpd8PRPze8Jv+rDt5x8sOamuKxUKvv+9JRf4v6pZSY
 fWAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 07 Nov 2026 00:08:17 +0800, Zachary Huang wrote:
> ASoC: es9356: fix the capture gain dB scale

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: es9356: fix the capture gain dB scale
      https://git.kernel.org/broonie/sound/c/412a061ebf8c

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

