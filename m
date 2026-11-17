Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939560;
	b=H08kAVxI9ZhQPXRU1P73GdSvybKD4BF9UYiBf0mWyccd31JhLTDVb+v2HqqTJSRWzfc0
	 PIjXmGnBU5198f49QRtvaollS4DsRPKapbQV/loH6lnLyrJ9a0CXSG3pCEMDEMg3VSSqk
	 ksrZdi+4979S9dvMnZhhvmSn8ghPw7E1tJUYMfonrFyxERTCW1zMf1OgcSnAdefzC2QgI
	 s8/zkJkrqB5LBJkQEuWqlZvIhWiHqsIUDuZKlcqvZHBVkk3fNdmSOvLKjItN7kgTNmGly
	 BTF5wQSjqXBctDxlmQOPm8KpB8sD7Abd3iAnfAW5z2H0aoAe44Ok3uZtoNEj6+x3ung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939560;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nRp0Q0hkzbc6wl+IwS56q56M5AQwhJGEXGmzXcbRvi4=;
	b=dSmTBpWHEbKHnXtI46vmnWWAFgKZ0WALNAL/0FtCsZH85q5vVme9jmetZwzsNWBAGVUx
	 OlfbY2fN5B3iq0NpjqfsAi+JX4n4+SeCpfBMVAEflZABQpYON4AZkBXK66G/M8Q/RM0oh
	 9y5Uvoo2cVt1aTvbN7OsyXC8Twqn0msK/+suuT3zhwNOPcNfQ/eykBPaIRINolAL3JUTQ
	 Mv6uprAnP8HRB0IC2FyxYdO+OlaaAhN+yd98jccIYD56ugyDjKE6Jxh2PkXbUFnVOYoyL
	 +L4VHwUCsxtj8MCcxl5A1b3oyNzzeSP3Oo9c9SsQG9nsl8FtemKgf1iVfDidQhp/0kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7qrYxWT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC3606A32C;
	Tue, 17 Nov 2026 18:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7qrYxWT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FA61F000C8;
	Tue, 17 Nov 2026 18:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939560;
	bh=nRp0Q0hkzbc6wl+IwS56q56M5AQwhJGEXGmzXcbRvi4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D7qrYxWT+r07/06UHHE3D0+FyyigoQ6yWjSZ0Vc1KhNt6jll45a1XMc7A78PR1AnI
	 XVIqGRm0Qn658UZCxEImfRwV7oNCY2LTpjBMRi5VwuBMCvCvNF5iRyeLJupxLLte4V
	 Ib4r3g8p6z7hWcs2SIiottrnXl/4XDswrpTqnxeiosVMWHbkvjWwguWs8HAh96LXCI
	 UqaFfNHqXglxJIFAYMXs0Ht9grJfiLIAEmPZPf41Fc/t1Xeo39jzKtJ8sXlWbgzbum
	 j2efe+eAYXpAFJrkg6JHWpN4kwe0wXvF/Fwisk7LmY4KUhWL4HOn4YSQqrO1P/ug0g
	 Nvyar066FtYyw==
From: Mark Brown <broonie@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <992BCE4B961FCE50+20261113054024.1489799-1-tuhaowen@uniontech.com>
References: <992BCE4B961FCE50+20261113054024.1489799-1-tuhaowen@uniontech.com>
Subject: Re: [PATCH] ASoC: rt9120: Disable runtime PM on component
 registration failure
Message-Id: <179492955055.77896.15294762636561354178.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:32:30 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xRvR3uSoooQidwFE7THtTbWdpj6b5plMMrZOpHfapDA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+zFrqZhaRzRz4k//rBtaC5SV3pqn4Xz9+eE/S340vQ
 g5WJ8r2dZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiu54x/E96sZpNUGi3558H
 y/kvO4hMSWSXrOft79x1wrk7aEfSXCuGv2IaW/70Sf8QeZjEqpGzWd/16eJ+mZLckDOqtWlrnJT
 dOAE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 13:40:24 +0800, Haowen Tu wrote:
> ASoC: rt9120: Disable runtime PM on component registration failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: rt9120: Disable runtime PM on component registration failure
      https://git.kernel.org/broonie/sound/c/6abaa17cda3f

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

