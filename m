Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003133;
	b=EDmLY0QDwxETpkK8ygU0LCylMOutAVGpv+p/Nf1Zzk4Uh97wF9Sce/A3sJRYQsjNqoeK
	 KYkOTq/sIG/vDWNIQhcbtFBIS+YmtquhsEQOwurtGrXk0XDF/dMvQWz0y+Bn7Le1cwL26
	 fVVly/4vLz+0HWaevk6GnWDVe/12Slr/BG3igmcXUpXbGKW68YD9X32eu6FYZ+gCb5KYL
	 by4hedpts6vV3Vyd41QkRm7Z2pOePxBT5CD3s4TOpXgD8/EuoBgtKCZoz7Pfb+6mRjR5O
	 tipv/VHL8XtXKUcQoR0Vb7nDhsvxhxfIDuvT19eYG3tmdK7owtS3Z5lHmg1BJmG7tfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003133;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YdF13372jy/m199oRlOe/vzqPP9Dt54Ay4k6PphMxZM=;
	b=TnsRx4iOZUyb9AKOs0Sr4bXdT27bmSinCKFZ3+sqw2y4z6OAthjf5GJujJfSblT0A7zR
	 k/970RfdGMKj8UAQFhoEtfE5g9qIWSN76Bi9IHY+gVuBqM64vlcviNU/hvyrRvOki1rR+
	 81o1w+FQRmzOEWqMcw+MJl6XLJtwXKhVLrmmKKt7bHC0QQoz1KxGGkEKviWyGViBpJJbj
	 9L7KNRZ2GP4L2wTKcU1UIqEQrj5EETnA2MqCuuF437tYEAQ8kkGs7+9W03FD+VKMPHz9/
	 hRlBULeSTSl5QyBTFVlLGTdob6W2OFagIM2cBB1VXbgRYsJkbdQ9LOQ/znaQ+Ulm4+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWg9WAKJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8397A606A320;
	Wed, 18 Nov 2026 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fWg9WAKJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E3C1F000C6;
	Wed, 18 Nov 2026 11:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003133;
	bh=YdF13372jy/m199oRlOe/vzqPP9Dt54Ay4k6PphMxZM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fWg9WAKJ0LPxwvRXKGcS2CpfyEXetZ1zj+yi+EPSH6YMcOYVMEJz2IOGISnrm8iOP
	 bVRzbOmwZn2+jRKa9N1Vhj6a1Ghgs0uRCAmLxnU2SLGTQGYaOlXHtXcKnJ/it6VgC/
	 f6cM25DIsuuik44OFgegzpm8lTcCIJf54qahEeTrRf0uXg1FE/NstSE7U3TZDAM6CW
	 qzoBbA1mVbOKOnbPyxpTSBD6Uk/4jUEQcGidmfMLYiEG4FMWKibxjlnDkMs9T95DNd
	 FiaAd8oBv92xPTitJGGdUC9En17PGbmjS3chYMH/R10uQtYNu60gw6HGbyA920T5wL
	 EUcrOTRF4YRKQ==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: rockchip: i2s-tdm: register the PCM before
 the DAI
Message-Id: <179495878868.2707353.10848747945533783819.b4-ty@b4>
Date: Tue, 17 Nov 2026 23:39:48 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W59zQSeaIH+lyhkCe/swjpF15sOyCWor0aGiYZn+l/w=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+TvqZoc+pm2Kb2+rVVXyH65hYwaQjqa8rFggvZlQ87
 PdgukZeRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACaStIWR4VuV6Z5Xbd2Ouszi
 vlb3azbvbLtyOmDawsWblf5e9HuzbjEjwzLn2YHrHUqOtLK/aYlOvflfcdLuLbH5zDs8ras3++9
 P5gUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 07:16:57 +0000, Arun Iyengar wrote:
> ASoC: rockchip: i2s-tdm: register the PCM before the DAI
> 
> The Rockchip I2S-TDM driver registers its DAI component before the
> dmaengine PCM component. A sound card that was registered earlier and
> waits for the CPU DAI is bound by snd_soc_component_register() as soon
> as the DAI component appears, which also satisfies the DAI link's
> platform (it defaults to the CPU of_node), so the card binds without the
> PCM component. Every open of the PCM then fails with -EINVAL from
> snd_pcm_hw_constraints_complete(), silently. On RK3588 this happens to
> the HDMI sound card whenever the HDMI codec probes before the I2S
> controller. Patch 1 registers the PCM first, as rockchip_spdif already
> does.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: rockchip: i2s-tdm: Register the PCM before the DAI
      https://git.kernel.org/broonie/sound/c/3743fe2e36d2
[2/2] ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defaults
      https://git.kernel.org/broonie/sound/c/49562d274477

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

