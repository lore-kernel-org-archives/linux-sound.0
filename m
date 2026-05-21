Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73B3E16B5;
	Fri, 22 May 2026 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445401; cv=none; b=sxy+xg4mPONKbFilT7wWpF+mnzNq9jlsMV8I5s1PTGJTrVurB7Z8AKsK1cltBIQEBgT8cfSmr/GdQ8971LZ/yUO1t3+B/zGOdeXtFZEdzRYOPnRtkp5OO39SG47hFfaYrBSglIGg7ItpTJMylJrCVxmZsfihjxgSdMbUtWsZKcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445401; c=relaxed/simple;
	bh=S0H5SD7RtNrJYabw+dCE7C2I2iaTckimDYHhCySa8lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nJjLRPsiN0hOVqwT7GpSiRiRcW/LoT7UynMIzl3BkGPqk1HdpfarLSDy99mRzsplfTASc1r2rI4rrmXkBmMcVFM44CDmuronZMXntC/K7x2bOkXEQuuSZ4zDSccj30aJ/HatzEzvR8KBNnJUfrq3rDCH25C1xkJ5qV1zhnV7420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooWnQQ/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooWnQQ/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2063B1F00A3D;
	Fri, 22 May 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445400;
	bh=+/dSVMv48xePhTwS4a1H4gsSe3rM7OX7KSS3a3eIqI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ooWnQQ/OR+X7zpcCwcZXOkeIx10pScj3koRY3Vmt1zIVthhKJbME5FTXXQ31hgug5
	 ltXooAbhwnC1QAZ2zrzHSqTALjmicfIwOVUJNMiKCyTpRBmhXPHIs9Nb6bTZYh05/f
	 Jh+b2KKOSIq1wo03QNzaElO6RXwayEEQIjd6nE4im6mFNMEAe2iDmjaIEwRVeD+kbV
	 Ei/URrejKXE9kROwfwYdMWXFm0bx6NYH/pKm0iFntNVuben/ViajQfVAw8az/6rtRP
	 NpAgqi2KNCZ4OtjLermrSM6RGYiNj7MiwxGo1OeK//UzFTPBUvk4xPg2mnxQUUoVwx
	 O6Z1hb2m2v7fw==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/3] Update some topology matching for newer
 laptops
Message-Id: <177938748816.58022.8067556376313060581.b4-ty@b4>
Date: Thu, 21 May 2026 19:18:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S0H5SD7RtNrJYabw+dCE7C2I2iaTckimDYHhCySa8lw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6Vcsy9K5WjUnGBhSpS6cUPVf5eEkGmOYLx4
 cO/3fvOopOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAulQAKCRAk1otyXVSH
 0LOQB/9u+shh+Lb6wrnmIu/JSztwJKZcfzWN4D282ZfG00SLoVCSgWA8AIoZqf4mt6xxJjzWXJB
 LAt9xoDOlUlNVhU3j+0OGltSV89H4UsMYs++Oh8FqKqApTIkLYsL6moGyzB6GnrX9kZczvk0jXC
 IkK8Qsu0DtPH2iFe04ww01BZXADPOBlcMengsXObAq7Oa0QBw+gmNtRFZltVpj84V9VPU/c++/Y
 ySxB/nLPf8wuOWFGCn2id4WEQbeWCnU6lVI1Xgg28lV2rbzfw/gc6DlRF1pJc3pSp3nm2KVCvo9
 rUmJmSc8KgIzvro2NP++s2X4Ixr9RbiniHutkoinZ6o4nbsY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 17:36:28 +0100, Charles Keepax wrote:
> Update some topology matching for newer laptops
> 
> Now function topologies are being used more routinely we are hitting a
> couple of issues on some new laptops. Firstly, several laptops ship with
> devices in the ACPI which don't physically exist in the laptop, this
> confuses the function topology code as it tries to add those into the
> card. Add some quirks to ignore these. Secondly, remove some unnecessary
> matches and quirk the ones that remain so they only match the laptops
> that require them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/3] ASoC: soc-acpi-intel-ptl-match: Make Chrome matches conditional
      https://git.kernel.org/broonie/sound/c/e0fb794d67f8
[2/3] ASoC: Intel: soc-acpi-intel-ptl-match: Remove unnecessary cs42l43 match
      https://git.kernel.org/broonie/sound/c/45cf24da0a10

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

