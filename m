Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A835CBD1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762895415; cv=none; b=KPhMMlGxxlyUYO+j5jmgCw51CqlFfbv0t/mk8DPanNUAc5H7gWzJwEQjjlpSucpMdab6k6DG66nq9Hiii06lLbEBweOppip2VtqbO1S48GnAa3Ov6qZqOraYjMBlqo0Hq5I3hEySktzFFIsC/VcMgma8ikMmSESyQAgJ9By6VRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762895415; c=relaxed/simple;
	bh=hOcz5P6kUQGnJucw5aeqEOA2UWi5WPaLsczOzjQVVpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I3U/qw/169JQEYOTrVO1KhGMAmjzUR/Y6VgekzyVIjKeICbxAT2YXUo0AYWN8NFKA7aXtUbTyhtxYqVgk4WGLmcki/3+g1B+8XSvybQwVxVy475nk2BJ2JPygG+3tfRdjW6N3l/YMfWWV/rXCdKVreus5CfSmxJ8FBC/5td8myA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rg0Z/KLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rg0Z/KLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C6BC4CEF7;
	Tue, 11 Nov 2025 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762895414;
	bh=hOcz5P6kUQGnJucw5aeqEOA2UWi5WPaLsczOzjQVVpI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rg0Z/KLpAHRLO25/T7/Gc5XFM/UxYdPMsWoup9BgZEPf90Wu4Sei6BIBb7GMb97td
	 aik4PKu6wlNZcAU97mcgpII3uHfkfHy8Lr6mXpM1AKjq8JvF3ik6/jHGoo+0PzM/7A
	 icnPm8s40mV7P5LQNoH3iMftvScPUuLv/LSDJcL6hnNGvW4VrnfUdRvdYzAxvDjsa8
	 2qbk6C8HrFRrxLrpeD3YXr/Q0x8zfdcCwayB+HbZX93TX2ueuiIH93bGObJw88bNUI
	 CNyCY3klA4aE6cYekT69VjOXtHh3LFKNIEmQ+3H3vAWl/E9qNQZwVTXL0xHC7X5+/X
	 eh4R1GymVi/ug==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
References: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: Intel: machine driver updates for 6.19
Message-Id: <176289541302.189249.11789985552214908262.b4-ty@kernel.org>
Date: Tue, 11 Nov 2025 21:10:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Tue, 11 Nov 2025 20:37:31 +0800, Bard Liao wrote:
> Add supports for new audio configurations on Intel platforms.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw: create BT dai link if bt_link_mask is set
> 
> Mac Chiang (4):
>   ASoC: Intel: soc-acpi-intel-ptl-match: Add support for
>     rt722_l0_rt1320_l23
>   ASoC: Intel: sof_sdw: Add quirk to exclude RT722 speaker
>   ASoC: Intel: soc-acpi-ptl-match: add cs42l43_agg_l3_cs35l56_2 support
>   ASoC: Intel: sof_sdw: add codec speaker support for the SKU
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Intel: soc-acpi-intel-ptl-match: Add support for rt722_l0_rt1320_l23
      commit: 38ecd1384079d5f7b6942b68496ee7e85aa9a883
[2/6] ASoC: Intel: sof_sdw: Add quirk to exclude RT722 speaker
      commit: 660d946ce6fd64678b4ed6b083dfc24c0f4d5a69
[3/6] ASOC: Intel: sof_sdw: add quirk for Avell B.ON (OEM rebranded NUC15)
      commit: 1d5bf23aa1e8aea43beca78dc5d69c68955e8871
[4/6] ASoC: Intel: sof_sdw: create BT dai link if bt_link_mask is set
      commit: f78d96c289da743d517f700d3fe7c6c43df667b5
[5/6] ASoC: Intel: soc-acpi-ptl-match: add cs42l43_agg_l3_cs35l56_2 support
      commit: dfbb57c2767dc128f6360c3e41136bff8fa6f924
[6/6] ASoC: Intel: sof_sdw: add codec speaker support for the SKU
      commit: 873bc94689d832878befbcadc10b6ad5bb4e0027

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

