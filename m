Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510433F9F2B;
	Thu,  9 Jul 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599537; cv=none; b=YOqeomWVhSgwpNDQGb699XmMTV9U9me3LZiQYRcK8FlF9G9z7Jt9tP2ApjqKC7psIjtGq08g4VL5IaBvYDCqpURrLxxH1yM00UdOtkBWAQtJmldaLlJpKc34SXmTwKp9gIi/iFthSv7cRWbep3j6ivKOaw6QIG7/cb7L097fJq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599537; c=relaxed/simple;
	bh=8Wsr/WQDSEeGERhmNpmAq1THFfzzcjmDqgBMsFvlo80=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uakf1pdP7p8vDR00xqLdhVbc4HivbudWOqVZxebETreYssryjPV8pQAWwb0ULAWBsOWVIyxIyPlDfEgUbeiYyv5dk6Ixv13MKMdpbQZISHavy42fbjm6f4JbHxNLdTi22DHvGZrFbJ8QqRR/cswV09TkWujC5P3rvXZ5cmPaMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4nxgoY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4nxgoY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C01F1F000E9;
	Thu,  9 Jul 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599535;
	bh=8nD7gMLWqBfeKy2FhYTbgGtjyT7s2e5fffLci+nztO0=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=h4nxgoY0CLRbSuz5uF/asXBKATBqbXPV1ArTxGzIRju3JS5Rvrdrr5sRXpOBRvX8N
	 y+YBWXmESh6I3QbT9qV/9El7K3H5C1M//5hTNMi72xDBogOOyub55ML23DI/qNHbOQ
	 uupcYnGiZc841K6LeojYhyQGIMRH1bXCgTuk0Z1zvt33SA/pxUfbEFhUmJwzhGC0pJ
	 S1wx0fSULGQo3iiN8/RxvJnym5OWDqb0VB4JSB5zJd5F6HozPsLFfX8kbGOxcrDZiL
	 QgdkW/bzvUCaQYuXXNrS2mfnAtxGDJ0uqGb5fLbiHH2RVzaOgOo8x02r3xJbNrsZz9
	 N6wcSS5GTQYpw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704072140.67222-1-pengpeng@iscas.ac.cn>
References: <20260704072140.67222-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: uda1342: Leave cache-only mode before
 syncing
Message-Id: <178353365981.26140.15175623141392679460.b4-ty@b4>
Date: Wed, 08 Jul 2026 19:00:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8Wsr/WQDSEeGERhmNpmAq1THFfzzcjmDqgBMsFvlo80=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5GtSj9idZPsJLACp5YFyVZC7cCDYQGviFYyW
 eDwFQ40u5SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RrQAKCRAk1otyXVSH
 0EZMB/9x+6c3k00vDDc7HQt++Ns5A6yGqNWFBqMfFmICW69pYW2LLO/w7qMpw0/+NcqX6CBvCj3
 CwlcUl9gGYlPvHrxEHBYvZ8FMjuUy4Gv0iA/+JO6dmT/8SYRM26eqmAvq9kZwnk9heL7HmuP7ZD
 vE/4XpY/L5nJhxkKSJFWwMkoLxKT1bkFviaGyV9hIQtBhWaqIQz91nFKi26gF4sinzMLnROR403
 EhkWqoFRGdhD70FiQ4ASoY5U96nZE6BWiailGMFK1wKVO95GV2aCAFjl5EE4PqnSu9iym2ptc5z
 xmglOBW98m+QGlAk+BrgrubjpZmCZEg3Tq2WGmp0wFM5zhy8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:21:40 +0800, Pengpeng Hou wrote:
> ASoC: codecs: uda1342: Leave cache-only mode before syncing

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: uda1342: Leave cache-only mode before syncing
      https://git.kernel.org/broonie/sound/c/29da72e58fde

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

