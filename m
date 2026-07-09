Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A138AC83;
	Fri, 10 Jul 2026 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684092; cv=none; b=RsOyjQSQdIJw4r6uT6pmcacc7RSxVfINww7ywFm45DkFqeB6qSg1N5mYh+DK31N/j+1VabYQLZFuW6ApDGTFJQ0Lo9ohZGMD5FE8wEre/PLNu2qVEoYWrR0rQu1XryYyThzdmVBO6hzowo2QYHgmDnE4kbGavkSre+gM9jABRfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684092; c=relaxed/simple;
	bh=PTifMNrVQpCcBMqtKAQfIwENykrJeb+7QAoTQgzvfuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I8RiieXciJQx2V9nb7mdwStm1ovfI8eEiriyc/3z2WuAxyH4m89e3DL+Wm/7H1GSF0Nc6A7S9MCECKKtHiH849mFwlOqQavYaWBmKtETOAnhKYUOsenVQOYiygptd2LyCO2BTeeVf02TthGv0lk0kyCahquqzSlXNAnm3FcCbwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0LxF/ih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0LxF/ih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9F91F00A3D;
	Fri, 10 Jul 2026 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684079;
	bh=EwDjfUMowQ6ANWv+sxvV8n0V+30XznBrnIAVkbxmxlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O0LxF/ih6fBKj+9IDb8WRRlU7miJZqNJ+UgxYNHcf1IgRHJpt2IYvZHMG+j+Fpucx
	 KkkIgneh8/h6zlvGdQ8KvfMUgVYTeATL2Q66nYFElSQLwx8QNvz+0iL8rgH7UvQxGP
	 EQn+djVlnBns2QrNHq6sRdU4AWAYiwdH3lt+7LMarxsnCtzO6hBDS4S87vKCIhPXkZ
	 IOZGi009auWoFA0VPNBBqw1uZClDl2VWjgddOUn/szBsSyjQYFLumZ2ZLnHD0OZuEA
	 kwA0fFkMukv97pQI+xn9NlUFwImWnE/OG22Fkt+gqOytQgRxQuGINcAe+ylTblEzvS
	 1uCON15cQKf7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Sharique Mohammad <sharq0406@gmail.com>
In-Reply-To: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
Subject: Re: (subset) [PATCH 00/19] ASoC: codecs: propagate regcache_sync()
 failures
Message-Id: <178361556960.100558.150763407757683176.b4-ty@b4>
Date: Thu, 09 Jul 2026 17:46:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PTifMNrVQpCcBMqtKAQfIwENykrJeb+7QAoTQgzvfuk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNvqIIgrAMUhd2v6OFXMhomhR7SoCR57QAm0b
 WhgjCRWmveJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb6gAKCRAk1otyXVSH
 0HGvB/4kqkVZek9xgIJGGQWvViBBOwaZkHykVuAjOGX6qVBQuq4wlUHSE8A9iuMWm9TWhnfmmf/
 qY7tHiiZWkGdib4+3DFzImfBI1syaYZ1IF9iOjw85/G3BqKxFpHFLC01bEIgaJXVqXadS/r+bL/
 wQtCZSDiLb8LQxiTDct7ffYjuvVh9IEE0tOG4MYweMtmLnmBpznfP+DbS3PUrrG1QBMOi6XMv7S
 cYLCfhu9MLVq9FqRviEbQ+5b/DLZTEjybd3GTTQjq3EEgtsK1xivyjYrLuMsD0Rubz3ReWuyAlz
 w3FtRWsyoRSd7ORK+PRgl9MRHh/t7yJkkkMthCy8jebVObA4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 11:48:45 +0800, Pengpeng Hou wrote:
> ASoC: codecs: propagate regcache_sync() failures
> 
> Several ASoC codec resume and reattach paths replay cached register
> state with regcache_sync() after power loss, reset, runtime resume, or
> SoundWire reattach. These paths currently drop regcache_sync() failures
> and can report success even when cached register state was not written
> back to hardware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/19] ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/e38cbb75248a
[02/19] ASoC: codecs: lpass-tx-macro: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/ea70ad6ac288
[04/19] ASoC: codecs: max98373: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/83cc6d88e377
[05/19] ASoC: codecs: max98388: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/49ea357ea779
[06/19] ASoC: codecs: rt1318-sdw: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/2c5e237e7e2a
[07/19] ASoC: codecs: rt9120: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/aeb606a6437d
[08/19] ASoC: codecs: tas2552: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/70f88374e4e4
[09/19] ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/0d6b2d6f93a6
[10/19] ASoC: codecs: wcd938x-sdw: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/72f1d7d21fbf
[11/19] ASoC: codecs: cs35l32: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/5e5ea96e68c7
[12/19] ASoC: codecs: wm2200: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/9497ea79d719
[13/19] ASoC: codecs: wm5100: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/d5f4c137844f
[14/19] ASoC: codecs: wm8962: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/56ce50099e64
[15/19] ASoC: codecs: cs4349: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/a407338ca621
[16/19] ASoC: codecs: rt1320-sdw: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/39dadd459c88
[17/19] ASoC: codecs: rt5682-sdw: Propagate regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/446a8b7a03a4
[18/19] ASoC: codecs: max98396: Unwind supplies on resume failure
        https://git.kernel.org/broonie/sound/c/d20de7409dfa
[19/19] ASoC: codecs: max98090: Propagate runtime regcache_sync() errors
        https://git.kernel.org/broonie/sound/c/181bce73427c

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

