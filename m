Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49123221546
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740587778; cv=none; b=WHlQ7Mm+2VSz8TiTTe2IRBoeaLhvO9pyyPFb/pKHUjuPcW9DwHxspcDkTsCUGSfI96iZ8sDkG5g0XwZs2eiLeSjqbKQyUhnIRE7TwDyoUbCjGrF6QhKwsb7zmG0teSOyWeffY+Uk8OX/Hy2w7O0A5Wr6ZODB+mPgKVAv9Vv0gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740587778; c=relaxed/simple;
	bh=LcKZBWBioqu4m8WbN0HJX1yOXdWLgxBwkL45SyR5r/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kXjfwbkv6qQto11ILMo4PGBVegV0tN6GSLauan09oXCylLT7j2ylKTQ2oszAP9/ZT2yBZ2ev+tgnan9UfQBsQyNmlgYynXvh9yDXXn2ZTA1wx4fl7EkA12itGAPv9bXnV5DzuYBKqucpkOqom6WBuAZF9NZwWiurBzGtijY39Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7lC8vxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7lC8vxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F8EC4CED6;
	Wed, 26 Feb 2025 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740587777;
	bh=LcKZBWBioqu4m8WbN0HJX1yOXdWLgxBwkL45SyR5r/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A7lC8vxV25vv13qeQL1qBXDwzAY23emn+YdLADkOfgf77yK3PJ+Gkqj4JwI+3eo/n
	 eHC1kuOGHBh9/IPau3rxNbXS12JPfpvpE/AsFu990L9OvDOOTnr1inXFoLc7d2lstD
	 8foM7ooK7qhEdUk/0prGcRUbt/Em51weTUJig/ogb1KkguoobNR+4pZQlSMN5rODji
	 JqeP/WAlQq0yhCgM5tgB7E0EmjtpZRX+0WkSGR2TL1Fl5y1fe4pfBI2+lSRByUvB9z
	 jQJlxSFpkvUIWrQNZFOJzP81b7yPZBN1/9kq7Cg/zeArW7Zox9CQy/R6A/UO+EUG6e
	 v4izhsP6il2wg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250226084728.1889082-1-shumingf@realtek.com>
References: <20250226084728.1889082-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt712-sdca: Add FU05 playback switch control
Message-Id: <174058777558.54121.3916985120415130460.b4-ty@kernel.org>
Date: Wed, 26 Feb 2025 16:36:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 26 Feb 2025 16:47:28 +0800, shumingf@realtek.com wrote:
> Because there is no playback switch control for rt712-sdw headphone endpoint,
> it causes there is no way to control HP on and off in ALSA UCM config.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: Add FU05 playback switch control
      commit: 62142da241a08006f89b0620f7291e3a08c0a094

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

