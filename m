Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7635A927
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 01:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943336; cv=none; b=Tz8SLf3F4uS0Z7enhhMQ6XRFbhEm4/EmJ35yOhb4Sw93wOiRwAc7mdofAj4dGrL+BouN5EQUIdBaty/x5jwmqshxOtsW3deoe2IXahChTFReQvq5W5He7a+99WDzoeT8ybCddgaoIibqHa6Ui2uQ57hQAYY3K17sOa4FCF2OV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943336; c=relaxed/simple;
	bh=gvMHvmXg+mRT87Zno3NAw+k5/3NzTyo8lnI1ExXoTmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dSnOEJ8CWfDX+O1xcft5g8L/ocbIcBMzHeWCcQvQqenEv19slAn8B3BI1paQLlW0SbzzZeOOoQJaG4EF3HeY81sOEJksR5Fv9FoxiPMHfLZID9i547QbiSrygODRtTHFH1buG3eIzwlwhi0dQZDumKhNLuHVY7qlS23jIl7S+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGEZRMs0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGEZRMs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787DCC2BCF6;
	Tue,  5 May 2026 01:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943335;
	bh=gvMHvmXg+mRT87Zno3NAw+k5/3NzTyo8lnI1ExXoTmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QGEZRMs0+LFnZ7ErdP4Nn86FYFpaaxLMJu8rCd3FjX3l/cavbcMJWGvf0Kd4ErAbP
	 n9G0TRanPawLhUQHz4yvPQ3ZFfeOFgTwI/ozvQNo2HfzJkFA9rw++e/GMeVi9p4OJC
	 Wtc3+buRpddQvoxo0fPDxpA7aOoYnpPVJ9HD00k2x5U9m/MDynp9FEuja8uVHmXDlw
	 iux1EMsVkcIp34gwtyPppw/yX2wcMoseWKJAEsBdHN6i2KpOnkG8Fl4ToFJVIcf5BT
	 JJ97ax3DhwNJWYKMkG0GfYTX/J06jLA7eHi7ArZzYLYWsGfJZXdocAUjmsezvWRwR2
	 atjnGm5JYBLuQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Ola Lilja <ola.o.lilja@stericsson.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, 
 "Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org
In-Reply-To: <20260430154524.338912-2-u.kleine-koenig@baylibre.com>
References: <20260430154524.338912-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2] ASoC: codecs: ab8500: Remove suspicious code
Message-Id: <177789919987.458539.12039849139388560645.b4-ty@b4>
Date: Mon, 04 May 2026 21:53:19 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gvMHvmXg+mRT87Zno3NAw+k5/3NzTyo8lnI1ExXoTmU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMlLCH47+WHCTDkyzlsyE4L+NH8DHqob3yCT
 XafqcWwJdCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDJQAKCRAk1otyXVSH
 0ML0B/9QZdDFJNY9DR01l47b3yZjmAMACN2SEPlVu5cCTZDZ9gfN/9FZiPt5/U2mHWwEn9zoSn+
 J3vhNGuhN73a1Fr76aLBKluLc6/nBErj10MpIJFjfSwK43O0JQ2XmJ6PrcNXKmP8hBYDqrq1RhB
 mDkYQtrynOEeeWMbbZwKdGsjHVdqcwGXmVrb+5KkEXhP6eRo9aCatJV0/fL0kgz+80498cUUEve
 4HTfXJ6xecLaLyJvOyQzaLyBVmoesOgRbVXwLpfiDBJedv0yYANd4eIb2k2r9TxZQ3Y374aCIfK
 Mc3y/OINJFe7xMc4ECRov03XCT8LHVgZfnfSpstX0VXZIt1F
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Apr 2026 17:45:24 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: codecs: ab8500: Remove suspicious code

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: ab8500: Remove suspicious code
      https://git.kernel.org/broonie/sound/c/e366ce8b22ec

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

