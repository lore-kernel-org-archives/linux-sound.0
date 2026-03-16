Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E6284B2F;
	Mon, 16 Mar 2026 01:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625152; cv=none; b=e23mMQpEp9smuzDPV0etar/4we8zA4lBtK7Y4ozxzJTy3zd2e5p2Iw+oXDhHmC4B8jv/fRhWbmOZyzodepwLqsS/cXSXHaR4nEYZxYxJde5yxUSH0HFSxRqvtWC9x0m4qxycVcvYMw+Co4eEewgp/Uq1/DxxdmOlq5fFnH7pB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625152; c=relaxed/simple;
	bh=PFSU3Xb1/50n45xqbb0QFtjlW6qW32WODAGYKVRlLvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SNwjP6QfA3qOhoZE9PRG5N308jb/Fh5gPnqNh+bOlxbO8Wfc5QBYRuPHJXCf2YkYtcuIMOuryNIu3xxOW2NPAdaN+FXGZxCkDo1/OMIlHzDOu5pXNQ6ghdVlE4AuTyvjxfYDJLiL9fHpbAzPCMNZI1aaEXP4/arYOiM5nPl+XJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozFbXdPk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozFbXdPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC80C2BC9E;
	Mon, 16 Mar 2026 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625151;
	bh=PFSU3Xb1/50n45xqbb0QFtjlW6qW32WODAGYKVRlLvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ozFbXdPkkb7J8CSNVEzRgVwXsYAy5KjdD/SBGsA8IDRVf+AzThZdq2YdhOencZq8n
	 Ha+kg1NBYxJA0eOUvzPNrghENmrDrQAZhVt63P9ayTXh/8iGl4rW9J4909setTmw+T
	 E/VE32qndZzVBmiUB31unNbzTgk+fze0DGz3Rbu6Hy3w4cI5oDhywM5PSztazMB7lO
	 adzEHxUDEzSHyn7atrRXcKZLpqnl+K/uK+YXuTZWb2hAw1Zi9PMtCCdS4ke0C0KRSN
	 7g3lSWN86YV1R/dI0m7E5slg7eV08w4gafzIKWtiTcrL9dzNDsk/8F3g3Yf4eYJ3YM
	 kGcjKRMZ4KrPA==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chenyuan Yang <chenyuan0y@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260313040611.391479-1-lgs201920130244@gmail.com>
References: <20260313040611.391479-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH v2] ASoC: sma1307: fix double free of devm_kzalloc()
 memory
Message-Id: <177362394690.208027.11744888499003194847.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:19:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PFSU3Xb1/50n45xqbb0QFtjlW6qW32WODAGYKVRlLvQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpt189tgmL2t2VzOsaxuBld64SCYUu3c+zHE5iF
 w4oYX2fnTqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabdfPQAKCRAk1otyXVSH
 0IndB/0fD2e3gUpgRsTuRhf9Gg7FhqnCRHBA4xs5wXPcffnh6o3cYED+JKY2e6K7Y8iIe3Keb2B
 RPDDC3gRGAQVzqa+RI79LdWdOzQreN42FJ0OpTTnLid/UptWM7OjQMl7IPhnvdGrR5wVmJWGa2h
 G8dyoGIwp8hf+blDuhbeVtXnVMB156XIZF4yx4+TW95XM3soGDt9Z+Y9pbmWjV46LPfh6pK6ZSd
 L/S1da4qIgEXSTeWy5oe7ZUpkJjdPY7f+lVaNb6ntROwmqvPft8M9Js3y2VtM4gC6LmuMjpGvjw
 T/UtGfxy9zfzWQM5aZ2iOS9YHq33x/s+74favDhl4aEDUxDx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Mar 2026 12:06:11 +0800, Guangshuo Li wrote:
> ASoC: sma1307: fix double free of devm_kzalloc() memory

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: sma1307: fix double free of devm_kzalloc() memory
      https://git.kernel.org/broonie/sound/c/fe757092d232

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

