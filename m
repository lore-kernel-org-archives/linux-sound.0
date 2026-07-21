Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86C357D1A
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727264; cv=none; b=UWTvdJWCWk/eqkAulpQGz9OuRDWD+pqOuOA/FMFSe+bG+snOhz3WVdlXyozzGzklWXoFPv3C5pb/+fz5Zep6FBT/F1jAb4X4itiayM7Vfe9j1XAa1tA9C6vee5W8gDJJ4ZJqUmy5ZQ15dxJh/LOjPGUcPkq//lgJJwzxfBhAYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727264; c=relaxed/simple;
	bh=p+waUq8B+AzE5MxcfErzvcfBN6IRKgpR75yxT6Hvl/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AjNfiPy6/VJepCXJDeEvThSTngc1xEbBeXx7gF7BLZO8kFHBKXCSk1Q/xnAd86vqqho+XvOkB/9GNVZ7B3cnKR958jYeywM2/XdqO5tCnaeE7XmUe9sBMr7KrMcMnSBy0J0vF0K34021+FSOLtsE+6YUTLlKNkgGrGW/F1ZXNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoJbLX8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoJbLX8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603BA1F00A3A;
	Wed, 22 Jul 2026 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727261;
	bh=e/+OZGThnlELJO1kOSzjeLCqwiB8WjV7zn/y5nQN+70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GoJbLX8HdDwwkhm8xwv2uiXKfxzzvvefUHt17hxct40MoPBv0NAmLoKpASAJf17j0
	 0wbWbZjzSUASTMQP6MW9+1ddRuuZlWZLdlBY7UA7Hzb2+QSUbgQJfSr51A0J3+He/M
	 2UNgzzKbPq8hFWg/23e1e6faC7tJcpV0oJwfgcVHO3lwFf0PRGZk91+aP1bPzBLVpT
	 KqbY2Ic6EA7lMTId19p3Q4sbYPRnA1RcQabnA1uxThLZr0DAVX7W4IeZSlCOebnBDK
	 3mc8DegTO7xyPI7aCgOs5GYZZJsHSfMGbOiXnphEvyzduXSHQ423p7zfb+RNMXe4xs
	 vAjGRmhwTu/gQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: amd: preparation for Card capsuling
Message-Id: <178465643668.123404.16012691573480255104.b4-ty@b4>
Date: Tue, 21 Jul 2026 18:53:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p+waUq8B+AzE5MxcfErzvcfBN6IRKgpR75yxT6Hvl/w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbbvvMlI8qIhN5onmt1g2fKANslM9w/dYnfR
 DDe3QqPiIyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG2wAKCRAk1otyXVSH
 0OhDB/9uKPzqkPyHoIOK6GE7we3Mviy/GXhYA/gDYIwTz1z+VZx5CPdSwcx3ScDFsn8cODpn1qA
 r2y95AGptPMxbncDN/lOcDoWwxc3/XmSFRtaMS8o5WKm6FRltZqOyzQbfl/FN4Op9W7nh9EkIhh
 6hsbEniDT0WCGUSMIITgFT82jbRhF5ykAogUJ1Svq+zLySs3vgu+/TzOFure14oHH3/cfWZiNUD
 otxlIqa/m+0RRT+Ar7q3gqCauvhvXKaAH9NBPBao2ckXI9nmksGtPh5p/qzLunZI5JwxtPa8BRR
 +35JY4M/h3X+rjc+8Hhx7JoVoqIdyIdHJTX4l1C1jisCK/yD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:47:45 +0000, Kuninori Morimoto wrote:
> ASoC: amd: preparation for Card capsuling
> 
> Hi AMD developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup its drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: amd: acp-sdw-legacy-mach: use &pdev->dev instead of card->dev
      https://git.kernel.org/broonie/sound/c/2462bdc608e6
[2/2] ASoC: amd: acp-sdw-sof-mach: use &pdev->dev instead of card->dev
      https://git.kernel.org/broonie/sound/c/a429f382c0b0

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

