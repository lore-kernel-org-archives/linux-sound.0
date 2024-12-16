Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404BD207E17
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376819; cv=none; b=tblSsC4Xho1Ilfh4MK84We/xKWy6ygjPMXd19DJ2er0KxaLqEEedcJdXK1LBLMghRUCINwN/pYJzQhp8cD9VCvvSmz/hWJvbhrcYRAqWtD7N6phFnJnRF6NVBnAG9XVJjtWPcqSmeccpR1SMHMPDHTkkNfKyC5CY6TzWyINUznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376819; c=relaxed/simple;
	bh=9iNrrnVIaNBiDACjkCO0lV00cy4vsUuWRURqEHTw4tE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a4wFDiUBvt/m6eTJLNFXyh3fX2WRocFEujLVavTZasTlNtc+mQO5GtuS459YhwB2FzMPgRI7L32CXjvRA4AmniQWLYYwfy6QxSpOl+edR8qsu2L8Cd84KPyEk6APkIKGB3nS+OMfja3hn6yvdfuoHxM+O+J60a6fybVGhyhiU7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIAZgSRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIAZgSRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1457C4CED0;
	Mon, 16 Dec 2024 19:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734376818;
	bh=9iNrrnVIaNBiDACjkCO0lV00cy4vsUuWRURqEHTw4tE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nIAZgSRkBAU0TNdwNTGewnyg96mcf3eUjDtuTOs2tSu4d3kH4in5ntJzwn4io+Dlt
	 Sg0rUBcGPG615OYCXSlS0dBfzaRh6EsyDXS48YTqHAke00KbW+3seWMtyqnFNSj7aD
	 MVEVUKBkoPQfmq6zXEm9f1UjncSkZBQUR7kJEjeIR0DOjrcAv5SIwM7pjpKkmOEusq
	 oAnDwwowDuwrJz/ObRuW8jvPSlY41xbrqbOJ36y61TtYTeVmKVP5MIFqKmxuhhoCZd
	 xEVdVA/YzMZFC0DA0A+g5hcU43mOc7bSzvHn0aAxVNiW3RrixO9m+drip7lOeYAyBV
	 hNldUWcPzHfvg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241216032721.131227-1-yung-chuan.liao@linux.intel.com>
References: <20241216032721.131227-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: Add matches for Cirrus Logic CDB35L56
 boards
Message-Id: <173437681752.201561.7447030675625198056.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 19:20:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 16 Dec 2024 11:27:18 +0800, Bard Liao wrote:
> This series adds TGL and MTL matches for configurations using the
> Cirrus Logic CDB35L56-EIGHT-C board.
> 
> Richard Fitzgerald (3):
>   ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
>   ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
>   ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without
>     CS42L43
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
      commit: bf4519f4b1e1fa6286af5d331146238ddc580ea6
[2/3] ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
      commit: bc7bd5c335030858216581e7a591d02ebfdb53e7
[3/3] ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without CS42L43
      commit: 6dcc8e7f2bb7b748d75844631b2bae860648202a

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

