Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A752305678
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056424; cv=pass; b=glQQi3NBGOqvpnLCJMdOGUC1iTmsuOUky9FiAxNiG0qG1GHiqV9r6d+cb/pGebJC1CV6ja2JgSFTsbxCychMxxSDZSNGkIW08TWj0/BywYjkPw7GEv49WLB0Sf0ftQBMcKdQxJHZ+fh+jnS7d4uClAYGGDCxJOVCOTjckmgH5D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056424; c=relaxed/simple;
	bh=jTLIWY0JE3CuiXU3sE2ZMrkZQSvR8U790VavU7/MqbE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TKqKL7xPueuWvPsPkKkXIIm/mg2V45Doiy5EnSiYN10oa9lazhPKxXlxfT5X8vwzxW3fKnyzyLwTzpUgQ1XLB3G8XhYUtuNGzrtCk08MOrRUWrvvvkNEqmKnET/bMiVmF7CeIuB/jS8fo5HzyFAwlyPCWW0/p3U3XsgLGc00PpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=b02UQzx3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="b02UQzx3"
ARC-Seal: i=1; a=rsa-sha256; t=1780056416; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CHziMbcshJZlsfcrWjUTSf5hCDE02VSRa9k9X2pFZJaruaBN12Lc4JUAJ00+7U2hzF7Rvrdr1V+M46I8z0bTsTczk0arF2AuU2EZDpyr4d1oA6na8KYlrpjCRQkwvP77IEmPOLWoFEraU89mW94IlKGGpF/A70Ve8kNNswhFBf4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780056416; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg+W/kCMCGMlopgFF/c99lKL3RVpQ7987n/sW5iE3bs=; 
	b=kfqa/Ea3v2ycZ35Rb/kFIMhNoBskhk+hDyjLAT+VjIKNlXbQs1nnBB0wdeZeEg3jKC3vsPMD/kw8HyxljQqjzqfnVrmzl66uN9E8oFwuhEC6+LKkedr5IOIjrL7BEDwihe6SC0TAf6uCY/jiuCfP+fz/Vz1ghbQoUPSl97uW9fw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780056416;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Cg+W/kCMCGMlopgFF/c99lKL3RVpQ7987n/sW5iE3bs=;
	b=b02UQzx3xwNJ/icOkWH+bUzEBmHJOAPJfljJR2jzqW0z0vzxduqkXMGYwNYLWBQu
	fevfyvQ9q6dLekM5MpBjXOIEreImvNdQn1g5S3K0aeuT5nhg93fCWFy3BPfnbt5WDPp
	YJxhl04wvqxZlGg99z8qkLNpoHWbu5iXLWT2Qv1lOk2+MXxTqRffb989BjB/v/eusYF
	41TAzVxxyg/akodSmUV0Rn4Gz2GDtqkBxycCDLAjURJomfUnXzc63LcLWcTMFhIl4a5
	ZcXkhF0U+L55d87ZLMQ62EB/mzmqcDxQOWPS7KuJv73Q90QYuXrgXDNFA3HLNYlu8OP
	YirHrUFVGg==
Received: by mx.zohomail.com with SMTPS id 1780056413569395.3383980810057;
	Fri, 29 May 2026 05:06:53 -0700 (PDT)
Message-ID: <b25d12e13bffefb926d92464eda1f66cb26f5dfa.camel@rong.moe>
Subject: Re: [BUG] Audio regression in 7.1-rcX; low volume on Edifier MF200
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>, Steve Smith <tarkasteve@gmail.com>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87wlwmr32n.wl-tiwai@suse.de>
References:
	 	<CAHLWS5FJCx66GQ-O10pu+nEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com>
		 <87wlwmr32n.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 20:01:46 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Takashi, Steve,

On Fri, 2026-05-29 at 11:13 +0200, Takashi Iwai wrote:
> On Fri, 29 May 2026 07:21:27 +0200,
> Steve Smith wrote:
> >=20
> >=20
> > Hi,
> >=20
> > I'm seeing a regression in the 7.1 series (including the latest RC)
> > where the volume on my Edifier MF200 model EDF100038 (connected via
> > USB) has extremely low volume; raising the volume to full makes it
> > just audible.
> >=20
> > I have bisected the issue down to a single commit:
> >=20
> > =C2=A0 =C2=A0 =E2=9D=AF git bisect good
> > =C2=A0 =C2=A0 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03 is the first bad=
 commit
> > =C2=A0 =C2=A0 commit 86aa1ea1f15ce6b56ac1b4c0d9b88a07a5b9bf03
> > =C2=A0 =C2=A0 Author: Rong Zhang <i@rong.moe>
> > =C2=A0 =C2=A0 Date: =C2=A0 Sat Apr 11 01:49:04 2026 +0800
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 ALSA: usb-audio: Do not expose sticky mixer=
s
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some devices' mixers are sticky, which acce=
pt SET_CUR but do
> > absolutely
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 nothing. Registering these mixers confuses =
userspace and results in
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 ineffective volume control.
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Check if a mixer is sticky by setting the v=
olume to the maximum or
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 minimum value and checking for effectivenes=
s afterward. Prevent the
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 mixer from being registered if it turns out=
 to be sticky.
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Quirky device sample:
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb 7-1: New USB device found, idVen=
dor=3D0e0b, idProduct=3Dfa01,
> > bcdDevice=3D 1.00
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb 7-1: New USB device strings: Mfr=
=3D1, Product=3D2, SerialNumber=3D3
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb 7-1: Product: Feaulle Rainbow
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb 7-1: Manufacturer: Generic
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usb 7-1: SerialNumber: 2021072690592=
6
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Mic Capture Volume)
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Rong Zhang <i@rong.moe>
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Link:=20
> > https://patch.msgid.link/20260411-uac-sticky-mixer-v1-3-29d62717befd@ro=
ng.moe
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >=20
> > =C2=A0 =C2=A0 =C2=A0sound/usb/mixer.c | 48 ++++++++++++++++++++++++++++=
+++++++++++++++++---
> > =C2=A0 =C2=A0 =C2=A01 file changed, 45 insertions(+), 3 deletions(-)
> >=20
> > Additional device information:
> (snip)
>=20
> Looking through the log, I couldn't fine the error message like
> "xx:xx: sticky mixer values ...".  Can you confirm that?
>=20
> If the error message really doesn't appear, it means that the sticky
> volume check itself passed, but the patch caused some other
> side-effect.  Does the patch below have any influence?

Hmm, the dmesg dump is, however, for a good commit. No wonder we
couldn't find the error message... :-/

   [    0.000000] Linux version 7.0.0-rc7-20260529-1451-e3ad86a82868...
  =20
   $ git show --no-patch --oneline e3ad86a82868
   e3ad86a82868 ALSA: usb-audio: Move volume control resolution check into =
a function

Steve, could you please attach a dmesg dump for a bad commit? And could
you please test if setting QUIRK_FLAG_MIXER_GET_CUR_BROKEN on your
device helps? See
https://lore.kernel.org/linux-sound/20260529-uac-quirk-get-cur-vol-v3-0-bde=
363188ca4@rong.moe/

>=20
> Anyway, Rong, please check this in your side, too.

I guess a dmesg dump for a bad commit will show the error message we are
looking for. If this is the case, the device also needs
QUIRK_FLAG_MIXER_GET_CUR_BROKEN.

That being said, perhaps we should also adjust the error path for sticky
mixers a little bit, i.e., set the volume value to the maximum instead
of restoring the garbage GET_CUR value before bailing out.

For a sticky mixer, it's totally safe since it's equivalent to a no-op.

For a non-sticky mixer without QUIRK_FLAG_MIXER_GET_CUR_BROKEN, setting
it to the maximum effectively allows the maximum software volume to
reach the maximum hardware volume, reducing the impact of falling back
to a soft mixer. By doing so, users don't need to wait for a quirk table
entry to get an audible volume.

It may also be helpful to add a usb_audio_info("check
MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky") message
following the error message for sticky mixers, so that some users will
notice it and do some experiments to determine what's going on. If the
mixer turns out to be non-sticky, they can submit a patch for a new
quirk table entry.

Thanks,
Rong

>=20
>=20
> thanks,
>=20
> Takashi
>=20
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1364,7 +1364,7 @@ static int get_min_max_with_quirks(struct usb_mixer=
_elem_info *cval,
>  		if (cval->res =3D=3D 0)
>  			cval->res =3D 1;
> =20
> -		if (cval->min < cval->max) {
> +		if (cval->min + cval->res < cval->max) {
>  			int saved;
> =20
>  			if (get_cur_mix_raw(cval, minchn, &saved) < 0)
