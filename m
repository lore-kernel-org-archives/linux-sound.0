Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D64963CE;
	Wed, 29 Jul 2026 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343064; cv=none; b=bS9hkENrU20h8dyUxRMaDL+QAxMySyQdlo0mxR72z8cvmQAldde6vjTi06/4irWuPDwlLJpNBkJeN1GlnCICwsI7tzpaeReBLVkiMc3eMiEIwMVO1cMoeYt1qp1XpnxDAg+AUOEHVw11qR0JB47C+Kzbk8ejfJKlyt8ZOUJX97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343064; c=relaxed/simple;
	bh=w+LY+at3i1wtP5freBQv64xCeTkh+8ycBGr6lvULLpk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H+exxMoicWhyoNfWD78oY6WmwJf45l6k/Ot286q8nka4wYy5srSTR9YsndL196D2/cHiEC9G98wqkmkBbd44zm5MTBljN1NF355g5j0HRFpYxgrEcBnNdyDOw+G2jRBUf6Q2KblrpqI3Tg5gFCYKYzAw9bVsZPssmr4nK85MbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clVU+2MQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clVU+2MQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812301F000E9;
	Wed, 29 Jul 2026 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785343062;
	bh=+HCM0kX9dT01jkiSkFQppEmfi0MQQnG5asMyMvfSwCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=clVU+2MQIhFjgHCTdaYhVd87PvHZH+X4RHevgpJt1ptJkrY80zXMeGzY6mDJwcUqy
	 rjfSPSoFS3kYZDFjRN+V4RmA6kAowSMaiZyRctitnUdwX6KwmHIl/Nwqq0Z7SxDMnV
	 wWOhOyPihETxrK5FaA4NQiM1rj6Tr5Xm/rfT9Hz5Cu2ThOtLsHEDATa7gOf2ENrAcU
	 b/V+3OrZaOH2Yprv5eU3FPDgyB7JGu64sVYiYXhbqGaNyH3pMNfU08QyZ1ghksBnwA
	 fL3Ij4YycjW1thu4PPrgtmw2vDQKqrzxI2/IXFzwzp28oW7i1J8STxMYQrvmgtZY6V
	 /F9mdTzR1Ye/Q==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260727185814.2599488-1-festevam@gmail.com>
References: <20260727185814.2599488-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: realtek,rt5640: Make interrupts
 optional
Message-Id: <178533341943.172652.9595574921790565444.b4-ty@b4>
Date: Wed, 29 Jul 2026 14:56:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Mon, 27 Jul 2026 15:58:14 -0300, Fabio Estevam wrote:
> ASoC: dt-bindings: realtek,rt5640: Make interrupts optional

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: realtek,rt5640: Make interrupts optional
      https://git.kernel.org/broonie/sound/c/537601771adb

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

