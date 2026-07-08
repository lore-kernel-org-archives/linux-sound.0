Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31B3BBFA3;
	Thu,  9 Jul 2026 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599532; cv=none; b=QNVzdpCRpwGqVnxZiADERzW55A5ELevDILBU1UOTM8GL7bkaGF8T6m7n1kBmQ87R3pN4zZqrGVvw3XdBlIR0AFCWb1k5u7f3Wu+vPlyf6xj1VP5MDysZMYP/hd1FbbASqqpK+6NCbomCJE57xUhx8T9R5PW6+jq1moWWpz8k42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599532; c=relaxed/simple;
	bh=v9xDDv4mUO3k6z3QxWEnvkb+imyV7+JHMnpr2ceu2DM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X4WXQmzblDD7fEClz2PcaATlVq6RxR8eX6AqPL+S6tbTYYjeUvwoX497aV+dJgmhdkeG0WA7M9ulhHwHwV2wRZSWk6sKlwL1ye4mSQf0l9MUIV9PKhSwpGnYOnflUf+YcyeptBIgoAkDlZ8yUdXFqVnUSj7f+6PDuabO6NbB+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JowovLTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JowovLTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42BE1F000E9;
	Thu,  9 Jul 2026 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599531;
	bh=ht4+iL4eYR/bV619+swqZwXe66WSoTGcvY5EdEKxt+Q=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=JowovLTwk3DK265bbjJ+C74XpW/uPOP7UGAP/No3tnPZg3Jy/z9z2BK741t1Wzx3j
	 gn0/e7AYhYe/4VbM6LCSwY9VoT8Yo3CXsjCc8cex+IT5ddrNm8iClJxy8xv0vRY9lG
	 hU9UhVWu75DC61n6VBsjzcAGpeJ+PQWXXVjGVbpy0wRcKuR15jer7L0orcRTn+9ffM
	 cptZnFz3FpSxQM1JcjI4JlaqnhXS41Hz56XS3cBzuLfwIHpYZx50b5RvNYNK2NTDJx
	 WokCb18vJvtOdULa5kmKkhIjv+Ta+Z0m92DKgE+y11CeUDhc0Acgp5+i5jnvomyO4p
	 9A6zy7ON9fA7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704071848.47928-1-pengpeng@iscas.ac.cn>
References: <20260704071848.47928-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: max98927: Propagate regcache_sync()
 errors
Message-Id: <178353360952.26140.9413110060044883294.b4-ty@b4>
Date: Wed, 08 Jul 2026 19:00:09 +0100
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
 h=from:subject:message-id; bh=v9xDDv4mUO3k6z3QxWEnvkb+imyV7+JHMnpr2ceu2DM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5Gor9QICI86oYC81mIRORnQpXzIuw1cj9owE
 zKxHmOmyAaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RqAAKCRAk1otyXVSH
 0NOMB/43JLS3AwsXhgh3CWsSF8xPTzifz/SvhQzYUpT8ZAF/YnFTtfbFJMgyOCd/hhPkjAPaCkr
 YwqnsLx9pPHld9m4uNsJD9jgk9z8oFts7WXSXr/nW45E2p/FgZtgT1p5ird+yNYa4d3UR8PbnJO
 s6EyMCBG6iJ/IEK1lSMIn3LLwjHmiZmQel9jWI0mfTk9ARH1CxXqFUR+1r/Tq5O5y0uZ/RZb26q
 7TVeoA+I7WfmimwvhJATwilcAqPq44rHwRmcu4PWvsd3V0FVLB/SiySN909/JgQNt3+gz5VNz21
 34T3ms/K4kB3UvwQUlk0gE3qjiWYVNmCTAdk07oUOH1EpxSR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:18:48 +0800, Pengpeng Hou wrote:
> ASoC: codecs: max98927: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: max98927: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/ed1d19d37f5b

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

