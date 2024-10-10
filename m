Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B3C6FE16
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576165; cv=none; b=WzWfVIkol6N17y4GkKUnFEAqm0/j3sCefij/7c76BWozS16Py42h9uKwoAPR3Oc6SRkkr8Z6r1q4OjkriepgKPQH5jvcmWtKq7dGLp42joaFj727pKsJi3NdJ3J8iCQCfRA/+CWmKLBSwB6hGDPs9Ti0AGp3I2elsw1dXqOaTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576165; c=relaxed/simple;
	bh=mijplwD9Q2OFp8wW/oorF6O/zG10D4E1ROCbxvZgas0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kNdS2Iju0EWB444bofgEUIyuXcjR+qiXhltOFry4+k0zpiWPaJConZLT1idFaTs30pDatcVaNLQKrSVbSJ3Ycfyf7a+lmemKoSuM2pYX0IZHRcFjtNcO9HYFnDZ769QAVM3TIit3nFh+UXxUe6LPmz3Z+aEmZj6cSN5fYgWyEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ef6NVHf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ef6NVHf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6866C4CEC5;
	Thu, 10 Oct 2024 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728576165;
	bh=mijplwD9Q2OFp8wW/oorF6O/zG10D4E1ROCbxvZgas0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ef6NVHf43qppicKu3JR+VFGtjad2dPjN9Xy6AiRFSHMwp8wYAxdodzCfwxa3s57j0
	 r6qOIaZ6Ii4A8bWNKOqcMwD5j9HQzbgyxKUj9ULZzvLWrSJVG4unjGa+0m80RPxv0b
	 zS6P+nGv2eFMMC7UeFp1RVROo/HLFbEOgII6ZRir/Rg2e4o06oxQKuL6e5aQ9+5sSb
	 JYuu97XedlcaqgNxn/8CeOsy/FZOgHayB4rggSxhVrHjkceS+SRHsvLXFBq/spTmls
	 aYragKClhNKOCJie8ZnkCVBESJdafpRcpBHGxAPQi1QvJZIoRKkLbd1VS4oBSG4hnE
	 wAip+M/FOrNIA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241009081230.304918-1-amadeuszx.slawinski@linux.intel.com>
References: <20241009081230.304918-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Bump minimal topology ABI version
Message-Id: <172857616326.3841093.16231307578868969417.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 17:02:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 09 Oct 2024 10:12:30 +0200, Amadeusz Sławiński wrote:
> When v4 topology support was removed, minimal topology ABI version
> should have been bumped.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Bump minimal topology ABI version
      commit: 9eb2142a2ae8c8fdfce2aaa4c110f5a6f6b0b56e

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

