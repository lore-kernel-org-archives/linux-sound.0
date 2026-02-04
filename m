Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5EE2F2905
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203911; cv=none; b=hfGoo9q+F0BCWnO6wrvPDCWvqnbhxMWA+Ilwu6W44+7nDpxuvqkyI545IZmTMmrrYHqjDcYcBpvOKeYVcpCzCM+5dQ6czj3j1FZMbqwRQ605o/Zs47qELabOLEs/Weq8zCbsQTGM5FcqCbj14tn54gkwotGI6pf9PhIqqNZwIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203911; c=relaxed/simple;
	bh=mVhUO8xTEHqTdVFMRpV7h1JJXd3v27DyysOAKu7b3DI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p1E9AWqEogL4SOQdPBvFKhFMfPuL108ZAuPWJJEO9P5Fbv44MlbN5PtNtP8MsImkdr+iYPhh9XlN7plAEk22tTTjSysEQWmBFm8+JE6AvqLGT2Dw9vfB7va9cMsMlOTG9uW9wV+qVyMyCC/jfkF7zmddCXkMF2kaEIQUuNyC+WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2k5WyBx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2k5WyBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A38DC4CEF7;
	Wed,  4 Feb 2026 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770203910;
	bh=mVhUO8xTEHqTdVFMRpV7h1JJXd3v27DyysOAKu7b3DI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q2k5WyBxgGmebayJ+SDqEc52ec9/+qYpxUThHQ1evNDHpiE3fh9mF1Ssqg6gPkWxl
	 +bs3WbBVLZSjrghFoYmdFewKCAHkcVbA7Dn2q37Cb/CKrkePBZBMufcTY4FLVgUbMY
	 1Bqy+k3viTirAUDFwOCjmoPnL7F7hDa8s8GJzeX8q4h/qi9cpA3KOjV1NLQXfs2LEB
	 wF2hGIfwUGffj9XMVoEQRGVayEZWVMhfKbJ6EJ8cUL4p+xN0rSRslPV+QSDHlV7F7S
	 DHOTdGGyIK6uLvD3H4uzYXF3qR5uc5ObhjZ5b4XcFatgI3jZ2fmnW4xX4U5BiGkd/H
	 5W7dvUIwOxzEA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260203095923.3741674-1-yung-chuan.liao@linux.intel.com>
References: <20260203095923.3741674-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: add SDCA property check
Message-Id: <177020390917.33145.17422572134462290123.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 11:18:29 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 03 Feb 2026 17:59:23 +0800, Bard Liao wrote:
> If SDCA property is not present in the DisCo table, assume it
> is present. This allows DAI links to be created from codec_info_list
> instead of being skipped.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: add SDCA property check
      commit: bb6a3c2db281c7d5aaa79b2a6fa00bcd10c0bb8f

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

