Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9101836E4;
	Sun, 23 Jun 2024 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719163323; cv=none; b=LPGmb1wLqvbJUygtb4ft3Ufe3IdVTCsXfSQKyLG5hNzNS173Ib1qtZdHldBcIwhhnNGrCegUvFAf55RbFhE1NwRV43TrSuCE1K2Gn3lFctJXjpWVnceISt+tZ6eGzxJZeqxeaL8BXQsVxi+4Yq/edpUEYf1DAYkoVCFEpp6ven8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719163323; c=relaxed/simple;
	bh=kbUqe1y/sCRmyDvaSIDdO92RyLhQfk5VsnBOKScFbh8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HZ8vtPHl2l0mt61LNNaUiv2KPix7eKJjAcFRaPq03FGam/rIIfayhvPNKF6wvAromrIuQjAaWu853m24iFl99aRk9NzlwcuzCStH5MJWx11aMYL3d+LdCWzPYWtiwczpEfJTnVllD8oiTYYdazkAmT60Xl65X48FCv2gi2qCgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3Wj6ii7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3Wj6ii7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10F4C4AF0E;
	Sun, 23 Jun 2024 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163323;
	bh=kbUqe1y/sCRmyDvaSIDdO92RyLhQfk5VsnBOKScFbh8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=V3Wj6ii7XTFXZagfUvxNJnyDLlXpOWuzptPhaXysREeiaf04jfwKLcTSRHwK4l7Tt
	 QwBoGr45qmiOvy54Q/SsPguoQP/6XeXYU+U9OsV0xbct1Ad6btdyKsd0gKQ9MayuRX
	 9Ga2/NNIeva/U9kgP1syEPEKk82cFiKkQzHX5cKopK/lzW46GIYXVoDtRraO7VYqsk
	 gDVO/Xs+1OTLJRPtNyJRccxRDbfdaOoY23icegDDLKqDdTK28CCGPg+N4WrkNhSkdl
	 +Eq5gVZEXVoBKP8J+7qbkjMGrWtaaFrukTAGbLGCCDkpFtl435vtujUwtemzcWNOjU
	 7O3DaSN3gQJCw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Paul Handrigan <paulha@opensource.cirrus.com>
In-Reply-To: <20240620142856.1609250-1-paulha@opensource.cirrus.com>
References: <20240620142856.1609250-1-paulha@opensource.cirrus.com>
Subject: Re: [PATCH v5 0/2] Cirrus Logic Family of ADCs
Message-Id: <171916332142.350242.14097013262313353947.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:22:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 20 Jun 2024 09:28:54 -0500, Paul Handrigan wrote:
> his patchset provides ASoC support for the latest family
> of Cirrus Logic multichannel, high performance audio ADCs.
> The devices that are supported are CS5302 (2 channel ADC),
> CS5304 (4 channel ADC), and CS5308 (8 channel ADC).
> 
> v5 changes:
> - Add MODULE_LICENSE to cs530x-i2c.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
      commit: 0e2407ae89b340c385afdca1e1c61dd651ae6b35
[2/2] ASoC: cs530x: Support for cs530x ADCs
      commit: 2884c29152c098c32e0041061f8327bcdb4e0697

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

