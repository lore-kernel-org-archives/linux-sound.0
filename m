Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B63218D8;
	Thu, 29 Jan 2026 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715310; cv=none; b=hjXAhdB3fE0UNRWVXuZpK0kM17rT7KLxUQxUFU5rybKkyN1aEtlDF+cKf7FZiPmM/nudrNlMbewT+Y86J/AaZvvyReHv6TuxeeXOTU02IQIjGTh9YAsdiy/eFEpPgfGnR2YbVJN7eiaRrWYJpXNyyxXEXt6sHa4Pd7ib1EfwE6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715310; c=relaxed/simple;
	bh=bTn48tAFA2vAhhDqmO1PxKez4DQBZ1dckEtwuaR3FIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sQOu4IuMbli2AftClBghJRenB4GUGUNuOp5Gex5YE0dPJvo/Ex1oD95XW4JDFuOcu+ehR+jYQOSwl46sYDMhDm9KtIA80CxQNV/sIOoGv4bAqj+4PbXjuAlOuOMibWR91vVIBqeS6zy7lUa9Ep2KidNTNqL/UUscYERltiIy3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvcR/oz1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvcR/oz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744EDC4CEF7;
	Thu, 29 Jan 2026 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769715310;
	bh=bTn48tAFA2vAhhDqmO1PxKez4DQBZ1dckEtwuaR3FIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QvcR/oz1zxNj47Qwc2hsJ+qeM3/K0KLBuxCgv4v9wkNIqtP5BBmDFEgu+GpdD/5yR
	 YjUS9XD1LE7A2ZdIzSah8Vdf6NS5k44sipdNSpQKvTPKm+FtZ+2sdb8nVtm8acIPv2
	 rs6DptTRZRGt49lsiifA7M2lrrZLJ+i+8FNwx+kXnNplWuBjIGqDderuISaeoUcrss
	 cxej/LWyEYtM9xmiCLJKvq0EuhP/9/FcH7R2p+4nz1sp06hJVNmFr2lha8w7agliw6
	 fc3sQvmXpLsGLQtiYFYVzmYXKZt96OisM9bUyRNihW7gE5b3p/34VxhUFbKXhP7r3H
	 Sc2/+Fw/IPf4g==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, mstrozek@opensource.cirrus.com, 
 Boris Faure <boris@fau.re>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260129141419.13843-1-boris@fau.re>
References: <20260129141419.13843-1-boris@fau.re>
Subject: Re: [PATCH] ASoC: sdca: Fix missing regmap dependencies in Kconfig
Message-Id: <176971530821.234368.9403465681897179599.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 19:35:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 29 Jan 2026 14:14:54 +0000, Boris Faure wrote:
> The SDCA modules failed to build with modpost errors:
> 
>   ERROR: modpost: "__devm_regmap_init_sdw" [sound/soc/sdca/snd-soc-sdca-class.ko] undefined!
>   ERROR: modpost: "__devm_regmap_init_sdw_mbq" [sound/soc/sdca/snd-soc-sdca-class-function.ko] undefined!
> 
> The issue occurs because:
> - sdca_class.c calls devm_regmap_init_sdw() which requires REGMAP_SOUNDWIRE
> - sdca_class_function.c calls devm_regmap_init_sdw_mbq_cfg() which requires REGMAP_SOUNDWIRE_MBQ
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdca: Fix missing regmap dependencies in Kconfig
      commit: bbb758a6943e19c483ab752cf8220140b46cf22c

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

