Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47CE42DFF2
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936909; cv=none; b=bnpMlPbG6aNe/WtJUMqAchSIDq4UaYkGwdjoJyxAjqu7PGslxK6sxSnzWPCoQFzDoOdpnvdoh0HfASrLVs4aecSmyn6ichx/R365pMtrUIXsK5fBmKgzLDv19rfrqPm5pSCpwLz1l6a4GUs5EG+peAfIwg4hvEnm+Jlo55gxo7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936909; c=relaxed/simple;
	bh=KPg3TeKcO5MQoDBrXlSvOafhsJ79uaSQZm72XqK5PjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VZmEkDiy3MeShPf81z6c9HkXt1pGVAD+3ViYmyYXM3nCHUsYCIROHhyMkl2GE80SxeREyNEwD6xvbveKYO4++HhYQYrrPzSOPWQU0yxPhoWkCtD32dmM4jzpY8VqrTwhIco/1Se6mssfE/2EHD4Z+mXMx1wScOQ30Tncw2cl90s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYZ0macA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYZ0macA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7206AC16AAE;
	Tue, 20 Jan 2026 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936907;
	bh=KPg3TeKcO5MQoDBrXlSvOafhsJ79uaSQZm72XqK5PjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YYZ0macA64RxIJDUO7Xb9qnCHSBeUdPWQxRHxfpIT6vpXei3s7Pd+w2ZrPh+JOYUA
	 Ek9awd9yh7yAzNQCF4tkfSwfYhiT18pXv0CcrSvoFcDNLTro6ryCMjX6IlP0co1gkW
	 +E7au+5FKmPvSdYS7WnSUK5S6IYBz8Y4T3qLOgLx+cMXmUtLE0BnYgehIabtcT8VWj
	 BcD485AD5Fxgsdpl1vx9QI2VeU4Mi4WQCacno+CJDpvBOf/4SkOiDeC1gZqQdFSbC9
	 1Kb/ptuD8hC2X+Bskt4u6ZdBYBQD+Kug/74iPIqU2g87Il3zWemXyqKrssxMOrFFC/
	 SKetLzM8F0c5Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com, 
 dan.carpenter@linaro.org, sandeepk@ti.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260120040825.1460-1-niranjan.hy@ti.com>
References: <20260120040825.1460-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2783A: fw loading for devices without pci
 bus
Message-Id: <176893690420.777973.14290792602612209797.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:21:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 20 Jan 2026 09:38:25 +0530, Niranjan H Y wrote:
> Currently, there is compilation error when the
> CONFIG_PCI is not enabled which is used for creating
> firmware name. This commit address this issue by adding
> fallback mechanism to construct unqiue name by using
> SounWire slave's link and unique ids alone when the
> CONFIG_PCI is not available.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2783A: fw loading for devices without pci bus
      commit: 1616c41e469cf5263e756161ed2e35664ff7d978

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

