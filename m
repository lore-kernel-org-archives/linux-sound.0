Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012931A549;
	Mon, 15 Dec 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807136; cv=none; b=OHP1YXHGKc9ShN5AKYVLP1b//6gd6/Wu3gi6g17HGliK0xZKo6mGGlrACBflZvwizdu3XnfSZyPsc9SeaxtXVwSg2xVRvTWxGOXviLM0IAcPZ6W7zCI3aaKAsnVH7UzWP6PWnIyfhui7W6RYUa2MWFgcvHreTV76YLHuTQ+wAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807136; c=relaxed/simple;
	bh=QftfheSx+e7Pz/hQ8qwsybGwm4nLmTi4LE+s13cohIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nWv6MInzlcGD7n+vmZlh4rigZ8u7+olvT8zirpJTEfhTbV3uF83GKlTegO2HoxETNX7aE1UoHnMoWJuHklhvwTHSMvGAo87ReMtgT69t9POlH5lFTBp+abgam1Op42bZF7WShMBXH36nGQ8fKi0pq7ymqSumLQYVeRoLm7vLH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq/PGFk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq/PGFk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881F3C4CEF5;
	Mon, 15 Dec 2025 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807136;
	bh=QftfheSx+e7Pz/hQ8qwsybGwm4nLmTi4LE+s13cohIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cq/PGFk4rOkGOvMsmFwB/sQnVbnH6eY+JJW3IJVL3MbMwXK7RZpH/mffTs3Z/78NE
	 Xws3aU1cG8ZneQhgkDCq/WBirV82zkDa7t3aj55mT0tyFJkPEVY1ZRPtZ0OI4SSmuZ
	 EshNuWhkmST6RvXq610iDHRKMTY/av/BFoUWe4Nr4MVpwhHXISlvpnO/3j6rzUkkkV
	 2NdSA3sM4acWzvNjnrNv+IlCEOQ3cNiIAas0hkuYE4FpCO7UgxgvPmTyJfh/zo3sOh
	 eSHvK0tAibmgZF5t8mwm6L9YobKf/tDNNwysxlLjjbPZge5W1x8GmEAGL844WdUmGJ
	 b+38thSW0MfVA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 HariKrishna Sagala <hariconscious@gmail.com>
Cc: khalid@kernel.org, shuah@kernel.org, david.hunter.linux@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <29c40b5a-3e4d-e89d-ca22-a1059cca3480@gmail.com>
References: <29c40b5a-3e4d-e89d-ca22-a1059cca3480@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: fsl: fsl_ssi: Replace deprecated strcpy()
 with strscpy()
Message-Id: <176580713397.161056.2062584359169802375.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:53 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 17 Nov 2025 18:18:48 +0530, HariKrishna Sagala wrote:
> strcpy() is deprecated,use strscpy() instead.
> No functional changes intended.
> Link: https://github.com/KSPP/linux/issues/88
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_ssi: Replace deprecated strcpy() with strscpy()
      commit: 774d075a80c652a0f35a5dd6f9e35cac5b7f6bdd

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

