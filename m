Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B651C485517;
	Wed, 19 Aug 2026 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157918; cv=pass; b=HVUKAG8FpaF4AirOXbUiVzT86r27T3cMhJVwteJjBGkGQ78md9VV92bPKSmzL8ji4WQy2MtTJ0PtE3Xm7SQ1pmnMKKbe30JxZm7CitpAWaFV+qr1MbUMyrCYvnDXixdxGK0N7UZq/ho2RUqcP1xwSKd3Szav9SGN4f89MewD+ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157918; c=relaxed/simple;
	bh=7rUSNkaKueEE9Z38Plqg7WCFwPjSTQUBOv1Z/VkDuzA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V3m/lGWnMbVHq/3MHRR0u9FErXpayQmE8x7rv2rfTH/TR297ItLzzuBgspcBMOFFHL7X3Y1fMkVjZPRgCcGlnOBPT2dd3cjfSliJwp3mZQaxMlNzi90aWlvU6/OPgzANzaZY1esTvfaDTWbk14R4ndPh4LEtimVAxz2XISLJlN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=JicwewDN; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="JicwewDN"
ARC-Seal: i=1; a=rsa-sha256; t=1787157892; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gUSgJgf2JpKcRQNt6vd5S0xBDTFn9H1mwvcJ1qMzr1EfjHxmS7OZsqoP/tIA4UkFASB1JyajlHtf9kyRfk98BeO5KT6v2Y49xJ+ywst5k+f14bl9lqxMw2uvTL2LGj1TYJ8mY3HdWr2A0a2Hvwd4nTTFb0sFZ0ilhS4aqVsFCAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787157892; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/8mEiZOryqTOQYMnvUey6P9/PLa0TRXprKQ+gWXX4uQ=; 
	b=YbLQp50NlPF+HWu+qtyhzOd4QSyDPf36dmy7ZniOlyL2xPKmriFGOyJ4FBxQ5nFqg37AufgnYUvhxwtpTLZPEeVat0cY5O1/3c+vyuY9VGIfIoRji/K8Xn0SICrDr35gpUPvwbrv/2NTwzSTMZy6BBdNQhLQkb8rAeWQIeey0hQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787157891;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=/8mEiZOryqTOQYMnvUey6P9/PLa0TRXprKQ+gWXX4uQ=;
	b=JicwewDNcYuyOL2KI/M5QMmIk96E/pM2JiZnbESpg7r7jYZC3L/TkJ9uAQCuO/oI
	AMb9PX9vrNuobzqd0WGf08JVy+1hMAZ4vk/SLQMV4MA4ueJOHrhUYjKLp8xWsQKNuPW
	xf3bctuxL7Wt6afRhdNYj/fRlxFdR4E41wPFL9iJ1dhD1coC0aMVMHNMT6rzzhURpqS
	clAuV4VQUZXH34TukgXicIaJLPDbk+N148Jkso3Kbob9iPlx8HaI5/gI0jWo6eMlgz7
	UnHyojpQ+0majZVOBLsi69QIeBE2pTdf+4D0pa6PIj2nMARn5xj++28bjSAfKb6X1qx
	58/zIV24RA==
Received: by mx.zohomail.com with SMTPS id 1787157889976450.0379774741722;
	Wed, 19 Aug 2026 09:44:49 -0700 (PDT)
Message-ID: <72776889dc0368b955e569d7a4ae7fca6ca82729.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
		 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
		 <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
		 <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
		 <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
		 <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
		 <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 00:39:30 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

On Tue, 2026-08-18 at 17:24 +0200, Alexander Niemeyer wrote:
> Hi Rong,
>=20
> one important follow-up to my previous message:
>=20
> I realized that the detachable microphone boom was not physically connect=
ed
> to the headset during the direct libusb tests I reported earlier.
>=20
> I therefore repeated the relevant tests with the boom microphone attached=
,
> and the result changes in an important way.
>=20
> With the boom microphone attached, on a fresh device:
>=20
> Mic GET_RES =3D 256
> no SET_RES
>=20
> Playback:
>  =C2=A0 GET_CUR =3D -3840 (-15 dB)
>  =C2=A0 SET_CUR =3D -2048 (-8 dB)
>  =C2=A0 GET_CUR changes to -2048 after 65.3 ms
>=20
> Result: PASS
>=20
> After another power cycle, with the boom still attached:
>=20
> Mic GET_RES before =3D 256
> Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
> Mic GET_RES after=C2=A0 =3D 256
>=20
> Playback:
>  =C2=A0 GET_CUR =3D -3840 (-15 dB)
>  =C2=A0 SET_CUR =3D -2048 (-8 dB)
>  =C2=A0 GET_CUR changes to -2048 after 66.3 ms
>=20
> Result: PASS
>=20
> I also repeated the complete Mic SET_RES sequence:
>=20
> SET_RES 128
> SET_RES 64
> SET_RES 32
> SET_RES 16
> SET_RES 8
> SET_RES 4
> SET_RES 2
> SET_RES 1
>=20
> All requests return success, GET_RES remains 256, and Playback=20
> SET_CUR(-8 dB)
> still works afterwards, with GET_CUR changing after 76.0 ms.
>=20
> However, with the boom microphone attached, the stock Fedora 7.1.8
> snd-usb-audio driver still reproduces the original failure:
>=20
>  =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>=20
> and no PCM Playback Volume control is exposed.

Could you test my patch with Mic attached?

>=20
> So I need to correct the conclusion from my previous message:
>=20
> The Mic SET_RES behavior is real, but it depends on whether the detachabl=
e
> microphone boom is physically connected.
>=20
> With the boom disconnected:
>  =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequent Playba=
ck
>  =C2=A0 SET_CUR ineffective for more than 1200 ms.
>=20
> With the boom connected:
>  =C2=A0 both a single Mic SET_RES(128) and the full SET_RES sequence leav=
e
>  =C2=A0 Playback SET_CUR working normally.
>=20

Thanks for your tests.

Let me conclude:

- Mic detached: SET_RES on Mic breaks Playback
- Mic attached: SET_RES on Mic breaks nothing

Still, I doubt if Playback SET_CUR is really broken in the first case.
There is a chance that Playback SET_CUR is effective while GET_CUR
becomes broken.

Could you test:

- Leave the Mic detached
- SET_RES on Mic
- GET_CUR on Playback
- Play some audio, listen to it
- SET_CUR on Playback
- GET_CUR on Playback
- Play some audio again, listen to it, and tell if the physical volume
has changed

The procedure can be achieved by hacking into the snd-usb-audio driver
and nullifying its cache mechanism, so that you can fetch GET_CUR values
from standard ALSA mixer interface.

If you can notice physical volume changes, it implies SET_RES on Mic
break Playback GET_CUR without breaking SET_CUR. Otherwise, it break
Playback SET_CUR.

If it only breaks GET_CUR,=C2=A0it implies the methodology of sticky check =
is
problematic. In this case I would probably consider demoting the sticky
check's severity.

I am also thinking about how we should demote the severity. Could you
also test if applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN (without this
patch) breaks mixer change notifications? I.e., tune the volume with the
buttons/knobs on the device and see if the audio stack reflects the
change.=C2=A0I guess it will break the notifications, but I would still lik=
e
to wait for your confirmation.=20

Thanks,
Rong

> Therefore Mic SET_RES alone does not explain the complete snd-usb-audio
> failure in all device configurations. There must be another difference in
> the full snd-usb-audio initialization path when the boom is attached.
>=20
> The separate Playback -64 dB minimum issue I reported remains unchanged:
> -64 dB is ineffective, -63 dB works, and attempting -64 dB does not preve=
nt
> subsequent valid Playback SET_CUR requests from working.
>=20
> Sorry for not noticing the detachable-microphone state earlier. I wanted =
to
> send this correction as soon as I confirmed it.
>=20
> I still have the usbmon/pcapng captures and can run further targeted test=
s
> if useful.
>=20
> Thanks,
> Alexander
>=20
> Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
> > Hi Rong,
> >=20
> > I think we found the reason for the different behavior.
> >=20
> > I reproduced the snd-usb-audio initialization sequence step by step=20
> > with direct libusb UAC1 control transfers and isolated the problem to=
=20
> > SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
> >=20
> > A fresh-device control test looks like this:
> >=20
> > Mic GET_RES =3D 256
> > no SET_RES
> > Playback:
> > GET_CUR =3D -3840 (-15 dB)
> > SET_CUR =3D -2048 (-8 dB)
> > GET_CUR changes to -2048 after 68.0 ms
> > Result: PASS
> >=20
> > After another power cycle, I repeated the same test but issued just=20
> > *one* SET_RES request to the Mic Feature Unit first:
> >=20
> > Mic GET_RES before =3D 256
> > Mic SET_RES(128) =3D success
> > Mic GET_RES after =3D 256
> > Playback:
> > GET_CUR =3D -3840 (-15 dB)
> > SET_CUR =3D -2048 (-8 dB)
> > GET_CUR remains -3840 for more than 1200 ms
> > Result: FAIL
> >=20
> > So a single successful |SET_RES(128)| on Feature Unit 3 is sufficient=
=20
> > to make subsequent |SET_CUR| requests to the Playback Volume control=
=20
> > on Feature Unit 2 ineffective.
> >=20
> > I also tested the complete Mic SET_RES sequence used by snd-usb-audio:
> >=20
> > SET_RES 128
> > SET_RES 64
> > SET_RES 32
> > SET_RES 16
> > SET_RES 8
> > SET_RES 4
> > SET_RES 2
> > SET_RES 1
> >=20
> > All requests return success, while GET_RES remains 256. After that=20
> > sequence, Playback SET_CUR also remains ineffective for more than 1200=
=20
> > ms.
> >=20
> > Interestingly, the Mic control itself still works after this. In an=20
> > ALSA-like Mic probe I could successfully change Mic Volume from 0 dB=
=20
> > to -64 dB and then +1 dB, with GET_CUR reflecting those changes=20
> > essentially immediately (~0.3 ms). Playback remained broken afterwards.
> >=20
> > I also checked whether SET_RES on the Playback Feature Unit itself=20
> > causes the problem. It does not:
> >=20
> > Playback GET_RES =3D 256
> > SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
> > GET_RES still =3D 256
> > Playback SET_CUR(-8 dB)
> > GET_CUR changes successfully after 87.7 ms
> >=20
> > So the problematic operation appears specifically to be *SET_RES on=20
> > the Mic Feature Unit affecting the Playback Feature Unit*.
> >=20
> > I also clarified the separate advertised-minimum issue:
> >=20
> > Playback SET_CUR(-64 dB):
> > no change after >1200 ms
> > followed by SET_CUR(-8 dB):
> > works normally after 54.9 ms
> > Playback SET_CUR(-63 dB):
> > works after 75.8 ms
> > followed by SET_CUR(-8 dB):
> > works after 43.6 ms
> >=20
> > Therefore the broken -64 dB endpoint does not leave the device in the=
=20
> > broken state; it is a separate issue. -63 dB works normally.
> >=20
> > I also captured usbmon/pcapng traces for both a working direct-libusb=
=20
> > SET_CUR sequence and the failing snd-usb-audio initialization, so I=20
> > can send those as well if they are useful.
> >=20
> > This also seems to explain why the sticky-check changes did not help:=
=20
> > by the time snd-usb-audio reaches the Playback Volume sticky check,=20
> > the earlier Mic SET_RES sanity test has already put the device into=20
> > the state where Playback SET_CUR no longer takes effect.
> >=20
> > Let me know if you would like me to test a patch or capture any=20
> > additional traces.
> >=20
> > Thanks,
> > Alexander
> >=20
> >=20
> > Am 16.08.2026 um 17:08 schrieb Rong Zhang:
> > > Hi Alexander,
> > >=20
> > > On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
> > > > Hi Rong,
> > > >=20
> > > > Sure. The libusb tests were direct USB Audio Class 1 control transf=
ers
> > > > to the headset using libusb/PyUSB, not ALSA mixer operations.
> > > >=20
> > > > I accessed Feature Unit 2 on AudioControl interface 0, master=20
> > > > channel 0,
> > > > with the UAC1 Volume control selector:
> > > >=20
> > > > wValue =3D 0x0200 /* Volume control, master channel */
> > > > wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
> > > >=20
> > > > I used the standard class-specific requests directly, including=20
> > > > GET_CUR,
> > > > GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-en=
dian
> > > > volume values in 1/256 dB units.
> > > >=20
> > > > The device reported:
> > > >=20
> > > > GET_CUR: 0 ( 0 dB in that test)
> > > > GET_MIN: -16384 (-64 dB)
> > > > GET_MAX: 0 ( 0 dB)
> > > > GET_RES: 256 ( 1 dB)
> > > >=20
> > > > For the timing tests I issued SET_CUR for a target value and then
> > > > repeatedly queried GET_CUR until the value changed or the timeout=
=20
> > > > expired.
> > > >=20
> > > > Valid values became visible after roughly:
> > > >=20
> > > > -1 dB ~81 ms
> > > > -2 dB ~52 ms
> > > > -4 dB ~47 ms
> > > > -8 dB ~47 ms
> > > > -16 dB ~52 ms
> > > > -32 dB ~47 ms
> > > >=20
> > > > The advertised -64 dB minimum behaved differently: SET_CUR returned
> > > > successfully, but GET_CUR did not change even after 1000 ms.
> > > >=20
> > > > To access the AudioControl interface with libusb, I unbound the
> > > > AudioControl interface from snd-usb-audio for the duration of the t=
est.
> > > >=20
> > > > I did not intentionally open a playback stream during those libusb
> > > > tests. Because the AudioControl interface had been unbound from
> > > > snd-usb-audio, I also do not believe there was an active ALSA playb=
ack
> > > > stream at that point.
> > > Thanks for the information.
> > >=20
> > > Unfortunately, I still don't exactly see why the device behaved
> > > differently when GET_CUR/SET_CUR requests were sent from snd-usb-audi=
o
> > > compared to your libusb tests.
> > >=20
> > > snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Could=
=20
> > > you
> > > test if it breaks your device's GET_CUR?
> > >=20
> > > Maybe comparing them with usbmon can show some clues. You can use
> > > Wireshark to sniff /dev/usbmon*.
> > >=20
> > > Hint: a Thunderbolt port usually corresponds to a dedicated USB root=
=20
> > > hub.
> > > If you have one, plug the device to it to get pure usbmon trace resul=
ts
> > > with no noisy URBs from other devices.
> > >=20
> > > Thanks,
> > > Rong
> > >=20
> > > > If the open-stream state is important, I can repeat the experiment
> > > > specifically controlling for playback-stream-open versus
> > > > playback-stream-closed.
> > > >=20
> > > > Thanks,
> > > > Alexander
> > > >=20
> > > > Am 16.08.2026 um 15:50 schrieb Rong Zhang:
> > > > > Hi Alexander,
> > > > >=20
> > > > > On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
> > > > > > Hi Rong,
> > > > > >=20
> > > > > > I tested the sticky-check part of your patch on the Logitech PR=
O X
> > > > > > Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64=
.
> > > > > >=20
> > > > > > Since your patch is based on a newer tree, I used a minimal=20
> > > > > > backport of
> > > > > > the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code.=
 The
> > > > > > GET_CUR-broken handling from the newer tree was not included; G=
ET_CUR
> > > > > > itself succeeds on this device.
> > > > > >=20
> > > > > > Unfortunately, the playback control is still classified as stic=
ky:
> > > > > >=20
> > > > > > 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
> > > > > >=20
> > > > > > I then instrumented the check and tried an additional diagnosti=
c:=20
> > > > > > after
> > > > > > every successful SET_CUR, wait 100 ms and perform another GET_C=
UR=20
> > > > > > before
> > > > > > issuing the next SET_CUR.
> > > > > >=20
> > > > > > For the playback volume, the saved value was -3840 and GET_CUR=
=20
> > > > > > remained
> > > > > > at -3840 for every tested value, even after 100 ms, for example=
:
> > > > > >=20
> > > > > > test=3D-15104 immediate=3D-3840 after100ms=3D-3840
> > > > > > test=3D-13824 immediate=3D-3840 after100ms=3D-3840
> > > > > > test=3D-3584 immediate=3D-3840 after100ms=3D-3840
> > > > > > test=3D-2304 immediate=3D-3840 after100ms=3D-3840
> > > > > > test=3D-1024 immediate=3D-3840 after100ms=3D-3840
> > > > > > test=3D0 immediate=3D-3840 after100ms=3D-3840
> > > > > >=20
> > > > > > So in this case the issue does not appear to be simply that the
> > > > > > accumulated 10 ms sleeps are too short. During the probe-time s=
ticky
> > > > > > check, SET_CUR succeeds but GET_CUR for the playback control re=
mains
> > > > > > unchanged even when each SET_CUR is given 100 ms before the nex=
t one.
> > > > > >=20
> > > > > > This differs from my previous direct libusb tests with the=20
> > > > > > AudioControl
> > > > > > interface unbound, where valid SET_CUR values became visible th=
rough
> > > > > > GET_CUR after roughly 47=E2=80=9381 ms.
> > > > > Really interesting. Maybe the mixer changes its value only when=
=20
> > > > > there is
> > > > > an opened playback stream.
> > > > >=20
> > > > > Could you clarify your "libusb tests"?
> > > > >=20
> > > > > Thanks,
> > > > > Rong
> > > > >=20
> > > > > > The first debug line I saw with |saved=3D0| was from the Mic Ca=
pture
> > > > > > Volume control; that control changed immediately and returned a=
s
> > > > > > non-sticky. The sequence above with |saved=3D-3840| is the=20
> > > > > > problematic PCM
> > > > > > Playback Volume control.
> > > > > >=20
> > > > > > I'd be happy to test another version or run additional diagnost=
ics if
> > > > > > useful.
> > > > > >=20
> > > > > > Best regards,
> > > > > > Alexander
> > > > > >=20
> > > > > >=20
> > > > > > Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> > > > > > > Some mixers are asynchronous, and some have broken min/max. T=
hey are
> > > > > > > mistakenly considered sticky due to how the check is implemen=
ted.
> > > > > > >=20
> > > > > > > Check sticky mixers more precisely by checking approximately =
16=20
> > > > > > > values
> > > > > > > and adding a msleep(10) between each check, so that asynchron=
ous=20
> > > > > > > mixers
> > > > > > > have enough time to change the value and mixers with broken=
=20
> > > > > > > min/max are
> > > > > > > checked properly. Additionally, mark GET_CUR as broken when
> > > > > > > get_cur_mix_raw() fails, instead of returning successfully.
> > > > > > >=20
> > > > > > > Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
> > > > > > > Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d=
12636f4b@gmx.de=20
> > > > > > >=20
> > > > > > > Signed-off-by: Rong Zhang<i@rong.moe>
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51=20
> > > > > > > ++++++++++++++++++++++++++++++++++++++++++++-------
> > > > > > > =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+), 7 deleti=
ons(-)
> > > > > > >=20
> > > > > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > > > > index 703c118f9d4e..3d0f97730a06 100644
> > > > > > > --- a/sound/usb/mixer.c
> > > > > > > +++ b/sound/usb/mixer.c
> > > > > > > @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct=
=20
> > > > > > > usb_mixer_elem_info *cval, int ch, int idx)
> > > > > > > =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_control(str=
uct=20
> > > > > > > usb_mixer_elem_info *cval,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int channel, int saved)
> > > > > > > =C2=A0=C2=A0=C2=A0 {
> > > > > > > -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cval->min,=
 cval->max };
> > > > > > > -=C2=A0=C2=A0=C2=A0 int test, check, i;
> > > > > > > +=C2=A0=C2=A0=C2=A0 int test, check, res;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 values (15=
 intervals).
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not fine eno=
ugh, check fewer values.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - cval->mi=
n, 15);
> > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->res) : c=
val->res;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min) is not=
 a multiple of=20
> > > > > > > cval->res, we still
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max anyway.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < cval->max=
 + res; test +=3D res) {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test > cval->=
max)
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 test =3D cval->max;
> > > > > > > =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRA=
Y_SIZE(sticky_test_values); i++) {
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D sticky_t=
est_values[i];
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (test =3D=3D saved)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > > > > > > =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_c=
ur_mix_value(cval, channel, 0, test) ||
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_cur_mix_raw(cval, channel, &check) ||
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 check !=3D saved) /* SET_CUR effective, non-sticky. */
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_c=
ur_mix_value(cval, channel, 0, test))
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return 0;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_cur_mix_r=
aw(cval, channel, &check))
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto get_cur_broken;
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check !=3D sa=
ved) /* SET_CUR effective, non-sticky. */
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > +
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Leave som=
e time for asynchronous mixers to change the=20
> > > > > > > value.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that=
 there is no need to wait between SET_CUR and
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * GET_CUR, =
as we don't care whether the GET_CUR value=20
> > > > > > > matches
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the SET_C=
UR one. IOW, what we expect is just a=20
> > > > > > > GET_CUR value
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * differing=
 from the saved one.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Mixers of=
 most devices are synchronous. The should have
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * returned =
early without extra sleep. Asynchronous=20
> > > > > > > mixers will
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return on=
ce the accumulated time is enough for them=20
> > > > > > > to change
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the value=
.
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check again after t=
he last msleep(). */
> > > > > > > +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel, &check=
))
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_cur_brok=
en;
> > > > > > > +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > +
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval->head.mix=
er->chip->quirk_flags &=20
> > > > > > > QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
> > > > > > > +get_cur_broken:
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 usb_audio_info(cval->head.mixer->chip,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%=
d:%d: broken mixer GET_CUR (%d/%d/%d =3D>=20
> > > > > > > %d)\n",
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cv=
al->head.id,=20
> > > > > > > mixer_ctrl_intf(cval->head.mixer),
> > > > > > >=20
> > > > > > > ---
> > > > > > > base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> > > > > > > change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Rong
> > > > > > >=20
