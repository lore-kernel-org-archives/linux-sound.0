Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7433EB10;
	Mon, 16 Mar 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683559; cv=none; b=n+lGSUuXGfxY6stmSFPGb0YHUnXCT2iNTnD1JuKkqd8f/jPcFaFx54chVRTHHWYBkp9q6A6DcgGpnrVdkBz4+iIthQ5/KaJzjU6+IF7xS3X01bHYUYZHcosj6FSZh5IrhtyMsu70z47iBT+awF4cjvJpX9lSFoGvg6pZC12CJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683559; c=relaxed/simple;
	bh=hRrl/WagcYppxci5k4uPVrr9P91KTL6DGb9DMWarMKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MaYqzNkiCRV4Aqq2mzwqjtzMkOe1C4qXVXDcA51rZwfesUhC22+zP3ni0xr1PEeJrQuVwMTorKAT4VNVhT4j+m68WmGkl606XrKVdjQ73G4jC+aYBWHqoFOBPA8mU1d9yO3Q06xUFbtR1EIqpFj07qW3sgouu2Ahh17M0+xVjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAd7goJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAd7goJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BA3C19421;
	Mon, 16 Mar 2026 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683558;
	bh=hRrl/WagcYppxci5k4uPVrr9P91KTL6DGb9DMWarMKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YAd7goJS9RvKlettdxnerBcPmA/i9+69Dq+fHSpA8qhY6fo6RfRo+fWhYXDT/8jYS
	 ackr2EXhfxO6V5qwcFoZD4K+tejlF/2IwwH2oUKaVRu+9qFBXuxWBCUCnRFJNTinLg
	 OIk7txDLum08vPedic4sZD9cTW9x0bhrA9pStMyVIJWNxuGUbWztrmKfsGx+0CVMxV
	 3cYsCv7HBmpFGsSnzPLL+q4gm0pgUxwRpHIoOkJJOVPQmRN37AxDDkDdt2lFdKSVaM
	 9QKm6dlRie5OZKHYp3mByRkkdbmo6poEB+C3DtWq3MVskGLUjwUvjRD489Eg2B/RLg
	 RDdoKUDP1D6Cw==
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chenyuan Yang <chenyuan0y@gmail.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260313040611.391479-1-lgs201920130244@gmail.com>
References: <20260313040611.391479-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH v2] ASoC: sma1307: fix double free of devm_kzalloc()
 memory
Message-Id: <177368355699.146755.12212083316613117253.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c

On Fri, 13 Mar 2026 12:06:11 +0800, Guangshuo Li wrote:
> A previous change added NULL checks and cleanup for allocation
> failures in sma1307_setting_loaded().
> 
> However, the cleanup for mode_set entries is wrong. Those entries are
> allocated with devm_kzalloc(), so they are device-managed resources and
> must not be freed with kfree(). Manually freeing them in the error path
> can lead to a double free when devres later releases the same memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sma1307: fix double free of devm_kzalloc() memory
      https://git.kernel.org/broonie/misc/c/fe757092d232

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

