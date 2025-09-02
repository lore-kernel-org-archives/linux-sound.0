Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F42F0C67
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806689; cv=none; b=ty+PiHabthmH84bCBm1KpX+t51hffeXlBqNn8jIxg1I7iBlRk8+ToABE4J0298yNSq9rCuehr0ijpGqiGbACUmLDrPMxDeAPLBGoGOUTpJ3lxbr3axgXEshKZXM+h7uJmrrOLy9XXe1nze49rkmQfVLtMjtuX8VRBjUasJtt8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806689; c=relaxed/simple;
	bh=+dLEptwjPbAKn2LTu7YvNaZ1ZvxUErP01Y8AezsTC1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qE69DLYyQ1gwd7seTvPAth4eQXvEkQFkxY+7avwJ8+Am2ZNAafHHh+NX8AA1xcj3iLLeCo/UQeXrduhJZDy4LscvuJPLFJsZJsfrbO1FSGXc25JdIqewXFS0739ELaSP48/mF/cuRMhaeRUHLNLtzdpxO8iqHipHR9mtiqbV1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W38PHnfj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W38PHnfj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57307C4CEED;
	Tue,  2 Sep 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806688;
	bh=+dLEptwjPbAKn2LTu7YvNaZ1ZvxUErP01Y8AezsTC1s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W38PHnfju2OEprdH7zMOrvQ6cE/LIwOvhARD10QmSql2hrNJZP/YgSQvoGz4Ny40L
	 kNDwVDfw1kyaZRZIauMlORPAnlk1aeRkuKw1CMMolipVJSoJ+JYiLlDx1JBEfuo8em
	 rXLoUQemdrRWMidd/l04iGjy5g01gePXcPHsr1lxp/0pYTGQGeDP4X/HdUpWYe6Ckw
	 h7jy6BOewx4DxmMYkkQpLB0n5Vxg3suv2I/ip/TLdvBdd7aRw/fUB1+04toH3Npc1O
	 WZ82jW2r+4dNNTcB9i+JsJnAyMbGCThVntPtyGwCvshS6G63b/Tx9IVptvnBeyKnfG
	 UrOmJOOR/7yYw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
References: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: soc-dapm: rename each functions/macro
Message-Id: <175680668809.15924.7803240139118328869.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 10:51:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 26 Aug 2025 06:21:49 +0000, Kuninori Morimoto wrote:
> ASoC has many functions/macro, but the naming rule is a little bit strange.
> I'm now posting many patch-set to makes snd_soc_dapm_context local,
> and all drivers will be replaced to new style.
> I want to cleanup function/macro name too. These are just cleanup patches,
> no feature changing.
> 
> kuninori Morimoto (4):
>   ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_widget() to snd_soc_dapm_kcontrol_to_widget()
>   ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
>   ASoC: soc-dapm: rename dapm_kcontrol_get_value() to snd_soc_dapm_kcontrol_get_value()
>   ASoC: soc-dapm: rename snd_soc_kcontrol_component() to snd_soc_kcontrol_to_component()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_widget() to snd_soc_dapm_kcontrol_to_widget()
      commit: bbf7a84787d0dc5910d121b025dd5f4dea060768
[2/4] ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
      commit: 2532041865305594e37c4c22bd650d52ea805ec8
[3/4] ASoC: soc-dapm: rename dapm_kcontrol_get_value() to snd_soc_dapm_kcontrol_get_value()
      commit: f6883f0f03575ecc8c4c5d2a04339bac91eb33d7
[4/4] ASoC: soc-dapm: rename snd_soc_kcontrol_component() to snd_soc_kcontrol_to_component()
      commit: 8a9772ec08f87c9e45ab1ad2c8d2b8c1763836eb

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

