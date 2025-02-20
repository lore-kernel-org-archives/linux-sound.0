Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525F26561B
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740090077; cv=none; b=cJhfXduVB5Dox9elx9keiydKoeX/7wbgqLDaDym0qgmOQOP6k3sLZltU9jxrQTtwxqSxBC6NvZsK/j/ZPkHekoK8Ew0kl1cH7a50iM1qh8Ny5sBdevuFa9FRIieMUAOXGSntBHP3XubT4Na0RzoQ+o6G+iOLnnBnlYiZHuzjX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740090077; c=relaxed/simple;
	bh=xp6rwdgNl5NhLqDP/28VjlrFk+C3ejGyDChYt058O64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bv5XUkzZxGZu58h/DDKkIvVZPRkTQlnp7OvAZoE/iBKi2VeeoYx9LSUEj1EjIy8tZdI9SvSEaXOgbcQtsF3En5PgpharfcpbDnjWCW03OVf6lAFSLV7JFnUs6UvIDPCG+ErL73oWukXbgmlRF5Znkc+14I06BtG/Qlk0WmfLOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWtwKxmD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWtwKxmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D196BC4CEE3;
	Thu, 20 Feb 2025 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740090076;
	bh=xp6rwdgNl5NhLqDP/28VjlrFk+C3ejGyDChYt058O64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WWtwKxmDSvUFd4kZw30CAHTrcGAHh77RalLrF7t8/96Z7fTig69DRRRlF0ecKDxfs
	 9uzlF/Hn8EIw+O/yVtvET2UV5lwf54BjF4Pk+1YYyFvGe1wopFxIEDW4OOu7Zl8wzq
	 ol5j9i7zmgZJj4U+FbnSgrx7ZBLSHrRkasckGh5DHo+EcFbo9KOIGhawM/ACn8QllD
	 SYysgeznhzjCbPgzHnj2eGXVvyn05LCUc+1yTxcvqXj/em+Rv6uACyTglvNyXrblpl
	 +KRcSJUh7IRPaTXN9+cjkSm06Tr2SFhfnSsCF2sIfKKXDbiLlWXisP7LRK/wNgc/DU
	 wKHJ/SCf3DOCQ==
From: Mark Brown <broonie@kernel.org>
To: mario.limonciello@amd.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, perex@perex.cz, 
 tiwai@suse.com, Mario Limonciello <superm1@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20250220184822.916090-1-superm1@kernel.org>
References: <20250220184822.916090-1-superm1@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: amd: Add depends on CPU_SUP_AMD
Message-Id: <174009007365.2293478.17231446510159177793.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 22:21:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-42535

On Thu, 20 Feb 2025 12:48:20 -0600, Mario Limonciello wrote:
> When SMN support was switched to the kernel wide AMD_NODE instead of
> local implementation this broke compilation on the allyesconfig for
> some architectures.  AMD_NODE is only supported on AMD platforms, so
> modify all the AMD drivers that use it to also require CPU_SUP_AMD.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Add depends on CPU_SUP_AMD
      commit: b47834ee4485bbdcc6d36f086ff61c3efd8870d4

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

