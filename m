Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60E3B14D0;
	Fri, 10 Jul 2026 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684217; cv=none; b=RqExWneK+S4NSz77gzCkSypNHwV+Re5XZlWZjIlBG+NbON1b7PGNWxRGqxGKvijsYp4lJR4OSZUJiwS8JmGli6cyfdM8aYbZja03sdOYKeDG96tkuzlFHcGc/SBfhYQwMgKmh3N1YqpBlV5PBRjnEf9Njku/Awh/37JvKF4j3Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684217; c=relaxed/simple;
	bh=7Iriul63gfyTb34bYqKEzJ6Lu9Cd0ewBsDM0jnC4TMI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NV5dE9nB01K3sgL4mkiTyIhmu6aDrxFtZPpf7npy2eTmz72asdZhHACKWe4Ae55zmwKBqKXuIoibNlwUvJL6WvT10xyOdn09LJxFHFs6bikbia8vpq6iS3K8cL4KePU7y3md7TUqYdHpKiDgotb7tItr0sVb1Vmv7oSJD1/zA1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhCqd5ME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhCqd5ME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD21F000E9;
	Fri, 10 Jul 2026 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684208;
	bh=9VqzjFeM9WvGbpthhb8KZXrl4akClT866ePbmUSQlCQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=KhCqd5MECPM50KGD6RyV/GD9hHQTkO8bE3viCmCIGZI/9pg4X4mYjkVxhxtT3oZ2j
	 B53hWFHCrSg9TboM+81CSypQSEZMmDMRcRJ9HvcCbwpnEcAgZyEuhWIS50p7AIRMbD
	 mEgGN//1B6C9joPIGF6eeDa7DpSjN8ZUEyHHu89YNHAiNFPpqRSg/UhlMPAK+sVf1X
	 w+NUVNcEkxjo4FiDodyU05nxsJVV9jMK5ipAsJRNNJkk47Tzq4ExpVMD1bImI+O0Bs
	 AN2TqcYkMq3t/aaVtfQtgtU5Z+oIdgvzIb2x02DQShBnf1qYlGvQJj7np48r/Pyj69
	 xJeWCP0bBUnLw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074137.47606-1-pengpeng@iscas.ac.cn>
References: <20260704074137.47606-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt1017-sdca-sdw: Propagate
 regcache_sync() errors
Message-Id: <178368416577.82617.7603021914520809964.b4-ty@b4>
Date: Fri, 10 Jul 2026 12:49:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Iriul63gfyTb34bYqKEzJ6Lu9Cd0ewBsDM0jnC4TMI=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqyAO7lGv7XuiV+5eSma8c/pg8YltXdPfDBPPLJ9p9Va2
 06B6XI3OhmNWRgYuRhkxRRZ1j7LWJUeLrF1/qP5r2AGsTKBTGHg4hSAiVgIsv/TYko1O7lR45dn
 jQtv36JrpxzOlelsD45PkYmtXm2z3yfspS3rEs0cTZv7NXYT7a6t26yVx/yl6/Gh/PTQU/0c2Xr
 WLFyblWecOvVgqvT5LX53d5t6uLL6ruqV/Z9ZUZAU7XGUb9HmK00aZh3rTVLcNKaK7dyYNl+4Jo
 DBWr5ONupLqEi3/Z22BK3Mxw6uGnlmPt8r49nCqxe51vyNk2uI9vuWJ7G/SoNb+01hlTy/ZG/rX
 w+zu+uf2jPefOp9UF7o1sz7k/7Gm1ixJ+yYXGbcnJ87+8+liVNMw28sVdu47X+xrLq/1ufiCW/D
 TkVVuRiIGM24KR3Lc9eHS6inpa9Hz2BJ5uEvvOXSJj0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:41:37 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt1017-sdca-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt1017-sdca-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/439f04ca429b

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

