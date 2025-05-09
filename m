Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF31126C02
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754611; cv=none; b=d7M5fvpF/tcereagtKQSbk/EE1kESlsVYnK7EhPu25/iaz/VWkVsDacOvhnJs7XRRQOkQMCXPUMyp93ub7pSFUmsQOvHld2aO9JvbsDX4iyeRYcywsszjCxpNvWRolM4JyVrvIB5ySHqD33hItIymGEWCQb3M3Yrw7SzL6ClVH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754611; c=relaxed/simple;
	bh=fVrGRgl+Y8ZPcEdU80Y83+GIataki8ORusjnm4N0Iws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RCVtQQ3h4YMRtbyDFdQhViF6qHt+dcQ23GE3ntFwlizGv0d0egoJ3DFWQkwBNJKBdr/elaoP1BUd8EPAx1Gf6MLrz2C9MznjW/cMufuzZKY2lLT+QVDUoEGL+pY0br2nMWoOlkmVsyApygk1d9ItMbdoXk6UgPrZmJ4Ka0slEx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6MhGnWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6MhGnWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36DEC4CEED;
	Fri,  9 May 2025 01:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746754610;
	bh=fVrGRgl+Y8ZPcEdU80Y83+GIataki8ORusjnm4N0Iws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H6MhGnWsoin8lP5DAkbc851L72h2Q36XCedUKY92fi4FwVY68mR8QohqVRHPK3aO/
	 /6bGYu4g1m/JxelJQpNAAJ6tM08T4jq6EsnGqv7aXjIQTyUn6z2VaRWtuty0VBqodV
	 OwfQO7Uh929FjehoCkksCKQAOLYZrjaO0/9jHzq1O/FTbjm8WBv3nlemjkMpfw5gL5
	 /L7PtKsT4V7ChXti7E5eB8W0w20uL0mHVx1YUKYbEh9Ba4s1ntC0puae4egKkf6guk
	 v46RlJWl0jNQSlt1CVrej6/by77W23CeQ3ke0meoPYwa7+bjpD6cKo/syzM24Zb5BP
	 IkBtvnPaSzhsw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
References: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Add
 rt713_vb_l3_rt1320_l3 support
Message-Id: <174675460943.17552.8530843206670420174.b4-ty@kernel.org>
Date: Fri, 09 May 2025 10:36:49 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 07 May 2025 20:26:47 +0800, Bard Liao wrote:
> The series simplify the variable name and add rt713_vb_l3_rt1320_l3
> support.
> 
> v2:
>  -  Follow the sorting rule to put the ptl_sdw_rt712_vb_l3_rt1320_l3 in
>     the suitable position.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
      commit: e79cc43b4833d9f5651d64ca313edf598df50053
[2/2] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support
      commit: 62a5897607747e63c64a8b7a7fc212b9b29c2a7a

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

