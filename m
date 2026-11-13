Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569832;
	b=eUcnadHl4d5MLFO4A3bjZr2AX5RgmlLUmH7zxEukuyfAsxNMvyXOtFq2GOAtoF0Oq2qD
	 ypBNlgoSJc484zOQwT0Hb8pstxLcnhZ6Z71qHJXUuZ1q1Hof/VjdC+lFK2TW+Xtldn9Gq
	 4OCWnlkLrYEQPt7tzFqya3g4Mz9egx3ZDfqmuuPgteWxxLRU95FW8Hzwz54rg564Lc0DY
	 bF9buY0bUFkYuI51ZuAmwCm2MglnVjnZcD7TtzHUJP3Vu+fPMTpkZML2rO5TyJcL1avOE
	 peshQKnYFYYmbcF8LHMihgtZnMm2abVLIyaAE+aMThx+H0NcNkLYAGNCCjkOzineY+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=91vpj5VL4WkvpEygF+DAgUCAZm5dIx441Zh2vUrxQo8=;
	b=ErTng3NfvRj45oT4gjoV3KST8X6SC4bf5Hsu29/lFib/ssOZ9wQgVAmMU0Ksk/CkAlt+
	 gDxI+2YfLJukGNnafXE1fGKnSdpW4hIg2DO5iWUrx7Ic+KXnbFz2OaryP4b7g0fcXkxk1
	 RDkPGMKegHsebIPTJLRluhElSUADFAC831BjeIzW8mr+XXBKM3SBBJt6NpK7CKOUvPYwm
	 ct2cllOZq23dzJEbDF6OOrUWXA+A/H1GP4jjauGR7QO8chWKfKZb231MJntefhVKhqbdQ
	 y/WSpfKZKLad/xQlzfMJksxG/Nf/Pp03HSttFXPGFemJDTyJ0J3kKeJDskyLpqlFmOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9zDB+mX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F7606A32A
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9zDB+mX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3A1F000C4;
	Fri, 13 Nov 2026 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794569831;
	bh=91vpj5VL4WkvpEygF+DAgUCAZm5dIx441Zh2vUrxQo8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=P9zDB+mXiGZ+y2z1Xx5ZGuRnI6kUyaJ9D2Q9lGEx9pNGz57LZWGzOYCizEQU+UNE7
	 W5dX90PZIuVu5dskzxc4Q81ztJhcRCvzanIcwTp9UfTA2yPIQ176q6jMz6El+OrVkg
	 kb8YqJ95BVgnlT05oaKVN6V2NHhO9FZT/0GZaGZoDb82nZbZTDNdl4+LM+OwlHCCia
	 bBwRC78Kq48kM/AkTkoREZrGU23vP+CaXC9JvDPT47CtTI6OLB6nVop/CJmWZQyBu1
	 AAoJrvQwsH8e486vGSIdfUf0CNybYfY76gdgRtUvhpU97dAFDisIkYjGxyMs1l00aa
	 j3WDMgj/GNjtA==
Message-ID: <sashiko-outbox-212730@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] ASoC: Intel: avs: Do not skip error reporting
 when an IPC timeouts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261113113840.3067489-2-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
 <20261113113840.3067489-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 11:37:11 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: Intel: avs: missing Fixes: trailer for IPC timeout error
  logging fix
--

commit 7616ba37e434bf822d649f2b888e0cc7892fe0f3
Author: Cezary Rojewski <cezary.rojewski@intel.com>

> ASoC: Intel: avs: Do not skip error reporting when an IPC timeouts
>
> If an IPC timeouts nothing is printed as avs_dsp_do_send_msg() exits
> early. This makes it harder to assess and debug IPC failures. Have a
> variable to separate "should copy reply?" subject from debug printing
> one.
>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

[Severity: Low]
Commit 26033ae6bd89 ("ASoC: Intel: avs: Move IPC error messages one level d=
own")
moved IPC error logging from the callers into avs_dsp_do_send_msg() after t=
he
early return on avs_ipc_wait_busy_completion() failure.  Should this includ=
e a
Fixes: tag for that commit?

  Fixes: 26033ae6bd89 ("ASoC: Intel: avs: Move IPC error messages one level=
 down")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113113840.3067=
489-1-cezary.rojewski@intel.com?part=3D1
