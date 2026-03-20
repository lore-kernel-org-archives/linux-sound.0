Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05903A7590
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017564; cv=none; b=K5l0yxcD91THHjrUzh+T8iaThPFoWkNaSp2ZojsQ1skBU5UJrNDbe4xDgD+xBm+cpSA6C5JRwAc/edmM8Z5ilMBLduMoFf/xP0M2xgwzgqVhH+6m8iVvLo1Ak1fd20rWffGJLAIBJ8RXE8WFfwCYFVXqGtL5NNqmeDj0eICQlcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017564; c=relaxed/simple;
	bh=JSSYCRVJ5UnJvOeQ8s2gKxlA1pkVWc2CHUbVyHZn2MM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c1Cwjrq7jvlWDC6NiEKuWP7HXPr2kA8AX8AjJ0ERH0yq9zBQHA7smpCxXY6mce7+RNXWYATGR2Mn9cxuP/hL9d4T+5aq1BLmYfQx6Ycs9Rla+TM0ulkcMsN1THhKUaFgq6JwQrcQKzbBqJTIDsSyBfbI1iTATVbO2xhHeK5SJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMaWmusY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMaWmusY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03147C19425;
	Fri, 20 Mar 2026 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017564;
	bh=JSSYCRVJ5UnJvOeQ8s2gKxlA1pkVWc2CHUbVyHZn2MM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=iMaWmusYI+ovKPgo1x0Kogu2RbEurH2Y7N/U38z+2TcdYe2GpoISKABtGTIsYJg1k
	 mn58HgaO/5cDzDW7m4IYKyntX72mZxiUF0vgAgr6IKPs9m8YAsBh+N1pF0BdbqMCHT
	 AiOmHaC/ERv3APFDMbn6zcTgYp6geuyKTqn9RonGdmd1l8cO1RXIuSPDSonp9fRX9E
	 zuA21nbobY+xY+h/M8ncrsZfBXtwL5nmUOUGR17r4KdGUiTfb7nd61dp8l9+uu/9U2
	 8PQLHPWNYHtPQyUnEuVgwSDsTK4PxZZpZ08x/GLLSQS7978ylfADe/1tZW427lMIOB
	 WM76B24tZIZ5g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Sheetal <sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: soc-component: add
 snd_soc_component_regmap_val_bytes()
Message-Id: <177401756274.146572.4498777534292576782.b4-ty@b4>
Date: Fri, 20 Mar 2026 14:39:22 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-db13a

On Thu, 12 Mar 2026 00:14:35 +0000, Kuninori Morimoto wrote:
> component has component->val_bytes which is set via
> snd_soc_component_setup_regmap(). But it can be calculated via
> component->regmap. No need to keep it as component->val_bytes.
> 
> This patchset adds new snd_soc_component_regmap_val_bytes(),
> and remove component->val_bytes / snd_soc_component_setup_regmap().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/misc/c/4bdb626957bf
[2/4] ASoC: tegra: use snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/misc/c/72660d1ac9f1
[3/4] ASoC: soc-ops: use snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/misc/c/7a478db6980f
[4/4] ASoC: soc-component: remove component->val_bytes
      https://git.kernel.org/broonie/misc/c/b84d27531744

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

