Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9862E3F7
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113543; cv=none; b=fXXxx4yL2cQRvhCqq1u21gvFNIN/h5mWHGyV9aFgln9yJ54FLYKga6w/0urOTBEMN3ppXhRzLsymYqzDwPkMX1Xr3CI3Yr8x3utmhGpXhujl41zsW0wQacROeiWGsKS1yQyA6t+/xHK9TbEjox34GT5Xa2EaMfOAlfQ5Z9Y7p4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113543; c=relaxed/simple;
	bh=y1eAcALUBJtOcY/yRjb+HRjFX6xnxr1k9+LVlC7sRV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YBI+4FYMwXkqaLnUP9y/ukgAV6UD5+roc1uICp1PFtaHdJpizjALfNSlMm3V3712u0AfQi2LyqVmPf1BWAb2GFkuKolYgIYrX8YKJDnUux5xOomNbznSVR4L+ZQNZv6uJb3dBC7FzB2sOLvKv9ZNbjxVw4PIy/HeO9MucQqdR8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWm+2O5t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWm+2O5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1DEC32781;
	Thu,  4 Jul 2024 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720113543;
	bh=y1eAcALUBJtOcY/yRjb+HRjFX6xnxr1k9+LVlC7sRV8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NWm+2O5tpmSwLbY5UOhSgVDcz415Se9L5pCVje9uQwZyioO39y3rWLkbbQdc0+/DZ
	 5IgK5tyum6yRNy320ETN/sqON2ubCzv65AOuq1KFmzRjk07Rj7QrrZ1NuNHXvEm+Ot
	 /wU4G+aH84/NlwAKU/QKglX7nyt+kRu0qGSy7IjPX8Qs14ge0gBmPJuRmSbAPVqkjy
	 FSaScg4sSk9q1+aM0oE2786dTsleVMsMZvXqr1YB4wh7desxUyCngyBuEAE5I7Da+f
	 IbCJSTZlgxJ8Tb2DKNUr8Hb4/buHZNqcxA6HBbUo+scP8aOecd3wnVhrHpvKsU70+6
	 lqajMp1vz+Y7w==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
References: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of
 periods by MAX_BDL_ENTRIES
Message-Id: <172011354202.90743.11488058235913274313.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 18:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 04 Jul 2024 11:01:06 +0200, Pierre-Louis Bossart wrote:
> The HDaudio specification Section 3.6.2 limits the number of BDL entries to 256.
> 
> Make sure we don't allow more periods than this normative value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by MAX_BDL_ENTRIES
      commit: 82bb8db96610b558920b8c57cd250ec90567d79b

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

