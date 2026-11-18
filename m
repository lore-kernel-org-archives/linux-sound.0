Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096400;
	b=P8dtMNSNuRgb9wwdhm7wyxd5PnAyo5gwsVA/iOlSkHU2h7J+uYaPW+YnZ003f/EIn7Dc
	 DfAVU8gpNYaj9zbbPOLO0lfSgnuSccgqhGTnup9WDcSIwFFPJ6laDHsyyQdx85/QXJrGT
	 Y8nDkJbJ4h8B/mL3yyrcResc4+RVtCtoKJB98gxwjomwOHxfFnlGz06U4L2pEa6Ov5Z/F
	 Cmc/LiC/W4x1mE07+zKke9j++P4QKG5qh/6sGs9g1uGx0q3x9ZokwZ0ug0AK8NxzymjkK
	 5uP4MLrzFDAt/d0/R/Mdhwp80zTiFhiokmpxGpCCug94REpEsKd7joEBorRizV4rbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096400;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yEHuIKscNBcr2ODtIvDbXvMU1VdStlgHKQaKmCUfC7M=;
	b=xM9JBMiaIDhVtMe/k7XSfrgfz+rlTxV+onLHHymf5F1AagVwH/rj9uYxCmgDEogZrOPC
	 JlUAoDHWNMIwVjscKKfoVippnVOGsyO9a8OwEPd1ZYVKd5nw5sgcUyAznvi2iiURt0BIR
	 TuZSHHwnSJSmcfS5cWTSqXITikxwIhAHIic2p6Px8ZiG4dx6H9qyOJYIgfvElNJO/UjsO
	 kajb+10NxpxLYFFuzrB1FY1Iu4Y/l7Ly0zKCnTZtQWfQDSBtZGqVT6huBZS1PktG9/Qrn
	 Vx2Ce8y/scNKbZVy8RGaVi+pig2w40esuAT4oaWuFPsUtIQjILFCJn989ELABLujpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkMf8ITB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A262E606A332;
	Thu, 19 Nov 2026 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkMf8ITB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CAF1F000C9;
	Thu, 19 Nov 2026 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096400;
	bh=yEHuIKscNBcr2ODtIvDbXvMU1VdStlgHKQaKmCUfC7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hkMf8ITB0dqSeKaBr/vbFzlLk09P602us5XrF5yM6T3pYjvU7erMD4smeTfRHvFlB
	 QVOaY2EtYgHZiWiCHU6Qe+IGpGLuzsZ5//DgDHfi+4hiJyDFta2aRL8ys6g1MH1Bb7
	 HiB/1axhrnqqhm4r9SaRxmrMP4tgixAtGxprEhdaHgZ1A7J71vsLyUZq+nXQGZOBSt
	 PV6QANKUmtkaU+gsBp2UAMetB2S0pWCo5XtDd+LgIoJMDed0a2tRbtvj0TAcyAbyOK
	 swbC10WWZmKsZeLHxTM5n+jDnQD58GFVMzHCHe9wVBOIhMFALb7G4pkrRPtAXDc5jt
	 NJcbsSQZWoFhQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
References: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: common: report line-out plugs on the
 Headphone Jack pin
Message-Id: <179502567183.810609.6836739761636920522.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:14:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vEdsMOYSGYQgjuscyDjbKmibDWbAMiNJHEbk0zfz2jw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/fc5s5L53z5/SxdPMe6td0RVWNYUXjf5wd2659u7f
 N8PkpMWdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi+qUM/73Ni34Zzl9fmX1S
 9EHgxxrelY5Fn+4vnWi0T6Kybe3Zd0cY/kq+uHImj1cw0EZI6vsipj+bo5hc1iQ5cl9mm/3vysk
 UM0YA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 22:45:35 +0100, Ingo A. Kubbilun wrote:
> ASoC: qcom: common: report line-out plugs on the Headphone Jack pin

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: common: report line-out plugs on the Headphone Jack pin
      https://git.kernel.org/broonie/sound/c/b610f9cd00f4

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

