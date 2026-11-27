Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795877630;
	b=0LtsZTEZZbCZ7j1iU56UryGZ3Q3d2/sTUH2rSErM8NON92k1ptXZiXYbsjCkuvG/OY/4
	 vnhRlkg32JPslZHYnmJcfuMdfyNJK6zpolQK+YkgKI7d7Bsdhaq0+gxT9ASQKS+vNps44
	 gyagPtCEvMedsX4xoDuc0gqkqHs4KO0Q5by8Acvr0bc7k8LdfFgHXKONUxVYmQNfeTw77
	 IWFa3JPI+uZXKqcC4xCMy0aM46yB1zNBFngO4Edt0H69AWlp0vD4c9we5MBfQ7PlVB3eX
	 E7oXVkz+4j1lIG3wwYZQcpngpzzZn0f5ykGtTnFBHaUmR7hQbiBwFOFGpZWXN96fA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795877630;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aI2gMYXr4Fr9UA8l7dKR+kfhYjOBstwSOO9QT5PWflQ=;
	b=MPmJxeHOqVjxULwnl2ameOJAnAdG0HY2ZFz8AFDipAyW+eP+qde3oGgJAWVbqmsVk0BH
	 rhQ/y3UzHO8yHQKOxnW9QuU4H1QNvvwKribXiYn82+qem32tlRS9bjooTytPlFV9hO7rS
	 fFHl1jyMeX071rPtnUFvkhtB/VPe4+TjFvADB/r3rmDg+l4HTBzH7Mp0EOOTg17WiHGRF
	 lYDfzpj2Si7vc02tKfe1ktQMhLHvDf9cl6ZUT4euM6us9cOtelFs5xvspjClJlUSl9nla
	 3ntIb8rceDBTWlhsR7aIHrWDZQkoKlroqAp3PTp8mkbDRreypRm5fO7GqzmBPpXPrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGMdQCk3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679A9606A31C;
	Sat, 28 Nov 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGMdQCk3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3722F1F00897;
	Sat, 28 Nov 2026 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795877630;
	bh=aI2gMYXr4Fr9UA8l7dKR+kfhYjOBstwSOO9QT5PWflQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OGMdQCk313JzA3opu9ojMOiDlHsdxXWv2wdLi3+YE2aGdvAa99VJ9yIS3yTdOw1yF
	 SB6LzBW8sFKWApa1beIULfWK2jbbwu/Kbp1k/SJ+idopxE+wc911pnltGYBZthODdi
	 SMX0t2NEYyWsUVlEGIYJq/NdYAfjRRmflyNFRVU7/b/SMn8V03rmL/q8YpupHaG6k1
	 rHdfNsjiIgtqCILyF6uwlWbeRPoEWJJ4qwDNIUEhieeups4z1uYbhnIDciZWZet7vt
	 CBLIhcoUSyK7VGQmPRqQ46B21yKfKvlWQc5yAOz6A7QzWnO7kr7BZC6lThvcMAxJp+
	 mC07l9PlZ3wZA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261127114037.2010271-1-rf@opensource.cirrus.com>
References: <20261127114037.2010271-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] firmware: cs_dsp: Remove some more wasted bytes
 per control
Message-Id: <179579367141.838304.16317574193837468104.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:34:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Dv3vrWIUzM8joyq/zWBE92AiB+MUkxoUIQEeKqC2N+g=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK5Xv3+8uuw2cFdorfXaIYzyDauunhSfx3PfP3v2X2bD
 Sz3X5no11HKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJpGxlZDien3D9uVPSrYes
 /7/zrFZkk9s6w3QCT3LU0aKH3Qe+rtjE8M/ox1LRHdtc8lZ/MT/8emZXy52vJixCHIp3j816d9f
 LKpgNAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Nov 2026 11:40:35 +0000, Richard Fitzgerald wrote:
> firmware: cs_dsp: Remove some more wasted bytes per control
> 
> This series removes another 16 wasted bytes (on x86_64) per control from
> struct cs_dsp_coeff_ctl.
> 
> Richard Fitzgerald (2):
>   firmware: cs_dsp: Resize members of cs_dsp_coeff_ctl to save bytes
>   firmware: cs_dsp: Store control cache data in struct cs_dsp_coeff_ctl
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] firmware: cs_dsp: Resize members of cs_dsp_coeff_ctl to save bytes
      https://git.kernel.org/broonie/sound/c/6534c2bedf46
[2/2] firmware: cs_dsp: Store control cache data in struct cs_dsp_coeff_ctl
      https://git.kernel.org/broonie/sound/c/3bbfb78a99fc

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

