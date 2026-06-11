Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ADA344023;
	Thu, 11 Jun 2026 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201890; cv=none; b=s5XuuCt2fajT2x1jHuujOY3NY+lAtxagdyw7m6uuPUJ1j3qTDX09yYqjQ6sJgcGLboBBzXk2d0vR4oezbd3HmkpZYl9wxbdNOqYoP308RlxtV9y0npp1rmIK/2N9XyuSRYC8ko14alkgJfUu/BVdJXdNrYYrSZVcAm/Y2C1b7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201890; c=relaxed/simple;
	bh=in4owDlCoeJ5PmWiRxoDfkggraoLjuAfbNkPu9JJgfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kHU40xAL9ssUifmppNlVXJEu1WzVGy3R8xXWTtfh9ljbhKJiqmaKdL4860bFIzjwJOdU2Zw4HTv5X1ao5JFaA1qR+YqmVioNbemOMEcu10+8HMin/HpY+se8FZ6/40TR+vd1uLuPPO0HZOlv3PNEgzcZK+sKurOk5W3DwfrzU7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccSvFvjs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccSvFvjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253811F000E9;
	Thu, 11 Jun 2026 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201888;
	bh=VxPP0a2J9KVuqsdgKSmN5PGiPnx6aQU7WMFCUoGrRCg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ccSvFvjskYJbTm0+NY5xKXSDJR3grdX7VMqM3LG+1G8QU/XupzSzVi8pp0IXwKcxP
	 i0SV7JchiJRmjvErCUV7pLL9PqmcVGZjss2SZbhkbyvdXHbtceFJcZcS9/fAsbSwUX
	 pIsHxhLRPTn0OuoDvZYs+Uac9Gq38R4mRiRby0UBCIVNmCs4DzMiba9GLtyS7izSAq
	 w1wHOJaFuJjgmOiOvhtxePwTS+uPvCStVo2YUhRg4vFqlq6Wz+4rAyOdw6MLXuUc+g
	 G1XVxaDrGQIg1QpbggAqb3+4YjFJmvw7s2so4MY6R0rLM75w0MpkdtXaiI/eN1lZvs
	 Ea39o2BR7eLZg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kean Ren <rh_king@163.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260611023757.1553960-1-rh_king@163.com>
References: <20260611023757.1553960-1-rh_king@163.com>
Subject: Re: [PATCH] ASoC: SDCA: fix NULL pointer dereference in
 sdca_dev_unregister_functions
Message-Id: <178118972702.447103.16644082204172118645.b4-ty@b4>
Date: Thu, 11 Jun 2026 15:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=in4owDlCoeJ5PmWiRxoDfkggraoLjuAfbNkPu9JJgfc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKvvXeKs0PxL6eiUdt5bLsly+fMGSta0hnIT8Z
 lMqHz9dALOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCair71wAKCRAk1otyXVSH
 0GziB/9BIdPb+N+KN6JdK7KxB1VxnzUwyVpN2y10dmpfv50p34FLdmnU8kcO1twpl7ryaOiqbpI
 zCJcVCyEJZFwbnsb6IuhJxM5IYDTNM9bGzfbpbrsDjQzsFtfDOf1Zl2y3/EouYFZzCvzeEGpHFd
 efQWT69IHAagF4byRVq1uwizeEMrQnHAPpExv3Hfh0jStoqsKXytbvguz0yS59YbI/7EDyVythV
 O2immacMBm3eGP97rZwtfKtkar3bprxAvDwArGY4Ybzf3N1pDKvQnhr3IZFzkE6WCSzf5VaKl2q
 UIc1gUf4r7fBSFgcWNe10KjboK70L4HQ92fVV5NH3JZ1x9RL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 11 Jun 2026 10:37:57 +0800, Kean Ren wrote:
> ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: SDCA: fix NULL pointer dereference in sdca_dev_unregister_functions
      https://git.kernel.org/broonie/sound/c/e4c60a1d4b6c

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

