Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF23C09E0;
	Wed, 17 Jun 2026 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695529; cv=pass; b=RJwcNo69xOFmoaaLEL39inC6VuKTMIxNB0D+NIwYyzATAEdk1fEB3RVS7HqA2z9ai4wKt+mM2azlsinitFTpvt0JFbV3Y+b75CorBsaRfi4ew2v21hgGjXd3TnkAml9NSjDUfBEKdKXRBLSPY1xmZDWfsHY/C7zSyxO3+mMRL1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695529; c=relaxed/simple;
	bh=cS7O+Mii6Gad+3VgwYw3xYYgZrrCGPQFuQ017OQyemY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASb0hnGJ8IAXOnaG+3lIaakAsBllZP6Btf2IdkwXuQeq9fj26sfKbDVXd5YyRuIBif+j05LR8pzo/Q9zJv1oBG5LfHqIdAFMDPwmu7TdlsiQnA4GcCjCPH0AeeBxjEHp6XKw3UjEkho4TjcU/jfuULYfN25wFV6vyz7DkcLlv5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=iy8eH+zw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="iy8eH+zw"
ARC-Seal: i=1; a=rsa-sha256; t=1781695504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S3S+HXkc/bIBO6garwC2AsXTuouzterZycrXWitY/ZiAS98YIIViImUbabhHvUE5McQSadwy33d0vezR0IrutUcrBh7CzTrAF21PmbmOkTOMwL8k76xhYrceL9vqwoGlcvLdPWyB0tzgtgoI3z78wb7u8o7C/R8zH4J6w/nrvLY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781695504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+en6VMPHt/KzGMa143NsFtwcRUN7ww53r4cKrYsgA0c=; 
	b=n/GBeTrGRv0tLF0xqChNVAYnLcMIhFbpJc/EBqnB7aRKBz92WwWRjVs1DLHukRY7vB36OO0X7MW8elupY0D+qqTBV5pxsk6jR6M4Zl+tQ7W6F6Txmxuh/dp9cVVLgBWYEPIPvac+Ld/IUQuOCIp2+ZfIXFajKEAnA+V6B64rAc0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781695504;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+en6VMPHt/KzGMa143NsFtwcRUN7ww53r4cKrYsgA0c=;
	b=iy8eH+zwYcMHtnrJY3L0B4jCxc1/p2XiNbqvA62ZUtt4smf3evsz0P5W4MdDOLbS
	W9UN0HbsgSstidEU56PfqXoRGWBceMSFT6Qp4wZK3aadEKehOozZxFiQCbrtWQ06Seg
	Hq9+NNJmZfjP/IZmICbgfFmBSPoEoxgE0gl3olzc=
Received: by mx.zohomail.com with SMTPS id 1781695502861977.1206640958941;
	Wed, 17 Jun 2026 04:25:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
Date: Wed, 17 Jun 2026 13:24:58 +0200
Message-ID: <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
In-Reply-To: <178120760640.484538.12942087225448845771.b4-ty@b4>
References:
 <20260604033554.96996-1-phucduc.bui@gmail.com>
 <178120760640.484538.12942087225448845771.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 11 June 2026 21:53:26 Central European Summer Time Mark Brown wrote:
> On Thu, 04 Jun 2026 10:35:50 +0700, phucduc.bui@gmail.com wrote:
> > ASoC: rockchip: Use guard() for spin locks
> > 
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Hi all,
> > 
> > This series converts spinlock handling in the Rockchip sound drivers
> > to use guard() helpers.
> > The changes are code cleanup only and should have no functional impact.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2
> 
> Thanks!

FWIW, the SAI patch wasn't sent to the proper maintainer e-mail
for it which is why I didn't notice this series at all until now,
and the whole thing is pointless churn that wasn't even tested.

From a cursory glance, whatever LLM was pointed at this and decided
to make the output my problem also didn't do a good job, the scoped
indentation of rockchip_sai_runtime_suspend seems pointless because
it could've been replaced by a pm guard followed by a spinlock guard,
without an additional level of indentation, and `if (ret == 0) {` is
not kernel style.

It's not worth the revert but it sucks that I have to now set up a
new lei search for all the drivers I am supposed to receive mail for
because vibecoders can't be bothered to run get_maintainers as they
pad their CV with nonsense like this.

> 
> [1/3] ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/4bda5af16920
> [2/3] ASoC: rockchip: i2s-tdm: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/ec22437fc41a
> [3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
>       https://git.kernel.org/broonie/sound/c/f7fe9f707360
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> 
> 




