Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C24052B0
	for <linux-sound@vger.kernel.org>; Sat,  8 Aug 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786193363; cv=none; b=MatUiR4SfwLQmKK72ojA+iWw5drIFJmNUv1cn/pYWfg5NpJBFRRPb9TrKBIflxWf3rI8bmLmBxVEJnW2jgw+4yr5PBSrB5JaxLxIzkADXhyPk7m2Hih9l1SBkz420KGGtr4jLB7coPPMHk8hUvt6VYwcyMuVPUQvrjIfoptZnNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786193363; c=relaxed/simple;
	bh=EZE5NF1/oLJYew3ZFz1+J0y8IZk14boT16IgtuW47iE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pt2NvYPFEYwbmSmbMyrVhr8KYH9m8XJIFjBbPdp/9nruv46rhPYAt6Q7cKKnEFqqhVNP390clGpClQ5zlw6uFMEdBTmehhrnFE7x5Gjd0e5c3eaC7SrTQqeSYhvf95rV8QWdGdH6wbN/gF1W/96vYiF9bBY3132itNxNUzw74Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQQJUnKA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQQJUnKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2F81F000E9;
	Sat,  8 Aug 2026 12:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786193354;
	bh=yzTPvBS9qWbSzLT4930U7TEuBTEg77R+VPcGQYmpA1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JQQJUnKALVPFz1zjyD2Bq7ZtxHXIrkQFsAy/S7QKAURZKWYhOAbOcvV/OU87jZa3C
	 swFPNQwM8nQPmb1wPcy6yblsb7zwo/k8jnWTceufz3G917wIi65lkP7DHe1aWmIje5
	 uRDjs3fmw2gF+BMOOEFAtFIzvgIhlGHsxV7YGzsqaQHS6xtIllcfYFpjZ66445r+iM
	 fQvrY9qLLrEVj0kNvmf+eBbwaOzzBzTHYGtXp2hXbHyNw6XI8RTOxRdTNeh9pSbdeJ
	 YIMtngmpLAFzvy7NrF9jrgxWdIL+WbXbmkqT5iU2rBdRajzF6SyP4glJpAdDoOeCuh
	 8Qu5uaixFgZOA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v2 00/44] ASoC: codec: use
 .auto_selectable_formats
Message-Id: <178611734857.279158.4751447893496466430.b4-ty@b4>
Date: Fri, 07 Aug 2026 16:42:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Fri, 07 Aug 2026 00:52:28 +0000, Kuninori Morimoto wrote:
> ASoC: codec: use .auto_selectable_formats
> 
> Hi Mark, all
> 
> This is v2 of Step2 of "use .auto_selectable_formats" patch-set
> 
> o: done
> x: this patch-set
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[02/44] ASoC: codecs: ad1*: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/b8c7c3723e26
[05/44] ASoC: codecs: adav80x: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/1cea95823792
[11/44] ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/31dbeb6d8869
[21/44] ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/8042806427c4
[22/44] ASoC: codecs: madera: use .auto_selectable_formats
        https://git.kernel.org/broonie/sound/c/0aec3e83e3dc

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

