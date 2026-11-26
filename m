Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734851;
	b=cuq/X8nDdGicmh6B1KaLkr26KGH++TKITrCid80RNjMANvDwrSQdlb8gfFs2wbl4vh8D
	 9iuUKe0RJK0Kd6JfHGrd2wDG1SWk58ZARhQCopULXgyV2OGRLv71AQPwI1LcjZdZeKGU7
	 DWgIt+ORLeNpDauWFwv3YKcdOUK+0E5u/6qD5ZbWmS7GZQGnoFU95Shb5zaCuACqrtUtB
	 8BZF7d2mZn7OcwTX+dvIvKSHVFs/9yhPQbd4xQwKtFX/w4ad7HKipGqRc5LyKTG55somX
	 fb67C70qQgLH7UmI05q3I8zw2BVNLRx8OpTCI3KQTV0+a9LN4czCjCtPlbKt050khZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734851;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2V0mx8KvDSloADKsFMwUZp/ao86S1YvoNPEoPKACjso=;
	b=jqj1GCDP7USkw/iQUXLDvucQNmDCLQ9JZZwz+07eGIaHzUHFKGsvtiyOh3wQ3jQVeGAI
	 j+iabNMyo9ej7iTJwynXejtvHJSkk1UJVNsBfkhzIiyItuMwHk+gVKh5PllyhhCk/I2og
	 IJMPfmeYJghewGNibndAIbLgzEgZZJnX+6O5jo5fK98GK7gZHLPKmHkZgIX4G3rX7e+6T
	 +6bqsKc/KmkWNpzjjdlnZBzaHW6vCJnR5gDfwHQQK7gCKBvbgsutRGaV4mSXGWja2hOdg
	 aot3eFTvNpOwNXcXED3JM3ba46hXlyLl6z/FvLt6EIAU45asDbdzFvxHMNaRX9F8sjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCTLrGw1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB8606A31C;
	Thu, 26 Nov 2026 23:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCTLrGw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B3A1F00893;
	Thu, 26 Nov 2026 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734851;
	bh=2V0mx8KvDSloADKsFMwUZp/ao86S1YvoNPEoPKACjso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oCTLrGw1uj64SziI7K6oLwymGAPjp5MEqzlPsRxeedivzAL1Zk9amSoQ/mWGEu15A
	 7P3sh2ri4/gxGCfPEum/uiOE7G7jT20bzxegU/SUSkwm1XcE7t9sGmyhAjPUkcGuqP
	 30Lg7qlg1aWhCg2Xm6exSSvEaJ73enTX9KTlYXfnZTD+pkP8pFCofGyZSTUxVZlphU
	 KZor9Wev08ly6FpYjXCiFZpzsv4jbydhnxFyhqZFS8bpJ9qqJJmuCzkV+Kplq5BbXj
	 CAWQ7VUv7QhSePPitF0FglqicNTzxnwMPYTVw39yC3HrCIDFRXLx+fl6pBSVKPpdEi
	 YuY4u5B1rh15g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Perry Dale <techluddite@outlook.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
References: <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 0/2] ASoC: qcom: q6apm-dai: stop the playback queue
 from wedging the DSP
Message-Id: <179572375936.838304.12750230700944585596.b4-ty@b4>
Date: Thu, 26 Nov 2026 20:09:19 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9xx5kMezR5vVzYWuK+csQ5UgfhjXK4Y0X0r9cyL6JHs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI59jroXK6P3357/ux5xy/KXNeo4lHb6PKEuzVSxejss
 3VRU4xPdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAimtMYGVplb125u8lzl7qD
 5OnX7wP9Kleorz/rHlNy5+2FyQ7c8k8Y/teKKSuURYrzuzPM7l15Vytt6QG9F+7nH95vb736VYj
 9HwsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 11:47:23 -0800, Perry Dale wrote:
> ASoC: qcom: q6apm-dai: stop the playback queue from wedging the DSP
> 
> On the AYN Odin 2 Portal (SM8550) the audio DSP stops answering GPR
> commands when a game pauses its stream, and every later prepare times
> out until a reboot. q6apm_dai_ack() queues one write per period of the
> whole appl_ptr after a trigger stop has reset queue_ptr.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: qcom: q6apm-dai: queue playback buffers only while the graph runs
      https://git.kernel.org/broonie/sound/c/a81d29df131f
[2/2] ASoC: qcom: q6apm-dai: keep a playback stream running across a PCM reset
      https://git.kernel.org/broonie/sound/c/164041af6ce0

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

