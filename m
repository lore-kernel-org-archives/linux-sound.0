Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173D3B14C4;
	Wed, 26 Aug 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739227; cv=none; b=qR3fUt9wwdFrAFV6v5EdiIltRTUUoalqCwDtUTMcE9wwEAwIqxbBRpGiU92M0DY+ufZLrxIRgi7v3lICjxCckIy+N1CNFdTyDbkogvbLcLrXtIZ4RRw0GY2jtQB1P+pIl51i3/ktEtReINTep/azyM3xgemhHNmWMGhqXFIpp8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739227; c=relaxed/simple;
	bh=yu/FDwKw8vCpw8DGljbxdSxYvelbyDXMPhHSaI0mJXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mF81I0nz1Y3ZOwvXwE0wZEqoN3sqwiqlFhlZEIKiavZgVyre9wCGnc2wdihH8uh4cdvlMEbWTtRItvethpGDDaGarppAF5UvDSnKRFMv/Ep7bws15zRN41wzSHiFHV7y6D9sbscfCjJfWiqmTazdIppDgAxld5qzGdXcsBA0USY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mv6Lyao0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mv6Lyao0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92591F000E9;
	Wed, 26 Aug 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787739226;
	bh=NtgT+ubk+KjyVdVRSY5QRnQTD2pSCmFQN2j+zKDZ99I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mv6Lyao0P6xS6QUZSJ7O0bzJbFV0hl3LuFjx/Z7+MBj2i3Mz9HxkCMOBcufQEeuiB
	 XrpEJZOKSvgg8XkzX9Zy2K3nxMclC76ffIVWP/npzvhN1Gdm0OY9EarhyS7/6AOloN
	 l2b/W9CEYGKlqydeRZoGEcv9JuC+d1d0OCbH68XBXgXahD8YjtcEqhLwyjiULuX/i0
	 uzuLqtju8TZbN+TZgjAis6gLxWUJBmti17g/m+fJ/Zf8yvv9Az5Giv3QVlavM8OHtb
	 6XIUuVoa3k6DcN+2+J4L74wnZItrC1qkVaQrBnghNZIrtu3QlXazKAT0AHLTziLxw4
	 T5fhl4v6v6Qng==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, 
 Christopher Tolang <christophertolang@gmail.com>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260823113221.19744-1-christophertolang@gmail.com>
References: <20260823113221.19744-1-christophertolang@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
Message-Id: <178766212794.119896.2209950795595633659.b4-ty@b4>
Date: Tue, 25 Aug 2026 13:48:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yu/FDwKw8vCpw8DGljbxdSxYvelbyDXMPhHSaI0mJXY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqjrxWaReIGx39nOTD8y+08ecoGvsSi+kDyryL6
 9UUh1DWKTmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCao68VgAKCRAk1otyXVSH
 0OGhB/9+gSA3WU/QqmZ627ljjK9a/8AYyIAGu6MIBY3fIGfjretq6rKxe2AipDY1wmu8D05/3P9
 lmWWUyXjSFASmhC8B+nbk9eF/7Rzj5mqOhs7LCOqb4050MbLGQUoPA7RZghyiY/j9RowCRgErXJ
 6wu17A+/lhHMjT55YO9KSTIvuXbiOVpYPjOMdFnzct4XD4zyhyDZ50HKL47MmnxeTlHn6N6Ne0O
 pR5F3IFxTGyjffeNPY4rDe0KSKtqgE5DiPWuqskqTjCU1k4JP035pTxwZI1QEdZ6n0NIsfRoUM0
 qm71M60sIzsmld8NMBMKoNbGN4I5b/pF4TybMPafN7jPHciW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 23 Aug 2026 19:32:21 +0800, Christopher Tolang wrote:
> ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add DMI entry for MSI Thin A15 B7UC
      https://git.kernel.org/broonie/sound/c/e2aa5ad3be41

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

