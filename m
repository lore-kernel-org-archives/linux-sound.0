Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D867429CDF;
	Mon, 20 Jul 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553621; cv=none; b=uTsNYOxzCgh2KTsIIqjot0gSK5VoR7lyRo2A1X8Lve4gm7G2Up0xJ/Cj83alnyZCajedatk+PkGfPYNuIFjsUVlaAHCGVBjZSuGckGxmkEqPI3BmGbGqax1LMolRxlBcSRmHZ46/Ap75sa6WevRbzfRatZriOIoNS6TJxiKblkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553621; c=relaxed/simple;
	bh=LwpMe1AWDqyvThpbOHXkEAznXfsLc4C0yqRpN9K0ArU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nsu+y/bjQgMInF43RiC9nwdrFCxXaul0+d6tNkWK4MVpqVs21aQExBkNDl+3iK+z3o4+EsObfLhGB9qN+MmC8BzdjTa3Kbo0An5kSCd/up/Fbx+pV7jUrXgw4W1LrcyNdBpV66l0C86ROfT4BINSHt6FWWe7Ph5TDIXfeUbTLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLIx+78O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLIx+78O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21471F00A3A;
	Mon, 20 Jul 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553620;
	bh=GS8uI2vEDNWRO3BzvuUCAmSknHUSRlVF1Esy+nUQCTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LLIx+78OJP/I8YMkWX+F1gN7piM4k7LpGC1V9lgUvIrPk+eumke82MtVr45p6gY8r
	 3WODtNxtV4GAVRiUxfPNmokuyINpVayDBnyU6QEYKc48rWqvN5RtCakfkxRdnsilgA
	 FBgjv1bM2/8Bvy/zfbnIIMIeioL3L128pHUGOLN7Lg41myDPxAednlV8WHZxECv+pr
	 u9GtBxWMFBejw2yQnxHm4nphl8L2fo/JBQm1iunfMSntARILXA0rItV4gm1vXWY6wd
	 QRC9oOY428SWdYcQpNOXF3lRxYDzSWfS7neIlFiaFGr1KJgOBrPddMbg8Szp2ZXYo6
	 6p5ODdEX6RG2g==
From: Mark Brown <broonie@kernel.org>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260718080949.157230-1-zhangheng@kylinos.cn>
References: <20260718080949.157230-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK
 PM1403CDA
Message-Id: <178449521948.33801.8647477120522855411.b4-ty@b4>
Date: Sun, 19 Jul 2026 22:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LwpMe1AWDqyvThpbOHXkEAznXfsLc4C0yqRpN9K0ArU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXiCS4u6mACI+Xo56aRWob3lULYsg0bEZlQ/zO
 p6b97e/mqCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal4gkgAKCRAk1otyXVSH
 0NKqB/9aQqaKUhK+hB2KNFHBXt0DgHmNOZ/2Wejww0kLAqWS+QgbLg0dsLZvfYBP765EXjRyurB
 G5SfpXDLKt+Y0GVisgmh4QV43utMbpKiMliu8J9sWDTMRDFHTUf+7sIharuqNY/3ZadcTP7ZAA5
 nbsY/6LN9l2bNPJySfkWt5JWoM6Xj1ssSTywWND49iN5LMrHQ94iOF8Cfwy/+SE7vd7/OEpnoF5
 p+xa5mmRhht2qvijTqHx99Lr7AvMTJ+ZLmF7WsqxrL0767zWzAV9ocSLyfz6w/gSMpmNL/BZ5xv
 KA1bF8Ubbntemh3BpkoaV59lZEbP7wcWR+LyOhI/r0nlBGY/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 18 Jul 2026 16:09:49 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1403CDA
      https://git.kernel.org/broonie/sound/c/8e29ed571788

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

