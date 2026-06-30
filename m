Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890443E4B4;
	Wed,  1 Jul 2026 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903788; cv=none; b=pB20VuUL4147YTCp8Z8WbGq2TYCuhaGyivwYxv99coKyYosgIAZmpQRmfyTyjhHvzwmIUsKzPHp3q4Pm2/tj1EmJbkCof2Ga131BzwPDEamvvzDM2Qt6WP8HHphm7NTcCe3Hm5ey0OJ3HeIakZWoAacNHovqHRAuighzUA8IH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903788; c=relaxed/simple;
	bh=teOTssev+ze9X+scCG6QMC1Pjlbf+7iPD8MVfby1gUY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nOp/q8crG2QtnK96xzSAB87lMpox8I1rkN8+7/Mj0I3kQzcUJtyZKqBgtQ56C0uMdfF/6hDnSruvVJCVJErf7NTN0pRo+Y/q57s3dN8rS+tlG0Rud0Bi1kkdRQGAlts4qrL+DMPfuhULqUmNOO/6N13aKrRaRn4Z5tmIjjNdjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=an4DnmSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="an4DnmSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEE21F000E9;
	Wed,  1 Jul 2026 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903785;
	bh=MRa/Q/sOYgrpjR/OxCpoaT10mdmwaDpMn/VSLSZBd9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=an4DnmSK0SEm/1myNv70u5B0X7ApyjW3mrKvXffP8K6U6Qvca3Ona+17/XRY16F7X
	 2qfDuMdXhzg+ByRwDkzMZ6nXzKCNrXmJUWgZ0i6O8Csie+b5aZCbZsDr0jyqtmo4yR
	 0409Y2HR2X9YehEZsz1kPBBJMopPBxNX+1szJT6F4sBA5xuFkoLk40rc7U+3mi1oJF
	 mtnXNWyHCgThu9RTR2Dz79WEmgS1kd/hKZpkN0hxuSW5Axv3Wia2jQVg0K1MP2mSQn
	 fMKTS52/umzXhnP463kQknl+8Xgs1DfLFDfKKTWgK4+IKjx+puUSAj2IRgwOhkcFCS
	 w6XBZkClNyXzQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jetha Chan <jethachan@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630003328.15675-1-jethachan@gmail.com>
References: <20260630003328.15675-1-jethachan@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk
 table
Message-Id: <178284125398.368110.6483962233520227549.b4-ty@b4>
Date: Tue, 30 Jun 2026 18:40:53 +0100
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
 h=from:subject:message-id; bh=teOTssev+ze9X+scCG6QMC1Pjlbf+7iPD8MVfby1gUY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiyXz8/SQ4zEls47Zqwkfu+t+sd1FwoXHpRW2v6zJknkX
 bL8fK3wTkZjFgZGLgZZMUWWtc8yVqWHS2yd/2j+K5hBrEwgUxi4OAVgIoej2P9ZC7ZItB8MEJF7
 2mOl65geI+1yn39ORBDfd5VzqlP/vLmTeOGf8VP25I+9czf8PaorYLcjumXe1M+/RBX8D6z9ukD
 RmH25OUOa/gEWmx2ubxZzJO6Wev9306keJekdfmG9/yUO915rEpHbm9gZ9Uz06nwWJ+VjW+YtcT
 7L1zK129DXep1nlIiAv/As3lNf7BP6Jhivflo36d8JnZJQpT/lzrYud2asjQgT5C5mqN7iNfcp+
 2SezGtAf+3Xjo2U1PwzuelKfdOuwwtdbvY+bmxPqt36rL7n8gEdGXebr8039367bK8pe7bO9wfD
 Um6mWpnjis8mbuyVT3blb3Z1a1lovfZiQujTrCWFKa21AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 30 Jun 2026 09:33:28 +0900, Jetha Chan wrote:
> ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table
      https://git.kernel.org/broonie/sound/c/e782d687d2f5

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

