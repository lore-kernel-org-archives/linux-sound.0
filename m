Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D41EDA0D
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853500; cv=none; b=MgeYt0AD26C9tvUMtqLIfpe8JGY7dXAa9/zz7kTcJFgDGBNTvXCyxOfFLWdnAgQKV26ictCvMK23Sf13bCwzxiqgPuk8h6OcCNA2gcr8bMAOtCu1PxuIewyCi2J8jGWndm1z3wb+2n3COokCbLfU+nP82olbZ++ZgTCYFW4R3yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853500; c=relaxed/simple;
	bh=TULlGwRXzEKSV2/LD3FkIn987+dPWSFnoHmrKZXV6t0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GFExjKb5nzYyR3947mtxn6mbLTCdiR6pDmbRpd6AKFdgi6KoNYX4tyOfac29ebMUJi9+nrRlKaZ9QPTMEIgYwDsMAjhJlZIDvkIyFjjYdDn0aCNnX3Ab7JyIZhh9s1e0NTtQ74T3dS4j1aE/jPxnb9uIo3UhG7gGor0G9ogTdU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMfo0K6j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMfo0K6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336B9C4CEE5;
	Thu,  6 Feb 2025 14:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738853499;
	bh=TULlGwRXzEKSV2/LD3FkIn987+dPWSFnoHmrKZXV6t0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YMfo0K6jK3QIH6aolcp9jqmBYVAsF1KFeSMKi+3BdgviEB2SoDHjv9AwK4+fi7zHb
	 Dy6WscVcXHPkDVHNAx34nzG2YgB4TB9xebnVjKrFkIFCilLVeY8wiT6xd11GLHe673
	 PjyJ6balKuLLNk+1Wxrmij7VWzDXwZdX0pKQG+dAhtquEoe+LE77GXGiI+3OoIXMJa
	 7Ohz6zLDg06l74ssJe5m9876FjzX4JOL83fbFiu89HOr21oCgjz0436j4Zj/8RfUod
	 WxyKLdEPfiqVQpyWTX5nxEmN3LRpkgrX/KprGGx1Vd+3V2IPfalkaf+vxf/HJmzP8h
	 oWjy6caIQGETw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, htcheong@chromium.org, lpg76627@gmail.com
In-Reply-To: <20250206094723.18013-1-peter.ujfalusi@linux.intel.com>
References: <20250206094723.18013-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: add softdep pre to
 snd-hda-codec-hdmi module
Message-Id: <173885349793.198179.2953699107379101217.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 14:51:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 11:47:23 +0200, Peter Ujfalusi wrote:
> In enviornment without KMOD requesting module may fail to load
> snd-hda-codec-hdmi, resulting in HDMI audio not usable.
> Add softdep to loading HDMI codec module first to ensure we can load it
> correctly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module
      commit: 33b7dc7843dbdc9b90c91d11ba30b107f9138ffd

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

