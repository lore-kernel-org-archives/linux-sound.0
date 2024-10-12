Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91393193430
	for <linux-sound@vger.kernel.org>; Sat, 12 Oct 2024 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728737449; cv=none; b=KwU9n2V+qfNKWtAgJqAOd3JR0dfLRDIOaQz8fwHkSS37pr5nzEsc0ATQENQ2dRCPss815z1kqasp3B4JiQbOFj9V46t9+m6+9R5BfIK/OjbtsXPcCKKpxm5V7CYp6r3jxHJl9ofuR9YayL3xQehYZ2qa04waUQig+ur4XunnIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728737449; c=relaxed/simple;
	bh=eEXHPzFT5egR7xIZbHpDM3tW2CYGvTWc5UOflPhaWNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gEMaJbdMW2bW75BW6O+LMiyjSNDf0TdpIb8hELKSuH9ULGFQ3miU8ZyOYxtNdECmoeXI6JgyITv3fCJqDCEkG+DUrpCIyIZJE986Hjb2DyECmK2d87MVF1Mi05dwH4l0sQ0t2W3crMvdxToprHam/TOpoc9N2Azf00NRL5QsY34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf1m3y3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf1m3y3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33B9C4CECE;
	Sat, 12 Oct 2024 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728737449;
	bh=eEXHPzFT5egR7xIZbHpDM3tW2CYGvTWc5UOflPhaWNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mf1m3y3V2wGzZWSRW5DTtdAFVb+N78uj+UnYISka6TP2JWD57YSlnAvLS4YwsmAVc
	 el30tckYtK+2DLAx8rBPXSC+0IsjhzICWzNB8oEocZg+Do56B6cH5eqiAl5CjmD+ZX
	 LBJ0y0qpmAkrkYcpcdypxEUV7vxU0vanSjzdYhW5qcuo1hJCxzbQss+euoOEmxCcLI
	 TPdb3R2I2cbHNUpxH3q5LNmSgNf+I/K5dmZaBHVND5RRtQGBlGUx+cb9WN/pubMW0+
	 NtTiSPsAt5ade9q7StkdhBuOJx8kNs74uo8S4vgYvWNLnDqvBm5g0WA6j99fa7LHML
	 +w7pgAL38rZcw==
From: Mark Brown <broonie@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-sound@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20241012095840.965087-1-zhoubinbin@loongson.cn>
References: <20241012095840.965087-1-zhoubinbin@loongson.cn>
Subject: Re: [PATCH] ASoC: loongson: Fix build warning when !CONFIG_PCI
Message-Id: <172873744765.3950734.18364191815436266665.b4-ty@kernel.org>
Date: Sat, 12 Oct 2024 13:50:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sat, 12 Oct 2024 17:58:40 +0800, Binbin Zhou wrote:
> Fixes the below if kernel config disable PCI support:
> 
> sound/soc/loongson/loongson_i2s_pci.c:157:1: warning: data definition has no type or storage class
>      157 | module_pci_driver(loongson_i2s_driver);
>          | ^~~~~~~~~~~~~~~~~
> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
> sound/soc/loongson/loongson_i2s_pci.c:149:26: warning: 'loongson_i2s_driver' defined but not used [-Wunused-variable]
>      149 | static struct pci_driver loongson_i2s_driver = {
>          |                          ^~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: Fix build warning when !CONFIG_PCI
      commit: 45b3605089b41b81ba36b231fbb97e3037a51beb

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

