Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D8B3A1D10;
	Mon,  2 Mar 2026 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455572; cv=pass; b=d3BbC0G8khj8+5nHnTs++YNo380/Lpa9fbl8C6FcvDsLrGkNyuhvJGI9GDthK1+Z+YYbFI9hTasIzovPM5kLm9kuxnRBOknykFiB+FSmuC5nyENYeGw3/J0J+hExfRbFieZNpf/j9lXHSCB/ewAyDw4giCSC4G3+V1Nli1srCFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455572; c=relaxed/simple;
	bh=YtiMFSMGOsM80kiq8sYVtpd9H+Zl4EMRcp4h96xpz+g=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HhTGDiZj50ELDxbObczFB3PzRtxuv1810EHToQTQdN8hDno6w3A7Dr1ngV/7XRtX1uAfu741sdWY8fMoK583rkzgW5YR4Ae1qhbjyI3OU36/DISMauVWV9eKzbKi7m/fadgAIDfdvZ9whul78KgkOMfcpQrM9eCwdERp5H7OLbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=pGYXhe8h; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="pGYXhe8h"
ARC-Seal: i=1; a=rsa-sha256; t=1772455556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dnpKMuFFysKv8G12/fMEig5ZxG1JlBjnVRTZSzIyxASBqFkwitHta10VPlb4QvOUhs4zGeXnlYg7ForMAxYIoFnrpNX5mg9YGx1ChQ+X6aEU3gBBVSsMZ8mdrFkQjho6wZKhQ3dR7n+beZ0r7Cdkxzwen/DKWieNpOYexJxZtPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772455556; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gTFtmfQtXMDpg7iv9uZxCLl93ucQXvrHZZRpLTgfjCg=; 
	b=gpi9ndaVADHaCm7YOverbUvi8DRAkDTfQIwPRuOr5BfFcsRVeSiDPLliBnPhbOlqd+zo++ISDKdqlgsLMpu1+yQPQ7xCwkgIyE9nK6dDb70eyewHqTKZBUvOj6ylsKO4cIV4kHp37RQY7incjEimKSO+nhr7dCKsJty1Jv1eM3M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772455556;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=gTFtmfQtXMDpg7iv9uZxCLl93ucQXvrHZZRpLTgfjCg=;
	b=pGYXhe8hNnpac95UlrzoZPcsuCO0LVN5WOx+Rc5xmQkmYQJ0/k7wFdVb962VfaLe
	ft+nqu4ljf8aDwVvVl03Zw36uMTM8XjecoXJOq7fd5KHD4sF3Tr3HsDwLrMxUnVtn6s
	73JJOVMi9MPNeCvxNWpWk4jP/JjlWFm6cKP2+zs02jWrYAjt38YNJvUlRV8oUGbf/GJ
	rC3WeIbOUHoVegxn41jLUOLc+nRzTSU7Bx8s0UeJZG0zJBEbf987fF3jBtjxBeahz/u
	IxgeJuBjaE2PVuOz1ltyNYDlQBiluH8oKrykJmCMueKWAiXinCEEPa+3pJzUzTwApz5
	d9DS++sqyQ==
Received: by mx.zohomail.com with SMTPS id 1772455553971555.43443934584;
	Mon, 2 Mar 2026 04:45:53 -0800 (PST)
Message-ID: <3c5080557a03270e3be526b4b2fcd2ac3812d707.camel@rong.moe>
Subject: Re: [PATCH 0/9] ALSA: usb-audio: Add quirks for linear volume
 devices and deconflict VID
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Cryolitia PukNgae	 <cryolitia@uniontech.com>, Arun Raghavan
 <arunr@valvesoftware.com>, 	linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
In-Reply-To: <87ldgamu0s.wl-tiwai@suse.de>
References: <20260301213726.428505-1-i@rong.moe>
	 <87ldgamu0s.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Mar 2026 20:40:46 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Takashi,

Thanks for your review.

On Mon, 2026-03-02 at 10:59 +0100, Takashi Iwai wrote:
> On Sun, 01 Mar 2026 22:37:16 +0100,
> Rong Zhang wrote:
> >=20
> > Some quirky devices tune their volume by linearly tuning the voltage
> > level (linear volume). In other words, such devices has a linear TLV
> > mapping of DECLARE_TLV_DB_LINEAR(scale, TLV_DB_GAIN_MUTE, 0).
> >=20
> > The series mainly adds quirk flags MIXER_PLAYBACK_LINEAR_VOL and
> > MIXER_CAPTURE_LINEAR_VOL to represent this case respectively for
> > playback and capture mixers. Afterward, apply these quirk flags on them=
.
> >=20
> > Some MV-SILICON devices with these quirks also have another quirk: VID
> > conflicts with Focusrite Novation (0x1235). Hence, add support for
> > string-descriptor-based quirk table entries and define an entry for MV-
> > SILICON to deconflict them.
> >=20
> > Some improvements to the logic of volume range checks is also included
> > in the series to help identify quirky devices with linear volume.
> >=20
> > Rong Zhang (9):
> >   Revert "ALSA: usb: Increase volume range that triggers a warning"
> >   ALSA: usb-audio: Add helper function for volume range checks
> >   ALSA: usb-audio: Improve volume range checks
> >   ALSA: usb-audio: Support string-descriptor-based quirk table entry
> >   ALSA: usb-audio: Deconflict VID between Focusrite Novation &
> >     MV-SILICON
> >   ALSA: doc: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP of snd-usb-audio
> >   ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
> >   ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
> >   ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices
>=20
> Thanks for patches!  The logic looks good and the implementation
> seems reasonable.  One slight concern was about the string matching
> patch (I explained in another mail), but others look fine.
>=20

Thanks. I will send a v2 addressing that.

> Maybe the patch to add the missing documentation for
> QUIRK_FLAG_SKIP_IFACE_SETUP should be applied individually beforehand.
> Could you send it a fix for 7.0?
>=20

Sure.

> The revert of volume range check makes sense, but maybe that should be
> combined with your rest changes.
>=20

Yeah. Patch 1-3 as a whole targets 7.1, where patch 1 is also for
backporting (so that potential insane volume ranges can still trigger a
warning in LTS, which is better than nothing).

Thanks,
Rong

>=20
> Takashi
