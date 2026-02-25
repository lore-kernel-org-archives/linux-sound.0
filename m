Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340D3AEF3C;
	Wed, 25 Feb 2026 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046419; cv=none; b=Yu4BUoL1zkrao/FKeZnJCBMrfOmVGiD0/GtbchvqIBt83UQQI2ZAwVs6lRmzcnnUbSHM2yq4K6+mBkqJ4nKKIN1iK+h1q1pUH+8R5q7ABgHogbRNNhU7GBSlj8J/tkv4I0IcDMVU84iLM8xj4mxtzf1kWYiZUUs78udmxOpfcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046419; c=relaxed/simple;
	bh=OxyI80SkQKd6nKmFbFyfbzg7zpFsOJcRxKeYWLO/JmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S8+0ySDV/CPvLOe7HM5wsyAMY0tIqyAam9qW53zY57e/OE5AjdcXn3yDMLbbhPtigGsOG4ot3kPZqBE/XIflEn9m6rpShSGLnbXeJrNhRbnxh+fOSTCsSx4z49w/y2fo5rJdXsUmlOMPzgjiC4JFVwp2aRmkKLNvUtOyiZ4rtko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnG0AaxX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnG0AaxX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAC4C19422;
	Wed, 25 Feb 2026 19:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046419;
	bh=OxyI80SkQKd6nKmFbFyfbzg7zpFsOJcRxKeYWLO/JmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MnG0AaxXRyJdP84eUqVMzUfT0BxOFKDv/7qA7y2hWbZztjln6iTepuJSGaPJ3ORCf
	 pVewA1M9+SdYdQXtMzrlDY95/sNbsd5x9oVF7QpMt0VIPLjlSFPzlxRHMtymdscbHp
	 c8b5V2oLXVKBco5qxh+RT/VdWtWoiFUqsG9XGTI4fC15M3QsB9duA2cWN/S0BFDzdd
	 PQO5UNDhndhGaYBJjilxyNy1pL1tPZmsK1BIQuF1uVwG8IzLWpm6EvyQBGBLEZtpMX
	 GvsljISxF1bWY21bXSAdTlaAZs3RwONHTy0mgh3XOAfpw/vCGULJHovAtUIcBK9Ekk
	 8J/bL5q5jv5Ow==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260225112339.1179585-1-rf@opensource.cirrus.com>
References: <20260225112339.1179585-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Stop including
 platform_device.h
Message-Id: <177204641864.168100.275257750286969163.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 25 Feb 2026 11:23:39 +0000, Richard Fitzgerald wrote:
> commit d1965f008f22 ("ASoC: cs-amp-lib-test: Use faux bus instead of
> creating a dummy platform device") replaced all use of platform device
> with faux_bus but forgot to remove the header include.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib-test: Stop including platform_device.h
      commit: 260c3fff1fefc570d8f23e87953e181d7d248861

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

