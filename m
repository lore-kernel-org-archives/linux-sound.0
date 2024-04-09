Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CB512E1F0
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712668077; cv=none; b=Ly1C07JLFmpErczwd8IImlz7Tsegl8iEEHPh1PVeOR57AsWBO0vMg8pjIwzLb1QbVkVuAYmUuBL4aMp0TOJBCcPJyNJKMLYKxFkgTILxnFmiOqT2d0HvmZYwXQRG+Ddo5S3uA2BY+3P1TuKZy//pu0qKYyCK8Oeu691O49ooYvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712668077; c=relaxed/simple;
	bh=bqwaqDPwZwF2/ArlMn7guYurYsRr70Krg4VvKA29s3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YkYbUnRC7hKW9cphFOQ6GV0f/QP5BIYCx/fLYyCREu4aiwQMrt4LGpL04pOT4b2VpnbLIPNphLpzSYYijJSCwSqbdTMelLhBKg7FlELHUvqZaziMSx1uixm/A38bSzrO+Bmc4iWoi2wIVFRJfky00ReqccYkHPPbhFJ65A2ZC6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRJW1/JE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRJW1/JE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEED4C43390;
	Tue,  9 Apr 2024 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668077;
	bh=bqwaqDPwZwF2/ArlMn7guYurYsRr70Krg4VvKA29s3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fRJW1/JET2KcykiHBgr7D75cc+0taxIalUKuY5B2dwbdcS8L7/izvDDh2dYPYeX9s
	 0fHcpwVqLXf7a/XyB3WD8cIEIVqzUN6qiJb1eWRfmnwSGlanHG8uB0QqwsauxC0B41
	 hXVkVNTcgwlTur7Kmq3NQGvqzg/zWK2rZjijD3v6pnVLto3CsqPC1yAXeG8XNPtma2
	 +MfRNrQXjClifCCsYW3BHGjk/H7UsuJipp8Qocl5iXVu2BR2LzEcDxO/pc1AN8tLrp
	 Uw3uxBWNAbPPrheBAXlrHxuTUFD0frtZOcte6FAtkgfKA1/U+gm+rql0BBO/KVrLhQ
	 NzwEPTCWBCy4w==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240407191559.21596-1-hdegoede@redhat.com>
References: <20240407191559.21596-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to
 Asus T100TAM too
Message-Id: <171266807550.28088.15662614766655326891.b4-ty@kernel.org>
Date: Tue, 09 Apr 2024 14:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Sun, 07 Apr 2024 21:15:59 +0200, Hans de Goede wrote:
> The Asus T100TA quirk has been using an exact match on a product-name of
> "T100TA" but there are also T100TAM variants with a slightly higher
> clocked CPU and a metal backside which need the same quirk.
> 
> Sort the existing T100TA (stereo speakers) below the more specific
> T100TAF (mono speaker) quirk and switch from exact matching to
> substring matching so that the T100TA quirk will also match on
> the T100TAM models.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to Asus T100TAM too
      commit: e50729d742ec364895f1c389c32315984a987aa5

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

