Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6021757D
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722637707; cv=none; b=Z8Y16JsLHzZ8MRUCdnJkXWFShra8hdirxaOR+nVkaAjk2nEBbzN5YvmjRmy5HzaZammgLUPREH4TveIulyAA43yp98LfS8miM4IIQkQ1ekwaCl5hO2uyJN0I7avY3HWrEjrWUOuZeB+9qfqsLPzlnwZ853rmNKAu2naVjZa7v8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722637707; c=relaxed/simple;
	bh=QKOJBGWTJn2jPLVa/+pdDhsHq7fyVsLxEOx12D5x2yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H9OnnatQ/moXg21yAXtnTLl0z7xh5fpaVtN03yfiLDVOlEoHXiF1bNINtcxduHoYa9M0cPflt/xqGPFXAnOl8GvaMJEcFx4ejtT8Za2238jV3TrxWivYuNq80wy93zV9H5QqzJ5Dc1HeaChFqWmsI67zGcNC+qn3SFvx2nu7mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehpe8fWv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehpe8fWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4B9C32782;
	Fri,  2 Aug 2024 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722637706;
	bh=QKOJBGWTJn2jPLVa/+pdDhsHq7fyVsLxEOx12D5x2yg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ehpe8fWvBsuCGiEKdeZbme0iHdZv5BR9Pp8HTrtBBSJj79Cfud0XLjI/9xBiwpx97
	 S531JEeEhtI0w9pGsRTY7R62MtmLv06N3y0mUgV2+vUvzD9pJTj3nguKMjZnfmN7FK
	 oCPtJljCPGhS0JAr1lmASj5dtS+LlQpllcrtOIZOCe5r+gxNEY1Xvq/Hmg/a5sT00w
	 fzzSeiOJW8NTVgS3AkQ1YptDZ+6Nco8F4UWGapvV130fm/HMUzE/3NVeqqm8waszYc
	 E+4/WkKyp5Onuxuj5IIPvP8ujDfHRCLaIdvfujKx+NMquMcRRWwej6Q16W8aWC3yT8
	 IBYzZXTeoIXNw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
References: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/4] ASoC: cs42l43: Remove redundant semi-colon at
 end of function
Message-Id: <172263770541.147512.5422412015989326949.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 23:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Thu, 01 Aug 2024 11:04:10 +0100, Charles Keepax wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: cs42l43: Remove redundant semi-colon at end of function
      commit: becfa08bfefa2cbb22c84d9e583e81387f2f3bf2
[2/4] ASoC: soc-component: Add new snd_soc_component_get_kcontrol() helper
      (no commit info)
[3/4] ASoC: cs35l45: Use new snd_soc_component_get_kcontrol() helper
      (no commit info)
[4/4] ASoC: cs42l43: Cache shutter IRQ control pointers
      commit: 93afd028fb5f06a46a32375fd1f0473451eb1c5a

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

