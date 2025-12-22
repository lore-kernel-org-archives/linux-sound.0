Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A941CAA78
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766432460; cv=none; b=LuSO3ToSqR1EgBWMGL1O/fF7MVd9ONh9+SRh8w8Gnry++ynwK9bB32RCSLk3/seW/C4i/3WlYvKYtbA1Pv+GWBoIDVBPlhGS10X8YhsBUhSmiLvKO5MkQvmmAVGF7oFolouZJ8e3gAARzhHxKlAM/HpMr/owppFbYhYey+n1d44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766432460; c=relaxed/simple;
	bh=ybcut6GydhKbYL6DOn3KmBa3ILU+nMRN3lLJCSw7XNk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l+ftSf9DmRC0MrXEILMelBvm1vAz5nFpnlbbKzr8YshqRcZ0UbgISwgYzfasoD2WbNuRhfKWFB6wxqeNdMDgJ2PSAo+EdMtVQoHvIH19XgZRQCYK6vHkgA2RjbCWpwY46wORdOIxZCEHOboCff2E/IPbBfFGOzWdpkt0XsGqieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBucnCmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBucnCmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE67C116D0;
	Mon, 22 Dec 2025 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766432459;
	bh=ybcut6GydhKbYL6DOn3KmBa3ILU+nMRN3lLJCSw7XNk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RBucnCmOKMl1seXW8AB/PgA9AeaKLkSsQJr9ri45YzUxK4MamDbSgL3uvIRppiVrs
	 GmJxQau8GLkl/iKz+DEkH+JepyPRFMkYGNR1a6twGBtsxBHC81iDP1LO42qtRWlMgY
	 Y17fzll/XPd/EYDSU8hVE/5nqqR1NzWq/alEH4svj8f/bsw5LD54XOPrKPMyLzCvUJ
	 yfphx8GRXbAP12WlCQ8gS0ZrJMuw4DcDqS7IC8mnHjKWUZTIM72ObFE5BW6F95jphD
	 XdrOO4o7uwqnSILe4gzgyPdpJU+cT/EcqbNoRcDQb+FnLODvWlamejMJ/apwaf4XCd
	 fNi3Uco+CCE9g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251222101329.558973-1-shumingf@realtek.com>
References: <20251222101329.558973-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320: fix the warning the string may be
 truncated
Message-Id: <176643245803.952913.12078144368679476007.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 19:40:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 22 Dec 2025 18:13:29 +0800, shumingf@realtek.com wrote:
> 1488 |                          "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
>      |                                                 ^~             ~~~~~~
> sound/soc/codecs/rt1320-sdw.c:1487:17: note: 'snprintf' output between 29 and 410 bytes into a destination of size 128
> 1487 |                 snprintf(filename, sizeof(filename),
>      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1488 |                          "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
>      |
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1320: fix the warning the string may be truncated
      commit: 8db50f0fa43efe8799fd40b872dcdd39a90d7549

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

