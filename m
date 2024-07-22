Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C316EBFE
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721675543; cv=none; b=sTm6Zy7XZhhpkCq3gbGpqiLPJzO6G1/f7HBlxrL1Y9bV1suhCzC5jaw7dOdAIJcdxZXdvMXGoVcR7b0B5fImgwtcppjQ1WCF95FsGeDWTlPHIV24zGOL/2MComnNLBkvmVCd8tRGiD+eVMavHE+4c8UPybiWxRTygHmjkao5yT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721675543; c=relaxed/simple;
	bh=qJaKIk6+DCF4AXqlRywZH6G44gwfDvN4DfZHy3E4aqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RV0Ziyl7qPvIllRVCUgt9oA8wI4BLDCEodsMCPl2DjXHFnbvz8tfDCiffQCoeQ/J/t86h5MhMJRhItcu5eACZ7xA2wiuKqICfzW5q38okFFKTgY7aNk/VJhs6OCjgZDQeHA4f1nQjEKFTAGEkVmkN76nZ/+Z1mG4arttfLvaUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwkHTE30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwkHTE30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D68C116B1;
	Mon, 22 Jul 2024 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721675543;
	bh=qJaKIk6+DCF4AXqlRywZH6G44gwfDvN4DfZHy3E4aqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PwkHTE30Kl7ROzM2ZPHCTzHnu8MVPga9ssfUJcp0adnOwVG6aSqTL7UQ8j5dhV/26
	 aYxwwczchip/IrmDUoPBsK4+rw+yA83FRwHkt6m/ShUVpxdMPSgwSfFT8mlrXH2fCt
	 1hTcAzzoPqRp8gQY+mn41f703/brpjQsIAQC+MAl7pGZuMQ6njC3kwTg07FDh6XbBv
	 5t3/2sfHLHsC6F3Q3W56mXxnD5vUKsBk7op0Abjzd6xbEwrxo16jV3QHCM81cqu+9I
	 64RCNkleAC0BzMh/zAz30uIlrQJkQu7C8nHJEvSUf8ZbJsHomXYfPgV6iWti/+NYpX
	 XzdhSBKxVwFwQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 kernel test robot <lkp@intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
References: <20240722083002.10800-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: use soc_intel_is_byt_cr() only when
 IOSF_MBI is reachable
Message-Id: <172167554047.83479.17939715379049478337.b4-ty@kernel.org>
Date: Mon, 22 Jul 2024 20:12:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 22 Jul 2024 10:30:02 +0200, Pierre-Louis Bossart wrote:
> the Intel kbuild bot reports a link failure when IOSF_MBI is built-in
> but the Merrifield driver is configured as a module. The
> soc-intel-quirks.h is included for Merrifield platforms, but IOSF_MBI
> is not selected for that platform.
> 
> ld.lld: error: undefined symbol: iosf_mbi_read
> >>> referenced by atom.c
> >>>               sound/soc/sof/intel/atom.o:(atom_machine_select) in archive vmlinux.a
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
      commit: 9931f7d5d251882a147cc5811060097df43e79f5

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

