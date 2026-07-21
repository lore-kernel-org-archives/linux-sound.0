Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7035AC28;
	Wed, 22 Jul 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727271; cv=none; b=COBNIJRGNiJ/mBIW5ioeg9ewCpbwganOymVAb8OO1nS+ukVMNNc8yRtyCt4hqXBSjk+/NoNjW+ROZAAq2wK7FGzMdfY998GLPttXz3paL4f6jb4LSIBJ4WjT3qOmhaH4yJ9cNiocZ2LZlJrUoKaHfUOvfxk1++y887Hrdv5nkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727271; c=relaxed/simple;
	bh=RWJkUAxNc4GbsZaqLm6Y6daUxTzY6ozDVLSGNXmnAb4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jk7LZ2BoeLyd8LjkHfbrnGgO4xICUhWa0L36fjrFyVXEwpEso92z5YZ6Tl55o2N2OcQFkwxLnhg3QbaByWBts/h7I6OtIXbXdXpU1/1Gd2rPNgkjFqjMB4ZoJR2zPnIY4NBOTxnVb77wRlq/6Gw0A4wgyB76RDmfRS1T6O5DmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOXAlSNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOXAlSNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B041F00A3A;
	Wed, 22 Jul 2026 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727270;
	bh=4txzsneR2KxSiA53F0gILCYo1BNWP06MtMDtkpborEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iOXAlSNleEB/5Z9bO6YuIcNNWHKWHovXs+IDdlzaLSahPl+JNkUMD9xtz2wNHneGK
	 i/OoWoe9ODYMpETx4Bx7Xac2kqzcTHqb1zUhbwadf+wR86g6M9m33JuKHruj3TUE0U
	 ZIJm6ddadoD2303yVxaMuiKprtX3/qVssV7ktrDyAO5VITXkDlNhdIcD86apCCy6uP
	 +tar7zjUqXKPV3P62/bNkluYbvKXPqSguz/8R0G7CMUTTE8KaoEkCL3PBGk9ldD+1q
	 3p3T+rS2oM5fdFgZ16Mt+757hf6r446XOD7+1eZ0ifUHnfgUDOhlalALrhoswCRYAo
	 xiFOzPrSFrrIw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/3] ASoC: qcom: preparation for Card capsuling
Message-Id: <178465724276.123404.7579010273952495297.b4-ty@b4>
Date: Tue, 21 Jul 2026 19:07:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RWJkUAxNc4GbsZaqLm6Y6daUxTzY6ozDVLSGNXmnAb4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbj1PK6qtO3u30yzfp/V8yQZDLKVn7ca6yBF
 uE53gORVimJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG4wAKCRAk1otyXVSH
 0GnLB/4o5tVGdEz0AOmROWBlMBehWvIOg2h9+RnOgS6tUxHuUiM0Rjue+umWFhDcamobd+Xgnb8
 7kedfVUX+80WCW5JyDz1FGcqbsV8K78W2qoKUfXLif+ZDv+N1uNdt1Fjb4XbwGIHg1VedeS9pV9
 q+mFl+qVmHTX5fEf+2wzDu2e0JYyEkiOhL6wgsf/XM7N2sciS4MdhxB0obGopzofk7tw6mwjvzA
 V/vSzjm2SodQ5jRhRkZn1QzLcUSm3dWU62qSvceXFHbZu2bM6jHGuf+J7TXl0qPTHJ+zCvJheNP
 qugOkTPaGS4To8Md+CsLU9pPD/PQsk6lGAe3HmUXFWq6Ydqd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 01:39:26 +0000, Kuninori Morimoto wrote:
> ASoC: qcom: preparation for Card capsuling
> 
> Hi Qcom developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup meson drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: qcom: common: use dev
      https://git.kernel.org/broonie/sound/c/a846f5f62a8b
[2/3] ASoC: qcom: sdm845: remove unused card
      https://git.kernel.org/broonie/sound/c/af6111f7aa9a
[3/3] ASoC: qcom: storm: use dev instead of card on storm_parse_of()
      https://git.kernel.org/broonie/sound/c/3c39af873af0

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

