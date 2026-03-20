Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B928000B
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017446; cv=none; b=lyHP4pu0/8LH7a7CB8qTOr00MM8SL17Sl22N4k6SFbS9ATRZM7f4qukg8UhXA9PnD5BHpAOtQnuwMWF6B7Kxz4NE10yqjQGlcXXhTzajkE9OAHd3XiOY9mCbsspdgBUMh3bc2JYF22kb2dyGuZd1CnvggT8CNueO9AjfLUrDcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017446; c=relaxed/simple;
	bh=X18Mi+UvesjWAZ5wZShOJWqHaxtenTTEAREQA4/Mqqg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k2C4TRt0SWvR9n2sOBSEq2nQl76b7ruxTbcDxv9r+S8/mChsP81AugII7qHYjDO91pzkStPJziVXzHgRO995ckQ/P/LkLeKydgzcS/cTa2a8nojOv3e9YOhCx4SEw+Rbr6it7JBVk482JW4mz6qYaoTi06bIAS6lQuZb2Sh1Ipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/suKtl4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/suKtl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F69C19425;
	Fri, 20 Mar 2026 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017445;
	bh=X18Mi+UvesjWAZ5wZShOJWqHaxtenTTEAREQA4/Mqqg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=A/suKtl45QHTig/rx/P53lTfRtaffoUbXEx3uO9vtscQ8/iNrsIv0GtLbhyZ1KVOY
	 /3vL3294a/1jH7EEoKt5sLa1KK1whHtpIdVCIuf+NSLU6rCY55giMVp+hWyhGR34eS
	 IF4L9bP9LRyDRpHQ/5vgvEBj4vYxpYfZG7joyLQLia16AnpbKwpiBz1jzletLysVPB
	 RSIw5sm5+7HhqtdxlebR/y3kEqcwq8cFeUdZJq0pd+l2ApFNVWddYyDKq+FYtWTyWk
	 W+i09UQeKzK2JY0dBeO8dxD7C/i4wtzXGWQXUPL3ZqXeq6AlosvCrhuu7Rofol1ZtE
	 zJgiJlD14x5nQ==
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
Message-Id: <177401136687.58356.56247969260120993.b4-ty@b4>
Date: Fri, 20 Mar 2026 12:56:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-db13a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=broonie@kernel.org;
 h=from:subject:message-id; bh=X18Mi+UvesjWAZ5wZShOJWqHaxtenTTEAREQA4/Mqqg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpvVujVTeCPIGwqbUxkQn5WUlb5Gf99F36FMDzb
 Ngb60ry39OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCab1bowAKCRAk1otyXVSH
 0PRrCACBaCeHEGU9pkry5UuPxNG9Kaw7GwWIaWZAx2abuyW59Too4lx/o+czPSLRl9E/lXH0Mup
 gywookR70GPkz3reufy7nXZ8DwAMilcL21tYunQAqBMjJkRG/h6WWuv+eysw/nsJJk63TCJ5Sx6
 a3VZ9HB8qbMQG23gUqzQELR7/efIyCn0DdVErrSNX0KcZqEAgpRNrc/nM4wA0WvGkfDq1xgrOU8
 ambms3RKTCafMD9wf3hEK8lG/PzAuMQR33kmQgB4RhZnKNuYjm97v8niZBWVdJ0UVslE8/QbWPn
 EtpyxfW9VgG9h9A/zM2e6VVI+4uOe9pMK1+xdC4MB6Dml05W
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Mar 2026 00:14:35 +0000, Kuninori Morimoto wrote:
> ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
> 
> Hi Mark
> 
> component has component->val_bytes which is set via
> snd_soc_component_setup_regmap(). But it can be calculated via
> component->regmap. No need to keep it as component->val_bytes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/sound/c/c2da4813882b
[2/4] ASoC: tegra: use snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/sound/c/72660d1ac9f1
[3/4] ASoC: soc-ops: use snd_soc_component_regmap_val_bytes()
      https://git.kernel.org/broonie/sound/c/7a478db6980f
[4/4] ASoC: soc-component: remove component->val_bytes
      https://git.kernel.org/broonie/sound/c/b84d27531744

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

