Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB2420E73;
	Fri, 10 Jul 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684119; cv=none; b=P1f5pdVLYWpbFNbXLSkeciW5ktVCYJP7IWOc+piMzsnYPC0cV+GjaygeRSgLMzUKXx65dY5h6qJlFYvYZ4/WffYov26KNclDsqPmWEsIqvkTW9lflXjFfv+HAIS2yrmzB+nP4qrChQt5GJTcNBck27dDHA2WnD7zXjwUQKTUEBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684119; c=relaxed/simple;
	bh=FxTwxjrwEorb6Q1wNu8DPQOOLJx9AlmDeM8HQj+qwYk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z+U4y3nHMCQtHQiGipqRT+pHJq45zWeFyByyElmytNmLdNq8irepFrSv240swdgof55JgGS8udrfMMTS+HLCpHYOarsECxxld5+PzO3gXM9+e2l3oW6KSkGOvnxNOR5btrnA42dzaCsfghw/UuLtfek+gjOmUgHc/tyO5frSW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGxRkfUD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGxRkfUD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8771F00A3E;
	Fri, 10 Jul 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684108;
	bh=ILmD+ZI99fl2GdiD5gy49YdoaY0tW4ZB2tW2Q0O3ruY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=YGxRkfUDKRgnuk8+lXzWCIbQ5Scf44BlA/nN8QjSQxjw9K3E0NR/4LXSLdT78GvQI
	 HNRLEUT3DjWPIRSlhDAugaCaD8H2QqdNvSJjukaFE/gMxEb2gyzKUGmunPKbDwL9Oo
	 xMGrpfSRxJXHr17N5F49OpUisvnXH8kECl8oR4jpx4NZgT8c36Op11BcFtQ11c/NiX
	 NKInw9ibUQfj5kjVHvuyDLVNhU4ENfb04sBVZm2DUsB1AM50Alk8daRHMwASM64zeL
	 0YczAU/I0CQncZ4xKvGg6aVsGl9eiQYbb5Wlp50xzlGyP5GLgfvHvPzlikICn012w6
	 cImdK/Mu8o4Nw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074434.54200-1-pengpeng@iscas.ac.cn>
References: <20260704074434.54200-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wsa881x: Propagate regcache_sync()
 errors
Message-Id: <178361663023.100558.5894609362303296117.b4-ty@b4>
Date: Thu, 09 Jul 2026 18:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FxTwxjrwEorb6Q1wNu8DPQOOLJx9AlmDeM8HQj+qwYk=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpQ3AqguLo/HoG4Zi10C8J1gQfoOQZwCjkG7yuYp0UnBTVQP
 IkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqUNwKAAoJECTWi3JdVIfQNI4H/jQn
 pfBfUEdl6SXVZtfY7O0m/ofBbBnl0nq0ke8i3o4FXA0ljzjLB9HbFDrgnSH+FAjMEUqrUvDwKJh
 sBAyYEyjSXmZFqmkh2fTu7LYNfMb/oJ2s0RstHCHvDbetAv9Pg8H43EFz1Cw/bhBItl5NMIlsi0
 pNhD6bzMj4Iw5qCXbaOaupiLdmkh3meacO+xqX9F29zvJgQaLu7TusDQdxOF5YgwZlpkx+T5di4
 /VVDIwG0gfTpbLZgzUebsToJHdjrCk7+MWDZQ+bT/dgaO3Ox8Nm8+LcaM365sJuO010WHwkHp0q
 yi+g/XAA+JRyyjVz9JO+dyX2V70aVqbsahE9IO8=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:44:34 +0800, Pengpeng Hou wrote:
> ASoC: codecs: wsa881x: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: wsa881x: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/e857b163c8f4

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

