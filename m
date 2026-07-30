Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57A44C65B
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435129; cv=none; b=TQC8k1uwqormwK1QuvYjJTB20HWXxxrNBci0NAJ/8qZH2fJQegNCWuCVkWSiQuY6HNMY3SdHPiPK/huAedOcCfpAOAh2ZOGgHsCNTy39RETY53Xt62sPsC/yjXqUG6PKcIN7l13ssUKZKpotKCeD/RJFOBnak3GV519zFvnDGgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435129; c=relaxed/simple;
	bh=DDRddNHkpwfkZSlY2wXQDHHD4DXMf5BFkLTIsW/cvag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i51BKjIycuzxNHBwjiYHuyKxcVsqcTp1YjB7u9TId04UvKnXX8lhmYRmonYagrFjONBr1VpkbRCyNaSpdI+Zp8DvbYGZ1j+AICZN1tpxo36q0F7tjcQchSHcmIODH4aLqFbBVOpjsxI630nTHcJ+x4ahBMOddkPFw29lUxZPGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkeAsN/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkeAsN/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE2A1F000E9;
	Thu, 30 Jul 2026 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785435115;
	bh=0sg86NbA4Q7Q+Y4ks/0Oc2ivS9bSRlbithTjvKW1hoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MkeAsN/7/t4K/EcDiQ1t28iI40QEGkgIxhtVRNZReDYeKkui0sB7nSaMvFWyUiPxz
	 4TVr4Qc/iDFGnodjTjeElGDMUM25xiHeLVEFFZ46U8RFiyxMDm/lXsfS91zuzYHMV/
	 DMH66lS1Vgu3fwBDRBJj8I7ZNTuH94OY9dQAV8s7I9HzYYlms2PMvJe9lj1u2ceKwC
	 72s7Kby3yRHh7AgfhaUQ8qs/o1kRs8UzYSy91Dw5/DKjg7jdpV646BVos6aOa/weBB
	 ovxjGC2AWCZ8JBCJnoo2hc0yaWfipztm1PSm9DFr4UgAZb0oZA30nLqFUuSymSiauI
	 DVrjtDR0hdjYw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com, 
 perex@perex.cz, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260724102543.2067-1-shenghao-ding@ti.com>
References: <20260724102543.2067-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Optimize calibration to avoid full
 device reboot after calibration
Message-Id: <178542971500.343356.6969318641217017453.b4-ty@b4>
Date: Thu, 30 Jul 2026 17:41:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Fri, 24 Jul 2026 18:25:43 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Optimize calibration to avoid full device reboot after calibration

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2781: Optimize calibration to avoid full device reboot after calibration
      https://git.kernel.org/broonie/sound/c/df3bdb553331

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

