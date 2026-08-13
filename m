Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303AE3A5440
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707510; cv=none; b=Wt1IrAJbzia+cBZwPa4xpbMo80wbkK62BHLpFrYVum4Sigk9N+26hTgIyeVykG0KLZ+Jk1N8GbVJHK3jH/gTZxubT0/G7TDMbcG/Go9mkUHb7ammIU2Q3AjW8oHoXyIEkaJPoi9RlYd/uPPNxTAV6NPCaA5CWIpvR7wjONxB5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707510; c=relaxed/simple;
	bh=4L3byC+oUO2YqBx3BxwlLjQ0F8SxzgWDgas8qWNKAs8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=njLJQRbETYKdrhYe3bI/iJ5ztodjG3iq0N4+DjlNJ/dLj9q7HwslKCZVhMb95HxLLqPsnFkkG6Hq15bql4Kk+P8wg/DnhOU3PACeXf9BbcDa/ZPZ24B4EfFWatFJmJF1+4iA5CcyuU0bHijoYLHOi9UgXFi2ftkwjfGnUpnMsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDq4ZEVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDq4ZEVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63671F00A3D;
	Fri, 14 Aug 2026 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707505;
	bh=BOrUo1AEOfEN9RU8abOxPFKWaC1fD94mO5EqwQdBc+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YDq4ZEVVQ/jQYASaurOigV9TRr1nc4wg4lyFJ+2xt8TEI1a9B+O16/QE5JnDCgOkj
	 0UGeOM7boAhTvWIfA3mPHrn3kbHysgKMr9mh1DP0LmNkDGWIkDe6GtBdNPmvt2RZrZ
	 LNcagfnB7hz/eL/zpLi0nJf6YXzGlEvAKikmhoBj+Ht0D1NUCJ4T77UJza/Fq/6aD5
	 TCZn8KnATgnKYlehoGBM/OR7N2Se8bYtxGXf9160Wp1YdzaeJyCY65Haxt6CEQa1x5
	 l8mEAeTHVCNx/5GJaNcLdHS49b0EG5knFMNc3oaWRsGCAkdRfKmUmFusoZ7kQa3n4d
	 17zXNCXxpDeQw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20260813080540.1030-1-shenghao-ding@ti.com>
References: <20260813080540.1030-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Refactor calibration start kcontrol
 creation to separate helper
Message-Id: <178664518271.364979.1309378396760896623.b4-ty@b4>
Date: Thu, 13 Aug 2026 19:19:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4L3byC+oUO2YqBx3BxwlLjQ0F8SxzgWDgas8qWNKAs8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfv4tv+gtIGRkdNOoV3CdNV5UBpN7HYCDvVNJv
 l1VmFR3nPqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCan7+LQAKCRAk1otyXVSH
 0EciB/sF+3O0oy6LdBifQ+Zf0TnjlWD9tjAdRrHU1qUBBx9oCyVjT4Fvt92O2+55gt2KZfDSDaY
 3jxbNKFzrmxXku2VyHCV6yOCJVndkLD/HqK6C3RX3KRl6QCIvxUleMvLBAfWb5cxuvAJxgHjaDr
 5hjpdudRbAxGtmcWymOUzmTrToScONRCyp4zce9Lku5pgwFNGXaaAokV0xK8xJpT2ZESZ9k7HQ0
 N/5yKZ7P/EM3MoTlgo7B/RuyLTbHq6JPH29OFeTtCTUfudKDBilpD2MHVAOJvDmZDxD3FXwyeRt
 Nj16M3kEj6rA+x3s/8O4haOLKzxINI0FjqfptjYd8pTigvbe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 13 Aug 2026 16:05:40 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Refactor calibration start kcontrol creation to separate helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: tas2781: Refactor calibration start kcontrol creation to separate helper
      https://git.kernel.org/broonie/sound/c/ba5401135aa5

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

