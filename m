Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721840;
	b=OJ9bUg2hgIQiPw89+mBjdqj5HRJ3JFUTAqdjNl0B+wW+SZcYSwtzZrCfkN4nx+ffT96P
	 zVc4qu4tyEj81maZ81KUy5vtR1EcpL1feW733rDZ/w1k3NNXy3OIz0HfOITNMcqO8IGRN
	 /8BCkR7Jr2BKaFCKY7ctv+flxQjW/YJ0jhlzg2APc8ubzr2KcddjwiNFRkU1MiE9ZeXX/
	 CyDfap0kdwxGG11Zg3p9b0BUEf7Xe+QajbcQ/FWUB0twlc5ze+yR3qn6tN2zyrSZIpy30
	 p6EW8uyEb+w6saGiQLhAicdNJqMVPgB8A9tsTgBysmk3NfZbSNco6RloS/kPgPeHEIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721840;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9E8o5SfIyKaPd78A3F4RTmEK7EyCjBEXZB5/Gk55Hw4=;
	b=dIeUXd6Ur7fvPd4A/kzk9ZRp27hHiS03lmxkZRg2UtGmVEXzgemM14u/PZNtkmkzxMID
	 UsYw3RiphXofm6H3XzQMoJzCj4aUZKdfluqUjpU7jta5qLUuE3Etq/XBk2WQ8Qm+bqsLn
	 FDoiGrG1dC0NaR6BThQ8sh3FX1IQ/K0vdoRNLc+eoD7Ye419biHVDcgio5sbEQDEOFydd
	 QxYLDejo5b2z2E9kVaKcKiMCcRbV+xXrjac5cbzs1wTwYTxtgl5gvaidCnjSJup6ra/QY
	 QhwfNF1QE14bZJgPKxhcH38BmehHFaxGnBRfH0I/VTfhu8lOuHNLUkcpHhF1Q/G68Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJbuvR6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE4606A31C;
	Thu, 26 Nov 2026 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gJbuvR6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209F51F000D4;
	Thu, 26 Nov 2026 19:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721840;
	bh=9E8o5SfIyKaPd78A3F4RTmEK7EyCjBEXZB5/Gk55Hw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gJbuvR6vsGMMv+rJmQFqQG56BOFTrcoqP+qoKVL+yar8hbPTteL61CvmpXh0crSHd
	 2xE83vce0eF/sUWhSpk5wx6HXVkW7d3gM0TOgKpFXsnrlEFXE5Tv2GjlsO0qYbsmJt
	 FZHjjKSl0s0RCd2YL6QDfuAPbzzIAdGZ6HGQbePTLjCEZeqNg/g0lVu7aBFbPg/hwd
	 74fDxE2wakSnsMobmq00f8EEmKrBoszh8J+IIxJo4Dsj1Etp4RJWXckNgzS0SOQ90/
	 2E2QQjoc/votGYiSz55tO1nRrOEnYr/6lh6wW9xSKb3xPj1Fl1f0v7hhj/38sOFMTI
	 gUCf+tOp4k1ig==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Michael McAllister <me@michaelmcallister.org>, 
 Riccardo Mereu <r.mereu@arduino.cc>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126115738.1765949-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126115738.1765949-2-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: q6asm: fix 24-bit PCM level via media
 format V4/V5
Message-Id: <179570763254.142532.5474593579002750428.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:40:32 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HAh3+iYtedJD2HXcN9Sa//olSZAk38ABWA4rHycwvb4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5unLcz62ctymJtWfZSZXMlcrZ1U6bBTuNbUrOFWy5+
 rBHYAVzRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayLY7hf4K+m/qen0J/A5uf
 /s84lX3zXuoB+c8yy7/FbNxsoSH76S7DP4OD4sEPbLf+2ffsWo1fYV7inoiKV167mLclJ2Vkr9a
 TZAIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Nov 2026 11:57:37 +0000, Srinivas Kandagatla wrote:
> ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: qcom: q6asm: fix 24-bit PCM level via media format V4/V5
      https://git.kernel.org/broonie/sound/c/f29b683543cc
[2/2] ASoC: qcom: q6dsp: add S24_LE and S32_LE to MI2S playback DAIs
      https://git.kernel.org/broonie/sound/c/e03e85ff7500

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

