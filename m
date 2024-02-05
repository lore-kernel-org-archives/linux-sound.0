Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8D45957
	for <linux-sound@vger.kernel.org>; Mon,  5 Feb 2024 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152323; cv=none; b=kjpfqB969uABwaBLiBezJZt+L/BrS1jR18rFtyE7GUW6HdcHfyEpZxomMgjBb65y443mFrnFHlaAtasl4G6V12p0YfjxqNQ109ZXsNmawyI2sAiFuUvPsLLUmdzSL9P9Pboe83WmZ0BjLGlH/tybklpwBb48t6VeT+tS7XZ68zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152323; c=relaxed/simple;
	bh=KIiF0znJX7pu7g5ceO0tvUe1EFCxoVX/gkYbJJRRHKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fWBpajtojh8ARdOms8QFHGBmRRzno2c2xBNxRay6QbdBTjDwbxM+xysYmPNzgEfY0s4NAVHE1HAf4noCum6peAbJcp8AE4qo6wBJVvIIO1SGR9VrSOXoF6CoPreJbZr6eF25zNx2PxREDaPx9VhvBMowOIiHaIInMYvwYk+oTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSR0Uwba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSR0Uwba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377EBC433C7;
	Mon,  5 Feb 2024 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152322;
	bh=KIiF0znJX7pu7g5ceO0tvUe1EFCxoVX/gkYbJJRRHKk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tSR0UwbaPhOpSQXBC9TIaf6XsaKaS2DV7Nek+GLRfy+qvfPkfqmzeZkZYz+A0rAWw
	 TDtDxke2RV+Gt9O0AEVSN1/MA+QRog4AYq2lL2Y3sJK2ApeYw9YnrrDRVTKIL0V9Ad
	 2/NCXi6+o3r3N6rmx1cDekNnPdSFDPlhmQoUVmSSM3ecDNqrPSKFfZVPX8ckC+YJIO
	 PnZb8cgpWNO3+1hyJAGGCX6mCvG/joBymfDzJvENt3lLbJyrPZdujNPBBCdILHpVn8
	 CjjZegW1wvImvwpmz+pPORMc0I+tKkdP/g2rO+/vVin/FJ6SnDAw8kySASokwv0C9c
	 bJ7Br/F6SOTyA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240202114901.1002127-1-cezary.rojewski@intel.com>
References: <20240202114901.1002127-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix pci_probe() error path
Message-Id: <170715231987.801804.1736027462162326166.b4-ty@kernel.org>
Date: Mon, 05 Feb 2024 16:58:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 02 Feb 2024 12:49:01 +0100, Cezary Rojewski wrote:
> Recent changes modified operation-order in the probe() function without
> updating its error path accordingly. If snd_hdac_i915_init() exists with
> status EPROBE_DEFER the error path must cleanup allocated IRQs before
> leaving the scope.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix pci_probe() error path
      commit: b5fbde22684af5456d1de60758950944d69d69ad

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

