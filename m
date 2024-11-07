Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F077FD
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941570; cv=none; b=s4TooYwFYTEWL9d1MYZ9E06XBdKhTe3nqH2ChLEBB391AmxnO/yiOsi6owF31KvDEWG0OcVZIPXQm+4PsSZQ9SDi4btzdVaQ2qakrxM4PI9llkphhSJeNsA6EZJ2LUhK4pym1v2kVl7ujeGs+hv4cB6+uAq6r7bFzPLlCjp24dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941570; c=relaxed/simple;
	bh=iLGmiadlkTjEpEqXYzG9liT2zh/k5PFpxJDI24gpE84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kc4MbBReIq6ZA5XhYKmv3DkozKCpT6MQOoKfyXOl54MtQtNyduRceEmTu8eLZ1sJOr4MnX7/dsRU7bdLF5JIesHQu1uYJhHiCWE07nXQ/TxEnGjewaZIU648szJlPOxCxiA1l9BWa1BraQi+JZhnQrHrJxFuO+zaFYpQZPFmEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnIfL+7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnIfL+7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F99C4CEC6;
	Thu,  7 Nov 2024 01:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730941569;
	bh=iLGmiadlkTjEpEqXYzG9liT2zh/k5PFpxJDI24gpE84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HnIfL+7g8b0UPNtaC4vY9Ew3mEVvXcsPkEZuFQfDAOKNSp45E9fXhzRac23Rsle2y
	 2SbAHQhNbxDccs8avunCN5AO0MkfD3qJ5PIkwxtIpjJmlaAjSWQRqTtxkQLqJQk5p4
	 zTetR9IjMdqFhZSWb8080hA8WpQc3+QBv+8SaXyw6ZYnLxEWgtXQWSsb6nim0uFkPg
	 uCy30XxmB24MuRACVuO++oSTEqkiDDNJxbqUC89JHEqs0y8xL/erb/cyMfE3ampRK6
	 MawyN8bgE7Y8taRcmnipNourICQ+rcqZniPH4A6VjPU7kQ3Ymi7mpJnIFxVnVSnhvL
	 qRe9cApncBF3g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
References: <20241106055810.10123-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: Kconfig: fix undefined symbol:
 sdca_device_quirk_match issue
Message-Id: <173094156818.261330.8273983756465145597.b4-ty@kernel.org>
Date: Thu, 07 Nov 2024 01:06:08 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 06 Nov 2024 13:58:08 +0800, Bard Liao wrote:
> Fix the ld.lld: error: undefined symbol: sdca_device_quirk_match issue
> when CONFIG_SND_SOC_SDCA=m and CONFIG_SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411021722.DiX1Y5sf-lkp@intel.com/
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
      commit: b6bd3f3b6357f727a177f31861144788eceda3c1
[2/2] ASoC: Intel: Kconfig: select SND_SOC_SDCA by SND_SOC_ACPI_INTEL_SDCA_QUIRKS
      commit: 845cb1ddf1fc2212f876db6df9d3277badd35709

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

