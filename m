Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776295;
	b=rFN8gbINptsuxnboBSPwjcTcIafuNuORzOO+LNnrmNqRo1tc2+sSTmkvoi8RfyLjIe0p
	 9uoAsi9HH/6StQLr2SnbCDXCRFzW6fAZ3PlAhQuMx5EgNqt5qioa8wWzBrgKfeaX1wSpe
	 X0Li85wSa6NUF4MTGS+dgMlGR3+UXBde2gpCDvgS2+p/zsjTvCWJTYcBQ9fRIyEjbh+Ud
	 8Xg+YPi6+q6Ujvg+EQj6VnIezqdJpii3JD3IRpnCx7oUU2/FnLVEIWfjkrZyEiZicw0pM
	 xS1HR1jgb1fpvMj0S9juh4Yd30pGhJYItjDOmoGgNzmhaqGu7zkdpbLa/mpPw5cHp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776295;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WZW1PdNwcA/ORBzFfu9kFu0rALLE5ehL+1z3C7JYPEE=;
	b=kgpDFQTG+0rMrLekbSy0ydNCTJojPX3pyGlCdCFBVy8LWU8vmig5R5VfLv7bn2gwNAco
	 KYo0Y597vAaOTRolIrC7LvkmdSd4EAfDpf3wjPwr2DyQ3Y9tERn5qCvsV9rtwOhh1rodN
	 MCD0MGXBjq1j4hGW7h0Lhbt12YSpzbdV+jxC+R1Nbu0MWxM1HIliweIjVcizPG58F9Fcr
	 UjKFTuG6RUOcX6HbKafZAJGGG1m18VykLwI0BhfaWT19wYzE5lLiQ1dBgZKVreoqI9UUi
	 PgUaP/Rxdn6PPl93UnjEhscKJ5OC5ablS5EU4TWhyBPnspb/X4MdfA9YTgrHiLsXtIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHYUEqei;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD37C606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHYUEqei
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A98881F000C1;
	Wed,  4 Nov 2026 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776294;
	bh=WZW1PdNwcA/ORBzFfu9kFu0rALLE5ehL+1z3C7JYPEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RHYUEqeioDpl8YI5K/GpPVr6UbBr+QiRnDdjFvx2Wxy7gyOTdpOiM2MwHeRBcDO22
	 6G5rTWY3VmM8iGuRm41Q3lUKhxAwvxUXynYy3ncFF/iYnsqIA/1vuAR5JaBuM4MQ1K
	 Q8wjtrlP73dA5ST2QrgVjyTNjrrBVF3DxN/GdzK8Xg1R9l4uveOSqlLRX8y/ZCkF7R
	 1m3rb9b2tJ3Md6TzIwztfftE96X0ctxw0Fwn2p66fMp2NNemxVLxcCwr9VoiPO62sk
	 BgcethVQlB3xFqESmwpMemM3MRxeI57BVcvIdensmpEi3tR5gVT4/lidZuY3mIAfXc
	 lrw+VqpLIE8YA==
Date: Wed, 4 Nov 2026 08:11:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, sound-open-firmware@alsa-project.org, 
	Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: SOF: amd: fix leaks when SoundWire probe fails
Message-ID: <20261104-interesting-auburn-rooster-2fdf5c@quoll>
References: <20261104024054.1508754-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104024054.1508754-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:40:54 +0000, Wentao Liang wrote:
> When amd_sof_sdw_probe() fails, amd_sof_acp_probe() only frees the IPC
> IRQ and returns, leaving the "dmic-codec" platform device registered by
> platform_device_register_data() behind.  The SoundWire context that
> sdw_amd_probe() allocated before the startup step failed is leaked as
> well.  The probe never succeeds for this device, so neither
> amd_sof_acp_remove() nor the devres cleanup releases them.
> 
> Jump to the existing free_ipc_irq label instead, which also calls
> amd_sof_sdw_exit() and unregisters the DMIC device, as the ACP7.x probe
> path already does.
> 
> Fixes: d948218424bf ("ASoC: SOF: amd: add code for invoking soundwire manager helper functions")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/soc/sof/amd/acp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




