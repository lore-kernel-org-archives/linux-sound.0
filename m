Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5AB1419B1
	for <linux-sound@vger.kernel.org>; Fri, 29 Mar 2024 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715639; cv=none; b=t4gJZp0asX7q1ufuNYUW6ze8Ddv6pCV+B8JnBQTwIYnaL+aAXVlrRaS4pvLyLOBdhaHzZBgaKQ2AonwBQMoNyHzp2qJWPrXbyCOCHYdM9yUgV4JrYIRDVu1B6mK7AXTTMwNKlH9V+5WLiw/tasxmk49gAk9ZaS1767Lc2N7ZjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715639; c=relaxed/simple;
	bh=Nb4f6TVGhh/22asBtCA76xr4emI2+oHkh3bnCtobCUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lrvKi4QHhPKVQuB97/ACB2io09P2DAyUgKj990lIouzDAuJ27PqWMPzsizI7j5KwRFlz+SYGlzAa9S1AfiDRjNWlTV5p3gIswO+pgKlEuF+8ZUYOxEDYzsKjGArxoMUnyjuRtn6Mj34R4rvP8UB5ll1BYWgfCfPLsWCzDxeO2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN+OfN3R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN+OfN3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F278C433F1;
	Fri, 29 Mar 2024 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715639;
	bh=Nb4f6TVGhh/22asBtCA76xr4emI2+oHkh3bnCtobCUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fN+OfN3RlR8YuEWAIvD1/1UA2w2lw6G4F8uw5EJK5x1dOZHWu89EzUgicvIT9+toj
	 jP3doP3eioNfvJk14M0uKeVnKVTuwlnDhVPUjHtq/w7SReoXJKTWze5vE4qvCCpN9D
	 gU9L2B2zPvg/UTo+JWVZN1gCW3PuvqN6XNG6XyjUt6pBwO6brXp2Txe5hM6CblTm3D
	 yWKKlMMBQV4vT/+zAOBgQPVb2Zf/Y/DCV1bDEuGC3fjuJlqRGEFicOkLBvldP1hQ3o
	 XpHfXmqO/TGs+km/K95lMFYsgPn6lYJ6aJFp0HWfx2q1U2mLK9XHlwf+MLRCv/lxCZ
	 Dl/Ksh0FLh+dQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/18] ASoC: Intel: boards: updates for 6.10 - part3
Message-Id: <171171563805.7557.17331301843824250247.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 12:33:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Wed, 27 Mar 2024 11:23:50 -0500, Pierre-Louis Bossart wrote:
> This last part is the continuation of Brent Lu's cleanups. Multiple
> quirks have been removed to use "default" configurations and
> ACPI-based detection of codecs and selection of topology files.
> 
> This cleanup has been done in multiple steps/phases since Fall 2023,
> thanks Brent for this contribution!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: Intel: ssp-common: relocate source file
        commit: 94a944a8c4f9e0de87cc9c5bdf8861ae2f64d874
[02/18] ASoC: Intel: ssp-common: relocate header file
        commit: bd1222ad1746ab4325b982c720c7099c78c7b731
[03/18] ASoC: Intel: ssp-common: naming convention change
        commit: a17fea3880aea23fd8821ff0660268a680e0326b
[04/18] ASoC: Intel: ssp-common: module name change
        commit: e1ff45518fbe73c09c3d0dbe8bd5284bb3d25dc3
[05/18] ASoC: Intel: ssp-common: delete module
        commit: fe2365c298b51dd08def916a3339a84ec2a1fd42
[06/18] ASoC: Intel: ssp-common: get codec tplg suffix function
        commit: 2e723a79ec609871116d216309c1b89d2f61b713
[07/18] ASoC: SOF: Intel: support tplg suffix detection
        commit: 1504a768f6045157437693fbfb50ae63ca86ec61
[08/18] ASoC: Intel: sof_nau8825: mach cleanup for adl boards
        commit: 1934906b26bf8d1bd798fa11bf7058bf380101a0
[09/18] ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
        commit: 3822d41469fc20fdff0d83b20324b382ee7bd0e7
[10/18] ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl boards
        commit: d5dd7f4fc0b5633fc9fb665803f5e95d564c7331
[11/18] ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
        commit: 4b95706b4a25c239aa7a7d7feb455c364c181db2
[12/18] ASoC: Intel: sof_rt5682: mach cleanup for adl boards
        commit: 34f256537685437122c4d326266739dd3b3678c6
[13/18] ASoC: Intel: sof_rt5682: mach cleanup for rpl boards
        commit: 7b24d86c845ce3b1c7bdd9175cd7c51aefe9ba46
[14/18] ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
        commit: a2e678fe951c3820db705a2cb20ec0a32d752033
[15/18] ASoC: Intel: sof_cs42l42: board id cleanup for adl boards
        commit: 2872f3b5df54ac14adc5ea62241312d66bd001ba
[16/18] ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
        commit: ae33c9134d6e1a88c2e49422aee1474c03a53233
[17/18] ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl boards
        commit: 6d90e02ae8aa6bedf77110075e7eef3f24f6a8a3
[18/18] ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl boards
        commit: 57ad033ce09d4d0c866ac558fc3c4cf53cfb2599

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

