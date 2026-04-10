Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFCA3DB65D
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838542; cv=none; b=WryAr4anv/0FbyDyWfmcGZrCMlBjfhvuVVAlvXDyurskWmS5d42DPoELSLs+3Qgnff2PKvG0gZdEN7d1VkX0iS7Rf1eWYfw15Z32o8z1c/q3l1AsbKsx7Crs8HSr3jqkV8ROcYOTblHhHLL11RQG+gmFRU/hKfsVXP14d7qxngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838542; c=relaxed/simple;
	bh=hBNIJ57Dve3hNW+HuCnyWy6Kh9gSaPR4eP/n1OC3hrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UZQfFOLTZOEGnqRPYjplV6L6diWsPmqJggl4OQGEsrcmyfwFbQL9TS/UMnqfkzK/jf699XQTLx06tY8Ev24GeQodVUzk+zOnCjjgnjCy34Qd1bsZxNSX9dlOS3lTxKiQ5M2+Ui3NdJ693BiRkuC5uGwvvZVuLfhRgkpD4hGZm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/pBWsbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/pBWsbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA17C19421;
	Fri, 10 Apr 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838542;
	bh=hBNIJ57Dve3hNW+HuCnyWy6Kh9gSaPR4eP/n1OC3hrA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H/pBWsbT24Hcy9goLIlPv1i9MIMRceWcLq1GNcC7pC96RiftBcpOeyoFa8FXKyxp5
	 QtZs0gFnWk7o1ha2LP7becEY1YMsqJyIGDLimxo7odnpZPUExt4kYMjEOOTzp6UFeG
	 dZU4zAPekjlccLsoX/gJtzL2cAza+dybfQerKs3wfPR6HEWbaKgyCIc026s4/It49X
	 OYWQxTia7ED0WJaL5adL64NzsGG1p/ULScJD2dtA0hssVY9Ph4xRZDtkITAQ/fHyxO
	 E3yfOnBvpL+PYslcew8m1oa5BK1NpdJdahMbbMaMg6fUy0qIvelQBQv6XsLBw0qPrU
	 5U+t86STvyr7w==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 shumingf@realtek.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260410104500.163337-1-ckeepax@opensource.cirrus.com>
References: <20260410104500.163337-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SDCA: Update text of FIXME
Message-Id: <177581891215.1070744.18268671331772871226.b4-ty@b4>
Date: Fri, 10 Apr 2026 12:01:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hBNIJ57Dve3hNW+HuCnyWy6Kh9gSaPR4eP/n1OC3hrA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2SVL7+P+q07jTCfKOfDK7Hd9Td7++oUV260ZV
 7p6unuSdbyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadklSwAKCRAk1otyXVSH
 0O++B/9836kSubghB+IYSb/2WRr7uNI9O1ZC4jkhVoZn2Yy89GsgVgoMwaBEaGz+Z63IOoVR97i
 ykmvUiXisjMpHvuvBD2lNv+fzETbwV/EIHmbDl39aa7D6XkAlFqAGoqizCFgkx26p8ZQUe8UJ4W
 UKTo+qhBw+tLa8DkvSjr5BJLpgUnRqALGibQ5a5iEbpPWS0zQHvALVZ/jMeeHD+4hh0PZC5X/tA
 47Ikamw20b2yAELDqpmNc5qbd0RwrxG4QjtNCcwwBSKfe2638zBOx/hNI2LBBkbRXK5rsYTDT5z
 1yiMZvUuiuE5YOAz8/6AsPKYzGg0MioBar/CtIrYc0BxOH6q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Apr 2026 11:45:00 +0100, Charles Keepax wrote:
> ASoC: SDCA: Update text of FIXME

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SDCA: Update text of FIXME
      https://git.kernel.org/broonie/sound/c/558f5228e1db

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

