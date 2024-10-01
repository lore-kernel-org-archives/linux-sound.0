Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A21CEAD9
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727825174; cv=none; b=UIC1XM2WjNq6SibrXrbMuUyTyY2QaN/g94PK7lLoFaklYnkqzoivmt+r4VrfYKD+8Y/PPgqPmrNHxXofjxGP09SQ284Wl0W9NrP2JllLZueismmBd4uIqinfnOn20E3IdRnR6sMWDDwvgkPF7yVpT77mmd849q0XzpVQ7iVmHEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727825174; c=relaxed/simple;
	bh=UGDnuMXBI/aOrvP8EgpslsYBhs4h9T0atATFAJpFItk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YdErrGrG2MVUyv0BRsbNg5xE4FeWIsrANQxCgS6850MZ5SIVUDuLjR1zxe0XMawxJecgX7aQqFJ36C2hNlOcwVTx78m6qzer+38E8SR2VUIjXelsabg8KI8Kip2r8TQpEchZM5VEh8s/PdcAO8m87KZ3ZMF1LURpBkEq3/LLNJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2az8YIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2az8YIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF71CC4CEC6;
	Tue,  1 Oct 2024 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727825173;
	bh=UGDnuMXBI/aOrvP8EgpslsYBhs4h9T0atATFAJpFItk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U2az8YIpSrR2p9kBCGbpuDZ+K7Bbi41ca2N+3po/2/GssqUBpR0fGE2by6fLVZbou
	 REfxcn5TzaUIjzeGCE0+4eq47xcNtR/c1HWe7Vk7aUkv3e4+snoEMqwP808RiQjLve
	 NC8ZoNryfEIMxVPimBIDlOdopPaZruW2O98yE5dcnamURuVWgwWgtJAh6ReSpckoYs
	 KVZVbgyppw0ZsdozvDp7h6dy+9s84w6+9wFQgkNHz5LKpnljN3Qro+qxH8w8T377aL
	 gBhBNK8SxQaN/lWoZF3H+6S0dB82vCz5tBwzItxsXkZUA/8CZlkS2PWI4+xZJ1tufj
	 OWeLTaDFjUN1g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
References: <20241001061738.34854-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi: Fix missing empty
 terminators
Message-Id: <172782517091.2309357.16693220151436664573.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 00:26:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 01 Oct 2024 14:17:36 +0800, Bard Liao wrote:
> There is no links_num in struct snd_soc_acpi_mach {}, and we test
> !link->num_adr as a condition to end the loop in hda_sdw_machine_select().
> So an empty item in struct snd_soc_acpi_link_adr array is required.
> 
> Bard Liao (1):
>   ASoC: Intel: soc-acpi-intel-rpl-match: add missing empty item
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-rpl-match: add missing empty item
      commit: 5afc29ba44fdd1bcbad4e07246c395d946301580
[2/2] ASoC: Intel: soc-acpi: arl: Fix some missing empty terminators
      commit: cccb586f513cd999b9dade82e5a25b711d90a76f

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

