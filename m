Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36C2F747A;
	Sun, 31 May 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780242815; cv=pass; b=lIsVej/dRYsX07FYNHyPlEe1BBxcccr9q9WC4WwtEhax8wS5p+Q+jPJh4MvqBbiRu5TUgdCcV+ElsDo4EotXB+fqkiFUrcbW+8plPTqZCNgAo7khAu+gGEfzIcFPGl+tnVo1LPXCHtoL4inzg7Z/XtzVYk6k+/HaG0r5dR9ysCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780242815; c=relaxed/simple;
	bh=B0wplUAqE5JBL7qXRAdqBpWk1clJIl8S8nH5960Arzg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BHHSfRpwg2JlKOGRP9RbYXsMTQRNyZnORemGlPh9cc33UanVW3FF3BZ9Px3Ih/7S7hv03LUa7jCeEV0GZLy7bpVlh/akbHDI5PhHI2d+7pQwL3oKSIFd7kspiXF+4wDpxAEnTT68PiObDDiQBzpadOz3Aw1Z3MnJxYjBxwFkZeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=TArXUV0l; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="TArXUV0l"
ARC-Seal: i=1; a=rsa-sha256; t=1780242799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UF59BsLzYWBZdrZEqwJSTCfQnKjfKNdotQu5leDs1Otrgfq4tsN5J5beKA2wrBsUnUpm9DtaZc5MRIhPVrvrbsvJLgB5a2ryeMboyCm9W059Wq9ZVG+cGkwnowZwJ4x45HsY2dRQ1lyTjpSKQzWd1J+3zr/5eHGPkdOJNrNS8n8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780242799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wnIQTEMzZdLDVzoGCBe6Kr9JmXE/D0xVCozwk9DdVcM=; 
	b=jP/cCoCh5PpbrM8LoQTLSZ1lXqrlguRsrcOI1fYZnakPn7+edy39gmHk841vDpsXd/C7nKf++hbwBAfLg9QJokbmEwlPEISxm9gVzyBbYLnUatQWC96ZMXl0AO3dzhcmOhppuaY1frMcm8n0aLhIsIPwDBOrxOcOquQ0FQI+oLE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780242798;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=wnIQTEMzZdLDVzoGCBe6Kr9JmXE/D0xVCozwk9DdVcM=;
	b=TArXUV0lEhEvU7s+CtRyz8VlEADCgqDi3VDhCV20FueOHH7yxMcIMjqtREgNrnPv
	HBpaY0R5+9SxH+E2utfJ/8flr0+vNpgBOxV/pWVXzPLf5S8JPNSveGvZKNujIJl+oHM
	v9uvCfD3UlnRlU0cKDTlxhfaW2hLYbqYfER3IggPbc5TVHmZSSv8ezanzeoCUWU43FW
	Fxv+hTBENezavJAPwoMtfk9Bw9YR91sO2Bdkz7MilKigkcMz8BgzvUJUsFlc4bx26Cz
	x1Rc4vMwByfVO9rxb3QFbAGUzgQibdahM4j+4l7HbKBLcY4+jePAr6dUmNUnTsudUD2
	QXyxdSLU9g==
Received: by mx.zohomail.com with SMTPS id 1780242797203590.3923957078799;
	Sun, 31 May 2026 08:53:17 -0700 (PDT)
Message-ID: <2bce37fbc5b218d77404f1ed4ba3583f95aeef80.camel@rong.moe>
Subject: Re: [PATCH v4 0/3] ALSA: usb-audio: Add
 QUIRK_FLAG_MIXER_GET_CUR_BROKEN
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Steve Smith	 <tarkasteve@gmail.com>, linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <87se77o9xr.wl-tiwai@suse.de>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
	 <87se77o9xr.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 23:52:59 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi,

On Sun, 2026-05-31 at 17:50 +0200, Takashi Iwai wrote:
> On Sun, 31 May 2026 17:45:19 +0200,
> Rong Zhang wrote:
> >=20
> > Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> > mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> > identify devices with sticky mixers. Unfortunately, even though most
> > devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> > which I actually met more since the commit had been merged, there is
> > also a rare case that some devices may have volume mixers that responds
> > to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> > check to consider the mixer to be sticky and unnecessarily disable it.
> >=20
> > As the sticky check can't distinguish between sticky mixers and working
> > SET_CUR but broken GET_CUR, add QUIRK_FLAG_MIXER_GET_CUR_BROKEN to tell
> > that the device should fall into the second category when GET_CUR
> > returns a constant value. In this case, the sticky check becomes
> > non-fatal and only disables GET_CUR instead of the whole mixer. The
> > current volume will then be provided by the internal cache that stores
> > the last set volume.
> >=20
> > An info message prompting users to check MIXER_GET_CUR_BROKEN for
> > potential sticky mixers is also added, so that users can learn how to d=
o
> > some experiments to determine what's going on. If the mixer surprisingl=
y
> > turns out to be non-sticky, they can submit a patch for a new quirk
> > table entry.
> >=20
> > The Sennheiser MOMENTUM 3 and Edifier MF200 need the quirk flag. Though
> > their UAC mixers respond to SET_CUR by tuning the volume, the
> > corresponding GET_CUR methods are somehow stubbed and return constant
> > values, resulting in them being disabled by the sticky check.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v4:
> > - Rebase since a patch improving the error path of the sticky check has
> >   been applied earlier
> >   - https://patch.msgid.link/20260531-uac-sticky-error-path-v1-1-12c232=
9d17ef@rong.moe
> > - Integrate a follow-up series into this one
> >   - https://patch.msgid.link/20260531-uac-edifier-mf200-v1-0-be69657c3f=
87@rong.moe
> > - Link to v3: https://patch.msgid.link/20260529-uac-quirk-get-cur-vol-v=
3-0-bde363188ca4@rong.moe
> >=20
> > Changes in v3:
> > - Make the log less noisy (thanks Takashi Iwai)
> > - Do not propagate mixer values written by sanity checks when GET_CUR i=
s
> >   broken, nor restore the garbage backed-up value. Instead, rely on
> >   init_cur_mix_raw() to initialize the mixer properly
> > - Gate cache invalidation as well, so that the current volume is always
> >   available to userspace
> > - Update the comment of check_sticky_volume_control()
> > - Link to v2: https://patch.msgid.link/20260528-uac-quirk-get-cur-vol-v=
2-0-84d3c8f48150@rong.moe
> >=20
> > Changes in v2:
> > - Turn the approach into a less radical one
> >   - Rename the quirk flag to QUIRK_FLAG_MIXER_GET_CUR_BROKEN
> >   - Add a flag `get_cur_broken' to `struct usb_mixer_elem_info'
> >   - When the sticky check fails, check quirk flags. Gate further GET_CU=
R
> >     by setting `cval->get_cur_broken' if QUIRK_FLAG_MIXER_GET_CUR_BROKE=
N
> >     is set, otherwise disable the mixer as usual
> >   - The quirk flag still applies to all mixers, but as long as a mixer
> >     makes the sticky check happy, it won't be affected at all. Only
> >     those mixers with constant GET_CUR values will have their GET_CUR
> >     gated. I assume the impact is minimal, since it's very unlikely a
> >     device would have sticky mixers (broken SET_CUR) along with mixers
> >     with working SET_CUR but broken GET_CUR at the same time
> > - Link to v1: https://patch.msgid.link/20260527-uac-quirk-get-cur-vol-v=
1-0-e9362b712e5e@rong.moe
> >=20
> > ---
> > Rong Zhang (3):
> >       ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
> >       ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3
> >       ALSA: usb-audio: Add quirk flag for Edifier MF200
>=20
> Now took all three patches onto for-next branch.  Thanks.

Thanks a lot! :)

Thanks,
Rong

>=20
>=20
> Takashi
