Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DD34403D;
	Fri, 12 Jun 2026 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302701; cv=none; b=niykBG+Hi2tPDS7/NPaejU2JiwypaHp+I2DANjrAc+POIj0T2YUtzUUhrMk1esWWbbCmxp7xZh0uGWvKmOafN3Vpd58w4sQZQQsPqUbQkskR7t7WfqrJKlvPFOFh9qC0ffcIISpa0T1tQsL4inftirMOJ7SKE/MTO5xltdnlppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302701; c=relaxed/simple;
	bh=c64y9tA9zLztmpd5QSPaddVuxctRggtx11z6SPUsE9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lmSp+q75ty4oZAKoPUdPyJ2GVLQ4ksq5AEV/2P+J4jrRuttVgxj6Xd8gI+kkf7/dKQhdajss/WcGGEIEG6xIYHsMZOrh1I91GW/QT95AsWKzuFvcoLmxXS8FkvNicAVW4PQrY69KL3tOXeGlkHtCV1j9pgf4xF5lm6AFkIv5eKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcZRsZih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcZRsZih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD881F00A3D;
	Fri, 12 Jun 2026 22:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302699;
	bh=L0N2/wuqyy4ZqynTVIqnQZ1VM5cO4Yy43xo5aXZ2FhU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dcZRsZihsBAX3hhytdhsK7yrBh0h3AULksXR2Ne75P8cE8mVOaVJb3g8nhk1XabZB
	 7c+s7EKEfUbNIKZVTq4WIFM2bsbi+rpzjzOlCm2BWlMWHMKqA2TVr3KwT88N0Z+cZ1
	 n0nhRVodlxOoZ9DDaU/dm2q+NxUV+N82z018KGbArvMlFDzYLMGzt/aCANg0JGWoTw
	 i5bNhYwCKrpKOjz+WydIaV2wDdWl+kxqkN75C61m0r3sb6nRzU9hNKZZaqfCnZgTnc
	 MnkvmynYw8aA1knB8ChhKSb13Uq1HXSvl+3HKpmt+iLRtxOpYUgQ6UGZQvxXggLRVW
	 STGexGG/gVPCQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Sen Wang <sen@ti.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260603211835.635184-1-sen@ti.com>
References: <20260603211835.635184-1-sen@ti.com>
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Add audio-graph-card2 and
 DPCM support
Message-Id: <178120729432.484538.15608853633773182034.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:48:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=c64y9tA9zLztmpd5QSPaddVuxctRggtx11z6SPUsE9c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIWoONfyLizPe+36u7c8L//yOXu2ILqApMh6l
 h/3nBjaC7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyFqAAKCRAk1otyXVSH
 0BVqB/0XQuKWj9ypOl9WaERw68wv6zzYAfgqSXF+2xBPgKpSg1vtCPd6EPYla7zaZFLuQ2+F+/N
 YLz/r1qwNUPgfFEpvM1rK8c3g/njPafyAHkn+Zk0FAi277RmWfbzdgeP2J0IDMB1mDfLcvSTOds
 u+/qNASQ4kvMQ2M5iy7nkyMBIr7CDMpuZSVk7slj+YXhh3MOEEef4oljiN/a56Feab06o+BfxL4
 A7FRd5Xs4CuoZbUrRuGT8BptahvGZ8aQE2sB/Tc0d507mvuy2W0H4DG1Jj5XUn7CBOvoURYWb34
 mdxMAnCU1T0fnpJsUpHgv/n3nQ0d8GEKMcwL98lH/+kzKoOZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 03 Jun 2026 16:18:30 -0500, Sen Wang wrote:
> ASoC: ti: davinci-mcasp: Add audio-graph-card2 and DPCM support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: ti: davinci-mcasp: Add audio-graph-card2 and DPCM support
      https://git.kernel.org/broonie/sound/c/216f7452a68e

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

