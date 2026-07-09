Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA5C3939B9;
	Fri, 10 Jul 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684103; cv=none; b=fO4nRc3hgtNUfGLTOo4NGftAgjAqlgK4gJLBGj9jXAJe9NfXHuPHVmYZjO1UgerTMN8tai0TakesecfctwXOC9skgqwPZsqz5ujuXCwttTVETnBjMciK8vtN4Kv74D+AMbuVsszR5SRivmo7xn0TF4LMS9obVvusyaMcL1Q3cP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684103; c=relaxed/simple;
	bh=iFjnRlquVOaZ4wP55nGoxiHvMoTkflEIWZvq+ttPlY4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n4QwO2Q/7OuzON0o+HZMFhfD0B98HqFDn0zDoIfcnEWQAk5BevC/QLbamBR0cZSA+xlh5mAoZx4NPcIMDa0eP7UiZRwb5OV4PExMNMIRqbIcK+vP1tiFduMdA4FnGUy69PTRTuPH6ogh0EgY811hC/RFaxuyCfzP7LI1+SUUyM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4ilcVT+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4ilcVT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6BB1F00A3E;
	Fri, 10 Jul 2026 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684087;
	bh=xxbXodlgIoBlzamFUUUt8UhwIHbl05eXMX5J0ic8mak=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=g4ilcVT+0uUHk+wKN8+RQ95R4OkF4Fffn1idmeTeApk2N7grSe/gJfbkLsecOwkVQ
	 ryhvN67JnxqEThkdV2txn/AmHklagc1Rs0OxdndlEhXAixYAZQK1GPOB1AXikQ9vvc
	 AS1MKdVPMoK5++qbWM616PcKlADK2ewyKR9DAeEXemNYhYZ1RktH7Ljmm5zRzpIBrM
	 QdSOwcsNSVKDSkhF1fQfLww1ULPW+OzxMCMNhmB0VDFOd/3NnGN8ik7K2uArjeQ6Ld
	 wWPeHzunnk14muhKkL1QoW5tRaHU5wfXp9YWcVoczfpNXsFM9voLVSnsMPn/EbLgN1
	 MksJfySEg6PFg==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074550.57755-1-pengpeng@iscas.ac.cn>
References: <20260704074550.57755-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt5514: Propagate bias restore errors
Message-Id: <178361382699.100558.12534129678680380349.b4-ty@b4>
Date: Thu, 09 Jul 2026 17:17:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iFjnRlquVOaZ4wP55nGoxiHvMoTkflEIWZvq+ttPlY4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNv1ERp0E6Mw6hOUAFn+2O8aELo1giiYsI5pT
 MnRTGpBkPmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb9QAKCRAk1otyXVSH
 0GWUB/4g2zdauBWBraGbUEO1ZIhSIqi2nWMA+pDfN4ZEeQiqCAhJxLShu+rrnGuAnAihFA1lkDj
 o/M8L584sTcVCC9nJkQyYOe9becDEWdNkOynkIEypkLtTExAgz4Ur9J2Hqm9bNsi7LoRtV7uWgy
 1uId00pHRJO7fwXgjcqGE/4NPPuJ/wlxFXZku6viXlZySWnuBhCxm3LLswTbC2K9eXMmClcSPbL
 nAY+PdGCqAouAEFmEeLS+ZTqXydjNbwnnTKTfNzvFWZqquFd+UOCPjudHEQ6N0MRZOnD+hL+rFf
 tD7C//FgPoSlFNIw97n9H7N05ErVOTd8KqMZVYUg1xFhIhry
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:45:50 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt5514: Propagate bias restore errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt5514: Propagate bias restore errors
      https://git.kernel.org/broonie/sound/c/abe8ddff80fd

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

