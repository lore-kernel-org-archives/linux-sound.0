Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56DE13C8E7
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466866; cv=none; b=Y+IbImFEkD7aszQ3K86Zdif95+kooYCYbqfn121Q9RuPr7SENtzeffy3ubgapFAQx670FLSMs4H7xxqLH8MRJ92TQHWwTvZoY4M9cvAM9SZzjwDUulGTswRXNlPX7CeIudGnjXEwMePRPkJcr0QqG1K3AfoJ282RecJ4wzE8vN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466866; c=relaxed/simple;
	bh=F6sUfcI9QR2xWONCcuwbnAKV6tmHdtr9+98sV20UKp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=enmtZX7A+ZbC4ziPQmBVfJt/Bo8oOCF0JR1XsbEnYGp9VfpQQSnue+Yg4o1iNDu7shhHb8wc1RLcRS7TTu1iph5S+UZoiVcZ1c2KxlN/nIBqab03d9uru9zFZh4dnLummpGam3c/0MCxAD1XpOx3PqRDGXs4oM1IqHyUyLvgtX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm4GiVxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm4GiVxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE24FC433A6;
	Tue, 26 Mar 2024 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466866;
	bh=F6sUfcI9QR2xWONCcuwbnAKV6tmHdtr9+98sV20UKp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bm4GiVxCedja/Jx8UhogGl+SbWC1b8kpxvHFXqwIeUVUWSC5TyjUPkf/AgNxR7rvl
	 Vt2DbbIDQfKO/AsUQr1ph7l1E59YeMCY7mTUo/i3tHUfjwwvHcW2cx5TJ2iqhSEGZF
	 vv3goEkdkspcC3gxH46SyAhr5riikrbWM+3L8R1V8ZqmxDZalB3tbjrZaOBHlO/T/B
	 OfXoJfpbqMft0kmLGiKDhULP7us89vMufHzSYHk9iSH1q0avNzCh6yjD5ukJ//TDdK
	 Wh+ZFtWetwDNA/NKVNFtVcIqsQmQEZQZLuminZvR2hkXLn8fn3WpwMd1ClMbXDcOZy
	 MFZyGYC8jeNQA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/5] ASoC: Harden DAPM route checks and Intel fixes
Message-Id: <171146686463.132239.1157973134119038922.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev

On Fri, 08 Mar 2024 10:04:57 +0100, Cezary Rojewski wrote:
> Set of loosely connected patches. Most impactful change is dropping any
> permisiveness when snd_soc_dapm_add_routes() fails in soc-topology.c To
> do it safely, disable route checks for all skylake-driver boards.
> 
> Relevant background:
> 
> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
> failures for Intel boards have been partially addressed by commit
> a22ae72b86a4 ("ASoC: soc-core: isable route checks for legacy devices")
> and its follow up but only skl_nau88l25_ssm4567.c is patched. The rest
> of the boards still need fixing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: Disable route checks for Skylake boards
      commit: 0cb3b7fd530b8c107443218ce6db5cb6e7b5dbe1
[2/5] ASoC: topology: Do not ignore route checks when parsing graphs
      commit: 6974857c2b2c7e2d2db59c0e23cc42b0efc58cd8
[3/5] ASoC: Intel: avs: ssm4567: Do not ignore route checks
      commit: e6719d48ba6329536c459dcee5a571e535687094
[4/5] ASoC: Intel: avs: ssm4567: Board cleanup
      commit: 3a2be3f05110fa1a5c682ff72a26681ed4f54cef
[5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm routes
      commit: 60c10c678b582d41532fefa12667d8adca75811b

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

