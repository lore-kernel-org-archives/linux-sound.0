Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF822253B7
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829687; cv=none; b=gnNPrPUBI3GItplONAtC17XormChiksCSnEoHQybF14Fdo+pGvilbv6RQ7yfsU7DIzdhXlZEYMff8BQkyQgU9x/h1cnIj3MgpxyVtJeVwqc744HIA3UDgotSCwqllvuib6RgYn9f5Qu7cbhYBl9Q7d+oH97UdcHoDK7HIkNT9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829687; c=relaxed/simple;
	bh=KnbHooalaXSrP3RpK6HIISXjibis2g0smxwboJMQ+Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h9hHJtzLHLr6LzScae3ASejb5ougQEMX84sEtDMtS/v4btG0eD+G0l34g3WITzxn2nUp2cLQLIlmUAV0lq1R21SvffUGFv2nRI5KNEY1dqrJag8bMvzbpNhD6H0oWBWt+6a5m7UvuUPXJQWO/QMISJrmgdvswHZuUTPUrwC4uUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZmRcuFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZmRcuFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232E8C4CEE9;
	Wed, 16 Apr 2025 18:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829686;
	bh=KnbHooalaXSrP3RpK6HIISXjibis2g0smxwboJMQ+Xc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RZmRcuFbskDN5tCaUCVhQNB8Q9sxChR7oOkpyLi9V06lpspOF+s1iTAcu832cxZxE
	 AKWQ1rfbqTTvuEgCGtamP1DzQ1/JyZp/wU31ohkiAkfEwNDTomc51l/fSJOWnTQtPZ
	 +O2RfAZ1CiSwKFAFOzUUwhZ3cRcVkFht6EvMi8w2hvCOUW7Dwh/VQtOsFr8FwXuLO1
	 5nUOWj9Wg2ElhZ52rYYm8p9+pIPogHDmIVL8SzsalBrAUaJOYzJ0kQ2MSkkTJW7wAE
	 tPrWGSrbqMaVdaaL2tyxNAaWkA7HpepRczuqBzkLwcI2yXhQS6ZFg8NLzYU0of2mMU
	 ddiQrvSB3t+CQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250416092528.737845-1-shumingf@realtek.com>
References: <20250416092528.737845-1-shumingf@realtek.com>
Subject: Re: [RESEND PATCH 1/2] ASoC: rt722: fix pop noise at the beginning
 of headphone playback
Message-Id: <174482968489.823707.9066756869948799604.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 17:25:28 +0800, shumingf@realtek.com wrote:
> This patch added the function_status check to avoid the calibration again.
> The codec driver reinitializes when the 'FUNCTION_NEEDS_INITIALIZATION' flag raises.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt722: fix pop noise at the beginning of headphone playback
      commit: 91f4ca732495ea5dad39e1b041ef0c2a6e1fe02f

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

