Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EE36F908
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560556; cv=none; b=PPyTU9mlVgqwHhLDFwMbRVRgTv7eoCU/45jJF9GnSZXeHUbfn7NTEYsklL9ReJsFKco33euogU3TAzy64/8/u8HFrUMZngX1/sAaRcyTbECrJO01Y+NmRSNr9wLgJZKiloUK9kiIhGC9LZXpsGy6BnfTMUUP7NF07/DhmW5aL5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560556; c=relaxed/simple;
	bh=afYdW6WpbCylgXxMy59z6OHBl9IT24cHdv8Da3rA6Ys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a0DnWi2bisx7FvjdH7AW/THPgL5vxh5809VRlVIkoB+miEszkCQ0reTRPLI1lJIQdbrJRbdqSeDLg/fMJ+fGM3mnlTHdud9o3t+WffQpuXf6Cm8kGjYOFewfzSiF3dEzY2RZ8jw7gRehYFPK+XYIo3070pP3Hw6qOIplB3VEIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi6lvmvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi6lvmvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB451F00893;
	Wed, 16 Sep 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789560547;
	bh=NZS+8M9xCyWV1SQSz2/o7Ssf3u4Fyt58Af5CA+H494Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qi6lvmvzxPGgihfUtautp8iVmCMQ8NhyZGmuIN9QMNabN2VvVQNqoKI8ykI4e/PPb
	 ERTTlxFc7CjNJxHqc5WqPX93g/B5B/f5wMaWTLnV1lpZX4Qqpfrrc6nmvARoytrJcC
	 alLCnvOG6PT+KfP9OXTnkQHgaVwJ+7nVQlXZNe/yiyTFU29mRG5fljoPQL/bSnuPLz
	 73RvhKGc6//LIl0a8lc0GmfBY3R18Rzuc+cDUnVj4X9VSc0GrlhHggL4hEuntNDTdM
	 MTHDhKypoZqZ8MSfkXt28EZCjRkmPHUQbQ+VqB5WRs37K3SbHuAJWtbjUsY0pOkGTD
	 wGpxof6wOIWiw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260915044735.1305-1-shenghao-ding@ti.com>
References: <20260915044735.1305-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v3] ASoC: tas2781: Add TAS2573 calibration support
Message-Id: <178949457658.151760.15632737262810659230.b4-ty@b4>
Date: Tue, 15 Sep 2026 18:49:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=afYdW6WpbCylgXxMy59z6OHBl9IT24cHdv8Da3rA6Ys=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqobfR8BI9VgpGXio4WQ6YyOSB+TNJP0scVX7R
 j4mwGUULmSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqqG3wAKCRAk1otyXVSH
 0Fe0B/47DsWyok+r0augNr5a+08S18pgItD64KQdkv9WcmMwIHZGWGyTecv5R1oDkPzgGYaiZSR
 dzpo20D4ZJyCh0U4gcmsmAUqKdOPzJ431wfUSK6xoYvceO51K8Gc1xMAh4cWxLC6Kkpj7Utkf1j
 eyypX/jPDY0HLY2mfoY3B/TUyXUAxCkTmEhHSTM0g7eHti6iAPN7TlrwsXjwOC81tyJFGahAwzD
 u5SZ+NwsD2GKu1TE2m4RZpruQluvg67+3opZvTtBJxh+L4GxwoNEJfMrgH5Ze+FJq4taNAiLlPt
 +HDNNylczmBhGxePOF/zivv3N9+aeUjN279sQTXTfRFdPLFa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 15 Sep 2026 12:47:35 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Add TAS2573 calibration support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Add TAS2573 calibration support
      https://git.kernel.org/broonie/sound/c/d1a73ad21f96

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

