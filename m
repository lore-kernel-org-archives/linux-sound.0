Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E52DAFDF;
	Fri,  3 Apr 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235198; cv=none; b=Cl0FGW70zBqv1TRmXbJZzF+w7yOmlrwTrdyi9I31g4E5kZ/7bX6hPvecf+iPK24A1rx53P59g8DcIafL5N9SFVVnz65t57449vk9ubvwYmWm5g7X7vi5w6sqK+Ju7VgiiDtERmMkTdD5hBwMNKh/Ov6id+JQmkK1iNE9fQWaoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235198; c=relaxed/simple;
	bh=gdgdM3fB4wzItjFyG55Tzp7c1I9NRlNk9iyF2DU2vs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dUevod8U/dcKap1viUdjLgXzKFfsCgcP8WmqUd5z+HhQ0P2Y97ACYJ3EdHvNSg8pWDz8JEry2EjtbV29Q2VKQ95LiYPgIzmczCKpNBXvX+WYpOd+hBYUAWkCcyGXCAHZPD/5+cXqSpH6DHljmS4//qCMsCbtQsJSFaMtblKRnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIR+fRDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIR+fRDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75112C19421;
	Fri,  3 Apr 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235198;
	bh=gdgdM3fB4wzItjFyG55Tzp7c1I9NRlNk9iyF2DU2vs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aIR+fRDjb+43amjIqGzovWhz1pElZznj9y5auhRImrqOAdwQHwamh9zuyio4OXmgp
	 sKoE8SrWkj26/KZ9v0RRdHTbY9ulZ3VzxMF2fI9N63yYu9CuVoGb9+MqRLHnbyvq3U
	 p71kxhY17zXQO+Gv4EdrWIVP67H4DFQXIjGKwkVHwlB5sFZZMGsJFV75tCADOu75G4
	 Ob6A9xrRF+lBOKXqVI11QyX3+IduLHaQ1negvND+mm10s8mzxjnTc2cTjGkul94CRE
	 cUP5hO5AJObbuFeBvf9wf+pQtUsZRA2rGT+y4okmu2Nw/EhrqlUBlivgPi9iz/VeQH
	 9Ps0llUM0B+7Q==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 superm1@kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260403063452.159800-1-Vijendar.Mukunda@amd.com>
References: <20260403063452.159800-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp-sdw-legacy: remove unnecessary
 condition check
Message-Id: <177521978957.52946.6156656301842370789.b4-ty@b4>
Date: Fri, 03 Apr 2026 13:36:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gdgdM3fB4wzItjFyG55Tzp7c1I9NRlNk9iyF2DU2vs4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpz/B7FJbf94IhmapyyNnMkezArRcsEdJqN6X6l
 fEKaRi0a62JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac/wewAKCRAk1otyXVSH
 0Dl0B/wMkLXnl5+Qew0RjL9kFbrfEkt/GJfbE0xPfNlN7CvgPPflT2A0rii2LCuif4UqU9AfyFw
 uIUMHHP3CLs1z/UpXia9nopyrhXv5KGr28ZtbEvRBammeqiZPpJmRDYrecDLm9t7bkiJ8WiXDxX
 3H8jLo9qUFfCR1/L/59PZmHarhWRJZJD6fcolA/rQ15dg6vIjJK7I7xLydxkHJ39ombQ3pUbCPw
 a57lfZ8CNCVbemxtAz1qbrXMFh7KGKf9plKBFIN6zmf5MGMB9gzu/sfvtQoq3Et6lgT1Tq6nGae
 qrEBw77wLHR07Q7LlbJIf7oN83ltADym4l8OjWIneGfPfR6g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 03 Apr 2026 12:04:25 +0530, Vijendar Mukunda wrote:
> ASoC: amd: acp-sdw-legacy: remove unnecessary condition check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: amd: acp-sdw-legacy: remove unnecessary condition check
      https://git.kernel.org/broonie/sound/c/0178e6412312

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

