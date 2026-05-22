Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ADB282F36;
	Fri, 22 May 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471838; cv=none; b=ouyogBmzcMRK3nEWRO3bPK/L8WbSAtPDk2hFbK3DgdH94PQdeBrrFCDIPoqcdwyYGfysKhxNZVf4XuBwwkkMevGgW9KQ0/CmuXsRL59x7NohtlE8Ntz5RMF4yHY8iHiD3v68Blo8i4wSCphhS/RcCNReHJgV+BdhUdXCn6Xo2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471838; c=relaxed/simple;
	bh=G977wFYZeJL9dO4L5j8WuYlyScxupqnnDsErYn4S5fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mM/YUN6lMxzmD4VSlKrPsQIX/GfCNjsUUYg1qG/mUsJa9cZmsgSNSU7ghGaaw6UwB/DfsQ/+fq+DRWSZi+MDXI/N7ahw+Qgbg2c8zazLFwpQXQpd2S8zQ/hLDCSJBVRtvHljRQIR+e31nuitpC7LzCrl1vui79ACePO2TRzVGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUQjzqxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUQjzqxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49FA1F000E9;
	Fri, 22 May 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779471836;
	bh=ySlfzbET71+o57AlLLgDovA0KAs9eNpZmvNfNdCu2To=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SUQjzqxLodwVv6RsVftw0JWcAkQQx8WM+k4K7y/ZxF/niGQniMBS9LM/OeiYezrLp
	 ztbrAA8tG2Guq+oVRlMCa+HVcj67FqasJSYzRqHTisuKnOXXIUlQaqERQdGQxsZyLo
	 TLKOjYeXMqMfDvx1yqxUauzj4ulmCWn7lu1X0KbSqMhDEhSq92/1Tc1uNohSixYw6U
	 vZuTcGaN7T7LE/yMubgbGY3dhgwD3oi7iosonXBs6cLykUGdnbufKurMJsvacZl/sh
	 AL9KIxVLMqVKHM9hXhjmgr6opK4xoCnLPVffMe3Ih0zAIb6jCREC6zXkbJTS7MXi+F
	 n2rCnJ49la6ug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
References: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8189: Fix probe resource cleanup
Message-Id: <177945304031.6494.16316071935569067242.b4-ty@b4>
Date: Fri, 22 May 2026 13:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G977wFYZeJL9dO4L5j8WuYlyScxupqnnDsErYn4S5fo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEJXZM99O+JagCIvgfofBdj+0iZOBzv3TpvVtX
 hejW1q7mWiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahCV2QAKCRAk1otyXVSH
 0NWaB/4hlQtZDLSmrPFVXvyMx3wwK6bZBuXMBcC5yPQt1BwAAn1YcO/2a/CMfeETmmA6VJ4fvG/
 9FzEuSxYmEg7g1th+zFi52ErCj3a5ozkXpAlqpML8ZeFbSEPN7+KmknAMjNfPYkzm+KqcD8qo4v
 wV9H5YKhEnmwJK+YcOKORUNF5dUjEIvmqxQ8SYo9R2WlQJmr7r2t03eWxENVbGpxxWgy8bKTk9b
 CIe+DUKb0ZCDXUTKEYzMoyBwGvtttCbahvtd/Q8LSbXFgnt4Tapsu9G8zrvN/3+/+F/4+/NcZ5d
 Yi7NipucE2iEKyvpienFGjRsbHbuTJuF5oodbBs39g7x3QU3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 10:52:35 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8189: Fix probe resource cleanup

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt8189: Fix probe resource cleanup
      https://git.kernel.org/broonie/sound/c/5404599c3292

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

