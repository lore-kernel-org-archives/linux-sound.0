Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840741DE11
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876647; cv=none; b=mTsAUiezkI668GQaagr4wYtYwGxapMR1IapQScF0hVKRYE96WstRAWJf4P4TvTM11TzSQ2D0AQVWHbuYAFCqTLL2qkV4gQpNP+7AIM2akH0sP11hsWO079EMHn1+VtwY0GzG3Alaj7jIsIAvO5CH/6r0hYIwjswa+1OMAq5bsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876647; c=relaxed/simple;
	bh=d7QIKgSkVewpm2lMw/b8HB1M/3J/tkzbwW1qEFIPvZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RraOA5u73siJuxo/88eUw5w/CETr5+7WCcjGgAgobulYAwEoksQ+zO48jLxCMJO+STGyWU263OPUcP0j2HY8OhMtJ5BZZe55a5VHAIlLDwG3kt7zVqvGFdePIxfwX8Pa/dVgV8n1B17OjvfSljWgC5JgQoyFZ0PMwsjteffuTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAB13n2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAB13n2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0BB1F00A3A;
	Tue,  4 Aug 2026 20:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876643;
	bh=KEeVpHgZpSZalqpXqvMX7wqFc81+x7yoBk7UqqTPKLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eAB13n2hVFQGOcfDiuRd+B342pOkHoNsA6ap+klPZ5clBRUI0Li1dlZZAHn/LPGDt
	 vg+EWM7URXgaxuzhl6dMqr+s92wPyQJbGX4QVN+5/8KvhKPlUZLwfx+GMXwkr1TnM3
	 RvUXGRSHnK2WWN2upPtAHenZodraCK3yN0DrTXZJ16XpiwfdxG4OHdypNsmLKWaZAQ
	 zMJ89kavgH2WSfZ6yXazf1MC9KeLWYia8XbpRg4g1c7b79Vwj1bX6hG5EdDQsm9VWk
	 HYrnr2HqHSuWluH4SBioIlASA7LYLsVCXJ4sEYZzknQy5kHd2nEVtqPntRobxCB60h
	 cFPSSJ8Ga1pDw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
 pierre-louis.bossart@linux.dev, ckeepax@opensource.cirrus.com
In-Reply-To: <20260804104828.557228-1-shumingf@realtek.com>
References: <20260804104828.557228-1-shumingf@realtek.com>
Subject: Re: [PATCH v5] ASoC: rt766: add RT766/RT767 SDCA driver
Message-Id: <178586175031.111355.6139378699093022761.b4-ty@b4>
Date: Tue, 04 Aug 2026 17:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d7QIKgSkVewpm2lMw/b8HB1M/3J/tkzbwW1qEFIPvZo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqclCgnzvEiOjfz5xu+zguUiq7Pj4DpZsuy/bYB
 B0ZPa0C/xiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanJQoAAKCRAk1otyXVSH
 0BClB/4vFNE5yhKonp44FliR/mcsOJ+yV4hN3YwsfETi1KMdApnJki90PzjCyDDNG29nJuMSE+Q
 JWVPpYazT/TaQcsBerARNjQKUah/2moAI+qvZT5R1d1ClIXccoLiJc/wH2EQ9VY5eXZOxvy1gWZ
 NTJckcztrg8i/aR7EKYPp1udf6o7PqG8rPcclyuaZCDLiY0zjyaybpYowmr+8elYtdOw5mNsZ9q
 A014ooIUYKCTlRyC/KHcZwJKtYbLbYgg9KajGs/qfxGFwA/c2x5t6svnnugixN6shNN/3o1Wjt1
 jml/gqAQK8p1Jnt/XI4REVwNAVND4ct/xaXlev+2C5plTw4G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 04 Aug 2026 18:48:28 +0800, shumingf@realtek.com wrote:
> ASoC: rt766: add RT766/RT767 SDCA driver

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: rt766: add RT766/RT767 SDCA driver
      https://git.kernel.org/broonie/sound/c/b50ecf5873df

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

