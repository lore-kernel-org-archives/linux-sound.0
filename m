Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB3B194C96;
	Thu, 19 Dec 2024 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634478; cv=none; b=fEM4Ey0N1Von5qzXgnEsr3LHG/KnLBi8cMZemOvQzUM1Yy8UBYz2vYxEYUBbjQo593TEgt4MdsuIkbmY+CQVWpzYnHORXwkMhkBCvJ8SenSXlJzjq1xSvE0oJ8dmIHqv2lunaYr6iTbiL3dkiDOYda/JdyiMT9f8L4ZeyIx2WfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634478; c=relaxed/simple;
	bh=eoCNoa8sc2154T7BfOV74YbVmzeD7YP4MAcMK3J5UZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rxd2yCwPiZw8jYyScih9DkPU9gJVa/F369gADtW4PVJsVSIb91gn3FX52QYSWEpotaXmE+P3mxHoVW1zy2+EXdjgkhzpWlvObRT8KJjjLlu3AhPs+DllLzBIsNNPeCBJB8hh1SkrewIvHu6rIvFmhzf6VNrBAxZifAB/jzcYm2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgzyyZSi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgzyyZSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14C7C4CECE;
	Thu, 19 Dec 2024 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634477;
	bh=eoCNoa8sc2154T7BfOV74YbVmzeD7YP4MAcMK3J5UZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UgzyyZSiaUmZy69DIRI21PnT6ha2X5jRCy8JoCz45LQ0RYNvtgYnNy4uaKbowL/Up
	 nI39xo2Csj8szyqe1RshRsJVW+0wZoPyY3q2EZiRtjU9EFU6zTfy02T/5kxmW053l2
	 pm6QRhBC1Iy8FZJX4FpaiVvCPwZfXofNIQuCdMVNVmhD+Rae/0dmJkaqVm8X350PRg
	 tfe3ouJqfYTGENiOCbCy3ccnO+oyiUE7sfO40MeINslvhwKg09qHupDLxkkqoOMPSD
	 xa3HNii9zFnnxCmpecfUYd6PCb+c7bqbSNCb+1DMQC0F+NBtEXuQytFlEu96jgLonN
	 KmCksujsY1MEw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
In-Reply-To: <20241219155719.84276-1-rf@opensource.cirrus.com>
References: <20241219155719.84276-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Delete redundant assignments in
 cs_dsp_test_bin.c
Message-Id: <173463447674.204333.2614618634992191633.b4-ty@kernel.org>
Date: Thu, 19 Dec 2024 18:54:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 19 Dec 2024 15:57:19 +0000, Richard Fitzgerald wrote:
> Delete two redundant assignments in cs_dsp_test_bin.c.
> 
> Unfortunately none of W=1 or the static analysis tools I ran
> flagged these.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Delete redundant assignments in cs_dsp_test_bin.c
      commit: ee37bc7e0144e312a8e990acdd4f49e4afa71f1c

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

