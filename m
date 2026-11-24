Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536083;
	b=YtepLPIMKVfFIZQ1iB7tqEH2hp3Ga3LV95oC/QVprknkAtFqAzhCOf/obssJmx4TEXsA
	 jnjznpoklfJXKLYS3Xj7g0D+zi/GiUBX+mSheNn7tu8v+bzLpz24qGivEOn2jVpDaXg+a
	 +Z2CR9y4jFVgXfY44eOJNWCEJaEj00y+J3dp0Jz5U3FwG9C0zedUDg05DmbUWqJkEII4H
	 ZlSsxP+xlfrarc4amMmq9TdK7fjY+1BEGZrn2dp8+6eAL0W+2Dy4imThgyBZJvS4ApELZ
	 /+aLfYAEZZYuT8mHgc4PcOAiCZ1fcVpVV1tjRM+M+q//TIYDKQ6CYTU1SUL9RBjRcWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536083;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PktzGNvC8aCyQfnjlw/S3jzDcAv/5mUKdGHerPfp2M4=;
	b=ldOhsOxeouGQG792YefIykOfbdKZcxEqfkPnxHY3OfEP4H4kMpIWPlg4tDn4oSWWvA6S
	 T7JC2wk8O0L631GOCCq3aYQu5J+IZQivmYgZimuxUCRDtShcje9ArgRF/R9QMES1rH8VF
	 /1vi1hH99NCVozy+s36nkX2Kt/ER7p8EF14aNPxeDrHqEtqGzbOCdLRapuwuyXquRZgi1
	 Umj62jQgvgGomUpo/vSn8IKanC7F+t5MSYt/OgPRussNE0juK5IJaTosRchyQzP1bQ3U1
	 2n4/BW7YGO70IOAMbSjImle5fNp29tjRIT0H2R0zDu6Ae4dQQ8OvhVTBMNdLb8tnA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8AMKnA8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F247606A31E;
	Tue, 24 Nov 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8AMKnA8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D6E1F000C0;
	Tue, 24 Nov 2026 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536082;
	bh=PktzGNvC8aCyQfnjlw/S3jzDcAv/5mUKdGHerPfp2M4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B8AMKnA8Bqm8hPzpFQhd6BsGz/zjzoy9PwqXhsYENrIgOINMXqAL8LZaGzNyztRqT
	 PP6jhKV7CcdkDIZsLemc2V8PXGSRwB7+eZ7BfdSTsFsBNtgCwLVGT3fvPFwJNLBgck
	 JMPNh2WFWwacN9VL8xZIKtj0ejDoCXQ6OcqWVsVi1sKgaoxQ0+T1o/bl4O2kS8pmpK
	 aoq+PTtEkibkhEuGPYOzTPwBAvzy0T+VrpH3++96MRk+BD167CvIOiu4kUGe3DffTF
	 yzzbhknQ3YU2cK68OmI2ppb7Z8orcUuYWkjx7J7cBI1t7R11O5m9s+ATregAoiqcXc
	 LxmuEgACpJiTw==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116110212.522478-1-phucduc.bui@gmail.com>
References: <20261116110212.522478-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
Message-Id: <179552778389.264265.15656602591905172713.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:43:03 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oeSQnfDbKUTfmp2jIdejhqYlZegz2av7F1bIGmHQXqI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZt5wTi7u2TMDz8GHOhSntLjJKv3Yk6Din3dbI28K77
 6anSlxIRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZyvYuR4drNR2cyzy/edHgb
 1yLbqFMZBz9l9j20+fCXW+v7Rx9lw3OMDFfWczSpPOW5Et36JM+6t8I6py5vianjk0eHA6NVBfe
 VsAMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 18:02:12 +0700, phucduc.bui@gmail.com wrote:
> ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: Clear busy_stream in hw_free()
      https://git.kernel.org/broonie/sound/c/98fe26341049

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

