Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E671F63D4;
	Tue,  7 Jan 2025 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279149; cv=none; b=VluDjMKB6zjIYxz80bwttUBq9koGCeOuS/t7eAhoYwRL8E1gQXxC+HC7EreNPNuVaaGL0Zc75lzM02/UZN+gXQfNoL/DESXCpAG1E1bWD0h6hUc8FQxkAJbsUqDgm/L07Fdpult+WXJVSqpJZSftjbHy6Agy50PAdhO3NW5nZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279149; c=relaxed/simple;
	bh=VSUXRdNHoPtoJnEXPsuMTGCZh3pyBCS2HaUrTJu82zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MF1ftd6SczAJlph0p+iB4/2tg4CYvlapqARTkUSsHdDi9PNuh5Af5DSSV9K8V2C6/EPTLY4IFNMIW+KQzYaSVQIqFfQg2PA0P+cjHM03YI+CekgSxGr153VGorhBE0LmEgnOjtMQ2DwUEooU8xz4Q/zM5OlrV5YsCNwl44FhA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0T0Fg9r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0T0Fg9r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7574C4CEDD;
	Tue,  7 Jan 2025 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279148;
	bh=VSUXRdNHoPtoJnEXPsuMTGCZh3pyBCS2HaUrTJu82zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C0T0Fg9rwVDnVk7b56UHpA792BfTm/pW7T3WUIif017JQz3bnfXlVtmQ0CdjjcBw6
	 m2JYGGThaXxWI+pJ2KOU0jcYSdHTUPIFEY+B9HrrtyXKBTkUe3AXrmvU+JpXYYJM2b
	 Wafjq9aWogxzIYoViL1MaPYRVFKWN/MtRCRwK6W3DRJyPBOhTSbAAPI4DtZG2GPyoT
	 2Wk15N5l6QcotTnB2PkGi6EJ2esEGR8HyXhJmHDgkYGCxTbHnG7Uia/wwJ9UBHzaNw
	 HT2frFcWHPcQRAsH2CelHRwq/SjANOPd2Zm3yqEGN+hRvMLfiv+ub6RU/s6d3QiKNd
	 Yn8tkXeAJq24g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, jack.yu@realtek.com, 
 rf@opensource.cirrus.com, neil.armstrong@linaro.org, 
 ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, quic_pkumpatl@quicinc.com, herve.codina@bootlin.com, 
 masahiroy@kernel.org, nuno.sa@analog.com, yesanishhere@gmail.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Cc: yijiangtao@awinic.com
In-Reply-To: <20241231125610.465614-1-wangweidong.a@awinic.com>
References: <20241231125610.465614-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V4 0/2] ASoC: codecs: Add aw88083 amplifier driver
Message-Id: <173627914448.519339.12595534699937651368.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 19:45:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 31 Dec 2024 20:56:08 +0800, wangweidong.a@awinic.com wrote:
> Add the awinic,aw88083 property to support the aw88083 chip.
> 
> The driver is for amplifiers aw88083 of Awinic Technology
> Corporation. The AW88083 is an intelligent digital audio
> amplifier with low noise.
> 
> v3 -> v4: Modify the commit message
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add schema for "awinic,aw88083"
      commit: e7b73981380cefc9ed6261e3b53c37c327cab189
[2/2] ASoC: codecs: Add aw88083 amplifier driver
      commit: c51187903fe4523fd7f521662c1ae1f1f3174036

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

