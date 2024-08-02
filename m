Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D7139D1B
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722637343; cv=none; b=UhWX1p9lMEAfvSrUyeTzxigpJo6xBICDab4uO2MRWNWmPv/u7oj5GuoCBJ4baw5KLtUfsSGHXM6dL56sYsWCRlmmcqBUBQnCANTWX4pk8RVQJdrGwkFwFUZXckzo1ccwjtj27GxA1vIm8nce1wu8VQ1AhgCmAUStA2JeOyz9tls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722637343; c=relaxed/simple;
	bh=+aSlO9zlo6n0Ul95qcd+80nMphawjWrVFENBLzlbUp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S+iBRnZC3ousXNcz79PTAtfCZv9mhbpqY52wT9MuV3J9v4P8oSDPbzfSWoabaFQekRmCtw8WIgNnFfQaywEdQBbpfWR9d6N+iNIBBxkXPT+oFk3ylQ6s9WsUSroNlKSiBSjv/jpefh1iimqr0G/ifZQ3j+E9t4BkuZ5KphEbiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxE7W0sk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxE7W0sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883FBC4AF0B;
	Fri,  2 Aug 2024 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722637342;
	bh=+aSlO9zlo6n0Ul95qcd+80nMphawjWrVFENBLzlbUp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KxE7W0skz/BBU8KT6UDXUpDEWMoZuGu8QiQoECEJt4HC058KAX25YAJznksxTuc4P
	 ECQSKcT8D7LOrjGhdikLG65x+72CAwPB8B+HSCvfaeNSb0bJt0RSLrA35szpYNdr6D
	 86gHlo6M/HjcbgpaB/me70pTGSW2fHNoBpzw5IF92CJSrw92NQ1+7llRgRD0SG/HjV
	 VC7g+CKHLJDeG80HLuF2KuyoOGO8Mqz9SzS04D0NuXfw5vB2lBq/OaknIoVf2G7bWs
	 UPlmrlI/I8qu8kKq4NW1aVMfFOlO1KNYQID/ru7eeru9Q2LEq/9VOuyz/Hoiqfj6ZY
	 lp0Hw5atzKU6A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: reshuffle and optimize structures
Message-Id: <172263734128.144413.3497995259829988964.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 23:22:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 02 Aug 2024 14:46:05 +0200, Pierre-Louis Bossart wrote:
> pahole reports a number of sub-optimal structure definitions with
> holes and cache-line alignment problems, this patchset optimizes a
> couple of structure frequently used.
> 
> No functionality change, only re-ordering of structure members.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
>   ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
>   ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
>   ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
      commit: cac88e96ba0961921b8068326579b26094f37ba4
[2/4] ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
      commit: e9e7eeaf199c7961d634235dbedeb7b682b1dd32
[3/4] ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
      commit: 5a4413d0fa8d0a438246acaf81637d71aab1b6a0
[4/4] ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
      commit: 5821d7b4981f4915ab353f538be38defe9656f81

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

