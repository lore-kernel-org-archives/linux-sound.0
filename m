Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D4325DD06
	for <linux-sound@vger.kernel.org>; Tue, 11 Mar 2025 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741709239; cv=none; b=bIQ65FYhXAqK8dSuj2gsXXX2Jjeuoj/Z5AkGjuv/aKMMPPCFiSj844gxoEvOWoClJhg52pfvMJiWcVYAgC/+SckNA/CAxpHg7pxVOkOqGNfjTEBXQtHFxdOu0KMZbVZdepa2vYuHCaXaEFRg2acsCwThjXvzjC93he+BvP+07Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741709239; c=relaxed/simple;
	bh=zlj3GwtnZebayqgdEo7s/waQYeRTyymxP49dtYesK6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NuEejb2uQ4HlJqSpcwLUoY8gEmllU/qaVMv7tYo0VF7JwtNkkZJA7R0B3c1zO4ff/7KD1jsSrM+E9BNYrJjmKS7VGmRJMBBuCtjCInhrYG7D78HaI10RPX2DVq0zZ1sE7gHxgmpBmBV1YDfHMXjVTE173FaoAH+9SIATXBH7FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgluIYZ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgluIYZ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3D0C4CEE9;
	Tue, 11 Mar 2025 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741709238;
	bh=zlj3GwtnZebayqgdEo7s/waQYeRTyymxP49dtYesK6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OgluIYZ8tz/VoI+KhNr21bXf89HBTg3U9LoyPOtd0wsA2UPPZf98upL88BCw0qF7Y
	 16E/I7ODOfyTItEJwLnSEpB3VTBzuUb2/S+ho7gSqY8yhcMY6NBYZyOetvoS7b8UBC
	 EVSuQ7qTbMheeJz/DEBdN1mZkcpToPr5j7HBgMdyk+cxnuHoNysLvQMLCk+tGmVwtB
	 Pf17Re1l2I3PTPU4FF48wQAr36aPF04lsLqpvfqdK9DguJVLtFdpJrzdojd9e/hJJ1
	 NrlImJwPfbHaozhG1TKSOpqsqhaeR4RxbTqcvv0OJa4pacTIkycON3O6RZYKD5kgn3
	 tczplaksSE+mA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
References: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43
 support
Message-Id: <174170923737.156739.3172778241656323256.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 16:07:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Mar 2025 16:07:12 +0800, Bard Liao wrote:
> Patch adds driver data & match table for cs42l43
> multi-function codec on PTL-RVP at sdw link3.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43 support
      commit: ac5b4a24f16f2f56b5cc5092969930b867274edc

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

