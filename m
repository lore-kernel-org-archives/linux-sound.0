Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096081;
	b=VnrDwt+MK5asjqNffXiCo+PK+xh4JFP+OMeIPWlLTifq6MKuTOj4HQHJMvQucywLRH9E
	 btwuHStSOjmeEELt2w00/jkhOM3fHjcCzMWg7tB8d6frIhYZ17bJB0it+YBnYSWxxYjgc
	 NemilziYFn4wAKXh63Wxm1uyh06LFexTex6jqeCmHHI/xMd+arHyKvE5v3rG8KHsYWkKl
	 ZbfNMZQrsFGQeL4TeASTcB3io9CuvbfBbxZ/QmaPZmbQrCmZdY1FUa3NhB67I64sbKYyb
	 UXR4hR5W5qwNjBYeOe20NpPm7u//FcnotgAy/+AzCVftKzyFSGYVaDqoM3I2APU/aQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096081;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QnyoGsZP9PR4xT3oQ4XUA3/GecLY7gW3slFTmMszXAE=;
	b=Pzn89qKTMiGWHqYqxSSoiCIWLZJxTeBrdgu8L1sSmMMXwXR6VqiAzyj0DrGnOMAvCd0Z
	 OmewPUeqD8lXyrV0GM01H6u6Gnig1W/iuBgAAzcKzFgFAcFhhSC1dTLpVIDyyvjTwFCF+
	 tmk1NXCLie0QWlcWstC+QMcuv10/uSC+YEIHO4gXK4FG3CZ/SdPjm81PiNRlsrV+YCSLx
	 o96NN1dm2Rnpx64YHkm3XLKr4G90KnGN/cOuUSYxJi9sOknu0UKMv/16l/jU/hoYVXxGC
	 L+73sU0bLVg5H1gyIJCp5oknT2909Y1xLTV06dr5vUdaaYf49niDYx8DtamauT5AV0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGAL0TUs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3218606A337;
	Thu, 19 Nov 2026 13:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGAL0TUs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7381F000CB;
	Thu, 19 Nov 2026 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096081;
	bh=QnyoGsZP9PR4xT3oQ4XUA3/GecLY7gW3slFTmMszXAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OGAL0TUsC7r5jblvySQnQyCFo1YrEYZiaVtav9Uh41raYZvxTwiyyScpEdgBcLt+Q
	 OPRb4bp0p4WsK3dze7Wcu2JU9KMvf125lhM1YjhBQKF0TWN/7q3iPbI97yDkbvtQ1H
	 ynNwvtv1mfzffEoNpa1SiZOlcfJpllPOJj81bHiMcfV6xZ5KTTrGof84g+sNppGojn
	 auXUfjiuvREeGyAjTKOUNOo4P4PtgXLpfIfsbqXN+uPyI73U9HKV3Qs4Q0lAk94Ong
	 7FBrefJsnWb8gRzou75cNWWSH7Fpcwsn91pfMOj0wTf0rAEwwsPbcBwRKkDybyoR+T
	 313ej3DIqGFig==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Karl Asseily <karl@asseily.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118142728.101180-1-karl@asseily.com>
References: <20261118142728.101180-1-karl@asseily.com>
Subject: Re: [PATCH] ASoC: es9039q2m: Enable the DAC clock at component
 probe
Message-Id: <179502625950.810609.5059504394834418849.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:24:19 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cTe6PJPekf5+NJxfPGelbMpG6soF3WCxLSxXxGXDdJE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/eNruDnpJsuMqxn7rxSv+RPw4gDP56un7JifzP3/o
 87lndLsgI5SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBMxPEMw//61W5dtvdYFjxf
 1p2rz5lx+2lStFZnJwvbBjWNTcyvYjcz/NPV43eLlK04G5+7nlP8KmONoh/3si93LZs3FUzcoG5
 YxQcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 16:27:27 +0200, Karl Asseily wrote:
> ASoC: es9039q2m: Enable the DAC clock at component probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: es9039q2m: Enable the DAC clock at component probe
      https://git.kernel.org/broonie/sound/c/27b63a33d6d5

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

