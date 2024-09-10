Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAB1A255E;
	Tue, 10 Sep 2024 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726005863; cv=none; b=EHTP6pKXmVpxbWT7ozOphJB4oaZ09boxULqW8LraqRWXv+92PjEUXKPyWmKFwXFcsLT1mkc3UuAdk0wNFLi5phv9IyW1oD12zvpi3SlNAsC6hs/p2D/5EO57VjVwKsACAO7tuG+YAaOljKmGiZw9POk7piEToUB3w8hC3v0Vucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726005863; c=relaxed/simple;
	bh=hLOkIDP9KYiXmTJhuJmCCi0JcGlEwZxLupciGBbydjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LULYiKOd2rask3MnP2DzeExQn78RaVeyttW0nJvdYUK/axIicK0VAX9W/JNZEXJjKKKVN/QwbDleKv1ZdmGMDxDS+CP49FlwrAJA0TllaZ1SBhHz5M2Hsn8qmETl9LmQzi7FJo7pL1QuiRAg/PqFIeQKLUP7H2iql+aahgKoL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUrgChVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUrgChVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE97C4CEC3;
	Tue, 10 Sep 2024 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726005863;
	bh=hLOkIDP9KYiXmTJhuJmCCi0JcGlEwZxLupciGBbydjg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SUrgChVgLL05Qe6sWYoSddZPtCtXvZnueyGP/xTCl7FgZLTMqme6tYwDt4ZFYcSTH
	 cooVEnhrtcUwopM8EfuDbMuUSACds8JVVfqzKSICl2EQmGgUcie624EnZqZZVENzMj
	 C4GAf7fMRnOk8nYtgaW/uN7UDbYJhKQOansuOaft/rVyZBS1OycpvDmu5B7IWCJ1kV
	 8KuDG7VfqrvWE+QzNqJ8w5rShZD+rr7prkF3d6dDaYsSDYXMchQqnzhmQRQIc05J++
	 KzOyEk26qDVZ8+U8PXath17VysNT0pu/xL6cHWvFUvUWidsWHf3TERge3ke6RpkVIH
	 qLtHq4NgbyTTA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, vkoul@kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20240910143021.261261-1-yung-chuan.liao@linux.intel.com>
References: <20240910143021.261261-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: update Pierre Bossart's email and role
Message-Id: <172600586137.1200152.17081565908869197523.b4-ty@kernel.org>
Date: Tue, 10 Sep 2024 23:04:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 10 Sep 2024 22:30:21 +0800, Bard Liao wrote:
> Update to permanent address and Reviewer role.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: update Pierre Bossart's email and role
      commit: c6b9a92225d1365197effcb3afc56ddd62fc36aa

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

