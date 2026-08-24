Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B842A339362
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739182; cv=none; b=uXpsE+9iaHyqJGz6txntdc3duFmt7kLgbjL3EpJHEQrzl9FdoQ6aeZV0HOygVW+DiXnexYrO8h/ixGBLdeXtCKfqLuC8bvMWDkHBt6ZihPlc3MxjRHdGjO1eCgaAmnB8uC9jzQ4gP4VNPbEFEcT5t4jdkmhq0apzwHEZwHBXuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739182; c=relaxed/simple;
	bh=oI7xAIUSHZg3P3KAoDSgG1grQ5mBa/nhXoyFToZI4as=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lvyO/5OLOe0doeWE4wpz0JShlK5kmljgjytdCXRma/6f2ksJeiz8WvSxLGRtJImE4Z3V4h0DMKZzH4qn9FdStObJc/Qr2lkhysZsNK8dXZIhV+DOAbaoxR14vPHsg0nHK/yM4vNOpZyxdPaSjJkxLKUpDlIu9zDqVtj0ks75A4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGTSgzbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGTSgzbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817A1F000E9;
	Wed, 26 Aug 2026 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787739180;
	bh=jFcw0XsoIdPNLk77ctRMbRnAkuMyigZdHfQoREf9XQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NGTSgzbvSgi15y6QpXxGNW/vBpadhLusQEQ4xNjZvMsfZtQA1DDjd0u3GARfcVah2
	 tR1ZIRkcn3tqKT+ZUbfwRGznX30k0Nbj/lFeXXj6i7EGaZMawX9/uWGdNdvqAoql0n
	 om5vS6ox0eqCYdTP7Lx1JyXr02iF+8Fk8y0+tdyKpaHf66+xOkJ6qWFQ3A7Q1paYBI
	 SWZbVAKDRkGunj2SbgWXfelGMsE1SrFNumbymUNuZR3SkDuPmjCH6oY/lMuYHCmD/j
	 790gvPEQM4rDv15yB6ztGW2soa29SaalMItWv3IbUQbOjZyvmBXVpqSmImrHNIaOyi
	 xKElMO/tSyVog==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20260824103936.3524080-1-shumingf@realtek.com>
References: <20260824103936.3524080-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt766: add RT766/RT767 VA1 device IDs
Message-Id: <178757686613.104933.2233147521645730247.b4-ty@b4>
Date: Mon, 24 Aug 2026 14:07:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oI7xAIUSHZg3P3KAoDSgG1grQ5mBa/nhXoyFToZI4as=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqjrwn7RAGkade9QswJm+h0ABP/Sqo29/dsuKU8
 ky4VssahtOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao68JwAKCRAk1otyXVSH
 0MgFB/0XJSOcyr/Xt564UkOp7rrIPgJHSfMv6SCm2F3lYnguwwl8208DjP0vaB6Slmrim5aL6m1
 80rEkoWDOm9bvYim4MVPGibADiVGa0BfsCLEKCBgbvEG7ggxFpGQH1o9iF4QAyu6TjVq0cOxA5u
 1yxSJmuVlNBonWRycv6aS9TL9JJ/jBeeuIMCmYqqnsLZi0TeGntlVD6jDPszuV7d0F2QHzxY3MU
 7zmmh/6gb6/2BNnquFu4t1zZuOBuQJQ4KB77Jpvpji2ublOElX7XqPw0YhFUfHeuVN4bXC61mAi
 HXCQrSNrKWRItgNjJ8DAr38CywaXakv/fjBcUPoHhcO78KP5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 24 Aug 2026 18:39:36 +0800, shumingf@realtek.com wrote:
> ASoC: rt766: add RT766/RT767 VA1 device IDs

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt766: add RT766/RT767 VA1 device IDs
      https://git.kernel.org/broonie/sound/c/60e73c07b3fc

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

