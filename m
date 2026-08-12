Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D4435EFE;
	Thu, 13 Aug 2026 11:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621014; cv=none; b=HbOohQ+LuO2DPQZ4Skii7VzjLT2+dRV/25iqktTNVxfqqW2EIfybapxA5T6wStUpl6CqJANhr9j25fRc+bNfKRHJOvflWpwYDy9rCnQXU5WCdyN5MitPqcKO0SW6Ur2Lsid1iMJcBXaqZNcZZe5IbdUjvVxyeT4rlVrRMT8f/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621014; c=relaxed/simple;
	bh=Uz3lNAd4B2wNCRRTWD4clAwXjG3Q0JgX4dRcKNsXM4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fKIvZYX2yJsJS9UHPo4onw1kiTC4m8hFMa8D8Q0v9pWDrAq+4jwXbcu614UWJPO4/UvxgPKDGryrcNp7S3KmwETFLmDKor41HDBDrqYKdB/zD9nhCqiicj3DBVIM03a5JLX4qU9IPz8rxiD/AtP1M4bIDi5oTUVVdw9vRFsgmSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEhjFG29; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEhjFG29"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFAA1F000E9;
	Thu, 13 Aug 2026 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786621006;
	bh=tjZ5K9I9vxkV4z0lzFLfUGBEaz+OoE8Mfm2dOhW6PXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aEhjFG299PGC3w/xcQk2AxrMxB67zDNALb2llcpnTaK42LcfbCk9uP4QFSfsA6hhu
	 ATLXznlz28ceA1ljJ6explTG9f4e1KEqx0gP40o6Em5XSD6JUHvN+gkzyUTyKkcOPg
	 2Rn+vwiE1dqtN+icNINzMHl9LT44RaXz9po3h+3Ee97FV+SXHD0DWX6m7llMC7G6xw
	 sjmE1LTpYpd8C7nntE2RVzLVSXIbSbarq+SyQK/oL4TrPNcbys8LIFGQr+7kuOuN/h
	 yxvHq65OHpJ2v5TIk6qZ5jPisJepzgTlJ5rVP/sUo6JvLh10wEMj2PI/leBL0rA6I1
	 iWFWNiR7+4ViA==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, phucduc.bui@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260812084311.29188-1-phucduc.bui@gmail.com>
References: <20260812084311.29188-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: pxa: Drop redundant probe error messages
Message-Id: <178655526662.342177.4013313611398631040.b4-ty@b4>
Date: Wed, 12 Aug 2026 18:21:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Uz3lNAd4B2wNCRRTWD4clAwXjG3Q0JgX4dRcKNsXM4o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfaxKDzkLiCKvZB8B+mdlqVU2815XQr8UFxuXr
 f9UoehwkOaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan2sSgAKCRAk1otyXVSH
 0OhTB/9UbDHyIfVRRK+sG1hFlazEXuZAqD4deW69cqgOVCBJiCSRb0TR9ALvCJabw1JLvx+MgpK
 Q+kV2GHS5jbZcfBw2C+rRUJcM/Pe5V6RiGEEZe3pZpz8kyaaY4CXWEDy46WiurR10q/BY2XVS64
 lOe972HjlytJh55BKTKTeN64gyA+FJbgDtvZRh4g64I9yqKDbNnotmAtFdjVhDEN2vbSJPupIS2
 m9OMqtXkRuyCxGUjNMuMx8+ZGGtZdTV/PZmZ0EoWCi9rLNgmo0a/Uq0MwxQWP3VWeCYCzy9YOe7
 brtwS/9tnDNsqZShysCFeWY7DlR04tFToILUwD/kKQ2UZ39X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 12 Aug 2026 15:43:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: pxa: Drop redundant probe error messages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: pxa: Drop redundant probe error messages
      https://git.kernel.org/broonie/sound/c/79a883d53960

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

