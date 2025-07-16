Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C65266580
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752687185; cv=none; b=E+MuiYS5p+6lLp9JnF3tevZUoW6S9fSX3b+MUh7IrU0P1++IFiHgyvL+KtF83oat9yHfuuOZBQcBDysdQtMk5urzdzKbM7ecuMl89fFpLogC9Nk0hO1Y2vYmb843eRMEeS8bka9le8NntXBMGVOLZS942mRhAfZlPKVQ3X/oq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752687185; c=relaxed/simple;
	bh=Ke8Ob/EuHNlQXTLMtuHmZVncmexGDMO20sv8GJCd7NQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IM9MJhLafEK9OsbmoN+EGvuR922SNDfj0usI0K/2Y0+GYq/116wx8xNCdigQJ2DOOGcX6oyIMRB6J04SujB4kpBeAu0G5knZtLx5EwxKd9LMOGwHbsjdDVAeYRae5V4nESlgBzP3qvZ+nsyVXnQUfO+D7L0J3PDJFSZxg9lAkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md5m4NjZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md5m4NjZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA91C4CEE7;
	Wed, 16 Jul 2025 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752687185;
	bh=Ke8Ob/EuHNlQXTLMtuHmZVncmexGDMO20sv8GJCd7NQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Md5m4NjZ0+TDiAimV8+DVnMqXXKN4+WaJKVUXSykTPXbk2rFu1gdfkO/6E33wFSWB
	 ArGGrMILsIGUS08MJGuSQflMQKqqyFddBtQkng6pf86HWgPt0zaBy4Agcs/U/Z1BJr
	 HmgFu9Txtq+InTpxEp+ctBITSXByjLV8v/l30xSrzyN7RFx0mz1sbdOFmPjK+zsuwX
	 4GHoZduf7VeZgWTRPVL8FE70B5o8wm4O8GWG51/IAkOyIrDAhptEWPyoSXJozirV1u
	 4qbvF/UI2F+AniE16VNsx7fRsH6JSKQl6XpvBIlAMBGJOgi7fai3o0A4WzPezWHiTy
	 u00rDMx6J/xaQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20250716082300.1810352-1-yung-chuan.liao@linux.intel.com>
References: <20250716082300.1810352-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add HDMI-In capture with
 rt5682 support for PTL.
Message-Id: <175268718380.748601.1365064650654686088.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 18:33:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 16 Jul 2025 16:23:00 +0800, Bard Liao wrote:
> Added match table entry on ptl machines to support HDMI-In capture
> with rt5682 I2S audio codec. also added the respective quirk
> configuration in rt5682 machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for PTL.
      commit: 03aa2ed9e187e42f25b3871b691d535fc19156c4

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

