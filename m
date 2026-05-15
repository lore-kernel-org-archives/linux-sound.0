Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543EB36C5B3;
	Fri, 15 May 2026 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863177; cv=none; b=qY7IFdkUhx+e5anYIVX/DbdteAY5jp6JcW+Lg6xFjk7tLsNX+PWBJPV5FtSTYqo2DIMeXin3ag4bSE/7/doNn0gdjuM6zk9jTZJmS6ed6LQxV0RMg0vqXFpCB+gAoRwHq/HY7Mj/XThLL+jyqplixIpICGaduHEiF1U2N+nHrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863177; c=relaxed/simple;
	bh=I7TAc+rZCY+QW278pM54A1Q48QiXqyHN4JcA2Ef4P0A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O6nkn1TGr+WMrP1kr0LSS88kAF27SyTWYzhR+5U6SWoK1OLxh1gliMKlGxl3Kg+kUUyGspoZOHSzd7O2oJVDIzTO/RHviMjLCVqdo2WSsHO/GbUO6b6N1upNoVnMz8HbcbGWauTBep+iY/lMrruEUAx03JBUJStbHFp1vOr2t2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVUyopmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVUyopmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5086AC2BCB3;
	Fri, 15 May 2026 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863176;
	bh=I7TAc+rZCY+QW278pM54A1Q48QiXqyHN4JcA2Ef4P0A=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eVUyopmThviU80i7jxT/seqSKfDcXJ7Hhd+5B7xvqEfZAoS2jJdDzKhM622zKstZw
	 DgL+C1X/D+9pUjHKbmikVwzprhMFCwwAYjX7txuVvNr4Dz82khUFYGyzOqTIC8EhTZ
	 LsJiBC5cUavYqERy4SJEmXCVA6vo7QNhdtdpsunnb8cFYMrQq773cluDSNs185MeNH
	 oPCelkTiFwWv0sPVdRbIfscSFPmW8WVZ6l3If2XQ2/tvf+4kdWGUycuMTQcocUiwkR
	 etdYDfu+WRv/naCxkBmzH4D8q+Z+/eb3qA5c3/AYg+b3uyrRvfBfUG3d8Tw9R9CSXf
	 cRpA6/zj2WsBg==
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <20260513190852.196723-2-grandmaster@al2klimov.de>
References: <20260513190852.196723-2-grandmaster@al2klimov.de>
Subject: Re: [PATCH v3] ASoC: codecs: fs210x: fix possible buffer overflow
Message-Id: <177881129882.1136679.15586331817456412280.b4-ty@b4>
Date: Fri, 15 May 2026 11:14:58 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=I7TAc+rZCY+QW278pM54A1Q48QiXqyHN4JcA2Ef4P0A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0xGCOhE207Qn+59UH2q9j5lCtzDNvsDfQHOz
 eHAUN+PORyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMRgAKCRAk1otyXVSH
 0EnfB/sEhsIwALz/7j7POgF2Jg8/GPdHWBopU+GtW3vm52zEjkxemeb7Q448UKZbvcV3tUf19hi
 pHGvxB1lnTmiOsU3B/DzzgyL8O/omqf7YKFb3hyfSvTPiF/WyPH06HE3SWjND0LW6N6VnYbY6X7
 MwVbMHc2y3U7rh0pCsYHtAY4sb76F1LdRk02s1gTq/Da6DWKw44yxkuLVO2i2EI+os0faasKx4s
 vt6B6FBTtsUqfwxY9XDbfDS2m7/Sc0qPcDsfM6bz5uATTZiCQRQANn7/dW4ivdy2K8WMjwpnPMA
 6M3UTR6gtWJPc6uybMekjdhHneNljKgQJIkXBwvrXtW/zehr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 21:08:52 +0200, Alexander A. Klimov wrote:
> ASoC: codecs: fs210x: fix possible buffer overflow

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: fs210x: fix possible buffer overflow
      https://git.kernel.org/broonie/sound/c/0d435a7ebcd4

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

