Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A6314D2D;
	Sun, 26 Apr 2026 23:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245738; cv=none; b=eZeBqt2tTYJ63rcggTIHq2Dgjvui9oeLB79Jc0FaTTm3ORDUBQZXnPxboK1Ybrg115G+L0VSzB6rx8Susjq7AZ7KdZHG3mPn03miLqnSNrd903RLw83lk0WW4xzq1ncs4x3wOO9t4OjjaCKs4Ksc2qVks+sYv3NUFm1smGpCSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245738; c=relaxed/simple;
	bh=NHVhQpDhXjjYXxTSl6z+dDi1wscOut6j9RAL0xW1J+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O0MCM9MFOzAgjgk6lmC+1DPm01xxjmUmvTgjaFxHoTvZroj0XQlD2LWRelPiuqumx0t3Z8xDrFG7EoQC3i/3DjvOin1FBEE2zlB38ZQMAkfCa7Pl7TuISz6gxT8PAIIO/56yfvmi1TYS6ymH1OniniT2aiQWosKCly6aAzmwKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7BVyR76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7BVyR76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2944AC2BCB4;
	Sun, 26 Apr 2026 23:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245738;
	bh=NHVhQpDhXjjYXxTSl6z+dDi1wscOut6j9RAL0xW1J+g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t7BVyR76ftyReB1ZsdZKxM+i0GjRwhPYlqpliCUmdQZnzkfbmEvtV65jp3hi3+g1D
	 yDPVdb1bYQ74RH8lWICTudQNnRMPJLjErHy+wBq3jg/DFY9Wa8S8H5ocrm07d43wd/
	 SeyX1CnNfyLjV6USJI1IlH1D0CYnS+ok7/Z6DsTYK3R4A/cKgi7SLUWcreWg1m0H/h
	 lmR+iHquFB92c9oSrZEb2EXebAUuRX2KHsn/zX5+NzrU+mziKjrJr3i8gFOXjWuvPj
	 CqskaBry4SOCCJCs41PQjG+smY6iYXe89DaikKA3DR0Faxo4eh69YHrY9ob6A21POj
	 JpzQ36TNC2a8A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Tobias Heider <tobias.heider@canonical.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260422-asoc-limit-volume-error-v2-1-2e2ced321229@kernel.org>
References: <20260422-asoc-limit-volume-error-v2-1-2e2ced321229@kernel.org>
Subject: Re: [PATCH v2] ASoC: ops: Log unknown controls in
 snd_soc_limit_volume()
Message-Id: <177724032564.266775.10089230662279547583.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:52:05 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NHVhQpDhXjjYXxTSl6z+dDi1wscOut6j9RAL0xW1J+g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4oApzpzquN3zzwHVJhtP7uLxaKe+Lm2q5XL
 jlXZGOVUF2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eKAAKCRAk1otyXVSH
 0Jh1B/4tmj2UNe1U1LMB3zEjJewMf4e2geE6ffdL+mL212u5CKkBaAE3NxXNwQydfKrKQ4ojbha
 lLPD5WiJKarVMZlmkjdEisxdxWR/6xUFVm+FcI/Jg9irdo/5UzwTCznTzzlHs9ZPrt7HVGyska9
 vtN31Ga9kjGKa2Kcbr+gLV2gFUJ9iLU6xnh++ojcmL3/SGELchUV476H+it5PZRn+1Coj9zonoC
 sTlZ4kwd4fXU9WkOb74CyEZ2t6rLXoWYFCSzrEUoTIVllL/vYHFeSXsEcllaIOX2mA7sU9Sg1oS
 D8BqJHRsliNUhLCPbn9oP23ecoyHjtBNwGjUiTq28QkZNXkF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 22 Apr 2026 21:34:05 +0100, Mark Brown wrote:
> ASoC: ops: Log unknown controls in snd_soc_limit_volume()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: ops: Log unknown controls in snd_soc_limit_volume()
      https://git.kernel.org/broonie/sound/c/0fa63c7ea9e1

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

