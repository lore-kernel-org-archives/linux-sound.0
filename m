Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177161;
	b=lfY95aM5fZAIp6ycNScT5vSYlt/pQ+lcWNsc5H5Bsc+HRglVG0nOMWLuh8NgrJCZyONk
	 GJDeGF5M4hc5h/xo4mqgIZy0Oi70n6OPjozsAEdFz7ZWOlZrf2g/Lr3fX37DU3Ls1QqB+
	 SSpb6o/o6RUkz5stYyBZ+CqyNMWdbnuVd4QNdBd74Qu7K1Vsj3ppdl5exPt/bMEp/BVgV
	 UnvP/Em5x8J+pXIYrhpsEXyzC+J4jKlQdTeyhtWklx3/hVXk3cS2GjKVq3I39foAhVBNI
	 fXo5jJSL0VWasY2KAq1wqNXkUfIEBaFKS/cwdjCHIAhoS1R+LnpZIq80lGAVQBWR65g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177161;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fZX/7Dka9LdrMhRfWpgKuI2fu59wvuNQq4Ii8wB8Yj8=;
	b=RcVQjmyRfpsrsEO/dbyn0PagHYHGmYwSHi5soCbiOO4nMtkwQhl/T75i6HJV9SntdFMa
	 vXnkVKt/rYnc8rwn+TduwNlYuL5hHvA7u+Lk0Z2DPHq1o/w/oUDjm9jUCbq/wZyZBQaVI
	 qZPdphGz1D7y4m7AK5zk5sa5cJ9ouIv0WCSSkPdQvoHXUs7aCG0tm+4tUkcChRm9EaUVo
	 v1joVB0bihGnuB1OGYIvbgeSm33I1IYl25u2QS11cWPSsZK2Cus5x2j2CDXl/54JtL/nG
	 DHTLRZoX2pUnG466DQF1P/W1VZU3lj4/WXDEeDbG8Ts11G6lb51A3FkAEb3Tlt2KwEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUFciKru;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C8606A331
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XUFciKru
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A4D1F000CA;
	Fri, 20 Nov 2026 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177160;
	bh=fZX/7Dka9LdrMhRfWpgKuI2fu59wvuNQq4Ii8wB8Yj8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XUFciKruTupZcPxvv6yFamBB9nFyV36oYFHwcBmIDMZ7bq4qhxnent40qd/XP/RSY
	 MZcTLjFWwX2ulithlcC0zma+i6phZoFZrw5UbkExSnSNYrnYSJo1pnCmEC1PKSvb/o
	 mdzlFGdcPH9tqNM/sy263LGarFAbauctl83xlD/Rrv/UuJIaY3F0AcpAPYjbhodaqN
	 C9Msl9wqU80ydODlElxKX8pifyZZBLXjRdGUX3/7w6tJOfRKbT/iXovPgK8Nz9afSy
	 nX83y6cvGBeNr/RhlbhwCaBwdRWMBRhefu59PbDqlgw9R+WJW+uKk2Sbta2HXI7q3O
	 21R36LH16dScg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20261119011102.1790-1-shenghao-ding@ti.com>
References: <20261119011102.1790-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: add realtime speaker protection data
 control for TAS2573
Message-Id: <179512742273.116416.2518390994948776815.b4-ty@b4>
Date: Thu, 19 Nov 2026 22:30:22 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t2VYJZDAXEfvx1hGdG1BVSjWo9nBuud3shOBQQ3T9Ls=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrI7e4O9+/3f51OMPzhVISvrP0Az6mlk7u038bcZag
 5KwEjH2jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk+k2G/9V7ovulF154sFZz
 T/3dR7eCTPQ170SGuDbP9XPjmsBUPI+R4UbUgh88qwMLFrSdSd102JSnXzZg0sEtwYf7zoiI3yh
 xYgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 09:11:02 +0800, Shenghao Ding wrote:
> ASoC: tas2781: add realtime speaker protection data control for TAS2573

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tas2781: add realtime speaker protection data control for TAS2573
      https://git.kernel.org/broonie/sound/c/250e33dab910

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

