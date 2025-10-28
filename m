Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6E12BDC34
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 11:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650244; cv=none; b=efqYBgX9X2lh3x1u6BzApnbjluUdt1TEhb8ruBbg5NJqacnHHb+TycbmJDSJ/NodCJxT0+glF7IC9bNwb1OmIpGuVm1UWUlc+07DrqQ/7gTf8wMoXAH2G/SChn7PU4PtcDD43fElvs24iX7LTeBwhjGz63zHgtGPYGoCxGR7c30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650244; c=relaxed/simple;
	bh=jLa2rDKRdYuHJ+bnPB8aSzbeYQkHl3ap0yM+hEdzSeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OcKWE87meAj5UAi/tnnyLqeglSOdkEVX8ldURodaoQld1j3YuAmMWZMtYrrIQi6Vl2CJCmILTo2beRUltm4tB/rawrEi9HGUlP4gxG8ruD0aVZR9AB3uGDSILMx6Xw7UVkXIrccMMUE/3/RcC9Z1djMda/M5Vg0Axy8iiYmVEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwV8WESn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwV8WESn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED863C116B1;
	Tue, 28 Oct 2025 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761650243;
	bh=jLa2rDKRdYuHJ+bnPB8aSzbeYQkHl3ap0yM+hEdzSeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JwV8WESn/+B/azfhGjtlrvMLnEs7i07As1jBGhVplyWsRWagPUtRy3QJVum4w865k
	 FBdl+Is0B7k1pmuw/rkihehRBDH4uxzJiPx95tyYJlQFMM5QaV/bBacjpsDBsYYjfG
	 BCIBevRnD/Rt28lhnPuwsk/IinHkJ//+gIBSViJzn6v6Tz8b5uhKlv3K+ypSr/PfJt
	 7Xf3H8TfWYeJFypMnn+I7TNcY5iQ3weT7+B8+6LFMKjhnDjv0FJLbyrQVXvHMflKhE
	 DpTufLd6RV+VOWJtaAN7SkGf27JnP00SIcR8pcqO8h/bnVUGrSpNJp8ZFGQR6vbsK6
	 Mtxdhj/QmMvpA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 Vijendar.Mukunda@amd.com
In-Reply-To: <20251027103333.38353-1-shumingf@realtek.com>
References: <20251027103333.38353-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt721: fix prepare clock stop failed
Message-Id: <176165024171.34272.5250868958229309021.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 11:17:21 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 27 Oct 2025 18:33:33 +0800, shumingf@realtek.com wrote:
> This patch adds settings to prevent the 'prepare clock stop failed' error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt721: fix prepare clock stop failed
      commit: d914ec6f07548f7c13a231a4f526e043e736e82e

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

