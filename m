Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17382D0C98
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071942; cv=none; b=OemM6PRGFxHzYFBkldeYCnr0bM2Wmi7tR7k5Pq6op1+4j20mpSJfm3OWGAbOFU7pPOOsbFpO2tVbsCjBZ6GsSBQXBGT5c4o/8DrBpj8sryuxfJX88S4U1/2uAO2mLEh7TAubiSf9Ce7LWu2720yOIC7pFOhyuVicyeuKh/KmPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071942; c=relaxed/simple;
	bh=z0fXM45sgVSyfzITVbX/gHZahLGojvuS7/CdlK1LMwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lkd/EpI5BpkuWzAM+RrRaihi8aas5F4hUrgbQS9J6D0ktoqZOYNuT373jw5v9oA0qWpACQP5zq4T1KtxtPxEsFLWzt4SnhiH9b3gNNx+7pLmjM37fq9IWTNKP/MDRytSzp43cSVxLZ5WeRzKTLr8Cyo9ER40OLbEgpU+YK2KsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oR3hYIMV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR3hYIMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B17BC4CEFB;
	Thu, 18 Dec 2025 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071941;
	bh=z0fXM45sgVSyfzITVbX/gHZahLGojvuS7/CdlK1LMwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oR3hYIMVuO4xyRuNfYiB/VVU4RsKge+4vc30KdPDexk8F2c+x7crBNSrgkE6MrbQq
	 +H3BbHMk4rDifHN/PRWFbt5EbJyKsDN3SZCNmXpczkrfcsCHS6csw5XWWcYEHpvIOB
	 0O0+M38TJvmQs2xoefU0FJGsPGA/1mKk4CBT1H4n80QSw87GpjWMTKTTpZo93KPiRQ
	 YdLJX60PcgK/6dkjznaa5+d2wv3GgMUqOCmNrOKgtofG+LM2KFRAiAaEki6eO7lEc2
	 Kqpn82/GaitrAJMn9noE8HR7X2WBGVwFnWJB8dbErNSGxsKlgWQlrXbUpd2XMc61yG
	 b/BNmu7XZ8N5Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, 
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com, 
 dan.carpenter@linaro.org, sandeepk@ti.com
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2 1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
Message-Id: <176607193812.209701.4994905607089165654.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 15:32:18 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 15 Dec 2025 21:02:12 +0530, Niranjan H Y wrote:
>  Currently the machine driver for tas2783A can only
> support 2 channels. This patch adds support for
> 2 channel playback with 4 device setup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
      commit: 5965df0670d9f4a092aa111a01c62a450e689c8a
[2/8] ASoC: tas2783A: use custom firmware
      commit: a3b0cd63f212686dd57eacd5d685ac259631248f
[3/8] ASoC: tas2783A: update default init writes
      commit: f8f1f0d8f0255d1e7c758dba9e3deb5a58a51aa1
[4/8] ASoC: tas2783A: fix error log for calibration data
      commit: ce65a90222e94eec1e5b7d0224b4d647af644cdc
[5/8] ASoc: tas2783A: fw name based on system details
      commit: 2bc4b4f77cb70df3ef05b80d0cb19edba17f04a6
[6/8] ASoc: tas2783A: acpi match for 4 channel for mtl
      commit: a6b5629e131c76c4ab8f2036f09a05f976f7eb73
[7/8] ASoC: tas2783A: use acpi initialisation table
      commit: ca8f3611dcf85489cae315f4844cccf858bbe9b3
[8/8] ASoC: tas2783A: read slave properties from acpi table
      commit: 961f20faa4b950c449dc98fa95a056ef368a24fc

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

