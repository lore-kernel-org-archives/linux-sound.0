Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9339D3D3007;
	Fri, 12 Jun 2026 22:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302788; cv=none; b=LHQGIzZZYMj/bNmcQj8uEzxZmf9EMZhQ1yzvusKCcoC+3xS1Ny1D5to54+18KjzEWboOJWF8RuV/Yjw1gL3uvd/Qx7mpuekZcJfD5vnoSfwHFHQZljDieafmRLjg9p0P9ERbYaH3XaovblE7BQVF3ePuK+5F8+fgcaAL+0f94nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302788; c=relaxed/simple;
	bh=aR8Qd/q7tl3IuZMvyRXwcjA7fYfkU2gkzKtVDqwkRLU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TfHw+bZeBlQn93AE+xSwNqEIqJiCk4PeJtfP5UoZnih+is+wjf3BJGj1FaSEl9bTn1cCiIqSfdBAEKZMHq/FqvHwhhzXV9UuxqRT/OqqMBzjl15m5d0AScDKgCJpZ84S1s8sbGcKX8XdHHSOb+la1fF/0KDUYFUvta4WJvnrfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9Zz0V01; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9Zz0V01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4E31F00A3D;
	Fri, 12 Jun 2026 22:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302787;
	bh=IHMQxw+bNunjoBP637/TbBBaioR2Ow3v/0SrKdzCs2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=m9Zz0V01LKv3YEyllrzmOIQXcT9LTt2kX3aEFsrMwlmdPHVOWbGN/PpN2x6k4wD46
	 m6m/Pav1XeGSWjN9NTfzqxoBiXs5RM18xWzbbIhUjZTIAUxH091eVHYCmrzvT8H+Xy
	 BB/QJg2A83NkL2Fz9yf9RBZD/UDXWrRGzFMz7ODOovM9vQzP3YeHJACkZ9ih3AAPaz
	 J/EZAPkU+RsfRZsGx5Rmog6Xn+8G1Ppx6sX8HA9R09hd9R3v1vNYYpN5FB8pxlB/Tp
	 6O5vZBW8WA0Ye7yrCUWJfyqUoqLATnLC0M/pvc9N9cXao3C/2fwYDnrm6KpgRW1hga
	 7jR0gxUZPwzCw==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260612123150.74696-1-phucduc.bui@gmail.com>
References: <20260612123150.74696-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: hisilicon: Use guard() for spin locks
Message-Id: <178127044075.48375.5978480710698523211.b4-ty@b4>
Date: Fri, 12 Jun 2026 14:20:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aR8Qd/q7tl3IuZMvyRXwcjA7fYfkU2gkzKtVDqwkRLU=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoshf/IqmWlexHehiWkgPYOq4DmXc3aGinRgSSa7KoGV04FF
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqLIX/AAoJECTWi3JdVIfQ3ScH/RSD
 HLSjoqK0w6Rx6LtRtUkZ37uTlg7tbk8MkSH6o+ewtuAK/0v5FzmD848MfPZkYLZqrxFng6CGasG
 lfP0vHLdL6EBEWhUuj906UkSC2UNMSOEveDR6WKWrMU6vd3kUyOjDy0h5QtfL0rACjRUDiCf7az
 xF+Jfbqa5QW59x9scybzxdGVeX3UNG5DG6i68KOkbS+JzDQpXho1fYiXpyXHJ5/BzIETM+prpvG
 /UD/cKllbd90vLXXKHOg0AAZUBDGTmiRmJXWNrva/GuoPNOBYYgiUPizKvG81bt5GZCOLgCasGb
 Bm12kPw7uPvx2+fFy5amgPKcBWxCze2OIy1hFXA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 12 Jun 2026 19:31:50 +0700, phucduc.bui@gmail.com wrote:
> ASoC: hisilicon: Use guard() for spin locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: hisilicon: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/da6899fc88e4

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

