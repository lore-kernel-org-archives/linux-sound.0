Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E792194137;
	Mon, 27 Jan 2025 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004527; cv=none; b=SQrxtiqHSDA6G0l/6ffPpIZ4GpVFnQz0iPYIHWWV9+zZ1idClyGujhlRjOyrbdeu7XUFiCdlrqHHWS/VI0nzSolr+0YMyU8G/LQOgoWonih2gOzGO+pufpt948DAjGLScf1VnNoutdima5eUSfRd1aTqiW0I5WH8iju1Z8ljeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004527; c=relaxed/simple;
	bh=Tsp12wz14BmSxmq2x6aIjdXQ2t764qqMLYSEnAcs9N0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eahtE1WM5+cEhMpPYzMxMnjwvtTzROUVyPUIbIL69y54bIUQCa/o849ZLdrOjWvG0gLPX1RBsEljrLXRydb78wKX4GNNHC6EGgELHTyrqU6wLa0+FgXfHSA6kuwvCY+Y6XKBhgRpCo5BDp0zIiLQUxPx93cgs/YUUCbfnMy7NQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hyyrz8Nz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hyyrz8Nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11625C4CEE5;
	Mon, 27 Jan 2025 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004526;
	bh=Tsp12wz14BmSxmq2x6aIjdXQ2t764qqMLYSEnAcs9N0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hyyrz8Nz3gtj5Efw/S/pc0Fn+LdvjFigJ+mCvaCwrj1Rnqkim8+KBdmSSLK5Klg7i
	 pKObujo9W/57k69YO5qNBKumt2Xj/iFNzG5BNASZlo4PRmwzOrEX+kPF8+s6mZ7+yo
	 9fbMTZua7mnqEtmQ1PwPHo+mbDoK6MVLUAxwlwR/eBFQmsQv2UnsktA05tWjqd530p
	 A13pPofR61LAQgtZabOymLCf9975EztlzVze+yvZ4C/T/0i7O5IRjUVCCUyAJ3gJdp
	 QVxXVEbu9WB2zz87NPMnggKEvlE171zifeNIRZn/JnSv2YLF2oLdQYMtqgpPYhIG1F
	 Ait/j3hrSbiAw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Marian Postevca <posteuca@mutex.one>, linux-sound@vger.kernel.org
In-Reply-To: <20250127150458.1489425-1-megi@xff.cz>
References: <20250127150458.1489425-1-megi@xff.cz>
Subject: Re: [PATCH] ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2
 bit control
Message-Id: <173800452482.222763.11363749572420745352.b4-ty@kernel.org>
Date: Mon, 27 Jan 2025 19:02:04 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 27 Jan 2025 16:04:55 +0100, Ondřej Jirman wrote:
> Max value should be 3, otherwise "DAC Soft Ramp Switch" will be
> overwritten by this control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2 bit control
      commit: 6c1bb4031729871fa203983bd77bed1ee3c61347

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

