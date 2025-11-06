Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0413305977
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473239; cv=none; b=eLqr5glrRk1NOMH3kg26RlNP/vijdUwwhlGonaaRhulbXWI1SlMb5cBe7fyN8lHFtaaqJs1KvaZk+Lm1266abMPos90dixkhcEO2i8gkDwRxWeIilfgWWhwukoVIzYiIhI4qhH68iZjMM7kwBMrx5kS0NFPYSH0o5GOgrpTcBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473239; c=relaxed/simple;
	bh=ZqauHgPc3MWbXQyDCi02XYZMxOt93KMGYqST1LgJt4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=beVyF+bqhp3+a1Z+DGUCQH1V7nxTa6GeVNXhYlEM9O5vg1nv7bgnhEwmf8AOrteuKG3qwFApvABmBrBCLs0Hymik1TxEVF6+Wvl1UfKWucFQ7mbwMyMZpYmrWjHo8ooMRb/ZT96pIVj7rcArN1Gve6Wk4hgSt8LD0RIr31LfKWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmSOM217; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmSOM217"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F799C116C6;
	Thu,  6 Nov 2025 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473239;
	bh=ZqauHgPc3MWbXQyDCi02XYZMxOt93KMGYqST1LgJt4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dmSOM217QdNUrknPsm+Zra13EH+PblhkY8RgyxqGaWQNa5JdIgRmkMGoCUjLMhvXO
	 bPBd3/YuwXOeMm5xy0+c+6YcYojJWhhZWtJmhpvTwyVc+t1HOERjZdg5sGs5rhTnu/
	 8mLFFe4nYNs7+BtfE16E/0Tdx1xKO6JKJZR1j9clOcBIutQbMIev4cCVR1ATzpF/Hx
	 LdGchLh8CdMkRUOQyWLDRUb4317/QiaMHZrAwlf+g+h2evr8nLSosdj/J11TKPUa17
	 WTf8UVTj2b7Sd65CHiGLcmYwX18yB7M8OU3GA1NRGdLbI0q/Wql5Tqdjvoeiy+HYQl
	 taBHOTz6bEVaQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com, 
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev, navada@ti.com, 
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com, 
 dan.carpenter@linaro.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <error27@gmail.com>
In-Reply-To: <20251030151637.566-1-niranjan.hy@ti.com>
References: <20251030151637.566-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2783A: Fix issues in firmware parsing
Message-Id: <176247323396.2482911.634928680966070810.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:53:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Thu, 30 Oct 2025 20:46:37 +0530, Niranjan H Y wrote:
> During firmware download, if the size of the firmware is too small,
> it wrongly assumes the firmware download is successful. If there is
> size mismatch with chunk's header, invalid memory is accessed.
> Fix these issues by throwing error during these cases.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: tas2783A: Fix issues in firmware parsing
      commit: 84f5526e4dce0a44d050ceb1b1bf21d43016d91b

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

