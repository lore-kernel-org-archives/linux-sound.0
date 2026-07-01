Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF13CB8F0
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079827; cv=none; b=N08IPt4MPRJbSFjjsP7bkRlIPelbkuybVYaILWkislZMJwVwNaLS+90zC9Q0e5eVbo4voqlwTCLPrymPseA1tbR7OxwK67Ugjr7TyZTnhEqKE14c66uJfmyEuDGRdjP8ld5e3dJFiKC5A1H0Uu+5MzBVD9dSfdIRMILTYnbYaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079827; c=relaxed/simple;
	bh=DHzSjS5nmSDwAyjhso6u7UvYo1zPstaiaupaei1yLaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HIS9f/EFdHv9OK16ZxqzsL91sVpa9qpe0q1KGMVsV8e9lfah+aePUET4HYbFV7FJZeZ+WbyfliClXjVVA6ORZgx7R8dJrFJZ/kMY3WiG8CVjLax1ZKpb7oGF4BGjVZIFWLtUvXY4hHQal9dEeOYdYk/06xmDC3Gq5Um4gFtuxXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMyFt8q7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMyFt8q7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272BD1F00A3D;
	Fri,  3 Jul 2026 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079825;
	bh=frfwuPqeIVOqyMMZ2DdV2MRvqfcJ+kQ/SHS4yHiTWOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QMyFt8q7zY215XhzCq1Du3UbWCNJDlCI+GKrxywhHzK81nQz3M2btw8QSjJsZudny
	 MFhTxNkNJYdvX08R084e1c04eq7g/yX5LHsKuONtM2RFmntzaped/0QyWSHVCR6vte
	 Ch+Y9HHT0Z0lQEEC3tLDiNlHwjNQwmJ2nOfhMQneQYANBsRKaYtFOWsYYwPrwYwvvs
	 pwzdr1NEEnwZMOiSNCFl6HXjSnvgmm4Jfw79/WyinhGxswkayiSYtl1THN+Gho+5qJ
	 eLwVNQ9qZOpFLIt8SEgZ5YncUaFwsVndRdRrF4DLuvCrEdCEgCZjDu2RTDQfH9MzaF
	 +qgO8e8VZIzag==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com
In-Reply-To: <20260630072311.8427-1-zhangyi@everest-semi.com>
References: <20260630072311.8427-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v4 0/6] ASoC: codecs: ES8389: Modify the ES8389 driver
Message-Id: <178291863280.38925.5011079351614169537.b4-ty@b4>
Date: Wed, 01 Jul 2026 16:10:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DHzSjS5nmSDwAyjhso6u7UvYo1zPstaiaupaei1yLaY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6OQjM+w1iNtamlHN8Y0LSfvYueEMtXMVe4bp
 tajRvdrt2WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejkAAKCRAk1otyXVSH
 0B2LB/9qXB1YTfuVOXABydx4cvt1+6B9ELuFLDriX8/2Z33RD/J49C85yzFz4dnH7TBaNorxRdI
 rLr2bI767U/+w6t1yPgUhSeZc9kmOT/lc9twF9KomkPWgw/sxVsv0v+LeSTv+OcRbUuHwV/Rn47
 zZKsx1hXmNpZq74xecT4wA/Z/FtnAMCsyicBA9LSm9FadiPznAFXT45jS+YnCEdo1wqpJxDjB4s
 W4aZaIf5Q3guyR2qBFNtGBEovmub7ubCJ0kGQdZvLdgV5AbEkvAs19t9znJcJvGvq9CO06YiaWv
 i56PfHUyMfBWxdjBS9+sMIj8Kng7zOraqzuU8hrMOENHiQEa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 30 Jun 2026 15:23:05 +0800, Zhang Yi wrote:
> ASoC: codecs: ES8389: Modify the ES8389 driver
> 
> Modify the initialization configuration and routes for ES8389,
> and add private members.
> 
> v4 -> v3:
> 	-Modify the maximum value for the HPF-related kcontrol
> 	-No longer returns an error when the corresponding
> 	 configuration is not found in hw_params
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: codecs: ES8389: Modify volatile_register
      https://git.kernel.org/broonie/sound/c/882e55031187
[2/6] ASoC: codecs: ES8389: Fix the issue about mclk_src
      https://git.kernel.org/broonie/sound/c/cbc559dd8d46
[3/6] ASoC: codecs: ES8389: Modify the clock table
      https://git.kernel.org/broonie/sound/c/9367a244afc2
[4/6] ASoC: codecs: ES8389: Modify the initial configuration
      https://git.kernel.org/broonie/sound/c/3bea836903c2
[5/6] ASoC: codecs: ES8389: Add private members about HPF
      https://git.kernel.org/broonie/sound/c/87592da1a490
[6/6] ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX
      https://git.kernel.org/broonie/sound/c/2264927316e5

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

