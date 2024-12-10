Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01031AA783
	for <linux-sound@vger.kernel.org>; Tue, 10 Dec 2024 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837760; cv=none; b=rpMMeQHnwegYQtuGGWFz+xirT5jDJHnQKhpDaxzDCELPHZJqE/s311ojHBeOMs0Lz8721yPqNOVmPJ6xc7qvICkzMVuBuRpKITWPNSYMZdtHJOwTFeWp1BXMo/HozIkYfjxkLBPP9C2IvQpIv0ZBDMNTTJToyQ0SKeR8BcngzlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837760; c=relaxed/simple;
	bh=fhyyYmJR1RE4/z1ffQQoh+UOhBQdaReAMtO6Muq0Jow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PQiy9ESgdE3oPTZClLdRe/+7fgz1NrpVmtbPqTYUI+eUbGmYSS0Av609Z6BaQzF8EnkTl5+4obwipwVVhTQZf2gWjsQjXjiI6K1DJ+Rimc4915Zd4DBMkO+o7hvvHkPtaF40olKRR9hdEuoGqswW18/LCx4Yc4WIfYVtelDmYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP38xwdL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP38xwdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD3BC4CEDE;
	Tue, 10 Dec 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733837760;
	bh=fhyyYmJR1RE4/z1ffQQoh+UOhBQdaReAMtO6Muq0Jow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aP38xwdLAGwONsGnxW5PFmRmJ7PhnGil0fbNQM2KW0D01ZsxuCBG9pn3Ei9TqVDwL
	 yg1rAfYXx7cvmkdsDKk6adKn6ClQAvgbtGQvTLbDAZlSqGc89D3fZKNPXZ1rLq8bQQ
	 uQcsBMugu4dNvC3M2XCdK9Q9rvRjQyAEWqWnt4W2LPDbmbFnGGYxO2Px0/37lrHqaR
	 PKgwrGdXcJRmSWCJ3mrxVXQ0EFypOl5UtObbqCZ+n4nWsZwKpss0JgNTYA4aFDeKtm
	 Kq5OROcw6HyVredVh95NALPUcLN405VulOrp9DVkjASU8bBynNjj+IHWuiiavYVbue
	 USgoOteVWD/Pw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: boards: updates for 6.14
Message-Id: <173383775898.46965.15311345569707612423.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:35:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 06 Dec 2024 15:58:53 +0800, Bard Liao wrote:
> 1. Fix the incorrect cfg-mics value in card->components string.
> 2. New codec match entries supports.
> 
> Bard Liao (6):
>   ASoC: Intel: sof_sdw: correct mach_params->dmic_num
>   ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
>   ASoC: Intel: sof_sdw: improve the log of DAI link numbers
>   ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
>   ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13
>     support
>   ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13
>     support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: sof_sdw: correct mach_params->dmic_num
        commit: 4ab80a2961c75562ffbac1f80de151a978c31659
[02/10] ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
        commit: 90a73807fd8a6c044cc971e53c2cc602f3841ef6
[03/10] ASoC: Intel: sof_sdw: improve the log of DAI link numbers
        commit: 41f91a884f9e5d9fda73fcb30d87b72fb7526216
[04/10] ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
        commit: 7662f0e5d55728a009229112ec820e963ed0e21c
[05/10] ASoC: Intel: sof_sdw: Add a dev_dbg message for the SOC_SDW_CODEC_MIC quirk
        commit: 558d516e4b0f886f15ea04c83bf3ab0bbe62e474
[06/10] ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
        commit: bd40d912728fc306e0861c82af4a359d8691ee16
[07/10] ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13 support
        commit: 124d534c581cda93aae06b37351ed76af7b98d5c
[08/10] ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support
        commit: a7ebb0255188a7a2f1c9edd5660346bd5b17fb7b
[09/10] ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
        commit: a3003af649efb6f3d86d379d1e9a966ea6d5f5ab
[10/10] ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
        commit: d7f671b2f566379f275c13e25a29fa7001bb278f

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

