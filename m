Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003137;
	b=tOfUj17E89bfZ0435JpG3EzO8FWy1j1RnsVL5dEixW8VQq/4udk/m0D06qlzUKUPjQMW
	 3xD2qvaHjr2TsJWynRkjC10H+TwGrwhdvjG76JNncMKPjYnMVillcrmAJXcYriFfwB6Pd
	 Q3UR+1auy6CNtQFHEsgFDhmJ11FukVIzy4qZOEyWm1uaSMzMqoFvsRz5pngLIJttCo99N
	 3GWR6IImxgRXLlI00Glba89lsl/SSkmWk/fTE18s8xzs8Vnza/q2qfIUWTBPZ9eLJKXO7
	 kvh002jmtmGQyoBaYBzceHgi6+8CHLVg7wQzycYKziLMuW1xHbrM3h8r2kg2UkIUzzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003137;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mbpK5VvMgaE8c44CA3zzBQyjwM2nCP657h8KuzWdg7s=;
	b=J5Tfr+obPJ1DV9CWiqkcNPVA5gj4iG//dH+W+hZ+SwluYEOZPQQynYLsWWP0Kqge2R6r
	 IvWaiKWzHJe6XefVODMDM5n5Q/m9wBvD7DIshmY9C4M5ZsL/bZWbyVrFzMdPYw9x8C1nd
	 oueZzNVuhD+STW4M3AuxAWZWtp7KPp6Z32LZ48u8OUTAG+wfh8cArAg1LJv2+1GsSJUXd
	 7/VArGZdM2Xz4DlOID8jNKA34w1OzjKKy5xWPtJNs4JvlK4NHnHYZTXG4KH4YK+S/92uo
	 q7bbkjnAN6AQyzLBmD+xVv0mNJGs9Ygmqq7lvOAhXmrAu2NFj6MVo2iDxImmhjzBe4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0ZwgUqM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246D606A31C;
	Wed, 18 Nov 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0ZwgUqM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD501F000C8;
	Wed, 18 Nov 2026 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003137;
	bh=mbpK5VvMgaE8c44CA3zzBQyjwM2nCP657h8KuzWdg7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l0ZwgUqMoV4TD+70ZhLOmFd5x2xQgdgxtIjkex5oSlU7sJKPtDsqXazmw9PrQ07OU
	 wkf0Fec/rc8RILcgFhhJHiDo4XmNcHx8s/FrlHczaBSXpBGNkKArli6cxT+MaIljNn
	 3fJSoM9chlztTB9t+f0laAC1Opvf8gIlCX36IKt2roUtNVjxMgX6uESqwu/gkzmR9D
	 KpeEd6qcfw04spowphxmNKJh9/1ZqLfptN+L5uQxzc6I0xYdXGvleulClvfE9FqKUF
	 qmA6qPXuVk++vvpppA3bmqTnTEWJGW87af/Nv8hr+h3iALNgGZuI2MHarbEAv7va6M
	 H3hkRFa3ccFsA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112-88a3a7ff32-asoc-wm8994@mail.sdu.edu.cn>
References: <20261112-88a3a7ff32-asoc-wm8994@mail.sdu.edu.cn>
Subject: Re: [PATCH] ASoC: wm8994: Fix potential DSP control text array
 leaks
Message-Id: <179495867980.2707353.14941092040996289104.b4-ty@b4>
Date: Tue, 17 Nov 2026 23:37:59 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tvqJndEPamrjdT+CsMooV8dlF/nOuJH2xizh3M/+WNU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+TvonP9egP1GvsYmd38zjzJ3XLtP7jts7blFPNs7kn
 PPgW0tiRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbyPYDhf8i+H5+WCv1yCHDV
 iVi8J/3XdM2YULVPUVXvnb0yFdaZpzMytAfkz3ypacLDcMWSn299d+a9uCz9W20lqZsVWLekW3q
 wAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 21:59:14 +0800, Guangshuo Li wrote:
> ASoC: wm8994: Fix potential DSP control text array leaks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: wm8994: Fix potential DSP control text array leaks
      https://git.kernel.org/broonie/sound/c/e72fa276c985

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

