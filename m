Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D13F0740;
	Thu, 28 May 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974965; cv=pass; b=MEYiX+mwE6Q0LE8+rnXtYYw7qGUa3LEeJm9dSTR3h2McObKPoS81oOhGHrdm3f0BsZG1TyM+FDgnKqS8bGhVKeFrt2fffgLDstbDo5bzrcqtcgAFfLDghKVZaNESZJX/h0ch42/f0J/J8iV57iJ6ZoBrmQgKu2BfBU7xLTSbMto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974965; c=relaxed/simple;
	bh=7qEK7ju3Omgrg8aAypHQk6Cbk0gZuRfZUcvvKJcACFA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IqFUl5JHJQgoJXrEUtzd37ReJeSqhFszr15boubLmu0RmcBQzk10cOXQ5ugcoy64NiwFbHQfyUmfBbw+UboneiFVyCTGklCxiop30t0wWTxaHvj3nASOicRRgpYUGIo6MVcgfrhviOoSeVALP6zYWlggWHY+ZH54lN4F/eyQrtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nAj+e7UB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nAj+e7UB"
ARC-Seal: i=1; a=rsa-sha256; t=1779974945; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RtNIp5pQ+N4uRz4sbdKqhMkiyRAh0GZeb5KzdeLEB4592t9KXZCeT3uGsU4/JJajw5kZT9x4sriFz7nqdN7FrKkfRestq+5qJdCG037fCw5e5wTxZQ+IIaPlu3fsNbqIrCVidKckQBffS5zkqzFvEEMGswZhOEVVATPYTrpezAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779974945; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=meLy9pmAiQkEggopsXqYM0yVHff10DZv32SxrejNWJE=; 
	b=DS1Yt5L4rwnHtPxTIL1S8d/AjzpT7Cp6Jpai+ldhLyuCOkVSRaknPqlIB1TmHpOPGfjQmfihjd6ugExjUOJX5aQ8vtC5A0cTn4jnXsTBg/aME2X3YurlZl4qmCwz68/Tc5qh8yvOF9nSIfG+29uAOsAI76L/SvO5ohYenzme1pE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779974945;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=meLy9pmAiQkEggopsXqYM0yVHff10DZv32SxrejNWJE=;
	b=nAj+e7UBC8m9KsXsA67ZpQ0G+P4Wr+yGaw5uG9KocDsQtEyLCq3sV/BrxzddgPjE
	/UZ1yJIoR8dbEmFNrpDDypsVD/M7R93gryh7fju8GAXCsig0/YiFnuMu66eOBae0bqY
	YGcbeWkMT2FfDGnIFF949slQ4UGtgPinNFNmqtkxfBy5s0Zii+UMkFIGlM831KKPntB
	WcBQh+ZjJcpgexjhte0ekVJEg6jxcFFiqcWdjzvKpwELnvmBbrqw2J+BWnH5Bjf0xXV
	uGJLHjDDwl/rx5Lpf7VyLwLNX4tBoMPg1Yo10zXrGIGPu69NTu3eK36m6PrwQCYm8Uc
	15uyo4Ob/A==
Received: by mx.zohomail.com with SMTPS id 1779974943588581.027273066147;
	Thu, 28 May 2026 06:29:03 -0700 (PDT)
Message-ID: <966fd55f52bb5e0bd1d16d3227b2e6695fa23f56.camel@rong.moe>
Subject: Re: [PATCH v2 1/2] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <877boougfq.wl-tiwai@suse.de>
References: <20260528-uac-quirk-get-cur-vol-v2-0-84d3c8f48150@rong.moe>
		<20260528-uac-quirk-get-cur-vol-v2-1-84d3c8f48150@rong.moe>
	 <877boougfq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 21:23:53 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

Thanks for your review.

On Thu, 2026-05-28 at 09:44 +0200, Takashi Iwai wrote:
> On Wed, 27 May 2026 20:56:27 +0200,
> Rong Zhang wrote:
> >=20
> > @@ -1258,6 +1261,16 @@ static int check_sticky_volume_control(struct us=
b_mixer_elem_info *cval,
> >  			return 0;
> >  	}
> > =20
> > +	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BR=
OKEN) {
> > +		usb_audio_warn(cval->head.mixer->chip,
> > +			       "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D> %d)\n",
> > +			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> > +			       cval->min, cval->max, cval->res, saved);
> > +
>=20
> IMO, it's better to be usb_audio_info().  Otherwise it leads to an
> unnecessary caution.  Basically the behavior is expected, so there is
> nothing to worry about that.

Hmm, makes sense.

With your suggestion, I also just realized that it makes no sense to
restore a garbage volume using snd_usb_set_cur_mix_value(..., saved)
when GET_CUR is broken. It would be probably better to rely on
init_cur_mix_raw() to initialize the mixer to cval->min instead, just
like what it does for mixers that return errors for GET_CUR.

Hence, I will turn it into a usb_audio_info(), clear cval->cached and
goto no_checks, so that init_cur_mix_raw() will initialize it properly.
The usb_audio_warn() in init_cur_mix_raw() will need to be gated by
cval->get_cur_broken in this case too.

Thanks for your suggestion,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
