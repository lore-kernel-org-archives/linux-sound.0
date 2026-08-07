Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A303D6CB7;
	Sat,  8 Aug 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191905; cv=none; b=LHII44XU2ACRw6+J5voMvYTXbRLbXMVF2QLzcnHGrVogNkl8DAHl/DLvsLqaIEPf/p7L+++C81Blw7BuCP5UrT3jbIv1FuLaoQxrsl5IBLJ45n001H17Iggy89dRcku0I8gdLTgN3r1uD3TFOZoyRruA/KIbVxd+jDvDDL3p9w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191905; c=relaxed/simple;
	bh=b84LKR1fyNO9pT0kCrf3bLJmLlWSoIcb/hp5yXJ9r6E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bItVN08nie0GNTbAVGHnBWr4N0W7L1w7WAstM+ZyxRPBLDyQJ0gHqWjrYCmV9Ynrg5+eSwy4Sa+0h8GOiFlCftI08gYrll2grmoeLR4ILDQSAojnmreo+lIzOJxx3u6jWfe5VHWMHDeOVy2uE7ciRCle4ZeFv82c8kfMtbrUUxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qcwc0CBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qcwc0CBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCAC1F000E9;
	Sat,  8 Aug 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786191904;
	bh=vSaNK2AZw5quCgarDYHqHd44zpaTbBh9GJtsuii1LHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qcwc0CBPa95hCAM4rE8/OtAhi+PV/C97u7PZ4F8d+cFLtJHxygtrFuZfjrlIDcvc4
	 1muRuszFaSm7s2Y11C43mv1JEsAlZfmBEFlQJszbXNg9FEBxXfOYU2qP+1JD4YnHVY
	 ZCvH8jzG+URORpEE5uA4IvKYpCvvKXkLtgSYCObCJHmzKsDPwEvIXHaibz35iZXTyX
	 cZv09VU/63zpT3SV/fiiVT8mGdo7KvM3YbbQoOlYAwR5V3fYIoXWKntvdnpAjM34uC
	 OdGyS6JyDU4wrUcyiwAFB1g55H5DCsvhxY/bFLDxGZxedftR4hqCt3ZDk2YkZt8FXC
	 uz8VBy1pHlhnw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260807012408.55272-1-rosenp@gmail.com>
References: <20260807012408.55272-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp: return irq error directly
Message-Id: <178611911883.279158.13122246716396470241.b4-ty@b4>
Date: Fri, 07 Aug 2026 17:11:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b84LKR1fyNO9pT0kCrf3bLJmLlWSoIcb/hp5yXJ9r6E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdyAdeRnQ+3U5buQwamZO1r0q76Rk+k6KwVOgA
 3/+PrqM7JeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCancgHQAKCRAk1otyXVSH
 0MsIB/48HBt0zx+mhkFDg/lXYEVkWIhsFd6SlQpszJyKo8zQTcgQiiuisoaFP+ywuwAXVpQrgmQ
 QsbW09Gw8QpQdQdTatwmYA/3lTGy+LZasp7mBQuPz2dovGDpotisZJDwIU04rC/Io8yZ8TTIS5f
 noi/HZGrqrekKW6sX3ouuOo09t0OF7X6eUskMh/JUhdreEE62K55zSu+SAe3zK77AjfuW/HGG/9
 7YFTLasqT1Vgv6TAAD2b4mL2w3SjoxDvZmdHHaLkDC4PLzrTxvAX+ygg3TOyvnojGKY3QwA1zrR
 S23N3JaclpdvtcmY/OAqkoNjCqRsZdNFAbmG8xXOBcgN1xXg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 18:24:08 -0700, Rosen Penev wrote:
> ASoC: amd: acp: return irq error directly

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: acp: return irq error directly
      https://git.kernel.org/broonie/sound/c/e04cf4dd5faa

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

