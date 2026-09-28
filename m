Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26427479862
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629360; cv=none; b=NHpiQv4m0Xq7cO/de+0cPA07Gd+Mf07SMOOxxTHaWdQYo1VxnfwUj/SILLEuW8lloVko7mpKdon/cn6IzDVUBfhPdAPCQc2eeZ2ZrBwJJjPak0r4kK2G96itzz3KmnHAotRqVSV7BVo7r3KSuC5K54ONS8W69/UtyWxyCtYPcdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629360; c=relaxed/simple;
	bh=mUmXkR59MNNHGLc/SvR+gJ70JVK2Vt/oI1YZ+33dm+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J/aaW3623NUORW7Sxv7Bbe9Y9fmnr6j5dM3SHdUNIfRMiMWxpG53lFU2beNu364yYXyOcYd0gVKuLTAemsE7TdZOiPBUof4dc2qMV4rS/7Jc7tbLeMgTFYoY+lsrlDFPjuImCX3a8igGHLtNS+DwH22qN92hTLWeSH/ygsY6Y4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDQgkjqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDQgkjqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B281F000FF;
	Mon, 28 Sep 2026 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629358;
	bh=lcXmWsHm/Y/RpavLpw4Y9bHfrZl3fBUJfhWy01wEM6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DDQgkjqY4WlpY8JFCL7cyedf6rNj3lTfk7bETq5BNPchAslICDjYbKqTaM6Q/I4d7
	 8Uq9+hb2bH38ESqgI1ulCBm0eRv3ivfhWl1BHXYuEtdnatQbDTHTZxYfdXe6e05pqd
	 GPUjr3nuVghaazpjyfIVr2vat6ebxK2CxFFY2QcyHgpN9y6SFFBtcXxN1T+JhvS07p
	 PLwd4nsYhf38BL6c0Z0Qkgfu4CjOfcZIRDfaTIL1XiFMalwuksuq8lyFYuT9zK2Few
	 6BAwsanz3VlAd9I/1mOG+45oZsJw4Ljl26FLldAVNSpLi0RGp7NFC+BmGaV8lLEvg+
	 9IcpQvZwU/q7A==
From: Mark Brown <broonie@kernel.org>
To: Alvin Sipraga <alvin.sipraga@analog.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/9] ASoC: add new DAI functions
Message-Id: <179059899282.139547.3397157028830053797.b4-ty@b4>
Date: Mon, 28 Sep 2026 13:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mUmXkR59MNNHGLc/SvR+gJ70JVK2Vt/oI1YZ+33dm+8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqutXr8WWN9MpnjNfD76h1h2iEt0iWxOawLZ4fJ
 t0VgfdpRKCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarrV6wAKCRAk1otyXVSH
 0JKeB/9y1Tpr4Q6k2p33YpDkja5+CRljuT97sCoGzN7neStEskSQ8PzzNE7NJXdMp6SIMpWWknT
 dNpU19DKo1v8Q9HBc3nWIOYDQpbSTCMhTl6sd2ZYJRo+ORrXyAcCr1fyI6aOV2QR+3fG0sFkWzj
 JypeEjo55qDhpst19zEfSMrjgREJs6eHRy6PpcN1QqfZ5SlDFyKEGMIpbWe3MY9H1MhcRdDnafd
 WaPAucGAeS+V7HRw2/nJV/TdIP7JYgr3gxnFZXHIs1uxTBJp6CZMSaB4ISp8MliSsbuZ8tLeeQ8
 W4XYN/lfMHMj5rV4mQB3IUbLCuemQ2wiwFW3XGNw52CRswNw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 18 Sep 2026 01:40:45 +0000, Kuninori Morimoto wrote:
> ASoC: add new DAI functions
> 
> Hi Mark
> 
> This is v2 patch-set.
> I'm now posting ASoC Capsuling patches.
> Current status, and this patch-set postion is below.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/9] ASoC: soc-dai: use snd_soc_dai_stream_active()
      https://git.kernel.org/broonie/sound/c/37e117c23563
[2/9] ASoC: soc-dai: add snd_soc_dai_id()
      https://git.kernel.org/broonie/sound/c/d4c557f621db
[3/9] ASoC: soc-dai: add snd_soc_dai_to_component()
      https://git.kernel.org/broonie/sound/c/724da1c8b630
[4/9] ASoC: soc-dai: add snd_soc_dai_to_driver()
      https://git.kernel.org/broonie/sound/c/e90c02200738
[5/9] ASoC: soc-dai: add snd_soc_dai_{to/from}_list()
      https://git.kernel.org/broonie/sound/c/f54b3dd4aa35
[6/9] ASoC: soc-dai: add snd_soc_dai_get_symmetric_xxx()
      https://git.kernel.org/broonie/sound/c/ee4f730ac8f7
[7/9] ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
      https://git.kernel.org/broonie/sound/c/9ec8ccc97dd9
[8/9] ASoC: soc-dai: add snd_soc_dai_get_bclk[_ratio]()
      https://git.kernel.org/broonie/sound/c/d47f591c9a8d
[9/9] ASoC: soc-dai: rename snd_soc_dai_action() to snd_soc_dai_active_update()
      https://git.kernel.org/broonie/sound/c/885ce49a700c

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

