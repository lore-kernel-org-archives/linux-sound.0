Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0884A32BF41;
	Fri, 10 Jul 2026 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684109; cv=none; b=hRo1L45uQt0wsVmjB/n3wwnt+AczxycAHUsHPczKbw31cOzscKHW+9hcIkGvPNqNnPfWSZlVBFU4s6yhkj6crojHfBkskgyZ/nkkDO5YGZWK1uJcGYexmyNgFzbJWJ8z7ffvT7Ez546oE6ryDww9AiQVbmynD4Y7ci4Ar24qr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684109; c=relaxed/simple;
	bh=dXLxgN2UqgzGDlHMENrVCk+1bFglYmRul9dDZMn4uRA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aV5Nv/c6rP1efNTHJEwj37Y6RYB7eShSmnib8EZh4SW8ho19QUjV/EBd1UiBVZg7sEE7IeHraDLUC9Sl8Gr1qRLoBU1iirKQaO3L7B+K3mCtJhmFe4p3xZJ/QUSbzPpjVuBOoCmiqNcqStVtURwSbdAsuN0bVw7/DJgvwLwxIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQFL8qBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQFL8qBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E821F00A3D;
	Fri, 10 Jul 2026 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684095;
	bh=uoLCm9pOZT4NeLafa6N57c2nJtnosFV90QfksOnU9T8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=jQFL8qBKE9v4u6SikGzNAtxygO9aNQ4dM0Eg7XD2dFHD7DC2OesVwmZIQz1b6IQEp
	 /4XjVhO1uA/aQf0rMrUUvxz2wisI2kzM0ymkZIfTV30PPM2SCp1eXo6uvABblTBRHb
	 a6q1q/d1D24c4a51eM7X1jJf2eQKb27E0lAMSOQ1LcecNsEcyzhNayyGpFfNjOyXMR
	 IiznVNBJkVfrlVkjZ+tNc1+xkc/Tl5FGzlbG0uz3a8RL9AJ5/NDGbF7QF8lnDlHB3F
	 nOqMEsjWNLCK0QbN+9ovbI/mXhTM6551PDYAOvQZAi9pQe0hDmQldsfifYcnh/kc1w
	 79GUt8zmHxKgw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704073646.33065-1-pengpeng@iscas.ac.cn>
References: <20260704073646.33065-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt712-sdca-sdw: Propagate
 regcache_sync() errors
Message-Id: <178361299951.100558.9366158107224652504.b4-ty@b4>
Date: Thu, 09 Jul 2026 17:03:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dXLxgN2UqgzGDlHMENrVCk+1bFglYmRul9dDZMn4uRA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNv9JcALo5IWyQDSqQ7nIYg4vIx29lpvBEOCR
 Ye1w4DEL0uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb/QAKCRAk1otyXVSH
 0DCXB/9y4wRS8yEVWGHsLQmYu5YKn1s07Gw2wPu6SlWIFl98UO6Aods3OaeK3pKQdAF5oY6TRG4
 qvcXfpSuFlZxA3dLx5/4INFcfWaI7GrI8wk9U97N3pa8/qPwS3PywqJLFDHJo4ha8sOmd3VZ0FU
 fBQ6jJldpt6DumEuln6oFesBwi2Udkc5TcwhsBHFoqSCbNUZNe17XVHH6UFKh7nHEjEdod2lSks
 FtQzOR0tUvO1SrHjCyfT3+zU2Og+dJoI6aEXWfM0BpUkNnGUdhTYIB35R3VQtdhy01B3PQLwZPW
 vVs43fKvI06Nf19zawVBNHF9mBuMBc4oeHSqQql5U/yktdw5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:36:46 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt712-sdca-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt712-sdca-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/ba8c728e7566

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

