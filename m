Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63053537FE;
	Wed, 22 Jul 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727275; cv=none; b=QBN95K1iTE2e/tmLCSKnCqffsZi/3/j5WS2J3cStbdkbhw7BL7Bx3F7qTpxtQeRlq0+Hju3IhYsejwGR03trDraSqzMlabOvrK6Yjra4Trdw0C0cgs6SI3f1+xxzdqtXqst8f1hx3jUru96WNJoLZCTtWYytFg7hcqWkq8h71Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727275; c=relaxed/simple;
	bh=8FjQOJcijE44laY72YhRrENFiMmHWBvc8KbrYdbC+C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X1VVBtRbk2Jf7LUsGQr5BjdibBjyz/7KqHdhdIpR12Hkb6llfAgRWkv3KreMkkZmlk0VYuIyta/RptbtjrA497e6mLl5jAwyX3E40PoZat+cG0728L63fD8PIJWHpV0itcSnYDonNEyqh3DLMPJIoZvng3tJ0uxnRJGldI1nSNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnoPtj8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnoPtj8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1F31F000E9;
	Wed, 22 Jul 2026 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727274;
	bh=PSfxo9MhkeOL3wxu3J9TmGTk1r3X9vWltEVQac/o0KY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QnoPtj8HdTJG8Oj+82PP12oADqFbb06DX4r2YLnUEExKhu90bwT3Nhi1lfBMDwUpw
	 ipTMR3v32SdaZsa5ed/RXj18bFN2UWb7Eonk/K6btLJisksXqveZYd+Y9lWiBH3rBf
	 rXv4dvVFMe7+DFuScyqJEWXdu0Uavb/0tP280Dgi9xgg0eF3RWnHb3O2e1w0xkjOMq
	 BmwkwatzjjOrdKsqUBEYRuB0DY5RBDLq6cCbuXVAklkWcp50++gkQaxi9Jxcs9neoS
	 hmMsbdCi9NUWR871uIAFhbx2BolrWmEP0/F90TQFEEOgdQvs+RDz702aI6CMmPVsRX
	 2VACUbjC7jjcw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 =?utf-8?q?=E9=83=91=E9=B8=BF=E6=BA=90?= <spark_psc@outlook.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260721-master-v1-1-6f56d5a54d96@outlook.com>
References: <20260721-master-v1-1-6f56d5a54d96@outlook.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to
 quirk table
Message-Id: <178464547269.123404.3609916987305365043.b4-ty@b4>
Date: Tue, 21 Jul 2026 15:51:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8FjQOJcijE44laY72YhRrENFiMmHWBvc8KbrYdbC+C0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMbnlcVzT4x/+Tbj4gBACd4qvmu12VUBlFcwW
 J4z7EbcR9iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDG5wAKCRAk1otyXVSH
 0AtAB/9zaXajzz/gs4bEnXPxww4HbhSZLwy8YLTSIaHpl7idtM5RIcr3h8dPoHtMZ66QfTjbm/r
 oyD+8V3j4y4/NANPlXHVLBjI/Mwox3xK33G/EhDlHIcPJCTeI6i6+rToUBvQ0TrdBwxonycYDZC
 xBjdtQwAOl0B/CJPq2fxNAnu6m2twtNrQ3Sxuje8FDm74RBGHpnXpwwTP0JuR5hHyfJrYFfUYTE
 jyxy25hgTg7f7B02g3xgXUO5IZHcdi9+sHIvJygY+eDyaCOR2LZ+4uLCiu5IJgKZswTkpMeIkeJ
 JI+CTctMjA7a4jxhZV5hFR87+yo1qLt1EW3SNNGs8MsbexH5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 21 Jul 2026 03:31:58 +0800, 郑鸿源 wrote:
> ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add MSI Crosshair A16 HX D7WFKG to quirk table
      https://git.kernel.org/broonie/sound/c/f7074624bafc

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

