Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C929437E314;
	Thu, 11 Jun 2026 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201910; cv=none; b=bani97LMdQ33VMHwshcKsDVlPnlPzS9XZwursAszO2Xiy5xrJc8Eo15fkfiGapXzMidgtOcsebwk3/7AR/rt2KQ5AzRBaiqAd1nLtZO3pdwB/AzcrZSc0HWBHj6fBylld10MeUnszYUYudx9mnAr0sDRZmUjUjsxzdFl2SRAFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201910; c=relaxed/simple;
	bh=FgzklUGXjUNu2L4Fg+icg11qy+SobUnXK+pcyXpSyvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LllBj/mdzA+M+9Bo0j8wgH4ehUVaN7dxvNqVFojNMLTIFQxJu9HimPdMx+z7IuVzAtXcMHksUgJ2T2Ezlwpnnh08sBkbb7HIQrgu/a5DefW8o/S9cC4Jl6rmvHBJjPxPBYh59MxkXzLMJVP/+XiQ/rGDbY2Ql3VeBx6R2dr9DfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4FJ83ED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4FJ83ED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF421F00A3A;
	Thu, 11 Jun 2026 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201907;
	bh=QDK1kH8UHAvTtlHTiD81bPSYKlYhG1hyuzJocm9z09U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=f4FJ83ED8lFAxExuoVJVWu6KCFmb19RdXiUKKS09pj8hL/CkTJZ2SvOAT6+6nHni3
	 uF8Cg4i6yT0fJD5FXtVYYsdRDeOIhgCIbe2Fr0x+Hq6gCBdv5NWp4v40hyYiG1rPOn
	 Jj78Kok8KFSPLMjxy7byCwOfDdRhMWOVHoCQz4o7LsVn/dErcu3gq+LmBokmVpuUVg
	 7/bWPOoUH7O/NVArkDwNQIRb7vXDSesHW/yQ32FebtWy9WtUnRH6fyUNXTmGdzL+fe
	 sUHVmoQANGqzRZxOH+2U6kf1RY+HT8njuAsXvfSkdDxFwt2qD3ebe9PspQblgqTODD
	 VL+Z9A2e18S0A==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com
In-Reply-To: <20260611125359.19839-1-baojun.xu@ti.com>
References: <20260611125359.19839-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: sdw_utils: Add missed component_name strings
 for TI amps
Message-Id: <178118602519.447103.397643315723566551.b4-ty@b4>
Date: Thu, 11 Jun 2026 14:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FgzklUGXjUNu2L4Fg+icg11qy+SobUnXK+pcyXpSyvM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiyt36+eTn/+3KPCU0XxrqpJWFKgWaaGC29B/L8TcayCy
 v4/k5k7GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJ/Odj/x8aYtwpnWLTf2Q/
 8/wZxdsfqZ8SfZ3aayO6woblg3rt0TP8JT/4ssuZZwUtOZY2IfBPdOZl+y9cO34tyigxLSyrOln
 cuvihzsP3vssrP/QduuITEf2nMtSrRPKh94uGktVs3ZOZEi45mjKdc7PMXiljdXyqkmNmr6iNdO
 NcZbG/3xk1PT9c+mrnkLs52dli8qLIqW9OWPh3xi3XD3Q8YvdOatWGhQldJ0v2a8+qTC+L3rNzn
 0Hk9u6EvS+8I/3X+XWaXZ2xdm5bFPOu0Oi/Pa02LdP7VjLw1d0vTRP7fcdozUP56TMLfxaou1hn
 s17h+eaYtJaZvTEyO/TdqU1n+c38XipZ35r88YTzdM+dAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 20:53:59 +0800, Baojun Xu wrote:
> ASoC: sdw_utils: Add missed component_name strings for TI amps

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sdw_utils: Add missed component_name strings for TI amps
      https://git.kernel.org/broonie/sound/c/79bec4638194

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

