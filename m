Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE415B99E
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347683; cv=none; b=Vf4i3Aw3Japws9QxmpiXHU1+pQV5nbOkKVotQ2BEc7U55lNmgmQi1WSIrQ8ggxl2ipLp2woJPQ3jlOGsCwhRRgtP5Do2cQL6XrBCqzoLHp/NedkScrUXKvcU2bEfxa8rO818rmtWO/e/wuylB1myJBBCe1rm3AgrqolGrvjNm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347683; c=relaxed/simple;
	bh=LwHO/1GHjUQaLSG6IJAJejVbzq18HDsxqku0DmvhHcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J9xBoWsegKWRwG98hkCFfd+KlYlyGl+g0bahM8bvg3tQR/awvhe1R9jE+wjfOEqJJElQvMDP1LUgM4t0n78/kmWey2cwSVMz1EGMCDHp6NZaG0bfUkM/6CG6s4svbaNuJ/DZaGabbGXtSu6Zp89nD4OQ0JkiWWK+lHQv+yqhzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0A5Yi7n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0A5Yi7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C20C4CED3;
	Wed,  8 Jan 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736347683;
	bh=LwHO/1GHjUQaLSG6IJAJejVbzq18HDsxqku0DmvhHcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i0A5Yi7nrr8CAt/ztdHkxtxVh5LBVs0ZPMaCFHD5JJBJ9OrL3yDy/iYiHbifuLiYM
	 7YxAlLMT5ncN0heYuH/jqBekbpgyKFwGn7CUkCoIgnnm97PvVoFJ/cMi2c+Nnetlgn
	 hUx4TC3eK6CNoPT3TWeR2SWwF2cZXfuUaqXq/LIB5DjEfPeDY3S4jEq/tb4wV3PFkF
	 X+Qmy6XF4z9CQPUWmnpZEinDYLSllEoJ5sRc5qwwpNSCyOaukp5IvvU1Q8D4cXm9uf
	 XVSId2MQJSvma7cjvynb8AzXB3ZShZC3sNL2jLWadEPIWkvjEubQYnIIns0Bj+AnT+
	 VwEP9U1SkRJLw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87msg2knsg.wl-kuninori.morimoto.gx@renesas.com>
References: <87msg2knsg.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-card: remove card check
Message-Id: <173634768255.57096.17726986657710103326.b4-ty@kernel.org>
Date: Wed, 08 Jan 2025 14:48:02 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 08 Jan 2025 03:05:52 +0000, Kuninori Morimoto wrote:
> only snd_soc_card_set_bias_level() and snd_soc_card_set_bias_level_post()
> are checking "card" in the function, like below
> 
> 	int snd_soc_card_set_bias_level(...)
> 	{
> 		...
> =>		if (card && card->xxx)
> 			ret = card->xxxx(...);
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-card: remove card check
      commit: 9c3d68ce5dee76f30b23ca29b2be4774e291f7f1

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

