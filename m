Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0A421F1B;
	Fri, 10 Jul 2026 11:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684098; cv=none; b=MTtwenwkEI5jrqs50tlNj42Lfs5hAt2xa63Kq5A6XXRLePciRbrCpSgQcHAI9tP9bvwdX0MhHw0KaqxH6dTdTRYixK15N73cJj4DGQ0ihze1/dgFggsZB2xH8dGyQx6j4RuBa6KmqmjY5fu66AE4inqrZrVi8EHVR1uA5LdSZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684098; c=relaxed/simple;
	bh=sXiHKJQGQwPPb+cBTc30HP0BS1FkPt/IzWl1nVomUmQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nEbLHULTwaenuLe2LxKzIHhM1HRo56tmDExMYQ0mx5cMdT2F0vc/5v/b3vWGlL9TJwRqYSb2suki90hAateD1YsJusPtMEfWOrdUPhFCLHoMfWevZqDq485lmnTdwUQoW8BIbG7+akCnUn10LNCe8TjcBp1I5Cwwg6kzd9X2t2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSzG7MaK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSzG7MaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181791F000E9;
	Fri, 10 Jul 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684083;
	bh=4RULVtAJ3jqKSiiG18pqH6dOISI6qciH7H9aJ6gpkLQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ZSzG7MaKqqZS5rS7uP3EMkfCvBMD7/bh08dXmXE+CbnIxfqCJLe3cE2OgduygwSSN
	 oJHyy7PWqr+y3GWqOfRNt56epUJevVKpmPLICjxB/8NGKcBbGg8Jl+VJhQpf8usBHO
	 zWm6dRuYEUxT69sF9W8J4eBwiexI6c7Ms6ueb4PFklTplAC6rgE/ZnXprcbDx3WRBc
	 03Xtl1VVl+wlJ3Z0jHnS6UQUaEbJ1Av+EzquHn3OxVeXmzJTV3jZTRSxmPwUmxB4rz
	 FlQE3bMy1AiOHNvWlMKHUA2SNWhBNVUwxSRmwl2oHtm52j+7Xdof+nAaZOdSbu4qFO
	 CqlQMZIQVRdKw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074238.50145-1-pengpeng@iscas.ac.cn>
References: <20260704074238.50145-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: rt1316-sdw: Propagate regcache_sync()
 errors
Message-Id: <178361326460.100558.10706068715733201499.b4-ty@b4>
Date: Thu, 09 Jul 2026 17:07:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sXiHKJQGQwPPb+cBTc30HP0BS1FkPt/IzWl1nVomUmQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNvxEiQ251cWdlLyFgPWfV+isKB6hvFWGYOCK
 yn7r0nzR82JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb8QAKCRAk1otyXVSH
 0EBsB/4l1SyG7SX5a5oXkIXD8QiRt71V6C34FJ2fxdOoAbZVduzVzUBXfFNjxWgCxr+Rq4m972m
 AO5wJOrU3EH/RmdwECIN30U9g0nbhesztnLQj4d6/xwJ6EdWYIDjHoKLel1jPxInJ3Lfmyy6Y04
 vIjjZYurEoGuLKlmrH5lhPvwPAS1SKJkR23ZXajULJUgpdvdPq1ouJ7Knn8eanR4eMyN6cBPuob
 ybqPXU9rKoRmosbZeyrRFmtOWiKlzg1F0Bt7Rio3/e//ccdG2K3O+K2UrPaWzAiggR87yAq1R5j
 0H3xH+8L7mzIqqqaO1IYRl45kAhbcd+bgj52M6i+E9s468zc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:42:38 +0800, Pengpeng Hou wrote:
> ASoC: codecs: rt1316-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: rt1316-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/c9ad95acabb2

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

