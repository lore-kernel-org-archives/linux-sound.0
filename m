Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100322;
	b=0BT8MSqeovfLV4lAgrLrUagAuEE5/R5zznD0mjV3NvvBcCSOj7DuMcq1DRAuwlrdeGP8
	 3z6bOI+u6xntWsCF9QpxrbuuUWsGLgpFswnKQX4GdzQ2XvAzZ/gAN41JKh0jOTBe5k/dh
	 bVTwxSpnUbaWYW2VWp0IXzLJ0Lk7JUQtK201aYTURXwkgxToMO6/sEavVoFaPjgYRupTu
	 TEkqoDrdH1hSPL2suS354MrrBJcNrAyHxvgSSAkmjR5sdd/Gw9fIzWG/94A6fr2nyQyIj
	 llPsaoO4vzBw/jHMj28snVAmECRARA2cAQQhW28tKqr4psHQu64nZq8pfvkj6zgq9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100322;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5s6v+hbsfWKHJ3fienVPYESGeXZvgXVHoK1wiKh1HDU=;
	b=t0dRglLbEnGdzbQsOSw9rgRoemPxVM+gez2rFx4W5/nPPByrPWVnpMbRWypL3YKlmHCG
	 N18E/pH5XpUOmivnvi3k4qdNI3R28uTiLnDiCP+OWvYoIBTfS/0DPjHRM8IGLd/SGt322
	 UyvcBgz7URHchLHtccfL7XdcDo3Ai7sJAjxL59FRPQQH64pMV1T2tcR9thLFev12XW8xm
	 CIk8nOnZ0tOW/C5dd9W8pfXNdtRRX1IOd1Pgc8l/FlntrNFDxSEjAXq7ZPXPwogJwaGbP
	 aqxS2eQKOPLWzjDqOzZIgZ3kXoyd9gOt4SI2Nst7eTo2ZfYckz9II7Hg2awDjifSGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIxf2bBo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3139F606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIxf2bBo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD5F1F01825;
	Tue, 27 Oct 2026 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100321;
	bh=5s6v+hbsfWKHJ3fienVPYESGeXZvgXVHoK1wiKh1HDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LIxf2bBoM8zB3LXNqu6r6u5rVv7iOMOZNRY2rz8ij53dsL506Vw3PmidS7LdiksAl
	 mSBRSBjghCIKZu039tBAW9xTxuntIPY4aO9Uff7mhRPQV7WTCbpdeVmSUtkMUftv9M
	 bHyU5FGtzNsTaeCFo2bzIzO+Xe/nMX7iaKis1CmME9SznyrP6D2Nqjgij+sSQjAQ/I
	 F/Gy5t5Rut1yDte0MkCnl6c3ehDUEmdrTxK+HC8/WsgyEmGMn6Hi3d2ugwmrdhNyvP
	 /P8biqCW8SwgGQZIffeZQvQ3+dVDiRXr66FQU3SoZLkb0UyRS6jnYtdiW844No0b8H
	 ugX6Bf6voB/RQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 925511F4ABFD;
	Tue, 27 Oct 2026 11:25:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
References: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi-intel-arl-match: add new
Message-Id: <179304288553.199157.12007515175717019184.b4-ty@b4>
Date: Mon, 26 Oct 2026 19:28:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Kp4sBr7G2v60z4rGoZkfQ6dBHxXFdZSvviqugsC+F/4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIedMlxHGpb4PAgcMrs2KpsP8aL375lh9oLxt7oqA2Qm
 ZMolRnWUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIkEKjAybP3bwnAhoOV8DVPE
 nfmxNU/s/5b721sa2amd74vYu6RzP8P/uheegneTtqUa3nx/ue/z8Tk97x08JlzNVqpqOTdBecU
 XbgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 09:15:30 +0800, Bard Liao wrote:
> ASoC: Intel: soc-acpi-intel-arl-match: add new
> 
> Add rt712 and rt713 + dual rt1320 configurations.
> 
> Bard Liao (1):
>   ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config
      https://git.kernel.org/broonie/sound/c/d25ac9e30cab
[2/2] ASoC: Intel: soc-acpi-intel-arl-match: Add RT713 + dual RT1320 support
      https://git.kernel.org/broonie/sound/c/51dc835b59ca

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

