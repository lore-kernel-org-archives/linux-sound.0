Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713648;
	b=A6nJQJPjSM95GhFLf1Jznv05B+2oA51wc42Wflr7ns8JwzpTTwjxJi9ee0d6xGadezJ0
	 tN9UAWFIOLqKHx/jkuWLd0okloJ/orgwpJbMWmqPqMb+falKtUMnzeHD/8onlg/TX0lTq
	 HxtYPOX7YPfWm7FAnKHFWvS/0igtLU/EyfX1H9j0p5YdmlYxhOTGvsiZEVu3abNcs+2+9
	 u75UCiIZVYdx+Wk/ybu/nalDI3d5OjTqFZY98JfDToyIKg9SWtfZOitfDrLfBa7Fogu1I
	 E1xNfQDSBYmNfsxDZmgdMUuRbAocWI3rBKrCQsZY4pZBsjDpraLmHHZuF9irHEr3gmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713648;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=b2C1CVimNes2c9yCOhSsSfuW6qBdbjlb3OJoRytVRmE=;
	b=YEhhWhHMbqpQFFTkcpo+CtKtoAEHSJVyMY0AGoA/mOujjmwnYO4rH+QaJXLwNfXx86kN
	 U92Q6zjnYDmCZciJc7cM2kr/3vTETbwD4Pa5umC1U+LfUwl7YWistE3v3v6CGY/3etXtk
	 AzhXgb6mH6qCd2EZVM5rhXfLo1jEnGHFl3AUyjTcbD67pxJylkLvnWWS4OZA7NOahse+1
	 X3Mt6vlZa4xi9imnJHtRkv/npbDtJbv7ktN5aYombzzRqOs2aun7tOZ3AuTtAXSuN5Ezf
	 cMcjmdyB3ZbWuywhausoJhgddNDCLByWboQXhfeXUsx3FsVsVN7WMDGBe4W53+RoX9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=li+Igiae;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A19606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=li+Igiae
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D831F000C6;
	Thu, 26 Nov 2026 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713647;
	bh=b2C1CVimNes2c9yCOhSsSfuW6qBdbjlb3OJoRytVRmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=li+Igiae12ds35r2S6u6F+QPetBcDPHZ8KqyLNqVNFs7hk4ZLRPECWt2VJ6HAgtSP
	 oS+4CizKj5Zay/9W2aNjpz260r3me1h7N8ZXIDIlXPSdr2E4Yyvj7TDJtsDavZ5hk3
	 3kX0gGxLG8bLaKuZkU8AzFcFxZPwB68M550SgHT5+MSmezqAYgXybnF2j/blAaBR9C
	 siKMs/oiHH4Nf8q2nOraXX6+IhwDCoIKaP8efRA3DJICVEG1StQtjNYOjFw2+GTTeg
	 1d2HmWGFe30QfSMtZYjB4jxqliwgTEhwIj7tn5NvoxAZqZ7C1B68aUT+chzHXPS9qM
	 fkjn15dXM6C3g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?Alen_Ti=C5=A1ljar?= <alen.tisljar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
In-Reply-To: <20261124182329.20428-1-alen.tisljar@gmail.com>
References: <20261124182329.20428-1-alen.tisljar@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board
 8D22)
Message-Id: <179570533321.142532.15788602041527539127.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:02:13 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5yOjnzlFbAMLdCfFAmdAJ8dDdT1ZTjDyJj1f2pSw/bs=;
 b=kA0DAAoWL+9zsLPQOIkByyZiAGsIamyjfqKjYMmF79kGEoEhmC46agAZ+8kdK3WDV0RlL1Ep7
 oh1BAAWCgAdFiEEXmoL6X9066wOwaGGL+9zsLPQOIkFAmsIamwACgkQL+9zsLPQOIk64gEAwEol
 eks75YRTX2e5D2o0nP0hK8F2A/g4uVOAu2b29voA/RJFqm9E3ZBv8HfiRPNvjKCEbNUNIq1cUOF
 was+VcEoO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Nov 2026 19:23:29 +0100, Alen Tišljar wrote:
> ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for HP 255R G10 (board 8D22)
      https://git.kernel.org/broonie/sound/c/b4378764a589

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

