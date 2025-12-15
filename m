Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E252F25EF
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807134; cv=none; b=TaUoUW69zJMglXspc5v3HQbkAhYdpz83oppgJvY6t/t/uSyJaXcTzqVtkBQTjTPzOZTi98FFwQfcneAnKyrPatHW2i6FxbyLhhBWGpZDwtM/MCcSdpOdif5NpAeE86L0oZuawpuYkuJPSJlu8Xx5+1AULxDRNX7/nElC1iEgEbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807134; c=relaxed/simple;
	bh=UXO5Hf9pen7dN3s4a7cAeEkZUpTFHG2af1g4MTOaqxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t8cVlUv92pN2P4tLOdDRqd2pAHIIjAE5o1H1VrS52A7TzO/ogU9ySo2Q3DCi7WmPr15ubqlx2vORj5COJE+jamTyAi13xjNQtbwyGkPGV+++WrooAQZEqLsxJg3gtrD+E4i78LruWD023ajPRc5Wn5qiPqCUvN+SzX+r4T6Z0QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbAtVI+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbAtVI+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81278C19424;
	Mon, 15 Dec 2025 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807134;
	bh=UXO5Hf9pen7dN3s4a7cAeEkZUpTFHG2af1g4MTOaqxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SbAtVI+UlQwJQnS+t9PCSku9Z/dFSQbQwlW3VYKoXNLpHJ6pmVbgbds9PoBsp52PE
	 fTSUtGZKu4Gg4rcPuhsotpN52u0B71fQ6Zj66HVGqqCBdM7VcpxzTlJYZo0HPXL5W6
	 gk431Gs4osH8/7uqrn3Rja6+xQSKET2meAkFgiHP7lhBOfueHBnePVR2ZD6AkXexDQ
	 Fjy5tkRLR34I/5MFJVufdHQtzhaoJLHddbPdVa5RpTTGOCs+1ZzxQHVcxehhwEXgqe
	 BYZE48QI67Epc7RAUTKvNByPHOSSTdP4qR3N+Cp2n6VuOpPrmhMAmQcvN/u6E3ZcKR
	 2lgxEF2KoOBAw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: catpt: IPC log improvements and code
 simplification
Message-Id: <176580713295.161056.3659304742036550658.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:52 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 12 Dec 2025 11:38:53 +0100, Cezary Rojewski wrote:
> Entire patchset provides no new features and does not alter the code
> from functional (user) perspective.
> 
> The first two improve IPC-error logging 'mechanism' and align the
> catpt-driver with what's done in another Intel's driver: the avs-driver.
> In essence, no need to log the error in every function, let the common
> handler do so instead.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: catpt: Move IPC error messages one level down
      commit: 384b13038715f16713d1b2bfe5fb927c8437e48b
[2/5] ASoC: Intel: catpt: Update CATPT_IPC_ERROR macro
      commit: eded4483b8a21eaeb0886ef6f961ccf4e0d9c976
[3/5] ASoC: Intel: catpt: Simplify catpt_stream_read_position()
      commit: d44f62b09b1e97baee3b10484a1c3c203bb83caf
[4/5] ASoC: Intel: catpt: Specify image names in the device descriptor
      commit: e97e07138f956a551895a9556d1a929978a5346d
[5/5] ASoC: Intel: catpt: Drop superfluous space in PCM code
      commit: aa30193af8873b3ccfd70a4275336ab6cbd4e5e6

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

