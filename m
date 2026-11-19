Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177132;
	b=GmG6KXTmUdQ9M2Gt0crG9tME9/lvdqJWysimrvakjZ/4Lx2fqZulG5UJT4jPdjGEzWEQ
	 cqRyh+CPVho4ABL0FLrycqVZrod3wWfi7/J5CDwAkSLguoex2PS1V+eMNiJXUPVt+4paR
	 1aXgBC8aOCftBoThaeGVxGLm/1mGTMU0bZkMg+zHcY8O52twQaUVf47C57s2B3SVizslR
	 555zvOyqCeAEICLl3SeyOUtbmdIXas41gkuTHzeRwYZ6Mca9vs5hXSrYGPNu98yKDQIJv
	 IAwaBGNBiS9wOlKJcHvgY6UxL/VMpbUpNMq3hdRc00LiQk4J6OiSqkQWwhq3rdcXuCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177132;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JkbYYtAjZb5zY+g6GhM+mlPnUmHrUM9km8i4WRe2QvU=;
	b=QlDgaszR1zLGQrCLu9AfQ6GqqBngUrDnwThQN+dawXf39AZQkmBhY7d5s20Bf25AiHs+
	 XJX81h+65hUnwo9w5M5Fr/9ik/58aVg+iUdztLmhMP2JZ7/WOeJRreicQol96PARCG9xn
	 nbucEQibBKlxodol2dUCd4MLGkAD1hHfRclrc/HHAwZC4S90n2iDLmHrBuuIo/0x1crLg
	 QtlPv18qZzBHARpLS/XdyaZj61hLz1Oh1Kwq1zUow/HKA3A9RFw9c5TrKWoyx5g4citwh
	 zrq9ZCzHcacCfSyiqfP3C6xpWoF6lN8UAgNsMMP7GIHg73g9JfDuG9pM9el+6EvPXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpW+Cabk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A36606A320;
	Fri, 20 Nov 2026 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XpW+Cabk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFAF1F000F2;
	Fri, 20 Nov 2026 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177131;
	bh=JkbYYtAjZb5zY+g6GhM+mlPnUmHrUM9km8i4WRe2QvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XpW+CabkxYnM/IlXEE/vQkfOJyhfDwFLHYUPFpYYmuGY8kOQJxxk1EJjDCdCm3bLP
	 vyPNqUqAr8IZeU7UAoAY2HOLaKeKVrdhFvnfTMMBPoDBPOJyYO0NF32lCq2zjY0f9g
	 0pSoTZNNV7W3gw7USoKTKJ9m/RUEDdUJSp8vWvKwZIO34o0g2/uBNgSDYdI27wkiqC
	 q2+wg2tkLfz4JQKsIlt7J0VpHyELrOos217nC8z6Rn8xH4b2Joxr/s9pb0qCX90HnT
	 qAaXkcgO2FOukzqUJ/4RbCM8h40rkNNlTeHmK7rjW5um1thwObLMw6Q85e78rPwv9A
	 uF0kQ8C15Mxjw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/11] ASoC: Intel: avs: Renames and debug prints
Message-Id: <179511128965.116416.8638900591299479694.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:01:29 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nIprSwe42caVVObuY1TUyME1HPC+dnhvdXTr/o+o7Rw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIZrFY0H1AS3CJ66eDE65ziCbFr3G9dPNd/Pv6JVGqv4
 kHZbN6vHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI6haGX8wP0u7lcr7fFGoj
 9nXrreMem/4Vfy+b/VjgTeK7wsS8wxKMDJMaJU/tUtm2MO9c+v8itX3Gm3wnGh2YuHfNX9c17Wp
 iT/gA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 12:38:29 +0100, Cezary Rojewski wrote:
> ASoC: Intel: avs: Renames and debug prints
> 
> The patches consists almost solely of renames and addition/enrichment
> of debug prints. Plus few removals to redunce duplication among these
> debug prints.
> 
> The 2/11 patch is the exception - as its follow up updates the messages
> around, the mentioned patch is here to fix the problem of skipped
> results coming from avs_path_pause() in trigger() operations. With that
> done, the dev-prints are touched.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/11] ASoC: Intel: avs: Do not skip error reporting when an IPC timeouts
        https://git.kernel.org/broonie/sound/c/29b76b28adb3
[02/11] ASoC: Intel: avs: Do not skip errors from avs_path_pause()
        https://git.kernel.org/broonie/sound/c/e3f298602f10
[03/11] ASoC: Intel: avs: Have one location for dumping path-errors
        https://git.kernel.org/broonie/sound/c/1bd4d27d1fac
[04/11] ASoC: Intel: avs: Small registers cleanup
        https://git.kernel.org/broonie/sound/c/1bdeb816a818
[05/11] ASoC: Intel: avs: Enrich missing-format and token-parsing messages
        https://git.kernel.org/broonie/sound/c/2a8f64f96e45
[06/11] ASoC: Intel: avs: Unify code style for platform_device_id arrays
        https://git.kernel.org/broonie/sound/c/357b3ab122cc
[07/11] ASoC: Intel: avs: Streamline topology parser names
        https://git.kernel.org/broonie/sound/c/516742b4e979
[08/11] ASoC: Intel: avs: Streamline wording used for board configs
        https://git.kernel.org/broonie/sound/c/4c59d3302e76
[09/11] ASoC: Intel: avs: Streamline naming of hw_params variables
        https://git.kernel.org/broonie/sound/c/13a4b93fd23b
[10/11] ASoC: Intel: avs: Streamline spacing used in the avs_ids table
        https://git.kernel.org/broonie/sound/c/2596a16ad41b
[11/11] ASoC: Intel: avs: Remove soc-acpi-intel-match include
        https://git.kernel.org/broonie/sound/c/a8b8834d2a1d

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

