Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928EE3DD537
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065729; cv=none; b=X5Rv/ns+AT9O7ieMBIFYPnnr3tckMQAZYOBeKAULajThphNhrllKe1ODfZ8A7XaLCH+Vo5wY8BG8SvQGRdox05ZutO/QSneKPmeVqHVzovbXqdcIqAJAxXw8vMD/gDqCQDB000F/xBNHB3SmEf6Vh6365oX9iznCw1WxMC9Kk88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065729; c=relaxed/simple;
	bh=2gS8XfkusJFfIAIxl+hvS7jeOyiTzzWPkRzYzKPZwIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSDlNv9wyt9mg2ne0jDyfnedN8ngeo6+VrYMEFgCyCmKDjbwzoofBkjWylxMfWbZU+5aKUru1BhtUQ6yIJCWwbN8ppxxpPzdCfb5K1t6YZSb/u6gD6erroORIERAtY/gAkiKbKtiHLFIXJaTqNt80SFi3uSZWc6x1rjyxtlCzhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhVChKyS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhVChKyS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35AA1F00898;
	Fri, 29 May 2026 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780065728;
	bh=HhZoZAr2pF2fTUiJqVrj2murSsl6nzRUYuqbfzAabfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nhVChKySr8wOOSPMBADn5djebqB9gYaSyMRiOStgZu2DR7he10Odpmqx606RMUX97
	 JSe/TedOGvzJGHlGq/vobRTvJMKmMPP1tTqwbZ+nfQxKD1AR4ORWev9QmRnUcfESNk
	 wtCs9/jQsLow9zzikyqp1oaZZA7zVpHnhP5DCMJr811D6vcffaEUvkr03hD7jHH87E
	 +tcf4so78KUE/kjzBaeRoSkOQHDK8GtYaqe2ERRj09qhHb1p3s62QS9RU2sykwtEMc
	 PK6td6QXotg3ERKkIRcCPS1RYFCITSebf5UcoCDcIkJ2SBsRn/ybgd+dJbiJ8rT8vp
	 aGQ54pDAOkYhA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net, 
 linux-sound@vger.kernel.org, andriy.shevchenko@linux.intel.com, 
 krzysztof.hejmowski@intel.com
In-Reply-To: <20260528083444.1439233-1-cezary.rojewski@intel.com>
References: <20260528083444.1439233-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: Intel: catpt: Error handling and debug
 improvements
Message-Id: <177999197688.110239.12996121345217539599.b4-ty@b4>
Date: Thu, 28 May 2026 19:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2gS8XfkusJFfIAIxl+hvS7jeOyiTzzWPkRzYzKPZwIw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqGaW9TdAu83w9orHJy/8BfmyF9uknXNQexkfHN
 Mr7GeuH03OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahmlvQAKCRAk1otyXVSH
 0JXSB/9bZj2Y3gvNK1qX3vhuyafXXDiuuSnUvaiyN1fPw2YRU7Z896kdzUwrbKTwBbX1fPO9cYv
 fBc2oot33MwmhhHpxikHuoSQADR50ZE0gvos/VPUeogRIx8WMpVZ0pUljnbjshoeOUjGMQT0oHC
 L+xNhWg+fqDCXpEKk37hFMLVZPYxhZmQUU/xPlFBRMR4c7Vz3oj2oshh1w93Nx+uoMgYgXScw/B
 Z5FzTE+nuVBqj1yAyEqcyoEbCYhWxNEmCp8V4/sw85yGSorf1Ynmvu4iEr/Q3v06FQnfajTAUVc
 GV0WPf18sgWy/bYGqMtIPnC7w3/Ayrj5Rb3VQoVKifXp3HhG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 28 May 2026 10:34:41 +0200, Cezary Rojewski wrote:
> ASoC: Intel: catpt: Error handling and debug improvements
> 
> Outcome of a long debug to solve one, long-standing bug ocurring very
> rarely on Haswell/Broadwell machines during the boot procedure of the
> AudioDSP firmware.  Clever/unfortunate user can increase the
> reproduction rare to 100%.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/3] ASoC: Intel: catpt: Complete coredump handling
      https://git.kernel.org/broonie/sound/c/7e5d59f407bc
[2/3] ASoC: Intel: catpt: Add pretty-trace for large IPC payloads
      https://git.kernel.org/broonie/sound/c/0ee392ea75c7
[3/3] ASoC: Intel: catpt: Print error code if board-registration fails
      https://git.kernel.org/broonie/sound/c/45cf3e0cb4ca

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

