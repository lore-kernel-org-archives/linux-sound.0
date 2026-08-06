Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50835B62C;
	Thu,  6 Aug 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039123; cv=none; b=FKwLTMsgtDhL7UW2yG8387IIIHdPpOdqEw493fqAtiGdXCflc/08uc0XHkVZ67+sPvsr5AEd1RUPjgZ8fBSltOvDG++AZGo66fm1pCsMIliD5dfehURzRsR38cHoePPb6rb4aSVHimxDNYQPLp/wqeGl3i6CZGgCZ0FADwrEDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039123; c=relaxed/simple;
	bh=zcHX6HnsUzmBNCKB9e4Pa6gnw3b+1uINmOqnjQrMINY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ba5H4Bu//hQaNtuqaawHfFeBFOPbe2Uc7jvnlKXH0OqR+Sgfyw0J4rN2xoX6BK4X97v6lMj/y9S3oJhhxOReQL1uGug+xLbwLj4KHGQWFFh0XnBcJ219XPTWVZTlezMp01v1cTnGUDnp0TgLQI/HGQYGTL+irpV/6BiAwHW1h/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOirIzhi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOirIzhi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963211F000E9;
	Thu,  6 Aug 2026 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786039122;
	bh=tZOvJQgoQoizrEmpjXzJ+hG2hidwRN2WPPPearsggwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HOirIzhis05DHuivt2zJi3A825/hHTkHMFMPBqM8SiVcEb6TaDgiHSrDGxDBb6D5u
	 xe+bKedyfC7sEK7NJqK+cHQvWRJf8M1TBdEsjUgaM1+TrXDqidhfO73ZLIz/ftkvVb
	 bU/8F8ncVL2up5VzTaaGEXuvyGH59W2+EpCUyvKD6t922kZsctr5DMm21wYJJzemnh
	 +QbQ5uovtsbLTXgQoDyrstQhkLF5UnSXlKuAOOlxsN8g1pwLO7X43QiKrP3P6cBwg0
	 NgdHi7XjM39QwTXdyiKtZT9pjUkzxqTd7yG9aiSww6PgonhU7BPKvuC6zQhWNY4uCV
	 0Hfnenu+zYb4g==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com, 
 baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com, oder_chiou@realtek.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/8] Reword the SDCA HID code
Message-Id: <178602013531.110757.1836801973517903243.b4-ty@b4>
Date: Thu, 06 Aug 2026 13:42:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zcHX6HnsUzmBNCKB9e4Pa6gnw3b+1uINmOqnjQrMINY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdMtOGONMTHPyuYtfDYK4g4T+WG2kMPBwvy4Kk
 3s+H2qRTiiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanTLTgAKCRAk1otyXVSH
 0LJLB/9+XOaleEXUyPGVV9z4qMegZXMyEsWOpr7XJ1KY77hfDmsjNOZIy//HvTsWrkebHc4l7RR
 PoA1qXU39s2FgDqpDn0iAmcVO5kFrwTN13HMoyuuNB1AwC7M8NIs890FEZgLeSf1Epg2CzPWnL7
 FJ/zzWFPCAJpN6RSoGXDN9ysnDP3IJxngXKOBjSifxHwhtV9z9TjoBBh3qUK9QXgtvWvV7ObeUH
 5PM3EbjsIHetCeoQDMKJ16NwCNbAhb/b88Lbzf6SdOxFzXJHyGwHBDt0dxK0T8lJ3kp0KNTv9ZJ
 nM0/DXPGGlr/LmQyx5feOYBAG6GEoYE4kZCWOsNEq5DU4NO+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 13:41:57 +0100, Charles Keepax wrote:
> Reword the SDCA HID code
> 
> This series reworks the SDCA HID code, the primary goals being to no
> longer store runtime HID data in the DisCo data structures and remove
> the need to pass the soundwire device into the ACPI parsing code.
> 
> To achieve this the HID device registration is moved to the IRQ work
> flow rather than the ACPI work flow.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/8] ASoC: SDCA: Tidy up error message
      https://git.kernel.org/broonie/sound/c/6a236928b43c
[2/8] ASoC: SDCA: Remove unused dev pointer argument
      https://git.kernel.org/broonie/sound/c/3dcc74d51b22
[3/8] ASoC: SDCA: Move HID registration to IRQ time
      https://git.kernel.org/broonie/sound/c/c03f0b9a7d99
[4/8] ASoC: SDCA: Move HID descriptors to function
      https://git.kernel.org/broonie/sound/c/f3243b79026e
[5/8] ASoC: SDCA: Update HID DisCo parsing
      https://git.kernel.org/broonie/sound/c/01dba3e93486
[6/8] ASoC: SDCA: Add missing destroy for HID device
      https://git.kernel.org/broonie/sound/c/df1fd5d8ab40
[7/8] ASoC: SDCA: Add missing HID kernel doc
      https://git.kernel.org/broonie/sound/c/3ede9e98ca1c
[8/8] ASoC: SDCA: Pass swft table through sdca_dev_register()
      https://git.kernel.org/broonie/sound/c/a50e530e05fa

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

