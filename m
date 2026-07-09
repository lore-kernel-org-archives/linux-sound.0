Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1F423152;
	Fri, 10 Jul 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684124; cv=none; b=gCMuPzTjEG9DB8f13/EvLIY+42NLLu8amK2BxIqXh4nEY2d4DRwjCq32BTdbzGq7ElZrkktFsPiDJoaifED3ZJMH1xIb0xBzWW7upOobuVvvkF2mFdW++bWi2wd5nS9+SnA6tJ+Hu4st/g4rbXdo6vcKc3KlRTbGfeo2On7STxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684124; c=relaxed/simple;
	bh=JY5uy/2SFkrZy4QL93cSVfHPbR6M+HMHhXAKsGBWNQw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VvXl/G6jOEEM4Y21zG8zv7TnXG375vyP8wjtwtzNejo8YBqI1065bEiG4Rn+tdH8uSYua6GYcH84qsiKBRcVZvkPgfXTQ209dLuljBOf/0xZE5C4YTc1jz6ACp/vDCXxYGbKOfrN0IW0QDNI7eTrxzQySgLYT5FKpNT8+vtHZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA7LnibO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA7LnibO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ACF1F00A3D;
	Fri, 10 Jul 2026 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684113;
	bh=7z42eCI0lC74JHZmqrmkrhBvBorw3Axq/rT/mbua++c=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=fA7LnibOpQ3thBNBZi7E/0UtOhanX+uKP80o8Po6oyC+mSb+umMwYD+n5iYio0mZ6
	 WZoTi2OVgWuXfl/lDtVOdc6ztvDPGm2a0UyGQJ4Me2ta2ERzRRDI2NYxoP9p/Q/3Of
	 y0+4wliLt4pMJs1viZx5YasbhVu7GNt6jAbCTZ48a0jm3pVib1RbYTzt4CMo6N8/HG
	 lG51L1+KRSl7QVCe1eh06PjwdwkLyZTQ09GSN7lDr80b/tWZbAVy3Qr/BOcQLapF4D
	 BT44hLMvDn4fYcQDxgr0OMRe2kL6SR2cSDCEQGgO+RytLPpstJSRVnly9C+xkSjgKo
	 MjJvalid1CBiA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072454.80981-1-pengpeng@iscas.ac.cn>
References: <20260704072454.80981-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Propagate regcache_sync()
 errors
Message-Id: <178361267218.100558.15533929411931278993.b4-ty@b4>
Date: Thu, 09 Jul 2026 16:57:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JY5uy/2SFkrZy4QL93cSVfHPbR6M+HMHhXAKsGBWNQw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNwOGTewTfTi0H2HWf8XxXAYrTdOh7MJvV6cx
 JcvMCPdm0CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDcDgAKCRAk1otyXVSH
 0PW+B/409XOELMokk5RQ4MAiuUkb/vcP2+TpeKVtMf3yWW4CucLf5dLfhLH8s4Jf2qOdbWoRTLr
 F4RUs7zFrNwrAKX72BTR9h3XAeyKaO7s9yLS+LaMLZLaEKCzBro7JHNs6UJ6hi7Km0IGj05zWqi
 7s7NGWl5FbhBTx/vTs6pwa0Hfp0NmzmiL5f6YqdJ/kH19ucx7GNyLetesU1myvn+7EuzGgj1tj7
 U15JJNrT8NlkuLgIvc5y65QXnKM0BneSROPJ8gbcPZgAVfG/NvtekOVMs7DNCTsHGEvB3ME0P8P
 SH8xB/B/9EZryvsZyHN6c3tTaEfKjY1GKMtYEThwULMnpBuC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:24:54 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wsa883x: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wsa883x: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/cc5c698bbca0

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

