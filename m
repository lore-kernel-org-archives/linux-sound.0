Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD181D4178
	for <linux-sound@vger.kernel.org>; Fri,  6 Sep 2024 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725643668; cv=none; b=iw2eMaPHVuiaySrVvP6zTLXlQQDzNdFTl2GW0a28sNKLELLDUOeIuiiF1zB2rh7qF34mq8YR3t2LxkbFITAwhIr1yZ47yhjTHauTM+mjC+OPNB0qD2Mt9kXJloGyQ6REn8iRiLjoAQJsg54PsxaxQYtLPFOHY8dnyPJ4v5asi4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725643668; c=relaxed/simple;
	bh=kQgExZUb0QNCWWb9FyjNUTLveJW5ovlxcvn1zbGfi5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TPAOZdGnSCdkSJ/we+youICpN1vTe9Db7eU62AN75iJFB9m3pctDx7LcSa2YIB7AKTs5pAt5GC2HUCHdBe1PcauwH1oNecpuslLGPrt96GamwJG/MgYrhPthSmPYUvZJaQCjLCTDTbhl2cB/yJMHG283Hp5j0tp9hFpOm1ASAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2u2zQZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2u2zQZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8705C4CEC4;
	Fri,  6 Sep 2024 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725643668;
	bh=kQgExZUb0QNCWWb9FyjNUTLveJW5ovlxcvn1zbGfi5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T2u2zQZfOCHl3V+/Ildg0Pt8gRxl5vW9Fk16Q0xO1rCzB0U6uHozUhEny1ZLeDv1a
	 uF2eIwMSktCOyCxM9opUZMXUcZPNr7X8OfZNIc5oHG8MXsNoewSCqhyczri+TKIapJ
	 LxlAc4cB2FCBV6KqcdfLe/BnrKE58ZkeLT7SkxZnw02qdudU4UqG6fvgdqxvS5BjQi
	 eBicpxPGhc07GoCtJBWQBIjdhXwGKgutAKAmYQ1y5snQbA41b6zuv9aflmjLke5uEO
	 63gXRnEd4X8VfMGP08zu5Azipi+EGyR0N6x/ftwdGwtwUElCRr2qqE2gXVOXDzhoWG
	 Y6kxLIWL26yKA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
References: <20240906060224.2241212-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-lnl/mtl-match: add
 missing empty item
Message-Id: <172564366655.1106330.18107100946467129635.b4-ty@kernel.org>
Date: Fri, 06 Sep 2024 18:27:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Fri, 06 Sep 2024 06:02:22 +0000, Bard Liao wrote:
> There is no links_num in struct snd_soc_acpi_mach {}, and we test
> !link->num_adr as a condition to end the loop in hda_sdw_machine_select().
> So an empty item in struct snd_soc_acpi_link_adr array is required.
> 
> Bard Liao (2):
>   ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
>   ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
      commit: c4246f1fe9f24f8dcd97887ed67d8fcfd91f4796
[2/2] ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item
      commit: bf6d7a44a144aa9c476dee83c23faf3151181bab

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

