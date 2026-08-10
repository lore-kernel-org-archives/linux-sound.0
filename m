Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E692367B9F
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378342; cv=none; b=RQ7ufVC0d5aWUS2KHNczMKPsq0030HKyYyJpOw2ubF4zKEHdhO35ZQFuzh71wOFkXHW90JqkCR8fk3TxCKXIlgY4O5CMJFsrsIoiiIrWwUyE46HU/hANOI+jULFiHHAdOTxXSX/4Vb0dj9FGGbM8/U+XYCtfcAMAEFpXUn2mo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378342; c=relaxed/simple;
	bh=M4cPzcJ/0cHxiu0O5B3Vy8cyOjv9mrbBjV7tzXGyLp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iD1XbYl56lWyWYKBH3v7JqPGmAfF099Ah/5TIc7uMh+Za6n15OOZ9fWy13jx4VdZl9BzqbmfJ0uWRow0utnYQ48r5du2dHDxspxRWkD6XXUDPLGwJ0NEkNjhfHE7/tiOJ7qZ2GNLjsXLSn6tcvVpuRUmTHvOvQ3Yo94XnCi+UI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qb6YzEsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb6YzEsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937E41F000E9;
	Mon, 10 Aug 2026 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378341;
	bh=P21q2syfBcJccUyrduOotH+gEl8ujvkcLOLjZpFnYSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qb6YzEsUD+1p32xZgqezGb+/69HGn6sqH4czW4Kz7UzYZBOsvGcZpA+53ePQVTNPj
	 M2MOyGquFunSbqsqoxzXPGIfXRfD3EXEbWir65Uph5HTHxCJTbJ9CkseCeKkqbeRF6
	 tzjRWKHmFGSxBK0H/bsnMkXq+FMleIfQR52XW2kaIX7naPofv0w9sMauBU+r6FfgiN
	 sc1o5kIdJOa79dmYJnj27cbSIViEHplKVMSDJntJk721vKekRBJqxNRobsHwjZVf78
	 u+XXuso7TtEFTP48HkZ5rTDn2z/H0TmYuUeieVFAhX7u6b9sBLnEnX7JQSZkQTW9jv
	 m+SOxASh9KrOg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260807000304.826-1-shenghao-ding@ti.com>
References: <20260807000304.826-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: fix clang build error for goto
 bypassing cleanup variable
Message-Id: <178636490557.155010.481811410480493670.b4-ty@b4>
Date: Mon, 10 Aug 2026 13:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M4cPzcJ/0cHxiu0O5B3Vy8cyOjv9mrbBjV7tzXGyLp8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqefhilTm7psbBAlOAGXNZ8999TlHstp3+ke61d
 fVc2GA78WqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCann4YgAKCRAk1otyXVSH
 0ORgB/9rTqpeuIigGaeEJQF6KEu+R8yqaOi7AeUfvexTK41Z0QDwycNPrFyTBdbGvwfON0Fh1gd
 ddpR61DmF18GJsFF0P4teqvPdnOHfp5lXR3ruJN8QDrC/IIj0wCaG+hnYCD81kUYYOuMne+oyuq
 OEmPKYyc5M4M4CotsqtRkTvgAtgP/AJnCmuVvSIcUP46F+JJ0EJ0mX2oybZxCkAT35fRshIHq6O
 tRM8VzUJYCee4WAIjPr5vwq2430JvRLm78L7LfW8CW5ahXVAy31MUK/WsYIPEG7sLY6Nwkd27mf
 CVBkCW8iRqFSWaNEe0Rrx6+4jttWyP4IBTzxZ5IIbuqsqW07
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 07 Aug 2026 08:03:04 +0800, Shenghao Ding wrote:
> ASoC: tas2781: fix clang build error for goto bypassing cleanup variable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tas2781: fix clang build error for goto bypassing cleanup variable
      https://git.kernel.org/broonie/sound/c/566fec6a3307

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

