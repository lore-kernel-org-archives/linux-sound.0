Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978662DC77D
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081879; cv=none; b=pGPcPkTbFzRDTrP7Lw0NaYSzIbPQ59hrHDRiVxkS5OVeiTnn1YLBe5A8i6lXaBHDPgEYISn3UeuRADkaIKljujKAhmUOxpPLvz1eFAEY/8VUD4BixQVLdyLh4+dEgZFfEQ678MuuD3tyTG4lPj/OwutuL3OyJQaMDimvVEKFAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081879; c=relaxed/simple;
	bh=cAlh1SEmrtoE1//iarYjz3DxFxJWhTgcWczXeKaBZ3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gpHsAbCR2XI46tvotIuHjptiHbElp4z42DMzdq9sA1zpzy2CrbEP/Zf5l7IONGn//hbDcHl3GWLnMokSi/b6eWhm6e5YAPIAosQV7xZKfWbeVREZo+kXu5GEnw5KdPNnBqCbunkUOXtP2UuqA2Y9GSd4SZrMHMC0vROZsxxBUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYhwgPoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYhwgPoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B8EC113D0;
	Thu, 18 Dec 2025 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081879;
	bh=cAlh1SEmrtoE1//iarYjz3DxFxJWhTgcWczXeKaBZ3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gYhwgPoRr6vTIZJya9gw2X2ti0N97eXqusuSsvZVvxnuXxMZZoIKtaqwdjm81olMd
	 u1MH5T5ehU6wPjA7TZpI1wvFWUnrR4vP5hqYSOARX74Y1AFAuvi0YAbYIZL2ghxPm/
	 EY+Hb41RwbN7h66GaAz3HbD/qtr4+JLQebLURNhul0p+C4SP431kMvIlerdV1DWJX2
	 43u3nWzWZFv7eMdKt3UUQLTLH5UYjhrvfyyWzzKxrS8LHt9UxNCc2aBafaFtGpQ6Ss
	 AIUV57Y7XolfykqbOCiOdaZsevSesv/pWhDZ7SBXTWJkS0H6TDRsZrfq6K8y/z0enR
	 fWsOjRGiUbiRg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20251216090601.3955252-1-shumingf@realtek.com>
References: <20251216090601.3955252-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/3] ASoC: rt1320: update VC blind write settings
Message-Id: <176608187735.237766.16435113488611332589.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:57 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 16 Dec 2025 17:06:01 +0800, shumingf@realtek.com wrote:
> This patch updates blind write settings for VC version.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt1320: update VC blind write settings
      commit: d05d125f4e123e23c89d002e9922f83cee7716e1

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

