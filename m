Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204F1CEEBE
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594715; cv=none; b=Hd2Iv9T4IUfVAZG9e+xfaq7Ek10U43Zfw1vrIGazfuWI7VbDo3WkMjKOnE4wovf0DvtV6Ofe7kr8AAnnOAv8HcWJS1VScyJg7jgEQjbBsOC2cAQRVhd0B6ZuqPZQ5h5OaSkAAql3nUz8u6ieGkufAdkhlZg1DDbczLlxK+RvsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594715; c=relaxed/simple;
	bh=MDh3tDdM5/ShzbXao3q3YILKnOAkao2F4+USObWoXp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kr0/rGqrc7nertJrsIis9S1RqIcKSV8m1TgH/3WyRlxNRwA9I8fuV/4nKhZc5YHHLmIJ3z1UcCt4QJehEKk/rqaAieM4UTap+J2C0fl1PB2WHC0xpf9oxSc+ZSIJhURqvit6tflQXF6KodZFqhB+6aUqsGtRloMczfG68XlAO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsaMbtS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsaMbtS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CA9C4CEE7;
	Wed,  7 May 2025 05:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746594715;
	bh=MDh3tDdM5/ShzbXao3q3YILKnOAkao2F4+USObWoXp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TsaMbtS5sOA5KHL11ko9qSmS2X7vmiVIaPg2wBterMRYuKbDDfhw4uZGjYEnwDqDg
	 SlRUOGKGiMHI0Y7Lg+jn4Q4BT/E9Di3+kj8RoA558OWnaUKQrDQFMLRkF/DKiWy/AX
	 bhXY7S9GIyYItbm5Ncb05FAYocnVh/0wp8sk7EIkjSNUMzI3cZKyGhNyto9d0rYVj3
	 jJWJ1NOJ9IzshMdTWZhg1VEZdoEFYs6i4Z2bFAlqFMfBAs1JuXCLHNaVszD1Nguw7/
	 VUeSFxxx8M27UzeAe98OyT/IeQuhbzjNmCcLhKYH4IhLOSyB2iWhXH2nF8CPyRdD/s
	 JRDQATRpFz6mQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250506014930.5408-1-yung-chuan.liao@linux.intel.com>
References: <20250506014930.5408-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI
 link/machine tables
Message-Id: <174659471367.4169088.439251442658806291.b4-ty@kernel.org>
Date: Wed, 07 May 2025 14:11:53 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 06 May 2025 09:49:30 +0800, Bard Liao wrote:
> Check subset of link mask when matching the machine driver,
> rule is superset match should be ordered before subset matches.
> 
> Priority: mockup > most links > most bit link-mask > alphabetical
> 
> Reorder acpi_link_adr & sdw_machine tables per defined criteria:
> 1.Mock Test 1st
> 2.Most links 1st
> 3.link_mask with more bit first
> 4.link_number number order
> 5.Alphabetical order
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-ptl-match: Sort ACPI link/machine tables
      commit: 08095e20995ad6e3648af7416c90163627fe7e44

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

