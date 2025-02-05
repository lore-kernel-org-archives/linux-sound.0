Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F244822F3A8
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759477; cv=none; b=R5P6bGYdHBwcAUv4kXWD4VLdeFHBMREySfQDkZ+PXvdAJp/4dQ+fWVsH9s0XKb7MsglHm/fajmUqD5TdzyXteYrdVaEPq73wdGlZJH6XDJ4Rpgbz9hmBM261RcneoK6ZT2fwXBxd20LC1lMDOxualBxlrjP985mzfROHTHrkMJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759477; c=relaxed/simple;
	bh=JftbGjwJ3oBWd5BDHvrhqN5xfsGJTsfB/uvz3IkKkRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q609hYlwMeHyAaATWEL7H48xeAnUBy9mDOn1CURJ/Ii77/YFD0GcPM1jJjbbS3EO82oQf4HW7oUqMYLswEaOpyabgL9qDpN2jSlzSJsox04alhTeTPzDv7qBZqX/sqUwv/yFxfY5aXsZzUrZM/gYPftLhHP0FwBWEQdzVJg3stw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baNJKwZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baNJKwZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67E3C4CEE3;
	Wed,  5 Feb 2025 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759476;
	bh=JftbGjwJ3oBWd5BDHvrhqN5xfsGJTsfB/uvz3IkKkRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=baNJKwZvwSObeBTCiLYXk6GZCt77e7keQxrBjkXSaolaTDkMeedrqj2n9olubQa0h
	 vq6f2Q14vpkaPZrcIVCh6rXIiuuixZrsngz9go3cuR0qmGIrg4TnWsEqFUCHg3Io1i
	 Kh6cRVfRmzVI/HWUR3LuIgdUtK88neOOzCJ7pqx1Q7uya7jW2i8dXYXMuAuaG1HMB0
	 HML2onMXh5xJBK+yZ051qdJ/zQW0kJikFeucgPNODbNZoO9Y/707RiclbO8fkF+q0x
	 gFEOUAKBxLP4ESlHGHfE2SCNuhIbC4j0abGS1MUdCSNLBOHWzmgOxRphGzz/AQvOxy
	 X0dTyKYZI7WJw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
References: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-tgl/mtl-match: declare
 adr as ull
Message-Id: <173875947556.32457.4918142000030700785.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 11:31:32 +0800, Bard Liao wrote:
> The adr is u64.
> 
> Bard Liao (2):
>   ASoC: Intel: soc-acpi-intel-tgl-match: declare adr as ull
>   ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull
> 
> .../soc/intel/common/soc-acpi-intel-mtl-match.c  |  2 +-
>  .../soc/intel/common/soc-acpi-intel-tgl-match.c  | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-tgl-match: declare adr as ull
      commit: 3588b76db7ba798f54dee39a55708b16e1c61de4
[2/2] ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull
      commit: 20efccc53abf99fa52ea30a43dec758f6b6b9940

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

