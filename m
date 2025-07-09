Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF621EEA8
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752075360; cv=none; b=OP6zb4w9ZNSRjXMkXJKKzUb3pzoAR9EfqU9g7Aw0qgTWwbWyY5LNgRCXq2SiooOzMVf5F44jbDfVjCbcYK5oamQdm8WhNHz89wA2DvHM1Z3D+s48MbXzOJQkig0MvOArnS9fLYh94bThti3XhAVk3+lOxEf/yc8UekVbiwNGGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752075360; c=relaxed/simple;
	bh=b4QFl55waDSkbGuY8X4DaxrQxFXzbN3RsCt2XuTM9l8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=stL2N1sgK9s0e0qtpvKX2Vfkhi5Za+IKgSz1q5YwrzOjJoX987Q6B2bGNxbG/igGMU22bKzXEGSRyVbIn27szoS/wnN6mE8D09rWt/AQM63klKBCeTtMYopmIpknyneaZCZG51XXeaTO6T9mioulYZp6kxwOYU/9i67hFgYqPgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqKgu18b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqKgu18b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86945C4CEEF;
	Wed,  9 Jul 2025 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075360;
	bh=b4QFl55waDSkbGuY8X4DaxrQxFXzbN3RsCt2XuTM9l8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PqKgu18bHCb3JT0GrRFzeiA76oWHOqCAWRdlrP8+A6ZSfd7ZmHOyfkOJXE2g6ZgZz
	 BIS6KQSWstWOt8Lw+4zrRgwHaZimA/mPp5OErNpF8M5JJLt+DW3F+L6CG4PwtosHO4
	 iJxe2DFKTmJrDnXe6qFe2KSZSpiXr5ZGc0mN9me1Yo4IwHy93oPR4GkGVFjg9Bnjbh
	 +iCvee6greHsRopnds30hi1/y8Ji44mvoXlufnpA8l0q2etFQ/DpR9qcAfIMyeK45s
	 ijo3kvW2BKwTp1G0175GQrXmGVJbjh/70JsDrLA9Wbi7+QTmWl/WOYkBBuETdcTGeE
	 B60Qb0Hyrs1Kw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
References: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: Add missed component_name strings for
 speaker amps
Message-Id: <175207535775.695799.5945746805854795779.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 16:35:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9

On Wed, 09 Jul 2025 10:57:45 +0800, Bard Liao wrote:
> Several speaker amp was missed when the compoennt_name was added, which
> results missing " spk:" from the components string, confusing UCM.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: Add missed component_name strings for speaker amps
      commit: c61da55412a08268ea0cdef99dea11f7ade934ee

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

