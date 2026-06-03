Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDF2EBB89;
	Wed,  3 Jun 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494370; cv=none; b=sCvu1b0T7D+MnlgRKV9ogOvgJADXpBAmkiTrCc0RLUAxANiv/0TVdekBEhz22EIS5qtBE/rAkTUPBDNLQCnPS5Fep3oRGiO2EmoFX1e3mhWrRKIi2qOtSAE9pmq1WdsOA5uoJ1ozJDFaTxYcZkH082Q/WLM5rclzBHaeuNH6ZYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494370; c=relaxed/simple;
	bh=iTS7peFxzwtnF5frmKtWAItro1LS4Pw0CPImeT2U50o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CKqEQ8+1wpOBb1GEpOsdl0tr2h892TXUnjBYHw+Y35Xya6ZJ1QbZHc9Fzppmq+y3bJ1zozMH4Xo6wCU9iR5Nh0vCACyreLcsYHUlQUG4Dm7hndusYOODApIIYP8FByMhG/dnvhmDIGzuquqpPKMVbalx1t2rgsWTOhjGNQf5XUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIPa35Hl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIPa35Hl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B1E1F00893;
	Wed,  3 Jun 2026 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780494369;
	bh=AT+eITPFZBNH4pWD+B7ApKZiUCMee3eICNlohkpDMj4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fIPa35HlkF/7U/7A6r84ENA+zrqhZQrakZbVU/VqR4ilCoMIwyh5UMgdjW5WTUS5K
	 NzGHV2pztiY6n+U1dNdy/BNHm4LTYQTyI4LvO4+yvyJSwKNZ5i4Ei1aAWP0Cud16TZ
	 7JBwi82A7uFcD6wnNaASVc5i2qFZ4HI2R91U/rJlsiLGTOATg59q/DUHj1JMgi88D9
	 /v0nOjDP7ia1t8wC5ng7bcAIhQIeU5CFpinUKfu0W/oZZZd5aXiOFnToc+Fny9vXo8
	 kXKXRAWlxbie2W/hk0ktCq23hAMz5cepy9W0JeBPoFzP8m+mt4uPzS0f9OjKwaLa7e
	 7uZnGY2VaL8aQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, chancel.liu@oss.nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
References: <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
Subject: Re: [PATCH v2 0/2] ASoC: cs42xx8: Add SPI bus support for
 CS42448/CS42888 codec
Message-Id: <178048783925.10172.17263652686786901191.b4-ty@b4>
Date: Wed, 03 Jun 2026 12:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iTS7peFxzwtnF5frmKtWAItro1LS4Pw0CPImeT2U50o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqIDAesWeEYjmOZhPkOwZTNpo1yURrck4PHihTG
 XtjxsY+Tm+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiAwHgAKCRAk1otyXVSH
 0NP8B/9F8LzWEFUQjfcf7SsIRP/A7Hi9P57gHFyLJ6LrVkt6AyEIQVWzNNulTOSFa+ArWRLuIzC
 vHaVgd5Os6FbR4XeMmbZUDA46CVbJoObpwdkbULLNnc4yuTgVdlEyQCrRWicYYUcnTkmwizCZ4v
 mF3CURjQ3v8c0usxHukmbkpZPT7MYieXmVHRKEp6fKA+wmIykmhKG0rP5rreTWK5TWPWjJBNLtI
 EalA0RstVeZMzFWxGwZcQSa+d90rG4VwABNJ4+aQXYyaehBZXzqQ29KppeJt/vib1bguZ28d3uI
 PVcfQXZ4JF3ui/8CkAn4mNCOMrRR/l0AXS4brTdoMp0+cDNN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 03 Jun 2026 18:50:39 +0900, chancel.liu@oss.nxp.com wrote:
> ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
> 
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The existing cs42xx8 driver only supported I2C control interface.
> Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs42xx8: Add SPI bus support
      https://git.kernel.org/broonie/sound/c/596f8d649444
[2/2] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
      https://git.kernel.org/broonie/sound/c/3158f585f4f2

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

