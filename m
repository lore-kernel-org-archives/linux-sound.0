Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D671C2325;
	Mon, 13 Jan 2025 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736792549; cv=none; b=qroXFVxhgOrzgL1tVAABK8Rae++6gLbBVnWgIfPnUOW2wUrTMgg9d/sWdAAxhadwLmI13cIzPimOhx0+L1Ddv2RvcxiUNZJSQ7icFC83S2DSpUrBWJ+qO/12XVUlQIKtQiTTGqPfLIjzA4wVyxVZWyvEmKqWsixsj+2P/qhE1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736792549; c=relaxed/simple;
	bh=OnGJvRzqIxoH9zr47A75aV+Y4ISOC2vXbn8Iu6VA6/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TXcx41FFmvjklu2DAkO9R08XY2wv82mDBz3NoJIoYVbsi0lIzuOD/QPvNPiH0gxkd18aW/iQfErtz+iyXZ76SAIKFeSXE8hYn8Lwri7lfLFd0fniqTDUianqBLylM4C8lz/xigYYohNNrNcRjmU6BHdnqpTHeFYqFJ3nAB7WZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5d4ZSir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5d4ZSir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B7CC4CED6;
	Mon, 13 Jan 2025 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736792548;
	bh=OnGJvRzqIxoH9zr47A75aV+Y4ISOC2vXbn8Iu6VA6/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5d4ZSirJS6UMvAKsD7dkHAHkNa078RIBlfI06FpphukyDcmuWVysFTAqZ7Ic+uhI
	 22YyUotirymTiSS0vA3QBRG/WO+2ibn6lVQ90FR8kgPsx/+91Vv1MLINxo3wSvxApo
	 fjfhLiw7MbkHgsRpdBjPNP6o+LyEBjkyYV45ovIQkie87uScSeEbRAc4oyiKrP2Ecj
	 DUGh4bF8hr/FOZYJkqhbE8Gfuc8w6IYO3VuVWJcCsATpz0QBDDvBkj68eHsTLgIhUe
	 R5ZbHOpLqGlETbyNZe0Kq0YAktLs0PjNIpfiMHzme6bI5cyCskuzW17U/jKHp0XNjY
	 QElAxYLWh/Zkw==
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250113001001.400669-2-thorsten.blum@linux.dev>
References: <20250113001001.400669-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: codecs: Use ARRAY_SIZE() to calculate
 PEB2466_TLV_SIZE
Message-Id: <173679254733.99208.6494102852695515837.b4-ty@kernel.org>
Date: Mon, 13 Jan 2025 18:22:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 13 Jan 2025 01:10:01 +0100, Thorsten Blum wrote:
> Use the ARRAY_SIZE() macro to calculate PEB2466_TLV_SIZE and improve the
> code's readability.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Use ARRAY_SIZE() to calculate PEB2466_TLV_SIZE
      commit: 8eb27b5758e6fb6d1881413e3f1159c579ac48b3

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

