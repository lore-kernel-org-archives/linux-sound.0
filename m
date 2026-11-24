Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541615;
	b=afk5AwbQeoBVp9mhnF+0aqruoCFCsjzJ4DKm7AYRh8KzxK4olFPhXKZUtnKsJSp8nnIi
	 zdD8hu/nB5JEEAa+ppVRJHt3yqgwWALT31QrX6l2K2H2R1qq3j0Nqw+TN5GgE5ZxNnyL6
	 KvFyGdVZghqW+qVmcBOTGvTMRwjgpoPLAfCNuFQD36Qb71wJ6aa0byJHlGSy765tC1y7t
	 Ei7kN3f/+BQ2hiu46cNkZP3Hvp8E0YIRXgvxF2G9Z+TvtoGnwo8mTMVAZuLzIj86Gff7R
	 75tZqRjOHjiWocm0tqfHE2Zvp+i7uskO1iobcEUqtDxP/UtlxnjM3mcIOWwb8KzXLPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541615;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pEuF4UXdvuOAlixC85PRtyQwE7CW1r+JuVMVWrFv2yA=;
	b=s38G7kAN3bnj9Dditu7HfrUXhmqIs9HLSASYY99Rf56duUTZQ8mJcl0zLiZ6BiURYs3g
	 UIgoN6OUiLDsfg9/pLSW2XebGIrkVXMg9KpDZU5C6h+I+7wi42gN/B52bsz9LpKTgnYv9
	 JhKfcYUp2Jadhp8w3cJLLJPsKJRsCNwaY5gOxEmGS4XpcOhzm2pZVJ9OdSEAWnigW0T44
	 A8pKRL6f6QGwpaz9XWuFmU80jfW9pSIPciJ1KgSH3Y/r6qwJQ4Fa+0XmWqr3mPaNZqUbS
	 anXfUIHvtQcM+6mUWJXJbW0aKG0RTjODm8n24vLyLMr0OcBIlaMHPBJBhXDEyisEjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGBBiw76;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A036606A688;
	Tue, 24 Nov 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGBBiw76
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3CE1F00A3E;
	Tue, 24 Nov 2026 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541614;
	bh=pEuF4UXdvuOAlixC85PRtyQwE7CW1r+JuVMVWrFv2yA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AGBBiw76bODRsuyoba/o6wZYt7FGGBiCRpBG9PdHYHwkXomfNiRqJudM9UdN73Bog
	 wN6wbpmo5iPTJAu4t555S0VpxjpP3Y3rNzKpsMSRoyEym+0vrnGaCr+EMI/lJLh+M2
	 jw9SJWUeiP2Ml+Zpp468oybRSFmZ3UDR+2vUMgIM8gj4vhLF1aZRwZi4iwlZJVDzsr
	 eD1OhsTqpNg9x9iIpBfz8Ms2y3shT6dRc0I5/e7As5yPhyRHsZDyMudrfdD/F1DxNB
	 EjPZP6dPzqIDF5WS6puIfwyGTaUBbO6yh1SYMk+MZiwW2wn1w49zeDizcFti7tJ3qq
	 vyzPzhQHAb9dw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: arizona: switch to generic device
 properties and clean up
Message-Id: <179553350367.264265.622212709195339744.b4-ty@b4>
Date: Tue, 24 Nov 2026 15:18:23 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AAwwm4kVkDk6Y8/0C98PPgTZBZCFethq14/7w3Cowyc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZT2Xt/ZXHvCJOjbHubv99n/SaVd0HVE8xGFQERL2Z3
 ipa8Vmxo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABPZ9ZCR4WHN56+LquXKz96X
 vchqdMNS7lLtn0krG6oanBdPWrVr1mlGhm0yMXKbejiPHnct+WQ/3U6s8J3zHqY8G56GWd/sOVI
 6OAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 23 Nov 2026 15:00:53 -0800, Dmitry Torokhov wrote:
> ASoC: arizona: switch to generic device properties and clean up
> 
> This series converts Arizona ASoC drivers to generic device properties
> and cleans up dead code and formatting issues:
> 
> - Convert audio platform data parsing from OF-only APIs to generic
>   device property helpers and drop CONFIG_OF guards across the codec
>   drivers.
> - Parse device properties unconditionally in the jack detection and codec
>   drivers even when platform data is supplied, preserving existing
>   channel settings and boolean flags when properties are absent.
> - Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
>   arizona_pdata along with the unreachable HPDET accessory ID logic in
>   the jack detection driver.
> - Clean up coding style and argument alignment in arizona-jack.c.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/4] ASoC: arizona: convert audio pdata parsing to generic device properties
      https://git.kernel.org/broonie/sound/c/e479ed6b6ccf
[2/4] ASoC: arizona: always parse device properties regardless of platform data
      https://git.kernel.org/broonie/sound/c/53136aa2d64d
[3/4] ASoC: arizona: drop unused HPDET accessory ID support
      https://git.kernel.org/broonie/sound/c/a516c1f40ea4
[4/4] ASoC: arizona: clean up coding style and formatting
      https://git.kernel.org/broonie/sound/c/ce694590177a

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

