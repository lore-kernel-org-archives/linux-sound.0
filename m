Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09ED32A3FE;
	Wed, 19 Aug 2026 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787160714; cv=none; b=tEzbMSgxA129m4MVgGeiZimG+vr7TEUfvhPrPdfocI1n9lmooUoRCFzkVigM2zKu4xHqC6ZDXEt65QLurWd3VcKMp/33Niok5Gx/svgz8+wui9JbF0UEtKVPeuLNbkR8mgZfUfiHVo1jHVhDpqz74DIZFFhxKibunYZcTQsNknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787160714; c=relaxed/simple;
	bh=69Am3+J+6pqF9Hgl0sivioyeQhObHdQ+/STZGFwrpFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E5f6PnWXSpu67SuW0DR0uDPkhGHpH2fQZBI1tiSGmvtOt8liXRgyL2zL5+tqTR3W+4E0BOnc5GKLAK8V1KGI6hF8Zw4+cB/hGWLiezcLJC88yFgWg6zqb9WdBTkErQxBeNpAvkwwBO1G82IQItU2TVapjL6TtCHr+kToERNOyN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTYDI/Ya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTYDI/Ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E561F000E9;
	Wed, 19 Aug 2026 17:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160712;
	bh=E6mLab68eXww+9sHdl3RnB90bsHaGwj27/7Uk2RX3IA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oTYDI/YaH3HObcU7zd1CgKpuiGW74zYfvClpC+WD00v+thQ0P4lHrIZkUmMAkX5E3
	 90j+ZRgH+hKqABqUX5tB35m4lrvi5UvZGsueG6tnXb27Fkn2Kc1iFeeoWQaFGfYPd3
	 cU8nV1N9Ag20cLR6qC0DchVCkuwdilrQ4NuwWnKJ4qiGWrYRrvauPzefMzdaD9i0Ed
	 RihLnIODfYR/dDehU4wQVPIbl2qR3TB/LjT6Ir7yehXXn+4fqoyUIMIIfXWv/v17TR
	 wVliCLTONLCVOECG6mqwYsd+G36jXSxfSxVEcOJ7+3kTQ1Qc4aQ9qcHKo1he74sP0O
	 kDGXoRnzNYVCw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Andrey Golovko <andrey.golovko@gmail.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>, 
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813194000.10412-1-andrey.golovko@gmail.com>
References: <20260813194000.10412-1-andrey.golovko@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: tas2783: prepare the port again on the
 resume path
Message-Id: <178714960765.98116.6107748730515715662.b4-ty@b4>
Date: Wed, 19 Aug 2026 15:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Thu, 13 Aug 2026 19:40:00 +0300, Andrey Golovko wrote:
> ASoC: tas2783: prepare the port again on the resume path
> 
> v1 was a single patch that powered the SDCA Function up in the port
> PRE_PREP callback:
> 
>   https://lore.kernel.org/all/20260813001500.9218-1-andrey.golovko@gmail.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: sdw_utils: prepare the stream again when resuming
      https://git.kernel.org/broonie/sound/c/6fd1b9225de1
[2/2] ASoC: tas2783-sdw: power the Function up before preparing the port
      https://git.kernel.org/broonie/sound/c/119046319e77

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

