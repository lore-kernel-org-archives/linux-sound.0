Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936651AA7A6;
	Mon, 30 Dec 2024 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735573255; cv=none; b=LzhjcouDoIO8Cv17O7a2tyiMBoFahche59KDQVJJEX8O8mgbO1GFZypYtwhVht57ASo4i+jZz4gbO+mmY2uIFpgSdcx6TsYpjXuWHx4BdpHSP4mCI/SSHN2Bk3tJnlviIlE550TU5dLoETSNJ/5kpcYNKhV1ja5sOzPqt8kuhm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735573255; c=relaxed/simple;
	bh=hVhVnNKnVI8iNCRR36zeqFoR6BeMzVmrgrLnHtVloSw=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdnPn2TUQDxd6ZZnjKiWDCDKdG0wztpL6UXdPLDyvYJ+P4Gpuu7cBGOUXF5tgJd6nOTex6EBlmL219S1WQwjSV9V+uWjCCmrhZYqWyei5dumEO7n1vHIWl01qgFbt4EErBByhUj/21DXqD5P4oRq/iS+1z77Z7ONfDxDpu+dBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=b7wK2tiP; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="b7wK2tiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=protonmail3; t=1735573245; x=1735832445;
	bh=5NzRg6mC+A0IcFPBC7W6M1k7t2cxX6NqRfEL9d0tTZM=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=b7wK2tiPtwiGoLGSt3K/XSb9mIwoFDba0ngp8SS0aMFKKQWXf9MNPGYES/SBWEQhH
	 xSZ7HvzA5i3cFLL5+pygYquLnOzRfKJKj1NX2vu1Ts8siyJdwA22K9wORNTVD3yVnq
	 gkZu2xbxlgUG/qxwu82+/2wJgLduXEuX2wAhvOe5msZdCc/G33kejas/khD1Swi9vz
	 W5OooqpUnbuAbxLBznjz6PZNRUu/xlTzKnXHkLrFiw8mgUvnmE31SSk9JantHwQ3kD
	 Rhd8bgG7Hy58EbvrtHSr/4wdaLp/bpjb9cKCGSDPSUGZv24D6cYbfZgd1MffLthI/k
	 4AWxAdE3J/1fg==
Date: Mon, 30 Dec 2024 15:40:41 +0000
To: tiwai@suse.de, tiwai@suse.com, perex@perex.cz, arnd@arndb.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, ryan_richards@creativelabs.com, wychay@ctl.creative.com, David Laight <david.laight.linux@gmail.com>
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Subject: Re: [PATCH v2] ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions
Message-ID: <rwfdemj7ic7rnxnycnv6sxixtfmyqnoi7u6wgulzpsjf7qm6oh@xwkyteg6hak4>
In-Reply-To: <20241230153243.2874102-1-ethan@ethancedwards.com>
References: <20241230153243.2874102-1-ethan@ethancedwards.com>
Feedback-ID: 28410670:user:proton
X-Pm-Message-ID: 650506ad36047dd1671b8562f19b6bb273721f79
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24/12/30 03:32PM, Ethan Carter Edwards wrote:
> There was a lote of code duplication in the dao_clear_left_input() and
> dao_clear_right_input() functions. A new function, dao_clear_input(),
> was created and now the left and right functions call it instead of
> repeating themselves.
>=20
> Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAv=
nD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=3D@et=
hancedwards.com/
>=20
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Co-developed-by: David Laight <david.laight.linux@gmail.com>
> ---
>  Changes in V2: Fixed formatting caused by email client. Sorry!
>  sound/pci/ctxfi/ctdaio.c | 50 ++++++++++++++--------------------------
>  1 file changed, 17 insertions(+), 33 deletions(-)

Alright. It appears my email server is mangling my patches somehow. I
have tried using both mutt and git send-email, and it appears that they
are still messed up.

I'm using Protonmail as my server with its bridge locally. Does anyone
have any experience with working around this? I can't immediately find
anything online.

Apologies.
Ethan
--=20
Ethan Carter Edwards
CompTIA A+, Security+, and ISC2 (CC)
Ham Radio: AE4CE
Website: https://ethancedwards.com
GPG: 2E51 F618 39D1 FA94 7A73  00C2 34C0 4305 D581 DBFE

