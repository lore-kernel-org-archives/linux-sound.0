Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903942BE87
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927607; cv=none; b=d+SeQXxUBK9ITWqzXbvBOkWbXKVDamVCNv7mtovumMuwg3HcD+lN3NJlWglggtoT7ERWWhZMS6bB/a75xSnszc4VFv99z6T7V94wHyJq/mgwaeQEzPq357aTFkAxQdQJnAd3yTSMAN5inyTwBotTEfPzeJUSQSmS0X7iJQT68jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927607; c=relaxed/simple;
	bh=Ca0cMJvQt7sKa8u06a5udJIf1vR4H+tCViHwBjHrypw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fdA8PF7jGdA12IowF1n1S1VJrwnRfjNgXsty543CEKVO6Hy0xDm0Y05hCXEvkRjhXA8GaW5L2zAetXyjgEkqV93uTSjK9JtAqxDPmLv9GK9uukOe+/WTCxJRdJM9qmznahNJUj5L/pRUxBmMajMJYn+XTBx++1O9CquFUV9W/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWFrSaCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWFrSaCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15901F000E9;
	Wed,  5 Aug 2026 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785927599;
	bh=s4UODaJtCw9kVdMxXpipdgz6imOVOUmY6QEdU4IBIBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oWFrSaCS+DUbCayXrV5IlN4fSKWh8ZGKqhYmzM907V92yntO9IfeUOPA3o7s0hmQ2
	 w/7/AI0kfTBCG5ewSOEX2xGf3mwnaAc4KhweM78NaGG4c/AJv843g4qSv1TYqTjYpG
	 ibdBLioF+bAYhoVWTDJkc8egSyhZT1IXWObZNqkKUBes4QiWBFy8lniVs8ngp9DjVu
	 lWGTO8uXle7leonN93UcBH6MeRJdJWkqGlkv3sK5oJUKDn61mEA9mtGkDtD0VSALXH
	 6rN6vZ009ahvgTblk8pJc8qVzMqp5gJ5EYuYOVFnBt/2xm1HT3MbGumH8Kx8ASk+3v
	 UEFeTg9Xm0gfA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v5 00/12] ASoC: add and use new
 snd_soc_register_component()
Message-Id: <178588681809.111355.8167772739798393167.b4-ty@b4>
Date: Wed, 05 Aug 2026 00:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ca0cMJvQt7sKa8u06a5udJIf1vR4H+tCViHwBjHrypw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcxerzsgLdVTLomjPPPk7jQc5Mg6+wXdBuU/uq
 A7NzP2qiYiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanMXqwAKCRAk1otyXVSH
 0OLOB/9rVyqVHum3vWtx2f9u1LqztIaJio3t2/UNxmdJmpd5KrBqTlO87O9XbIphO+52/bnCCjG
 ShnIC/RnMDiRnjB0COLbAF9SjDYmmD0dDhH29QTrtidk8dr4ZtJ+uGGekgHlz8p2U/buDi5pfIC
 uTPC5NTKMHhZEE8zIYwuuvfPieXMHWGEUk1F9Jz5GZir9NxN/5KsYIkcwSLlNAxMlcHcIQeJ0Sp
 vdc0QFw0vJRjm3JbM+vbPuzsQT0tk/ArkH7dMLP47XsH6Ev53sjUVlYGMDY1ht+hRr2hurkpa2a
 CTCDFWJ5ESnZ8jzpRMbr/wMj6/SzOtmysJIG1JIqinYDqb8N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 06:34:03 +0000, Kuninori Morimoto wrote:
> ASoC: add and use new snd_soc_register_component()
> 
> Hi
> 
> Current component has component->name. But snd_soc_register_component()
> user can't setup it, because component itself is alloced in that function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/12] ASoC: soc-component: move soc_component_field_shift()
        https://git.kernel.org/broonie/sound/c/23b64e9b9ba2
[02/12] ASoC: soc-component: add snd_soc_component_alloc()
        https://git.kernel.org/broonie/sound/c/de182d84b3a7
[03/12] ASoC: soc-component: add snd_soc_register_component_{c/d}()
        https://git.kernel.org/broonie/sound/c/3e53dc96a007
[04/12] ASoC: soc-component: add snd_soc_component_{set_}name()
        https://git.kernel.org/broonie/sound/c/f6cfdd246c25
[05/12] ASoC: soc-component: add snd_soc_component_{set/to}_priv()
        https://git.kernel.org/broonie/sound/c/d99690513a9a
[06/12] ASoC: intel: avs: use snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/6105b0c10c57
[07/12] ASoC: intel: avs: probes: use snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/825521664559
[08/12] ASoC: intel: catpt: pcm: use snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/c8eaeedcace3
[09/12] ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/695cc675f0d5
[10/12] ASoC: soc-topology-test: use snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/10c062304d2d
[11/12] ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
        https://git.kernel.org/broonie/sound/c/7050ee33c2db
[12/12] ASoC: soc-core: remove dev from soc_component_initialize()
        https://git.kernel.org/broonie/sound/c/157936199385

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

