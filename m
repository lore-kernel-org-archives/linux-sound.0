Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B081581F0
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728086233; cv=none; b=iJ8bk6C5iw2oY5s63yTc48Da3OGJBsMSGgQdeikT5555KXVnVzP28bAf3QEB40yQZqTHJl68wN2E/vFRXlya8a2fJOiuKqGS2R9LOI6xKCs/DMUGTdKNF/Uciw1tTMyTAP5VJ4ompyLlkAn5Bs+2rq7nMKv15VB0s6CqbCOgQm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728086233; c=relaxed/simple;
	bh=rByr2jMbB2CEi9Ymm5lkB+CQ+JgV7G8pz3jAwICLWik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaPmSIhbonjtTKeuBtrdHh6luB25HrXnSNLRC7POTNBg0pDuLhgeckcytzunSraRJArKeqoA7QbDwL9eGjqS58TFhFwDBnTqcAdqph6CTErzvXr43EU0XMOQ2lApqC55u4wYvQKQmReWwwqPglxkLjdy84JNOvU2V7vHYVCOAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA+Y3tMQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA+Y3tMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480BC4CEC6;
	Fri,  4 Oct 2024 23:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728086233;
	bh=rByr2jMbB2CEi9Ymm5lkB+CQ+JgV7G8pz3jAwICLWik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hA+Y3tMQHw8BdW7UzxKaKlkKjw3u1/0XzdFQioaENPBGRlhD4GyV2Ei28Tkk0QvUs
	 LOweCrozOynFxRx5tuAnYgGboPMP9mPhguV5dRVatWi8ZBBWrPd8NMZVAmoIz564PN
	 rp+fe6P4SQ5NR8cdBpBi4S0ubTdKYyZSngSCnhlVgP5PJUECeG+XGj8XiabycL1Mur
	 UmSFqKsLkUDnGSrsRO+FxkZpXIe0iak6eu/LiCfXopK22BltG+o0BbjxI+jxvpkDAv
	 8HqizNUjy8nEMctSEkPKEMerIsmQUkuIcXghavJKbNerE/Rgjhphn+w/vF/u2tr3tx
	 yzTgzbPNnTQGg==
Date: Sat, 5 Oct 2024 00:57:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	bo liu <bo.liu@senarytech.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Gergo Koteles <soyer@irl.hu>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 48/51] ALSA: hda: Switch to __pm_runtime_put_autosuspend()
Message-ID: <5c107f8a-60c4-4332-a900-0fbe48a66a3c@sirena.org.uk>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094145.114167-1-sakari.ailus@linux.intel.com>
 <87o740kuge.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="07OVY3p8QR7ou0nN"
Content-Disposition: inline
In-Reply-To: <87o740kuge.wl-tiwai@suse.de>
X-Cookie: A bachelor is an unaltared male.


--07OVY3p8QR7ou0nN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2024 at 12:56:17PM +0200, Takashi Iwai wrote:
> Sakari Ailus wrote:

> > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > pm_runtime_mark_last_busy(). This patch switches the current users to
> > __pm_runtime_put_autosuspend() which will continue to have the
> > functionality of old pm_runtime_put_autosuspend().

> Many of those calls are with pm_runtime_mark_last_busy().
> (Actually the only one without it can be an oversight, it's better to
> be with *_mark_last_busy(), too).

> Wouldn't it be better to keep without converting and rather drop the
> superfluous *_mark_last_busy()?

Indeed, the same is true for the majority of cases in other patches.
These changes seem counterproductive.

--07OVY3p8QR7ou0nN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcAgNEACgkQJNaLcl1U
h9BdEQf+MzVN0C9sF34eAyQCpncjmJ3dSCrqBEM15NwmLESyBViPGF8B9lSOyBqe
eetmRec8l/osnxExgFIeUQsBNrZLqwRxeIkpsIXjgznCWCA76ZVqNG/k9x0m09e6
GcWfm2ErWgsWj71bR81l0UpWzEysqPwfaEbIGLGPkEVYx47nBWJQ3jl/aqFJbV8/
RqFD+bGrKwsc5A2SqjHP5B82Ja8KecFp0ZCJ1mkMPMFluewfICnevFmPlRX+irzE
q6qaO2sl4e1SFuaXVMasOhRDxwB5nN7imrMUGgwdVCwDw1EDNleM73FH2oN5xxbY
z6nlaxY6fWyU07k0EDiLzyP5pt4N/g==
=igLX
-----END PGP SIGNATURE-----

--07OVY3p8QR7ou0nN--
