Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697329;
	b=QjLPC2o/P0KiFFBSM6uE5SFkY81Qh88RGm1H3Z/q7PZipe0spr3yBVAcRaahPIDJ1own
	 PEvXnmVsesOSHjrTa3VazVmkny5dxXxCKwn3PL7ypUkJYqK6afvVAPzqaurWqrDMvJmvg
	 8B1NSb3ItTvTRc89ucqygKAkLaEOwZ4r3P8igcZ05thBMZlPr21eNaIA4MZ4GWARtGzSb
	 vLJA4y5Fod0oSVGRCGzTHBrDP/E0Jx7PR5cL/3KAaWDlld+MzwZQAcMT8DRaVwFxLsSW2
	 so0jt8q0dFqEwRkLyaRE09iSejt/mg3RAjzUN4iCxaawgaqKLEl8L0CerV/jVlEMIvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697329;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=d1cfZ1s3IdLwP1yvfW6GV+7DJCtk9KIlEaPxDD/ONVk=;
	b=mXwA7G7LRh5bMuuPrlTqBJ58x3Y25UEjc2+H25N1I7jJbqeC2YORoVAyd6YuiEqjuoil
	 Az3To37XEnJPC5bkZm960fAmfTlaRUHx9xk2km0CjCawiXvY9W1tNJD5+GHPJDOQwCd4B
	 wbnTFv0sp2uobk1ucrQiVymdWHxtjrLtrMb9MJga72cXbhZzYDOSzrX56/OC/CKdnRDSh
	 TrrirYwReRF27iwLnhh/juSvbxAo1zZGbL6xmBA9YzB38Vh4Bft8UHTqXZGeY5AEP94/P
	 LjvHAXfXJnSg4PRHw+QZJfrIZoJVPymCWnTbC+mlIckoPniyVg3L06K41JCANRJL6aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfnMxuXY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B0606A329;
	Thu, 26 Nov 2026 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfnMxuXY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B001F000E1;
	Thu, 26 Nov 2026 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697328;
	bh=d1cfZ1s3IdLwP1yvfW6GV+7DJCtk9KIlEaPxDD/ONVk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WfnMxuXY2k3jsyQCdpwyYUsjwLAkEpsgAFW0LuMuzFoB9AFr2raneRCKSjpU1RH30
	 iBlDUfIe51mK5QjJ2wrTy8ALiW1yCAr1hAoHWg0VC1o/Ie0Kgt0/0ZU70QsMHJjhaN
	 wc0luSyfhFkB3hNe0Os1GFMiTq7QzNalAyPp89XcSbroFh88+ED/AHpPdWzhllS4hp
	 SiGUZCpfx/4P+urUi4FEMqCkye+ayG06N9gziJ4zFhdbhn9u5ENQQYJ8N7mYZ470js
	 ywjqc8kPjlYS5r8sj3nxNtx1g3zGVDe4PtiE0h0o/Mf9syI4TCZjm75GAq8m/sejhq
	 oK5BfMA7aGYiA==
From: Mark Brown <broonie@kernel.org>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnav Kapoor <kapoorarnav43@gmail.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261118093840.3514408-1-sammiee5311@gmail.com>
References: <20261118093840.3514408-1-sammiee5311@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: control: Check the volume and switch
 values
Message-Id: <179563223125.358726.9356759142143664573.b4-ty@b4>
Date: Wed, 25 Nov 2026 18:43:51 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hJZXXmpM/hvWnwFhalgGEdrHXX9QHJ5l1HSbH8B0Nes=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5tNbIO0y9V3k5U7NjTqvBssl+61qyWQLiazeu/NX0f
 v8CnabLHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIxGUM//Q+nXUxZ6oz4BY0
 Fzpz0da9LCf/eHq5pL7b412XK84XGjP8FRV8x/wwa8M6D5nZ11Kmuxe+90u6GLqHT/O8Wp7u9fB
 bnAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 18:38:38 +0900, HyeongJun An wrote:
> ASoC: SOF: control: Check the volume and switch values
> 
> SOF volume and switch controls accept any value from user space. Patch 2
> rejects values outside the range the info callbacks report.
> 
> Peter pointed out in v1 that snd_sof_volume_info(), which the controls
> with more than two channels use, reports the maximum differently from
> snd_soc_info_volsw(). Patch 1 makes it report the same range, and patch
> 2 checks against that range.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: SOF: control: Report the volume range as ASoC does
      https://git.kernel.org/broonie/sound/c/ce25f661d1df
[2/2] ASoC: SOF: control: Reject out of range volume and switch values
      https://git.kernel.org/broonie/sound/c/4f64e9b7c63b

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

