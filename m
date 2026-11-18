Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096060;
	b=K1SD3nNQaq7I18WvMk7uMKMbGi1IQwAf6/IUHocriLlsNPZuwiImT/NUjVkp0MJJ0lYI
	 4CFYgXnJtBJuwoEehzNxa9Yp/AoeBodmMS4dGBiAkh9tUdFOfRvPGfiuV3uyh/FnLkpiG
	 U4OXafZ+n/s/vMklUdQcbBprAtlFN2m5ow0GyV0SM/BCXvh5Ba436YFrWWzroOqnicIsR
	 i1tlyAykqd3OMQmMbk0fpRxf39glO7F6SZFz3MWptYjJn8M36jDwphIXQnSFFAa0qOOof
	 JQ5rFFW0dB5btzQwBNY0gOEA6I759Pd/CHSBizSWK6iTWhvTzwfvJMpzQq8bjju5q4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096060;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=En+020RPVc7mTytUQ4HcwO7rcu8cEIxHcFHIbahL/4k=;
	b=mxJX11EIF5yipi5DHFGuZ43pKkzWfBKF8VHFWF65UcQDxwIcQeUBUGpCmdpz+7JKlf0r
	 /nfWDLpPeIeqchybdmRvQjHtNpUKGcy9nIJR5QzAjvTX15DBtrSM2n5hmOVueWFuRMetg
	 K9lJ2p9BgRHIR7LOy06MtamJQDbnogq0eV1yIfINq9VtHtpo0/486rZgm2+Q6lGcTqUVw
	 0mC3DGWj+sTpUmb6G8zw2nOmvVtzT+MVgIXTsUPbHPDdJ5bb+ezah/Coq/PThaM5WwBvS
	 fcpWWzBqbTSAdtLCP0eFc1SLuKfNg6t2ElleS5hj+J9Pfiio24rLelQTAUA6VA7bHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCZzmd6Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC1A606A326;
	Thu, 19 Nov 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCZzmd6Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79411F000D2;
	Thu, 19 Nov 2026 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096059;
	bh=En+020RPVc7mTytUQ4HcwO7rcu8cEIxHcFHIbahL/4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CCZzmd6YUnidfBZm/fLzgFVzXL1idWVLjz+xkCSsvEv8m1PyGHLYSU5LJ4orWXpdY
	 5+o07Ata43r1KwwLqP7p0Vv4mO9eOrFDt+SOpyeIJkE3hAE7Ut3TgLaOwjSzbq0ypw
	 cOmPEOnnsEtOcwtia94Iz8BhZU0k2xqZvPhGvbsb+XBQ/tPQ3Is4uItwVUwcpwoeNi
	 MFtFfseb/BPHQNNvoshNSAkVwKfxR3jOpebDnt6glAQkrBMoR1MdAJm1WzB3VaSgy6
	 Xi99eebdlGwAoTe6wDshS2W8jTvtx/KFgDivsHrTTFkqH9xXqLrIs75+3hjutV8q2m
	 W1EVXBSMHO+BA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Julius Bairaktaris <julius@bairaktaris.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111080624.244291-1-julius@bairaktaris.de>
References: <20261111080624.244291-1-julius@bairaktaris.de>
Subject: Re: [PATCH 0/2] ASoC: qcom: qdsp6: bound the compress ring by the
 DMA buffer
Message-Id: <179502346399.349622.9493801754958983425.b4-ty@b4>
Date: Wed, 18 Nov 2026 17:37:43 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NWPtdka5pFVfl4DdBH0dB1abmby7OY5vLNIMpV6KvoY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/f3xo+DJhrUv2r6t+qj+Q76wZP5T/smWE2s0KvZGX
 5kRcENRqKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATkW9hZHi/6/4My7w5O47X
 fFUvFi8+8kPh51QVl1Xv3x338JfLOnmIkeGErP/E+oDoRIWZp+Od7k6U49nBLs5+r8LP9tjUmHP
 Vu9gB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 11 Nov 2026 09:06:22 +0100, Julius Bairaktaris wrote:
> ASoC: qcom: qdsp6: bound the compress ring by the DMA buffer
> 
> q6apm-dai and q6asm-dai allocate a fixed 8 MiB DMA buffer when a
> compress stream opens and take the ring geometry from
> SNDRV_COMPRESS_SET_PARAMS without comparing it to that buffer. Their
> copy callbacks place each write() at the stream position modulo the
> ring size, so a user who can open the compress node and asks for a
> larger ring makes write() copy data of their choice past the buffer.
> Each patch rejects such a ring in set_params.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: qcom: q6apm-dai: reject compress rings larger than the DMA buffer
      https://git.kernel.org/broonie/sound/c/3857bc06e5a4
[2/2] ASoC: qcom: q6asm-dai: reject compress rings larger than the DMA buffer
      https://git.kernel.org/broonie/sound/c/4c15e549b7ad

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

