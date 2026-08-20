Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3611E258EE9;
	Thu, 20 Aug 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230651; cv=pass; b=AXhQgTXUTNj2s584E41ryHA+d0XuZgFNCzcWV2oJ3vApyMGsFtw2xA8Q0kAzVxaUmzs52ovR+65gKxRsK+TY8KSulEeHAUM+FfagaPWQiqhKJIzhphJmAFUZTxp9vh8MzHQnYohYwOw3D443SphSXXH36Nt0xVur4wg3dvZeMFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230651; c=relaxed/simple;
	bh=cCteKFglU5+KmSqKIKGXWSZrLaibkEk4KwJeXl8SIdo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iGBbYwzxEjPJ1rTA/qHgDYjTZWIwIkA1/9Vz6gh/6e/I8bbYqkr3XUqZ6eRe1WWof57+I8si2vDxQ9pOzOzdC5QmDpZvplUZ69TxhlcAklkR476gfOM0oTva9x4IRkQq8BGwlWg+2fOLmn63cIz3RNITl1a4G5CTyNIqIQiTMX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=c74sN5TT; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="c74sN5TT"
ARC-Seal: i=1; a=rsa-sha256; t=1787230625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XxpQ5KLMeWHLh8yRqzs1oja5eYWS5KBkypQecz6T3iuPidx8jUShmhqD3Dzq+YAKg1XpXxfoRgtHEFtvWWYZ5fXkhRmmTBcjwU0LD0njTYjaJ6hendHnKrZo5GJpojHoihCwx62oldxLP/n09l8LkgClc/+cAW2Iaf30nsOKd4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787230625; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1mwFj0DF9mlPHHNlb6DOP9kmLoIsjj32TQdq8Pr5vAQ=; 
	b=DBRqFQCKwaJ7emINcla1BohjBM6/Br9M50EZFXiSM/L/P10QZw+CTrJ+al0x/FjIQrK6fUSZavMtBSfuWvzFd3Xzz2mGu80r7fW8FkIz6UuQUuqKdB2Nw4U76Sytk8UqnlXiwnU2q2HBcxUOnKyQ0h7Vy4wxk+Dj+/Qo/YUI+dE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787230625;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=1mwFj0DF9mlPHHNlb6DOP9kmLoIsjj32TQdq8Pr5vAQ=;
	b=c74sN5TTMDPmbKxXO/ZW41o8EvPkY3mpuL+Bceke/hFPv9PZ1DJuJCRSFvXA2qPR
	DIPCq8237sCbHBBFyAr9SvzVOEL2BWMmG/gUOC6eqI8fWAQqCjD7t520YZLtl15UQcz
	b/8ODz+HZVrQC48IFR8cTZo9XYtN0xSJ+PM5XfzA9vOBDW57/CcrLU3Yk812hBjxigw
	uxuP/avhDOFIE0Rb48/JmIK+k/NAIkfRZOJDD5Bh8UClTXcn9q4Yqz1hokC+Gy4KikN
	tusvd16GO47teXDBzOqplKoQiPHKNBmyeV99Oi9IxIcuOBGeUx+DSeUjU2dgw5SOZmu
	fe1xrGMk5g==
Received: by mx.zohomail.com with SMTPS id 1787230622099802.1137294488123;
	Thu, 20 Aug 2026 05:57:02 -0700 (PDT)
Message-ID: <f60339edc65efc277986ec01b1134ae8d4c4cd81.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <9dc9681c-a491-46bb-a64c-eccce0150398@gmx.de>
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
		 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
		 <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
		 <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
		 <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
		 <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
		 <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
		 <72776889dc0368b955e569d7a4ae7fca6ca82729.camel@rong.moe>
		 <9dc9681c-a491-46bb-a64c-eccce0150398@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 20:51:48 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

Thanks for testing.

On Wed, 2026-08-19 at 20:37 +0200, Alexander Niemeyer wrote:
> Hi Rong,
>=20
> thanks. I have now completed the three tests you asked for.
>=20
> 1. Your sticky-check patch with the detachable Mic boom attached
>=20
> I tested the same minimal 7.1.8 backport of your ~16-value / 10 ms
> sticky-check logic again, this time with the detachable microphone boom
> physically attached.
>=20
> The external snd-usb-audio module was rebuilt and loaded successfully
> (the module taint was "O"), and the old 100 ms diagnostic changes were
> removed before this test.
>=20
> The result is still a failure:
>=20
>  =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>=20
> The PCM control exposes only:
>=20
>  =C2=A0 Capabilities: pswitch pswitch-joined
>=20
> and no Playback Volume control.
>=20
> I repeated this once more with another dongle replug, without changing
> the module or touching the volume wheel, and got the same result again.
>=20
> So:
>=20
>  =C2=A0 your sticky-check patch + Mic boom attached
>  =C2=A0 -> still classified as sticky
>  =C2=A0 -> reproduced twice
>=20

I didn't expect that, but I will take your result anyway. Your device
seems to have more mysterious behavior, sigh.

>=20
> 2. Is Playback SET_CUR really broken after Mic SET_RES with the boom=20
> detached?
>=20
> For this test I detached the microphone boom.
>=20
> I used a test version of snd-usb-audio which:
>=20
> - performed the Mic UAC1 resolution probe,
> - kept the Playback Volume control exposed,
> - clamped the known-broken advertised -64 dB minimum to -63 dB,
> - and bypassed the normal ALSA mixer cache so that mixer reads fetch
>  =C2=A0 GET_CUR from the device.
>=20
> The initial Playback value was:
>=20
>  =C2=A0 43 =3D -20 dB
>=20
> I played a 3-second 1 kHz test tone and listened to its level.
>=20
> Then I requested:
>=20
>  =C2=A0 23 =3D -40 dB
>=20
> The immediate output from the cset operation still showed:
>=20
>  =C2=A0 values=3D43
>=20
> I waited two seconds and issued a fresh cget. It then returned:
>=20
>  =C2=A0 values=3D23
>=20
> I played the exact same test tone again, and the second tone was clearly
> quieter.

Just curious: could you play the test tone throughout the entire process
and see how long does the device need to change its physical volume?

>=20
> So Playback SET_CUR is physically effective.

OK then. I will propose a patch to demote the sticky check to
informational warning. Before that, I need to reconfirm your test results
about MIXER_GET_CUR_BROKEN.

>=20
> At least in this test, the effect after Mic SET_RES with the boom
> detached is not that Playback SET_CUR stops working. Instead, GET_CUR
> can remain stale for some time after SET_CUR and later reflect the
> actual value.
>=20
> In short:
>=20
>  =C2=A0 before:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043 (-20 dB=
)
>  =C2=A0 SET_CUR requested:=C2=A0 23 (-40 dB)
>  =C2=A0 immediate result:=C2=A0 =C2=A043
>  =C2=A0 GET_CUR after 2 s:=C2=A0 23
>  =C2=A0 physical volume:=C2=A0 =C2=A0 clearly quieter
>=20
>=20
> 3. QUIRK_FLAG_MIXER_GET_CUR_BROKEN and mixer change notifications
>=20
> Linux 7.1.8 does not contain QUIRK_FLAG_MIXER_GET_CUR_BROKEN yet, so for
> this test I made a minimal backport of the flag behavior to the otherwise
> stock 7.1.8 mixer code,=C2=A0
>=20

What was "a minimal backport of the flag behavior"? Commit ad2c7d2c42af
("ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN") is already
minimal and must be backported as a whole.

> without your new sticky-check patch.
>=20
> I loaded snd-usb-audio with:
>=20
>  =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken
>=20
> The kernel detected the constant GET_CUR condition and kept the Playback
> Volume control exposed:
>=20
>  =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>  =C2=A0 PROXTESTC: treating constant GET_CUR as broken
>=20
> For this test the microphone boom was attached.
>=20
> Before turning the physical headset wheel:
>=20
>  =C2=A0 ALSA cget: 56
>  =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.72
>=20
> I then deliberately turned the physical volume wheel further down.
>=20
> Afterwards:
>=20
>  =C2=A0 ALSA cget: 47
>  =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.52
>=20
> KDE's volume OSD also reacted normally while I turned the wheel.
>=20
> So, on this device, using MIXER_GET_CUR_BROKEN did not break propagation
> of physical mixer changes through the audio stack:
>=20
>  =C2=A0 physical wheel
>  =C2=A0 -> ALSA value changed
>  =C2=A0 -> PipeWire value changed
>  =C2=A0 -> KDE OSD reacted normally

Did you properly backport QUIRK_FLAG_MIXER_GET_CUR_BROKEN? In particular,
did you backport the change in snd_usb_mixer_notify_id()?

If you backported the change properly, your test results imply that your
device doesn't depend on mixer interrupts at all -- does the volume wheel
emit HID events to ask software to tune the mixer value on its behalf?
Please try `evtest' to see if it emits multimedia key events.

Thanks,
Rong

>=20
>=20
> Therefore the current picture seems to be:
>=20
> - Your revised sticky check still rejects the Playback Volume control,
>  =C2=A0 both with the detachable Mic boom attached and detached.
>=20
> - With the Mic boom detached, Mic SET_RES can make Playback GET_CUR stay
>  =C2=A0 stale after a Playback SET_CUR, but Playback SET_CUR itself is st=
ill
>  =C2=A0 physically effective.
>=20
> - At least on this Logitech device, treating GET_CUR as broken did not
>  =C2=A0 prevent physical wheel changes from reaching ALSA/PipeWire/KDE.
>=20
> Let me know what you would like me to test next. I have kept the Fedora
> test environment and module-signing setup intact.
>=20
> Thanks,
> Alexander
>=20
> Am 19.08.2026 um 18:39 schrieb Rong Zhang:
> > Hi Alexander,
> >=20
> > On Tue, 2026-08-18 at 17:24 +0200, Alexander Niemeyer wrote:
> > > Hi Rong,
> > >=20
> > > one important follow-up to my previous message:
> > >=20
> > > I realized that the detachable microphone boom was not physically con=
nected
> > > to the headset during the direct libusb tests I reported earlier.
> > >=20
> > > I therefore repeated the relevant tests with the boom microphone atta=
ched,
> > > and the result changes in an important way.
> > >=20
> > > With the boom microphone attached, on a fresh device:
> > >=20
> > > Mic GET_RES =3D 256
> > > no SET_RES
> > >=20
> > > Playback:
> > >   =C2=A0 GET_CUR =3D -3840 (-15 dB)
> > >   =C2=A0 SET_CUR =3D -2048 (-8 dB)
> > >   =C2=A0 GET_CUR changes to -2048 after 65.3 ms
> > >=20
> > > Result: PASS
> > >=20
> > > After another power cycle, with the boom still attached:
> > >=20
> > > Mic GET_RES before =3D 256
> > > Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
> > > Mic GET_RES after=C2=A0 =3D 256
> > >=20
> > > Playback:
> > >   =C2=A0 GET_CUR =3D -3840 (-15 dB)
> > >   =C2=A0 SET_CUR =3D -2048 (-8 dB)
> > >   =C2=A0 GET_CUR changes to -2048 after 66.3 ms
> > >=20
> > > Result: PASS
> > >=20
> > > I also repeated the complete Mic SET_RES sequence:
> > >=20
> > > SET_RES 128
> > > SET_RES 64
> > > SET_RES 32
> > > SET_RES 16
> > > SET_RES 8
> > > SET_RES 4
> > > SET_RES 2
> > > SET_RES 1
> > >=20
> > > All requests return success, GET_RES remains 256, and Playback
> > > SET_CUR(-8 dB)
> > > still works afterwards, with GET_CUR changing after 76.0 ms.
> > >=20
> > > However, with the boom microphone attached, the stock Fedora 7.1.8
> > > snd-usb-audio driver still reproduces the original failure:
> > >=20
> > >   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
> > >=20
> > > and no PCM Playback Volume control is exposed.
> > Could you test my patch with Mic attached?
> >=20
> > > So I need to correct the conclusion from my previous message:
> > >=20
> > > The Mic SET_RES behavior is real, but it depends on whether the detac=
hable
> > > microphone boom is physically connected.
> > >=20
> > > With the boom disconnected:
> > >   =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequent P=
layback
> > >   =C2=A0 SET_CUR ineffective for more than 1200 ms.
> > >=20
> > > With the boom connected:
> > >   =C2=A0 both a single Mic SET_RES(128) and the full SET_RES sequence=
 leave
> > >   =C2=A0 Playback SET_CUR working normally.
> > >=20
> > Thanks for your tests.
> >=20
> > Let me conclude:
> >=20
> > - Mic detached: SET_RES on Mic breaks Playback
> > - Mic attached: SET_RES on Mic breaks nothing
> >=20
> > Still, I doubt if Playback SET_CUR is really broken in the first case.
> > There is a chance that Playback SET_CUR is effective while GET_CUR
> > becomes broken.
> >=20
> > Could you test:
> >=20
> > - Leave the Mic detached
> > - SET_RES on Mic
> > - GET_CUR on Playback
> > - Play some audio, listen to it
> > - SET_CUR on Playback
> > - GET_CUR on Playback
> > - Play some audio again, listen to it, and tell if the physical volume
> > has changed
> >=20
> > The procedure can be achieved by hacking into the snd-usb-audio driver
> > and nullifying its cache mechanism, so that you can fetch GET_CUR value=
s
> > from standard ALSA mixer interface.
> >=20
> > If you can notice physical volume changes, it implies SET_RES on Mic
> > break Playback GET_CUR without breaking SET_CUR. Otherwise, it break
> > Playback SET_CUR.
> >=20
> > If it only breaks GET_CUR,=C2=A0it implies the methodology of sticky ch=
eck is
> > problematic. In this case I would probably consider demoting the sticky
> > check's severity.
> >=20
> > I am also thinking about how we should demote the severity. Could you
> > also test if applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN (without this
> > patch) breaks mixer change notifications? I.e., tune the volume with th=
e
> > buttons/knobs on the device and see if the audio stack reflects the
> > change.=C2=A0I guess it will break the notifications, but I would still=
 like
> > to wait for your confirmation.
> >=20
> > Thanks,
> > Rong
> >=20
> > > Therefore Mic SET_RES alone does not explain the complete snd-usb-aud=
io
> > > failure in all device configurations. There must be another differenc=
e in
> > > the full snd-usb-audio initialization path when the boom is attached.
> > >=20
> > > The separate Playback -64 dB minimum issue I reported remains unchang=
ed:
> > > -64 dB is ineffective, -63 dB works, and attempting -64 dB does not p=
revent
> > > subsequent valid Playback SET_CUR requests from working.
> > >=20
> > > Sorry for not noticing the detachable-microphone state earlier. I wan=
ted to
> > > send this correction as soon as I confirmed it.
> > >=20
> > > I still have the usbmon/pcapng captures and can run further targeted =
tests
> > > if useful.
> > >=20
> > > Thanks,
> > > Alexander
> > >=20
> > > Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
> > > > Hi Rong,
> > > >=20
> > > > I think we found the reason for the different behavior.
> > > >=20
> > > > I reproduced the snd-usb-audio initialization sequence step by step
> > > > with direct libusb UAC1 control transfers and isolated the problem =
to
> > > > SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
> > > >=20
> > > > A fresh-device control test looks like this:
> > > >=20
> > > > Mic GET_RES =3D 256
> > > > no SET_RES
> > > > Playback:
> > > > GET_CUR =3D -3840 (-15 dB)
> > > > SET_CUR =3D -2048 (-8 dB)
> > > > GET_CUR changes to -2048 after 68.0 ms
> > > > Result: PASS
> > > >=20
> > > > After another power cycle, I repeated the same test but issued just
> > > > *one* SET_RES request to the Mic Feature Unit first:
> > > >=20
> > > > Mic GET_RES before =3D 256
> > > > Mic SET_RES(128) =3D success
> > > > Mic GET_RES after =3D 256
> > > > Playback:
> > > > GET_CUR =3D -3840 (-15 dB)
> > > > SET_CUR =3D -2048 (-8 dB)
> > > > GET_CUR remains -3840 for more than 1200 ms
> > > > Result: FAIL
> > > >=20
> > > > So a single successful |SET_RES(128)| on Feature Unit 3 is sufficie=
nt
> > > > to make subsequent |SET_CUR| requests to the Playback Volume contro=
l
> > > > on Feature Unit 2 ineffective.
> > > >=20
> > > > I also tested the complete Mic SET_RES sequence used by snd-usb-aud=
io:
> > > >=20
> > > > SET_RES 128
> > > > SET_RES 64
> > > > SET_RES 32
> > > > SET_RES 16
> > > > SET_RES 8
> > > > SET_RES 4
> > > > SET_RES 2
> > > > SET_RES 1
> > > >=20
> > > > All requests return success, while GET_RES remains 256. After that
> > > > sequence, Playback SET_CUR also remains ineffective for more than 1=
200
> > > > ms.
> > > >=20
> > > > Interestingly, the Mic control itself still works after this. In an
> > > > ALSA-like Mic probe I could successfully change Mic Volume from 0 d=
B
> > > > to -64 dB and then +1 dB, with GET_CUR reflecting those changes
> > > > essentially immediately (~0.3 ms). Playback remained broken afterwa=
rds.
> > > >=20
> > > > I also checked whether SET_RES on the Playback Feature Unit itself
> > > > causes the problem. It does not:
> > > >=20
> > > > Playback GET_RES =3D 256
> > > > SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
> > > > GET_RES still =3D 256
> > > > Playback SET_CUR(-8 dB)
> > > > GET_CUR changes successfully after 87.7 ms
> > > >=20
> > > > So the problematic operation appears specifically to be *SET_RES on
> > > > the Mic Feature Unit affecting the Playback Feature Unit*.
> > > >=20
> > > > I also clarified the separate advertised-minimum issue:
> > > >=20
> > > > Playback SET_CUR(-64 dB):
> > > > no change after >1200 ms
> > > > followed by SET_CUR(-8 dB):
> > > > works normally after 54.9 ms
> > > > Playback SET_CUR(-63 dB):
> > > > works after 75.8 ms
> > > > followed by SET_CUR(-8 dB):
> > > > works after 43.6 ms
> > > >=20
> > > > Therefore the broken -64 dB endpoint does not leave the device in t=
he
> > > > broken state; it is a separate issue. -63 dB works normally.
> > > >=20
> > > > I also captured usbmon/pcapng traces for both a working direct-libu=
sb
> > > > SET_CUR sequence and the failing snd-usb-audio initialization, so I
> > > > can send those as well if they are useful.
> > > >=20
> > > > This also seems to explain why the sticky-check changes did not hel=
p:
> > > > by the time snd-usb-audio reaches the Playback Volume sticky check,
> > > > the earlier Mic SET_RES sanity test has already put the device into
> > > > the state where Playback SET_CUR no longer takes effect.
> > > >=20
> > > > Let me know if you would like me to test a patch or capture any
> > > > additional traces.
> > > >=20
> > > > Thanks,
> > > > Alexander
> > > >=20
> > > >=20
> > > > Am 16.08.2026 um 17:08 schrieb Rong Zhang:
> > > > > Hi Alexander,
> > > > >=20
> > > > > On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
> > > > > > Hi Rong,
> > > > > >=20
> > > > > > Sure. The libusb tests were direct USB Audio Class 1 control tr=
ansfers
> > > > > > to the headset using libusb/PyUSB, not ALSA mixer operations.
> > > > > >=20
> > > > > > I accessed Feature Unit 2 on AudioControl interface 0, master
> > > > > > channel 0,
> > > > > > with the UAC1 Volume control selector:
> > > > > >=20
> > > > > > wValue =3D 0x0200 /* Volume control, master channel */
> > > > > > wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
> > > > > >=20
> > > > > > I used the standard class-specific requests directly, including
> > > > > > GET_CUR,
> > > > > > GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit littl=
e-endian
> > > > > > volume values in 1/256 dB units.
> > > > > >=20
> > > > > > The device reported:
> > > > > >=20
> > > > > > GET_CUR: 0 ( 0 dB in that test)
> > > > > > GET_MIN: -16384 (-64 dB)
> > > > > > GET_MAX: 0 ( 0 dB)
> > > > > > GET_RES: 256 ( 1 dB)
> > > > > >=20
> > > > > > For the timing tests I issued SET_CUR for a target value and th=
en
> > > > > > repeatedly queried GET_CUR until the value changed or the timeo=
ut
> > > > > > expired.
> > > > > >=20
> > > > > > Valid values became visible after roughly:
> > > > > >=20
> > > > > > -1 dB ~81 ms
> > > > > > -2 dB ~52 ms
> > > > > > -4 dB ~47 ms
> > > > > > -8 dB ~47 ms
> > > > > > -16 dB ~52 ms
> > > > > > -32 dB ~47 ms
> > > > > >=20
> > > > > > The advertised -64 dB minimum behaved differently: SET_CUR retu=
rned
> > > > > > successfully, but GET_CUR did not change even after 1000 ms.
> > > > > >=20
> > > > > > To access the AudioControl interface with libusb, I unbound the
> > > > > > AudioControl interface from snd-usb-audio for the duration of t=
he test.
> > > > > >=20
> > > > > > I did not intentionally open a playback stream during those lib=
usb
> > > > > > tests. Because the AudioControl interface had been unbound from
> > > > > > snd-usb-audio, I also do not believe there was an active ALSA p=
layback
> > > > > > stream at that point.
> > > > > Thanks for the information.
> > > > >=20
> > > > > Unfortunately, I still don't exactly see why the device behaved
> > > > > differently when GET_CUR/SET_CUR requests were sent from snd-usb-=
audio
> > > > > compared to your libusb tests.
> > > > >=20
> > > > > snd-usb-audio also tries SET_RES to test the sanity of GET_RES. C=
ould
> > > > > you
> > > > > test if it breaks your device's GET_CUR?
> > > > >=20
> > > > > Maybe comparing them with usbmon can show some clues. You can use
> > > > > Wireshark to sniff /dev/usbmon*.
> > > > >=20
> > > > > Hint: a Thunderbolt port usually corresponds to a dedicated USB r=
oot
> > > > > hub.
> > > > > If you have one, plug the device to it to get pure usbmon trace r=
esults
> > > > > with no noisy URBs from other devices.
> > > > >=20
> > > > > Thanks,
> > > > > Rong
> > > > >=20
> > > > > > If the open-stream state is important, I can repeat the experim=
ent
> > > > > > specifically controlling for playback-stream-open versus
> > > > > > playback-stream-closed.
> > > > > >=20
> > > > > > Thanks,
> > > > > > Alexander
> > > > > >=20
> > > > > > Am 16.08.2026 um 15:50 schrieb Rong Zhang:
> > > > > > > Hi Alexander,
> > > > > > >=20
> > > > > > > On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
> > > > > > > > Hi Rong,
> > > > > > > >=20
> > > > > > > > I tested the sticky-check part of your patch on the Logitec=
h PRO X
> > > > > > > > Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x8=
6_64.
> > > > > > > >=20
> > > > > > > > Since your patch is based on a newer tree, I used a minimal
> > > > > > > > backport of
> > > > > > > > the new ~16-value / 10 ms sticky-check logic to the 7.1.8 c=
ode. The
> > > > > > > > GET_CUR-broken handling from the newer tree was not include=
d; GET_CUR
> > > > > > > > itself succeeds on this device.
> > > > > > > >=20
> > > > > > > > Unfortunately, the playback control is still classified as =
sticky:
> > > > > > > >=20
> > > > > > > > 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabli=
ng
> > > > > > > >=20
> > > > > > > > I then instrumented the check and tried an additional diagn=
ostic:
> > > > > > > > after
> > > > > > > > every successful SET_CUR, wait 100 ms and perform another G=
ET_CUR
> > > > > > > > before
> > > > > > > > issuing the next SET_CUR.
> > > > > > > >=20
> > > > > > > > For the playback volume, the saved value was -3840 and GET_=
CUR
> > > > > > > > remained
> > > > > > > > at -3840 for every tested value, even after 100 ms, for exa=
mple:
> > > > > > > >=20
> > > > > > > > test=3D-15104 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > test=3D-13824 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > test=3D-3584 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > test=3D-2304 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > test=3D-1024 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > test=3D0 immediate=3D-3840 after100ms=3D-3840
> > > > > > > >=20
> > > > > > > > So in this case the issue does not appear to be simply that=
 the
> > > > > > > > accumulated 10 ms sleeps are too short. During the probe-ti=
me sticky
> > > > > > > > check, SET_CUR succeeds but GET_CUR for the playback contro=
l remains
> > > > > > > > unchanged even when each SET_CUR is given 100 ms before the=
 next one.
> > > > > > > >=20
> > > > > > > > This differs from my previous direct libusb tests with the
> > > > > > > > AudioControl
> > > > > > > > interface unbound, where valid SET_CUR values became visibl=
e through
> > > > > > > > GET_CUR after roughly 47=E2=80=9381 ms.
> > > > > > > Really interesting. Maybe the mixer changes its value only wh=
en
> > > > > > > there is
> > > > > > > an opened playback stream.
> > > > > > >=20
> > > > > > > Could you clarify your "libusb tests"?
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Rong
> > > > > > >=20
> > > > > > > > The first debug line I saw with |saved=3D0| was from the Mi=
c Capture
> > > > > > > > Volume control; that control changed immediately and return=
ed as
> > > > > > > > non-sticky. The sequence above with |saved=3D-3840| is the
> > > > > > > > problematic PCM
> > > > > > > > Playback Volume control.
> > > > > > > >=20
> > > > > > > > I'd be happy to test another version or run additional diag=
nostics if
> > > > > > > > useful.
> > > > > > > >=20
> > > > > > > > Best regards,
> > > > > > > > Alexander
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> > > > > > > > > Some mixers are asynchronous, and some have broken min/ma=
x. They are
> > > > > > > > > mistakenly considered sticky due to how the check is impl=
emented.
> > > > > > > > >=20
> > > > > > > > > Check sticky mixers more precisely by checking approximat=
ely 16
> > > > > > > > > values
> > > > > > > > > and adding a msleep(10) between each check, so that async=
hronous
> > > > > > > > > mixers
> > > > > > > > > have enough time to change the value and mixers with brok=
en
> > > > > > > > > min/max are
> > > > > > > > > checked properly. Additionally, mark GET_CUR as broken wh=
en
> > > > > > > > > get_cur_mix_raw() fails, instead of returning successfull=
y.
> > > > > > > > >=20
> > > > > > > > > Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
> > > > > > > > > Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-=
9c5d12636f4b@gmx.de
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Rong Zhang<i@rong.moe>
> > > > > > > > > ---
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51
> > > > > > > > > ++++++++++++++++++++++++++++++++++++++++++++-------
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+), 7 d=
eletions(-)
> > > > > > > > >=20
> > > > > > > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > > > > > > index 703c118f9d4e..3d0f97730a06 100644
> > > > > > > > > --- a/sound/usb/mixer.c
> > > > > > > > > +++ b/sound/usb/mixer.c
> > > > > > > > > @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(stru=
ct
> > > > > > > > > usb_mixer_elem_info *cval, int ch, int idx)
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_contro=
l(struct
> > > > > > > > > usb_mixer_elem_info *cval,
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel, int saved)
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 {
> > > > > > > > > -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cval->=
min, cval->max };
> > > > > > > > > -=C2=A0=C2=A0=C2=A0 int test, check, i;
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 int test, check, res;
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 values=
 (15 intervals).
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not fine=
 enough, check fewer values.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - cval=
->min, 15);
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->res)=
 : cval->res;
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min) is=
 not a multiple of
> > > > > > > > > cval->res, we still
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max anyway=
.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < cval-=
>max + res; test +=3D res) {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test > cv=
al->max)
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 test =3D cval->max;
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i <=
 ARRAY_SIZE(sticky_test_values); i++) {
> > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D stic=
ky_test_values[i];
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (test =3D=3D saved)
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
> > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_s=
et_cur_mix_value(cval, channel, 0, test) ||
> > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 get_cur_mix_raw(cval, channel, &check) ||
> > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 check !=3D saved) /* SET_CUR effective, non-sticky. */
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_s=
et_cur_mix_value(cval, channel, 0, test))
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return 0;
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_cur_m=
ix_raw(cval, channel, &check))
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto get_cur_broken;
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check !=
=3D saved) /* SET_CUR effective, non-sticky. */
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Leave=
 some time for asynchronous mixers to change the
> > > > > > > > > value.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note =
that there is no need to wait between SET_CUR and
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * GET_C=
UR, as we don't care whether the GET_CUR value
> > > > > > > > > matches
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the S=
ET_CUR one. IOW, what we expect is just a
> > > > > > > > > GET_CUR value
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * diffe=
ring from the saved one.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Mixer=
s of most devices are synchronous. The should have
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * retur=
ned early without extra sleep. Asynchronous
> > > > > > > > > mixers will
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * retur=
n once the accumulated time is enough for them
> > > > > > > > > to change
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the v=
alue.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10);
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > > >  =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check again af=
ter the last msleep(). */
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel, &c=
heck))
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_cur_=
broken;
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > > > +
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval->hea=
d.mixer->chip->quirk_flags &
> > > > > > > > > QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
> > > > > > > > > +get_cur_broken:
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 usb_audio_info(cval->head.mixer->chip,
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D>
> > > > > > > > > %d)\n",
> > > > > > > > >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cval->head.id,
> > > > > > > > > mixer_ctrl_intf(cval->head.mixer),
> > > > > > > > >=20
> > > > > > > > > ---
> > > > > > > > > base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> > > > > > > > > change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
> > > > > > > > >=20
> > > > > > > > > Thanks,
> > > > > > > > > Rong
> > > > > > > > >=20
