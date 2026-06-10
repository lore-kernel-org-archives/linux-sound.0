Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322EB3A48D9
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169841; cv=none; b=oR03ZjYXQajknrLEFbYX1/zZIMfshBrGBpoazXlu4QXXGkn5ggqVGCqFNgCfTeAYarM6VIcFg3foMJ3x1F0FCr0MnXJfdW+QKK82HLPbgOsmfeDE2DVP7tbnzfpS1yru4EqDIWN1CUyzAwwvUiw/tY4leas84MwGZcyHtWMwK0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169841; c=relaxed/simple;
	bh=3IWiWB4P7fzL9mXvqtrnQa6UrdihbOnmpLySRCcQt7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aQ0bejMxHfZX6JR0GGtk2SRfgJPWzUAfNmcKFvh4+1j2EssJ6NLQgFgFao2Nf4avI54KeBHzOXkPkvLkxp8swpipYmfVx6SKJmzTkyYSpJ/cHLsNim6IlJHILIu1dRp3WAAPtSxOcDGZzLLdGF9p/vRVWNSgNjGk3tyNtixhBGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0NJeldc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0NJeldc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B981F00893;
	Thu, 11 Jun 2026 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169839;
	bh=DYQSNbTgLjZpbGazlqVsw+iSp6ZHUy5Ev8hg8xhSNfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W0NJeldciNgknSnRWhyEligmuySafuyxEIwNgJDCyMeEWD/8c/zpu4mUxsi7KmFLL
	 uq6OCnlZsQLHlqIKvkNNBgqBsKpTz4Kt+LMia4CCXneW0MwY45bhpp60NIxJVV5Bzh
	 JuGSvg/2TLoXYY4oAP/2NnNLI68G2i7zkq8rDQFRIib1mwqyJIbnjU0ZDae+CuaYGK
	 717dlLx5N6sk1mycxst95PLHnbVtN7LFWAlXgpuY0dS4nalFNP5Erg8KIkNCqEOpuU
	 mnYFTqoOlr+lekv2MXSSWXuWMiOm8OQmMeR2QpgiehaaQIuE2vy1DJg+ShK5uOOJ8S
	 Mwwi3IvQ//HcA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldcxk5wz.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/6] ASoC: remove .debugfs_prefix from Component
Message-Id: <178109050535.232889.2042278518940413402.b4-ty@b4>
Date: Wed, 10 Jun 2026 12:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3IWiWB4P7fzL9mXvqtrnQa6UrdihbOnmpLySRCcQt7s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKn6qHaHkAlR2eUwxNmhfXBTNo/4uyD/rquN39
 IWoc/t2TMmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaip+qgAKCRAk1otyXVSH
 0DH6B/9cetf8EzqdUVLVjIUkdkuA/S/jbrx31kUrT84+JojG60iuGLj6pg7N/okt675/nhO+3vf
 1Oo0B5uE0vuolWpT8P9CobkC+X+7dBiLfVoNYTdeWUagis2q04TtUljV2HE8VrMnJ4dwE8smt9j
 KLMXC2EehLzUn4bkf8XdAbFT0p/J88c+mPSlwHxp8cO2qVh+nyfp1faoYo4eSdUMb0TXrxFQN6H
 /z86W5/gOjfudQwhfULvi4SmMotwEmvb0Vup6c6s1Js//7+m58MNH4xLAX4mj12xsAu6adlhLCF
 1K55Hr7kgM9xDRqf7v8eeynEcmTbDALpqQS0m3yZStllTi2P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 02 Jun 2026 02:55:08 +0000, Kuninori Morimoto wrote:
> ASoC: remove .debugfs_prefix from Component
> 
> Hi Mark
> 
> Basically, we are assuming to use snd_soc_register_component() (X) to
> register Component. It requests Component driver (A).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/6] ASoC: soc-component: remove CONFIG_DEBUG_FS for debugfs_prefix
      https://git.kernel.org/broonie/sound/c/8fec6e55859e
[2/6] ASoC: fsl: imx-pcm-rpmsg: set debugfs_prefix via Component driver
      https://git.kernel.org/broonie/sound/c/23dff77e3025
[3/6] ASoC: soc-generic-dmaengine: set debugfs_prefix via Component driver
      https://git.kernel.org/broonie/sound/c/921ee966824b
[4/6] ASoC: stm: stm32_adfsdm: set debugfs_prefix via Component driver
      https://git.kernel.org/broonie/sound/c/d7c18d15c6d9
[5/6] ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix via Component driver
      https://git.kernel.org/broonie/sound/c/0cac8e35132f
[6/6] ASoC: soc-component: remove .debugfs_prefix from Component
      https://git.kernel.org/broonie/sound/c/cd849a5fcac8

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

