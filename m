Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E9348457
	for <linux-sound@vger.kernel.org>; Thu,  4 Dec 2025 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764874362; cv=none; b=fCrMh7N9xSPXL0VDZmA+fn3ZzqoZlc83EtgDjg3WRTOB8CuwfQ+D0dqYDQgQ67bJc0LfXEfp5MRXYc+lHptzj9eaHTVIt+in+hJRFGbLVA+xOrIlUV3fIDUxWcu0/8XhjF+7SZgp2AXz9NB0TVZzXZvfLgS9qH0TCBsyCGgBy1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764874362; c=relaxed/simple;
	bh=6GowbT8hV+IQpig/x+wG3ti0QooC/+w1EccEFATISdY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B9mxAfbcU4OGi7ERxsPF6uKxzls1vaxyJylan2lpQGrFhZyoO8vNNMC82BpF2bxsDEAG6sQHWuvQlU3eQ2S2+Z704h5fNpxPexSp+SOsNtxPm/5ncDNMjie43ryi/+Jh55pMFBwFeYmgDr1OQ0e9y3IjsHixnTDON5DFQ2avyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xofp8e1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xofp8e1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79DBC4CEFB;
	Thu,  4 Dec 2025 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764874361;
	bh=6GowbT8hV+IQpig/x+wG3ti0QooC/+w1EccEFATISdY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Xofp8e1maN6hvsbelQwNH59ujjLfjkvZxjP5fd7Bpsl0DuDEJKrdcs50A+r3cFodG
	 j+JdtJeat5ITyIkPHeeVJIjnzNY5y7ktRT63Yacx/PyughqO2ndiqTqDdWGh+sJuBr
	 YzOcINmnAgRNPg69uKqCpnmGm6IV9W7zPtZyRpC3mGuMOqCkyUYQdrLLI7/D17erOK
	 NCT6OiZgwCBnpy/8yeUG1xlb+y5ki0wON1ZjX3eD7OOEynJHZ3xTFlXTynImyoATw+
	 l8R9Pzdyc3gAkzGlc4HdUp8OAEbrUtswAxTmdI7Okd5NYYkxFqCcDJrdJSL0gAVDWt
	 Xbo1saySa+ACg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20251204052954.488568-1-ebiggers@kernel.org>
References: <20251204052954.488568-1-ebiggers@kernel.org>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Remove unnecessary selection of
 CRYPTO
Message-Id: <176487436055.200760.6117015715975245987.b4-ty@kernel.org>
Date: Thu, 04 Dec 2025 18:52:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 03 Dec 2025 21:29:54 -0800, Eric Biggers wrote:
> The only crypto-related functionality this codec uses is the sha256()
> function, which is provided by CRYPTO_LIB_SHA256.  Originally
> CRYPTO_LIB_SHA256 was visible only when CRYPTO; however, that was fixed
> years ago and the libraries can now be selected on their own.
> 
> So, remove the unnecessary selection of CRYPTO.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cros_ec_codec: Remove unnecessary selection of CRYPTO
      commit: 8fb817335ad8d960ea05af3882cea113e59cb4e1

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

