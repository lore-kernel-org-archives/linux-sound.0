Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61C71E7C0A
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497004; cv=none; b=evQ6pm59Q1xCoyh0MlE8n0DbXCHV7dibRQ3AGBS3N7EqbpWLhyjrC87hDVNxFzLeZSzNVFb9v0M5neewEoPjyU3zbzpT3fRHthT00Pe8z5qYB6rp+Et9Wi+S6c7ER0J/NUm7GTQ68dZQzHy8vO9NR/qHKVGFTZ9LssNeoem2BU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497004; c=relaxed/simple;
	bh=J5MwmFp1N3stK8sG1h2+t8PHpBfrtwEwitnUP1GCEcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ujKtns1U5fJopVz5We/GfGgrXW8B4VVwlMIxqNoJ4oBEvO+6y2Z4h3+Qg4zGVPFewkjG7Hq9Ee6KhN+wsal1Lb97oIQa0qhcU9S3oDN1idiAlBmmuuHcvWJ7mmWP2xLw2apefmgfxjOfxmayrD/lrD9NWinxg0iKHYQV53iOstc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebPnMrMT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebPnMrMT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4653C4CEDD;
	Tue, 25 Feb 2025 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497004;
	bh=J5MwmFp1N3stK8sG1h2+t8PHpBfrtwEwitnUP1GCEcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ebPnMrMTi7Z0QaxbooeOMBVc7QRPEezgUQbHkjOxjEBMJ/cKjdtKTBFRKtX1187+9
	 tcmZP6KGE2t+FS0LO2L+8+60F2PisIkemM9IdA2rS4Yrpz/2OtBcKjXEEVzin9h4Og
	 bI49xLCOpmQOBN27ivfB4ULKp//5zG59bxwgrNFEoG6aMj/Cy2HrmDu7sNgvd34DWZ
	 2aQrAy3+iS8Oo/jvwviom6EemqOVioXBK6lvkPMZezNHFsQxR33ioEf5vfP5Yp2N3K
	 UPnBM9tldjEGt3RF58FLqqu/pcb0sLX2vWkowUMuXGkTXNvrUiDLfos1Ovn1BJKaVQ
	 OkJSsVDKRFavw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frkaviho.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
 <87frkaviho.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [RFC] ASoC: ti: rx51: use inclusive language for
 SND_SOC_DAIFMT_CBx_CFx
Message-Id: <174049700339.77394.7312172743937949179.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 15:23:23 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Feb 2025 01:19:31 +0000, Kuninori Morimoto wrote:
> In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: rx51: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
      commit: 38399716e353776dca7f04dbae98a07af68f2880

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

