Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BB223338
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879443; cv=none; b=VYRxcahe2rnpvMVTzmT9RwpL6tuodyXXp/58KZhTOJi+n5YI+08i1iaeRhgUJpwvD6+1QBpTz28Gru66aYCXkvJFYocBvSoAG9GvuEaoAInxeOPJZKdmCvA4e02hjS5+y98+EwtLbLoepP7mG4PNNX19EHHsUDbTAKukKDsvdtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879443; c=relaxed/simple;
	bh=K2EBttlvmrZDPsRfdrB/uIa91xKacJNcK64z7pATYV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oNHDsG2VLAhdeVoYg/hAFu/6l7CiCF/rVIi99qmEMXcNw5Sxr1hriDDuvr5C8ByA1mx3ZXsP9ybFhP7wti3YTXQIRliRS5rdGAtvkLNahO644VYDGFvwwrVN9oWUea4zLFCENsxR82JxSyFowEd0mgf0zULLYbFBhv7286xV9jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLDy+WmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLDy+WmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7049BC4CEEE;
	Mon,  2 Jun 2025 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748879441;
	bh=K2EBttlvmrZDPsRfdrB/uIa91xKacJNcK64z7pATYV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oLDy+WmTAIDGvC9cWOuqurRnvQHATTj5TNvi36IpYM2HNOoMUx6lLjKU2CkmNI6KK
	 D9O1m4Tc5Xpe4AXkNfqklg1Slcx1YOyHqQ6fNXy7Lk7+4yfionesTxpjbR6rpTM+rA
	 ALCXZwLN8nEyJO9ry7XjGAE+La9yhN8wRkoWPwTeUuYNClCWjYK1pntd9NsuVc4pSo
	 M6umV0uSg2BO0B3RNEqyZNHWtlpwy9UH3+xZwn2RZ3LUpyYtznRWYr9EahyadybM3d
	 08AAWSfZ535KdP+QDyEzEw7w7NSJ2DiteF1ub+3Tb1zy+bSboJLF64A84I4nwS1Ilw
	 Z06jSA3FwimsA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250530141231.2943351-1-cezary.rojewski@intel.com>
References: <20250530141231.2943351-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: pcm: Do not open FEs with no BEs connected
Message-Id: <174887944019.88031.12931353594862880783.b4-ty@kernel.org>
Date: Mon, 02 Jun 2025 16:50:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 30 May 2025 16:12:31 +0200, Cezary Rojewski wrote:
> The check is performed in prepare-step, that is dpcm_fe_dai_prepare()
> but that is very late - code operates on invalid configuration from
> dpcm_fe_dai_open() till it gets there. Relocate the check to the
> open-step to avoid any invalid scenarios.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm: Do not open FEs with no BEs connected
      commit: 59a4d9a9efd921ae2b722ffa52217124bcbc0acf

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

