Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195013DB992
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402084; cv=none; b=hRvEpgn2DbWvVpMDwC+sCQn5l3Q/2BtL8o8Ld/HPcvhbVV2UYU7hZCBgThmLL/GgvATm47gC7MRvqgJv4vrItNJn4AyLweBDKP8KCaWQSE7zEZhaZsgIEQLQUyA+k7TQhtfsWxyCTVmHBFEB7G6XhJdJ0YBFZGTG9t8pMikoTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402084; c=relaxed/simple;
	bh=dGCT4XHcujrQK2sKUgNEKADIdB0SmB+vR6weKRUWRf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YeFKxQg7Hy4jtnw3VkDT6g5G08KsiBiKFd1Gqt1vwF3tTi8HuF3DhS/lmJZYxc5IADh/vGmvKj8ZQ0yu9AUql8sSZs7TQ6nzDirTEkgpDNmkDDhwn672NmG/ta+GBBodi9Hfay7IV3qyGgHbnoAd7rc/edka1kC2ut0Mzpw3A7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/G+9EOr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/G+9EOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BF81F00893;
	Tue,  2 Jun 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402083;
	bh=kwewgopAPfs3G1mCE941odq66nXinoK5dIHmOcC3TWY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=l/G+9EOrEQkQPmsEC6sJ1HGU5PzvQTrCMPASZcpy/d/w2orBf6obVj2eb80mY3tUS
	 CLXY0NdRKLx/0ItyoPWA1tGdleg93y+Wjz90oHd+Uw2Aru5jAeyEgxrIXFqVDAhGve
	 V+YpUXz5JWxVpXdOxUvMocbG1pboEvLBlthJfnFiZZcR18rc7Q+vA5FwoAN9uxRgwJ
	 IK35CpfZ4/RjAVKPGsDEQszdW4TAc3SVM2cPe6x1CFuPJKIH8WkrmAW7ty2sgEUCgs
	 KKDBxi6iiHOPYDkJhR30iFFe6dUOrMcqGyKI4irkW7DKpV/N2l+RMJDc4EnxJYbZ84
	 BjqbstPZidifQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, jiada_wang@mentor.com, 
 linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com
In-Reply-To: <20260525201801.1336936-1-cezary.rojewski@intel.com>
References: <20260525201801.1336936-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/3] ASoC: codecs: pcm3168a: Fix and updates for power
 management
Message-Id: <178032591118.44654.4554236976696140137.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:58:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dGCT4XHcujrQK2sKUgNEKADIdB0SmB+vR6weKRUWRf8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHsegdu17zjEUyBhNLpC7dQel1ak32+GqO0ncO
 XPj3GpmLcKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HoAAKCRAk1otyXVSH
 0EIbB/9AUgonkPJCcWNSd9X2/CNLg+wUE/tW0THMdFS9P/HxUE04VrC34du0uXyultd2Gret/hj
 DloIjGYGYMIVhyQI83EOWvn71Wl4piKRU1gi6syxCHwTaDm5/+FX7DlbEzYe28zYgO3J5fPYwNo
 uDDlExGh5BoZW7xsJzVtx8m3CKLQ4B2nUsAXIyvqbU9VizwfS+y9JaR7ci+ad88QfERxcHRLH6O
 17V01HotET6k+xsE2knulikCkyhERk6p5MDe7tOCoALfRPqFnbBy3vgyV6ic3ESNI97orhD4od5
 5ZMLT2t8tC3fVmCoBcXgFrS8+TgNGSwZctp+gDJKkc2lWdo+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 25 May 2026 22:17:58 +0200, Cezary Rojewski wrote:
> ASoC: codecs: pcm3168a: Fix and updates for power management
> 
> Set of changes composed of one fix and two improvements.
> 
> The fix leads the series and addresses "unbalanced disables" coming from
> the regulator core during S4 (hibernation) scenario.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: codecs: pcm3168a: Prevent regulator double-disable in S4
      https://git.kernel.org/broonie/sound/c/bb3c847523f9
[2/3] ASoC: codecs: pcm3168a: Drop redundant pm_runtime_idle()
      https://git.kernel.org/broonie/sound/c/2c734439be9c
[3/3] ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive
      https://git.kernel.org/broonie/sound/c/eb7107264da8

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

