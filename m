Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DBCA62
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253782; cv=none; b=evJWU1xnjbq8ZWqdRAyMry5q3ZtE/q5hpT32Z5cdYCPf3YzlHH2RMaOHiDtIwKKXDyChh2h2mxyAXbMTY5DJGhq6930wOqRGZyFqTJrshTOIVoNR84S7qV8jQjc9I0K5tYRRYiD1lVYbUjkpRnXNdMZt20U6MP8LER/I7K0fvA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253782; c=relaxed/simple;
	bh=ZfVQ/XIUwLShf3Q1HTMAdeFdFpZ2ogXhC20oHgmjWSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kXflGGDdm7qRjfgRsE4rwQXAIJft3hS8Dhg49pOR15vaLs40nj5fDRKuDi52rX/V+xeODtBfU0rvgrJipyoGQOPNCjzX0DPQtls4pYTkvvb1ssiXmPTRtoysHgZx7LP6IYpDxOCvAgrD4VK266ouRAagW/MQ9U/TjPYtAATBzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EO2ufDTA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EO2ufDTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F78EC433F1;
	Thu,  4 Apr 2024 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712253782;
	bh=ZfVQ/XIUwLShf3Q1HTMAdeFdFpZ2ogXhC20oHgmjWSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EO2ufDTAXbtvmNmUM/7j4fjiN9QrX4qtdUqbZLUhceLEEV0o27dK2mOpm9KA6LsYL
	 gWR+7VFOlBtwYXpib/G/PlxG8mSNLAYcPbbWaSgkgGTlDpyHN8HoMuLK+IY9SYqO99
	 AT/w2Oz0p63m6Gl2l6oACKyeLfau1iFYwk57E2H9KFdi/NbNO8Z9W1jWsON9kqagYM
	 W95dQ2XrrMPiKRkxYYpWGd5XZSFAyrrq+rQM4B5r7UUXrc/DJfg4x5jRwlmRWI4pd1
	 25SRp5s/6pBwmgJMo1L626OaVGW1ks09b9AoglussSnF4xs4t2ge8+ndOq3rricAF2
	 dsoQAAkua66fQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, 
 cujomalainey@chromium.org, lmajczak@google.com
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Message-Id: <171225378015.123813.8269519706443486701.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 19:03:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 03 Apr 2024 11:16:25 +0200, Cezary Rojewski wrote:
> This patchset impacts UAPI.
> 
> The only known users of the soc-topology ABI v4 are Chromebook
> configurations. Starting from kernel v5.4, all of them are making use of
> soc-topology ABI v5. The patchset first removes obsolete code from the
> Intel's skylake-driver - the driver of choice for the mentioned
> Chromebooks - and then proceeds with removal of relevant soc-topology.c
> and uapi bits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: Skylake: Remove soc-topology ABI v4 support
      commit: 251ea652050e715886b272f831cf5016150a60c8
[2/4] ASoC: topology: Remove ABI v4 support
      commit: c57468dc1f80a4a3bf6dd271688837d3c1f26e75
[3/4] ASoC: topology: Cleanup after ABI v4 support removal
      commit: 82c192540b242a8bf3c3d4140905650df9f327d4
[4/4] ASoC: topology: Remove obsolete ABI v4 structs
      commit: 4ba509bf3988f36b536b49b9e7022a6358f87f56

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

