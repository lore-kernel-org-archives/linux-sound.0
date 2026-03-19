Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3E2D3727;
	Thu, 19 Mar 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933675; cv=none; b=Cp6RGXc/gbTE5kE9ewK/TH1yFp0cocanu/TE7XYKxRtdKxDIbxHf3gQpvrInMalI6BGIRzVqcv1VKwRkARHwQEKdQ4agvnNvfpRgWYR6W//tNGsRdEx713rjad/ZzwgQzjOhqYYwKO/Hb0QW6Lze+GN0/yTR3AFCJaAVkmN7lIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933675; c=relaxed/simple;
	bh=he34+0wizSFfqRiO9194UtqQsSk6XC+EjEbGeqPyUg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MaGyTDwxuw72wYmBgsdvHBZfQ0kG6yH44cJ0hsRAt2NXAONNeikWyKLph69docBzzwCjKr195U2KQOlsn7xjIdHCOjFUPrRWJtvod9p69jZ3MbA6IyKbETbsX/h4n9uM4XllU9JVmSzlhdUPLrG/3foNcCBOKaN90hIQgxrhpzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV286Fqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV286Fqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46378C19424;
	Thu, 19 Mar 2026 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933675;
	bh=he34+0wizSFfqRiO9194UtqQsSk6XC+EjEbGeqPyUg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FV286FqwTmAbInFmmGb5ZsTqLhk2z2nPeit3LuwW4Kz8fZ8q25blEnd4mfE3aAZ/+
	 uSlMTZcZzpsqRpGX8m61obtXVuk06BMvWYlCk4hWQIrRwKZiAdhsMLIezJnMVXBO/b
	 Txl7vP4qRKBA2UpvgU2gg2gMnCISqD0KNLh03qc8o/f6ItqEJ8DVJLqmaAGtilC0lV
	 Q05pV+UK8qADp3J56E8nY1ofEDmn+qDRxnqdltNPrNMsCTX4zoRICMKvV6UIGC+ukY
	 +xncu4Jnm1aiZnhL7BS4Oe4YOUkCipXs+mHuaWLGdAUmODbCqvXFYzgu6cEuKNOGU+
	 BBk57diBEIWDA==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 webmaster@raspii.tech
In-Reply-To: <20260319090747.2090-1-baojun.xu@ti.com>
References: <20260319090747.2090-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add null check for calibration data
Message-Id: <177392478513.62583.10628320822573233875.b4-ty@b4>
Date: Thu, 19 Mar 2026 12:53:05 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9787
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=he34+0wizSFfqRiO9194UtqQsSk6XC+EjEbGeqPyUg8=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsw9IhmZy28c6yoLeqLId7GseLZ94yv9rnfsF1de03T59
 WjtmzbbTkZjFgZGLgZZMUWWtc8yVqWHS2yd/2j+K5hBrEwgUxi4OAVgIjeb2P+nXTO73acXVnpR
 fu0liSLuhZsP3Xzv/njp94t3MhdPPLLVnPn41mNrpkdMi/Z7nZD+lvF6bNaGTfxfu8QqimYmr28
 tsPPPPWters82+dI/tabG+/qGUjeWGHuZlh2wzPadL+6X1tLDHerIXv2kSDZQuCH2ufKkDsfyQB
 FebddvnyWK9uZ2nbxVdZOz3TLq78I5mdFP6n3EVC7sFM+WKf/pYXpfN3+1xK29rMrpl4NWZTpqs
 3Sm69vJa0fnMDbfLD+vWeeYkZYjtLLw0Geh21x75wk1uz9VFqsvyE344riU4/TpSVVPnkwozzvG
 y3163mGFHVZeCitYdT7l5D14mL8poKW5LKRtr9L5T065AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Mar 2026 17:07:47 +0800, Baojun Xu wrote:
> ASoC: tas2781: Add null check for calibration data

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: tas2781: Add null check for calibration data
      https://git.kernel.org/broonie/sound/c/a437601a0a13

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

