Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6043E1DE3B3;
	Mon,  2 Dec 2024 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162309; cv=none; b=rUQlqbqZpz4MvBfpc5W9Qzvn9QYROg8OJ5MVDx6fWJ/zCNsRtCOHtWGCGCwMAx1r7wWi5F8W8mnVA57Ee3jq1AglCQxiMt5BlxqSnxNH8yUenuSpt7btbfzYwdUQWDSrPrAQS+GK7FYC1HMefEBwvSbunWBANDwDCwX2Vrvl1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162309; c=relaxed/simple;
	bh=F465A/xcZjT1ItJy7jDm7anDbaAiluIiWyeLm2UOUdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f30J2D6PCFV3pA/x30Utz3rnA59n3U5OD7y0IoI5Mx9tH9HsIKp2lpbg2+QE7NU9CI385g4CCVeg9m7NY34T1ZDrHHrHI1b2iTaQvlk3c+bj5Edqw0OXgOcEe2EQXh8K2gnkF8ubF41Ga7jvzW75tpiVxAMHm4I7wqX/Ivi6PdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4JUVMeL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4JUVMeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0976C4CED1;
	Mon,  2 Dec 2024 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733162308;
	bh=F465A/xcZjT1ItJy7jDm7anDbaAiluIiWyeLm2UOUdg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H4JUVMeLkl+pUS/DGUjmL8of6HYpsZjQT7lxVRHBv1qu8VsuMsfSdspLtK4th6qY6
	 rtYMYk03s4J2Hv9fxhq0NlfnwwwLRst2dfIJxbguYB2WZ9Y+e0dcYU+2EHKRUp3aKC
	 KxNoHYX7Oq1e2iDycXPtkilrJN90/T4WiOjX/q1pWxi42EMie5hoDAv61gaQaT/hpS
	 GcsxyE0k0oqgt2eziNivGEjcMM4KBXYVsl/8zorHJQ9LAVuYxlntomYxsFTt/alV5z
	 S1918De6+WAoicame2ROkV11NP8mmrNoshH2WxpGYfuWaHiXjjvSue/k5J4HPLnp3d
	 qp5W6osXudIMQ==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, perex@perex.cz, 
 tiwai@suse.com, lgirdwood@gmail.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
References: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: tas2781: Fix redundant logical jump
Message-Id: <173316230670.189181.879023337858247511.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 17:58:26 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 25 Oct 2024 16:20:42 +0800, Tang Bin wrote:
> In these functions, some logical jump of "goto" and variable
> are redundant, thus remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix redundant logical jump
      commit: dc9f2312acaee205609ad3c8b5f064e39eab1d6b

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

