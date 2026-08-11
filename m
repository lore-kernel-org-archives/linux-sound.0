Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60D1F09AD;
	Tue, 11 Aug 2026 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456570; cv=none; b=jcoypWj5Gg/rmPDKjNSVSN9vnAjEg3+C15uNFm3KpZpp+OsRt6A3EYvSnqLHlhqzuiWFuVFG/luAxvsG7kWxTC97l+v/kUFU1mLEZx8vL4Q4r0/6kxN1gAMJTYDYUpJG5A7FAiZCgAW6UNqc3kgkgZyjDXDMIjbCG99BoWLoTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456570; c=relaxed/simple;
	bh=olIB1QfFfuEGH9ld8ptxP6KlQAND7iJt2jDuHcX6ky8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZGtBdv3gZjaEGHxs6mdgr1VViXFBGSqtmf3a6K0875T2BL0/0FuiaO2BAryhgURpE3gJOTxZck3OpwkZZ3FHcMxm6SmrRF0kQZC0EoObdHngVpbsQGleWe+qolvNpDpco59Aa8B6u4teNxx0CtBnFzKLnJTLnJ/9385JrymW9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=T9nr76kQ; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="T9nr76kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786456556; x=1786715756;
	bh=Ji1FbxRdPHDlfIOD15c4e9Uln93TAdyXt7AF7MdTzQg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T9nr76kQiRExH777n4/SfeHYGxuQeU3Tk0V8XfXfS4G9okohR7y2kpK+gJl4u75wx
	 Uf1pC0gh8QXEcG0OsfzX3kke6AfrDav6v0e2M2/yNF8Jy+oIJAG/ZUy1OLtBO1+jyi
	 hpFyVarDwJndpjm6U2lXwD3YjxCXjRuF8jUc+c30G/acTZbfulF11DfX1jLzrxyF7c
	 lXZZvZll60sOaD+XVUZXAMsUZWq5x9NbThyzqLZ70T9Ss3j6xw4dffWCDVa70vdtqh
	 mLzQkBRiJefY3tVfTILq8OnJCmjcv4Pu4z+LeW4bBHVV6mN4PhEDxxFBNrLmbNUnS7
	 0vL8O4spSZJ2Q==
Date: Tue, 11 Aug 2026 13:55:50 +0000
To: Robin Everaars <robineveraars@pm.me>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Niranjan H Y <niranjan.hy@ti.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Charles Keepax <ckeepax@opensource.cirrus.com>, Antoine Monnet <antoine@montane.tech>, Andrey Golovko <andrey.golovko@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Ville Saarinen <wiza@saarinenkoti.fi>
Subject: Re: [PATCH 0/3] ASoC: tas2783: fix stereo split and resume on a two-amp pair
Message-ID: <20260811135539.8672-1-wiza@saarinenkoti.fi>
In-Reply-To: <20260811124822.205891-1-robineveraars@pm.me>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi> <20260809103634.20438-1-wiza@saarinenkoti.fi> <20260811124822.205891-1-robineveraars@pm.me>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: ee87b912d071c1aea82b05698c3789540bb6f8ff
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> For patch 2, please add both:
>
>   Reported-by: Robin Everaars <robineveraars@pm.me>
>   Suggested-by: Robin Everaars <robineveraars@pm.me>

Both are yours, but don't wait on a v2 from me -- I'm stepping back and
leaving this to people who know the subsystem. On the record for whoever
picks it up: the channel-mask approach and the positional behaviour of
sdw_compute_slave_ports() were established by your report of 2026-08-05,

  https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/

four days before I posted. I got there independently, which counts for
nothing -- it was already published. Antoine's patch also predates mine
and is the more likely vehicle. The tags above belong on it.

So nobody is waiting on me: patch 1 is Charles Keepax's now, fixing the
reversed timeouts in the regmap core first
(https://lore.kernel.org/all/ansTPGgVNoDJlA5r@opensource.cirrus.com/).
Patch 2 I'm not pursuing -- whether the mapping belongs in UDMPU23/FU23
needs the spec and TI, not another host-side patch from me. Patch 3 I'm
not pressing: it was measured on v7.1.6, predating b627da430357, so the
evidence is weaker than my changelog claimed. Nothing there is worth
your time isolating on my account.

Thanks for the 7.1.7 retest, and for saying plainly what it did and
didn't cover.

Ville

