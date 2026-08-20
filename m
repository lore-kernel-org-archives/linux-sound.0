Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372871E9919;
	Thu, 20 Aug 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243731; cv=pass; b=iz9iS2Z//okHzs80JJdpYLVgxekOIRNl04Iigi0yQVOWZeRrHlpM3PzGihfD6d8dUl22Y4M0AJzcHbkx3q8vci1LWY4xUHvVAMo9F4Mw9j+XoxOuaRmfqbOzLIznah1F843fMdn4C5zuD8Ho113cjCh6Z6pIBndi3F1qqc5Vs3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243731; c=relaxed/simple;
	bh=2ligZybL1PaCjNcS7IArmYaMLQcrjtXtxERD4XX9GV4=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hfO6KieCCJACq7VTKPmPgykCkcrxRkNXM6x87RY8/P31KGT7GAnl7R+Mm23fchA2KSqNr1nwylmRlVwrvgxm7La7/IVsP5v+VWdjuvMHNr2jQtaNa2g0oH/xDY43bDaZXeIol4XgrfgIL36w9R+Lm1LFQd1se50q9du7vEtX4to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=N7SZwZUO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="N7SZwZUO"
ARC-Seal: i=1; a=rsa-sha256; t=1787243705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LGi3naojStdGXfkvpTXVVFk/HaqROtWgU7a1fQKjj84v+/oDj4OV2yicsAnu9SVvkxYxcmFJ8VOKAOHqkvyKj9hBKQSkDKJv+AGmNV2p9cNBGhT8+OwbVW54ZHpn8E9aW2J6EwAMvmO9eioDBpZeWyJfuHpFj0tnkpv4Z9ApRBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787243705; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N9fcSWCCohDdB9FZUGxPnN/Xs3QzojFvk0sH+98mYY8=; 
	b=Q7AYgdL3pzlBdP2TB36p54iBEBXcN1GfqItYR1hOEpxGyID21jQMENH7C8ITZD9HzbcX3msVJ2myOCB/gyf8qku7XOXuXyj5HbGHnXzrRYKIUw+L6EzNT16+gpuw1Xct33qIAN8vNAR3DIjVUe6hqkfZ3ixqsCtCaIcMa/nvHBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787243705;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=N9fcSWCCohDdB9FZUGxPnN/Xs3QzojFvk0sH+98mYY8=;
	b=N7SZwZUOFyagCXREcpcal2molcTds6B3B+fyEJ1AEqqQ0bwR97Yw+x9i0smTCcM6
	uy1JGvz+lu7JsqLmvx6z0i02nw2HXXIODI7/FZaKoUAROWPIUFcgOXM5kcUBTu104pd
	P8rElBIaCE0RIZGKeZsskegmubK3ib79JrXs2GS2LOfReNxQsB+1Y79r7VW2n2VnfG5
	N+WodMU7d5OJDRXDK0+q/B7zlsqDCxwMEFBFL7x5JtONTxXkAsrZw6QWVigoLGAq6kQ
	zd40tf0OIhwitKwzuXE5YYAgEnH7Ud12hw9jFkgqKO35rTUGHuvl59mNafMpvKiZ08K
	OtzTnFXHWA==
Received: by mx.zohomail.com with SMTPS id 17872437032981016.1972898525356;
	Thu, 20 Aug 2026 09:35:03 -0700 (PDT)
Message-ID: <eb9780b4e8e93af4609c7f8b46b33f18a024806f.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <3d635888-4004-436f-b488-a683225642d6@gmx.de>
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
	 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
	 <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
	 <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
	 <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
	 <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
	 <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
	 <72776889dc0368b955e569d7a4ae7fca6ca82729.camel@rong.moe>
	 <9dc9681c-a491-46bb-a64c-eccce0150398@gmx.de>
	 <f60339edc65efc277986ec01b1134ae8d4c4cd81.camel@rong.moe>
	 <3d635888-4004-436f-b488-a683225642d6@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 00:29:47 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

Thanks for your testing so far.

On Thu, 2026-08-20 at 17:01 +0200, Alexander Niemeyer wrote:
> Hi Rong,
>=20
> thanks. I repeated the MIXER_GET_CUR_BROKEN test with the complete
> upstream commit and also performed the two additional tests you asked
> for.
>=20
> First, a correction regarding my previous test:
>=20
> My earlier "minimal backport" of QUIRK_FLAG_MIXER_GET_CUR_BROKEN was
> incomplete. In particular, it did not include the get_cur_broken checks
> around cache invalidation in snd_usb_mixer_notify_id() and
> snd_usb_mixer_interrupt_v2().
>=20
> I have therefore discarded that result and repeated the test properly.
>=20
>=20
> 1. MIXER_GET_CUR_BROKEN with the complete upstream commit
>=20
> I started from a clean Linux 7.1.8 source tree and applied the complete
> upstream commit:
>=20
>  =C2=A0 ad2c7d2c42af943a3e711bdc1e4fd55b76fcbe55
>  =C2=A0 ("ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN")
>=20
> Before applying it, I verified that the relevant 7.1.8 source files were
> byte-identical to freshly extracted copies from the Linux 7.1.8 tarball.
>=20
> The complete patch then applied with fuzz=3D0. There were only line-numbe=
r
> offsets due to the older source tree.
>=20
> I also explicitly verified that the resulting source contained the
> get_cur_broken handling in both:
>=20
>  =C2=A0 snd_usb_mixer_notify_id()
>=20
> and:
>=20
>  =C2=A0 snd_usb_mixer_interrupt_v2()
>=20
> The external snd-usb-audio module built successfully for:
>=20
>  =C2=A0 7.1.8-200.fc44.x86_64
>=20
> and was signed with my enrolled module-signing key.
>=20
> I then loaded snd-usb-audio with:
>=20
>  =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken
>=20
> The detachable microphone boom was physically attached for this test.
>=20
> On initialization the kernel reported:
>=20
>  =C2=A0 2:0: broken mixer GET_CUR (-16384/0/256 =3D> -3840)
>=20
> and the PCM Playback Volume control remained exposed:
>=20
>  =C2=A0 Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>=20
> The initial values were:
>=20
>  =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A047
>  =C2=A0 PipeWire: 0.52
>=20
> I then turned the physical headset volume wheel significantly down.
>=20
> Afterwards:
>=20
>  =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A031
>  =C2=A0 PipeWire: 0.28
>=20
> KDE's volume OSD also reacted correctly while turning the wheel.
>=20
> So the previous observation is reproducible even with the complete
> QUIRK_FLAG_MIXER_GET_CUR_BROKEN implementation.
>=20
>=20
> 2. evtest on the headset Consumer Control interface
>=20
> I tested:
>=20
>  =C2=A0 Logitech PRO X Wireless Gaming Headset Consumer Control
>  =C2=A0 USB 046d:0aba
>=20
> The physical volume wheel does emit multimedia key events.
>=20
> Turning the wheel down produced repeated:
>=20
>  =C2=A0 KEY_VOLUMEDOWN
>=20
> events, and turning it up produced repeated:
>=20
>  =C2=A0 KEY_VOLUMEUP
>=20
> events.
>=20
> For example:
>=20
>  =C2=A0 EV_MSC=C2=A0 MSC_SCAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 c00ea
>  =C2=A0 EV_KEY=C2=A0 KEY_VOLUMEDOWN=C2=A0 1
>=20
> and:
>=20
>  =C2=A0 EV_MSC=C2=A0 MSC_SCAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 c00e9
>  =C2=A0 EV_KEY=C2=A0 KEY_VOLUMEUP=C2=A0 =C2=A0 1
>=20
> This corrects my earlier observation that evtest did not show volume-key
> events.
>=20
> So your suggestion was correct: the device does emit HID multimedia
> volume events.
>=20
> This also explains why software volume can still follow the physical
> wheel even when mixer GET_CUR is treated as broken.

Thanks. It matches my expectation.

>=20
>=20
> 3. Continuous-tone SET_CUR test with the microphone boom detached
>=20
> For this test I physically detached the microphone boom and replugged
> the dongle so that the device initialized in that state.
>=20
> I stopped the desktop audio services and used ALSA directly.
>=20
> I played a continuous 1 kHz tone.
>=20
> The initial playback volume was:
>=20
>  =C2=A0 43 =3D -20 dB
>=20
> While the tone continued playing, I issued:
>=20
>  =C2=A0 23 =3D -40 dB
>=20
> The tone became quieter immediately when SET_CUR was issued. I could not
> perceive any delay between issuing SET_CUR and the physical volume
> change.
>=20
> The amixer command itself completed in approximately 10 ms, but I only
> mention that as command timing. I did not measure the actual hardware
> latency with instrumentation.
>=20
> So the useful observation is:
>=20
>  =C2=A0 Playback SET_CUR -> physical volume change:
>  =C2=A0 no perceptible delay

Ditto.

>=20
>=20
> Therefore the current results are:
>=20
> - Your revised sticky check still classifies the Playback Volume control
>  =C2=A0 as sticky, including with the detachable Mic boom attached.
>=20
> - With the Mic boom detached, Playback SET_CUR is physically effective.
>=20
> - Playback GET_CUR can remain stale/delayed after SET_CUR in the
>  =C2=A0 Mic-detached state.
>=20
> - The physical response to Playback SET_CUR appears immediate to the
>  =C2=A0 listener.
>=20
> - With the complete MIXER_GET_CUR_BROKEN implementation, physical wheel
>  =C2=A0 changes still propagate to PipeWire/KDE.
>=20
> - The volume wheel emits KEY_VOLUMEUP / KEY_VOLUMEDOWN HID events, which
>  =C2=A0 explains how the software volume can follow the wheel without rel=
ying
>  =C2=A0 on mixer GET_CUR notifications.
>=20
>=20
> I should also mention that I am not a kernel developer and my technical
> knowledge is not sufficient to prepare or review this kind of driver
> change on my own. I am using ChatGPT (Plus) to help me understand your te=
st
> requests, prepare the test setup and backports, and make sure I collect
> the requested results as carefully as possible.
>=20
> I still want to help with testing this hardware, so I am happy to
> continue running any tests you need and report the observations and raw
> results back to you.
>=20
> Let me know if you would like me to test anything else.

I think I've got enough bits about your device.

I will abandon this patch and find some time to prepare a new patch
demoting the sticky check into an informational warning, and make it only
set get_cur_broken. Afterward, QUIRK_FLAG_MIXER_GET_CUR_BROKEN can be
dropped. It will still gate GET_CUR on your device as a >1s delay is
anyway unacceptable, but it's completely fine as your device doesn't
depends on mixer interrupts at all.

Thanks,
Rong

>=20
> Thanks,
> Alexander
>=20
> Am 20.08.2026 um 14:51 schrieb Rong Zhang:
> > Hi Alexander,
> >=20
> > Thanks for testing.
> >=20
> > On Wed, 2026-08-19 at 20:37 +0200, Alexander Niemeyer wrote:
> > > Hi Rong,
> > >=20
> > > thanks. I have now completed the three tests you asked for.
> > >=20
> > > 1. Your sticky-check patch with the detachable Mic boom attached
> > >=20
> > > I tested the same minimal 7.1.8 backport of your ~16-value / 10 ms
> > > sticky-check logic again, this time with the detachable microphone bo=
om
> > > physically attached.
> > >=20
> > > The external snd-usb-audio module was rebuilt and loaded successfully
> > > (the module taint was "O"), and the old 100 ms diagnostic changes wer=
e
> > > removed before this test.
> > >=20
> > > The result is still a failure:
> > >=20
> > >   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
> > >=20
> > > The PCM control exposes only:
> > >=20
> > >   =C2=A0 Capabilities: pswitch pswitch-joined
> > >=20
> > > and no Playback Volume control.
> > >=20
> > > I repeated this once more with another dongle replug, without changin=
g
> > > the module or touching the volume wheel, and got the same result agai=
n.
> > >=20
> > > So:
> > >=20
> > >   =C2=A0 your sticky-check patch + Mic boom attached
> > >   =C2=A0 -> still classified as sticky
> > >   =C2=A0 -> reproduced twice
> > >=20
> > I didn't expect that, but I will take your result anyway. Your device
> > seems to have more mysterious behavior, sigh.
> >=20
> > > 2. Is Playback SET_CUR really broken after Mic SET_RES with the boom
> > > detached?
> > >=20
> > > For this test I detached the microphone boom.
> > >=20
> > > I used a test version of snd-usb-audio which:
> > >=20
> > > - performed the Mic UAC1 resolution probe,
> > > - kept the Playback Volume control exposed,
> > > - clamped the known-broken advertised -64 dB minimum to -63 dB,
> > > - and bypassed the normal ALSA mixer cache so that mixer reads fetch
> > >   =C2=A0 GET_CUR from the device.
> > >=20
> > > The initial Playback value was:
> > >=20
> > >   =C2=A0 43 =3D -20 dB
> > >=20
> > > I played a 3-second 1 kHz test tone and listened to its level.
> > >=20
> > > Then I requested:
> > >=20
> > >   =C2=A0 23 =3D -40 dB
> > >=20
> > > The immediate output from the cset operation still showed:
> > >=20
> > >   =C2=A0 values=3D43
> > >=20
> > > I waited two seconds and issued a fresh cget. It then returned:
> > >=20
> > >   =C2=A0 values=3D23
> > >=20
> > > I played the exact same test tone again, and the second tone was clea=
rly
> > > quieter.
> > Just curious: could you play the test tone throughout the entire proces=
s
> > and see how long does the device need to change its physical volume?
> >=20
> > > So Playback SET_CUR is physically effective.
> > OK then. I will propose a patch to demote the sticky check to
> > informational warning. Before that, I need to reconfirm your test resul=
ts
> > about MIXER_GET_CUR_BROKEN.
> >=20
> > > At least in this test, the effect after Mic SET_RES with the boom
> > > detached is not that Playback SET_CUR stops working. Instead, GET_CUR
> > > can remain stale for some time after SET_CUR and later reflect the
> > > actual value.
> > >=20
> > > In short:
> > >=20
> > >   =C2=A0 before:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043 (-=
20 dB)
> > >   =C2=A0 SET_CUR requested:=C2=A0 23 (-40 dB)
> > >   =C2=A0 immediate result:=C2=A0 =C2=A043
> > >   =C2=A0 GET_CUR after 2 s:=C2=A0 23
> > >   =C2=A0 physical volume:=C2=A0 =C2=A0 clearly quieter
> > >=20
> > >=20
> > > 3. QUIRK_FLAG_MIXER_GET_CUR_BROKEN and mixer change notifications
> > >=20
> > > Linux 7.1.8 does not contain QUIRK_FLAG_MIXER_GET_CUR_BROKEN yet, so =
for
> > > this test I made a minimal backport of the flag behavior to the other=
wise
> > > stock 7.1.8 mixer code,
> > >=20
> > What was "a minimal backport of the flag behavior"? Commit ad2c7d2c42af
> > ("ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN") is already
> > minimal and must be backported as a whole.
> >=20
> > > without your new sticky-check patch.
> > >=20
> > > I loaded snd-usb-audio with:
> > >=20
> > >   =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken
> > >=20
> > > The kernel detected the constant GET_CUR condition and kept the Playb=
ack
> > > Volume control exposed:
> > >=20
> > >   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
> > >   =C2=A0 PROXTESTC: treating constant GET_CUR as broken
> > >=20
> > > For this test the microphone boom was attached.
> > >=20
> > > Before turning the physical headset wheel:
> > >=20
> > >   =C2=A0 ALSA cget: 56
> > >   =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.72
> > >=20
> > > I then deliberately turned the physical volume wheel further down.
> > >=20
> > > Afterwards:
> > >=20
> > >   =C2=A0 ALSA cget: 47
> > >   =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.52
> > >=20
> > > KDE's volume OSD also reacted normally while I turned the wheel.
> > >=20
> > > So, on this device, using MIXER_GET_CUR_BROKEN did not break propagat=
ion
> > > of physical mixer changes through the audio stack:
> > >=20
> > >   =C2=A0 physical wheel
> > >   =C2=A0 -> ALSA value changed
> > >   =C2=A0 -> PipeWire value changed
> > >   =C2=A0 -> KDE OSD reacted normally
> > Did you properly backport QUIRK_FLAG_MIXER_GET_CUR_BROKEN? In particula=
r,
> > did you backport the change in snd_usb_mixer_notify_id()?
> >=20
> > If you backported the change properly, your test results imply that you=
r
> > device doesn't depend on mixer interrupts at all -- does the volume whe=
el
> > emit HID events to ask software to tune the mixer value on its behalf?
> > Please try `evtest' to see if it emits multimedia key events.
> >=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > > Therefore the current picture seems to be:
> > >=20
> > > - Your revised sticky check still rejects the Playback Volume control=
,
> > >   =C2=A0 both with the detachable Mic boom attached and detached.
> > >=20
> > > - With the Mic boom detached, Mic SET_RES can make Playback GET_CUR s=
tay
> > >   =C2=A0 stale after a Playback SET_CUR, but Playback SET_CUR itself =
is still
> > >   =C2=A0 physically effective.
> > >=20
> > > - At least on this Logitech device, treating GET_CUR as broken did no=
t
> > >   =C2=A0 prevent physical wheel changes from reaching ALSA/PipeWire/K=
DE.
> > >=20
> > > Let me know what you would like me to test next. I have kept the Fedo=
ra
> > > test environment and module-signing setup intact.
> > >=20
> > > Thanks,
> > > Alexander
> > >=20
> > > Am 19.08.2026 um 18:39 schrieb Rong Zhang:
> > > > Hi Alexander,
> > > >=20
> > > > On Tue, 2026-08-18 at 17:24 +0200, Alexander Niemeyer wrote:
> > > > > Hi Rong,
> > > > >=20
> > > > > one important follow-up to my previous message:
> > > > >=20
> > > > > I realized that the detachable microphone boom was not physically=
 connected
> > > > > to the headset during the direct libusb tests I reported earlier.
> > > > >=20
> > > > > I therefore repeated the relevant tests with the boom microphone =
attached,
> > > > > and the result changes in an important way.
> > > > >=20
> > > > > With the boom microphone attached, on a fresh device:
> > > > >=20
> > > > > Mic GET_RES =3D 256
> > > > > no SET_RES
> > > > >=20
> > > > > Playback:
> > > > >    =C2=A0 GET_CUR =3D -3840 (-15 dB)
> > > > >    =C2=A0 SET_CUR =3D -2048 (-8 dB)
> > > > >    =C2=A0 GET_CUR changes to -2048 after 65.3 ms
> > > > >=20
> > > > > Result: PASS
> > > > >=20
> > > > > After another power cycle, with the boom still attached:
> > > > >=20
> > > > > Mic GET_RES before =3D 256
> > > > > Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
> > > > > Mic GET_RES after=C2=A0 =3D 256
> > > > >=20
> > > > > Playback:
> > > > >    =C2=A0 GET_CUR =3D -3840 (-15 dB)
> > > > >    =C2=A0 SET_CUR =3D -2048 (-8 dB)
> > > > >    =C2=A0 GET_CUR changes to -2048 after 66.3 ms
> > > > >=20
> > > > > Result: PASS
> > > > >=20
> > > > > I also repeated the complete Mic SET_RES sequence:
> > > > >=20
> > > > > SET_RES 128
> > > > > SET_RES 64
> > > > > SET_RES 32
> > > > > SET_RES 16
> > > > > SET_RES 8
> > > > > SET_RES 4
> > > > > SET_RES 2
> > > > > SET_RES 1
> > > > >=20
> > > > > All requests return success, GET_RES remains 256, and Playback
> > > > > SET_CUR(-8 dB)
> > > > > still works afterwards, with GET_CUR changing after 76.0 ms.
> > > > >=20
> > > > > However, with the boom microphone attached, the stock Fedora 7.1.=
8
> > > > > snd-usb-audio driver still reproduces the original failure:
> > > > >=20
> > > > >    =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disablin=
g
> > > > >=20
> > > > > and no PCM Playback Volume control is exposed.
> > > > Could you test my patch with Mic attached?
> > > >=20
> > > > > So I need to correct the conclusion from my previous message:
> > > > >=20
> > > > > The Mic SET_RES behavior is real, but it depends on whether the d=
etachable
> > > > > microphone boom is physically connected.
> > > > >=20
> > > > > With the boom disconnected:
> > > > >    =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequ=
ent Playback
> > > > >    =C2=A0 SET_CUR ineffective for more than 1200 ms.
> > > > >=20
> > > > > With the boom connected:
> > > > >    =C2=A0 both a single Mic SET_RES(128) and the full SET_RES seq=
uence leave
> > > > >    =C2=A0 Playback SET_CUR working normally.
> > > > >=20
> > > > Thanks for your tests.
> > > >=20
> > > > Let me conclude:
> > > >=20
> > > > - Mic detached: SET_RES on Mic breaks Playback
> > > > - Mic attached: SET_RES on Mic breaks nothing
> > > >=20
> > > > Still, I doubt if Playback SET_CUR is really broken in the first ca=
se.
> > > > There is a chance that Playback SET_CUR is effective while GET_CUR
> > > > becomes broken.
> > > >=20
> > > > Could you test:
> > > >=20
> > > > - Leave the Mic detached
> > > > - SET_RES on Mic
> > > > - GET_CUR on Playback
> > > > - Play some audio, listen to it
> > > > - SET_CUR on Playback
> > > > - GET_CUR on Playback
> > > > - Play some audio again, listen to it, and tell if the physical vol=
ume
> > > > has changed
> > > >=20
> > > > The procedure can be achieved by hacking into the snd-usb-audio dri=
ver
> > > > and nullifying its cache mechanism, so that you can fetch GET_CUR v=
alues
> > > > from standard ALSA mixer interface.
> > > >=20
> > > > If you can notice physical volume changes, it implies SET_RES on Mi=
c
> > > > break Playback GET_CUR without breaking SET_CUR. Otherwise, it brea=
k
> > > > Playback SET_CUR.
> > > >=20
> > > > If it only breaks GET_CUR,=C2=A0it implies the methodology of stick=
y check is
> > > > problematic. In this case I would probably consider demoting the st=
icky
> > > > check's severity.
> > > >=20
> > > > I am also thinking about how we should demote the severity. Could y=
ou
> > > > also test if applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN (without this
> > > > patch) breaks mixer change notifications? I.e., tune the volume wit=
h the
> > > > buttons/knobs on the device and see if the audio stack reflects the
> > > > change.=C2=A0I guess it will break the notifications, but I would s=
till like
> > > > to wait for your confirmation.
> > > >=20
> > > > Thanks,
> > > > Rong
> > > >=20
> > > > > Therefore Mic SET_RES alone does not explain the complete snd-usb=
-audio
> > > > > failure in all device configurations. There must be another diffe=
rence in
> > > > > the full snd-usb-audio initialization path when the boom is attac=
hed.
> > > > >=20
> > > > > The separate Playback -64 dB minimum issue I reported remains unc=
hanged:
> > > > > -64 dB is ineffective, -63 dB works, and attempting -64 dB does n=
ot prevent
> > > > > subsequent valid Playback SET_CUR requests from working.
> > > > >=20
> > > > > Sorry for not noticing the detachable-microphone state earlier. I=
 wanted to
> > > > > send this correction as soon as I confirmed it.
> > > > >=20
> > > > > I still have the usbmon/pcapng captures and can run further targe=
ted tests
> > > > > if useful.
> > > > >=20
> > > > > Thanks,
> > > > > Alexander
> > > > >=20
> > > > > Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
> > > > > > Hi Rong,
> > > > > >=20
> > > > > > I think we found the reason for the different behavior.
> > > > > >=20
> > > > > > I reproduced the snd-usb-audio initialization sequence step by =
step
> > > > > > with direct libusb UAC1 control transfers and isolated the prob=
lem to
> > > > > > SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
> > > > > >=20
> > > > > > A fresh-device control test looks like this:
> > > > > >=20
> > > > > > Mic GET_RES =3D 256
> > > > > > no SET_RES
> > > > > > Playback:
> > > > > > GET_CUR =3D -3840 (-15 dB)
> > > > > > SET_CUR =3D -2048 (-8 dB)
> > > > > > GET_CUR changes to -2048 after 68.0 ms
> > > > > > Result: PASS
> > > > > >=20
> > > > > > After another power cycle, I repeated the same test but issued =
just
> > > > > > *one* SET_RES request to the Mic Feature Unit first:
> > > > > >=20
> > > > > > Mic GET_RES before =3D 256
> > > > > > Mic SET_RES(128) =3D success
> > > > > > Mic GET_RES after =3D 256
> > > > > > Playback:
> > > > > > GET_CUR =3D -3840 (-15 dB)
> > > > > > SET_CUR =3D -2048 (-8 dB)
> > > > > > GET_CUR remains -3840 for more than 1200 ms
> > > > > > Result: FAIL
> > > > > >=20
> > > > > > So a single successful |SET_RES(128)| on Feature Unit 3 is suff=
icient
> > > > > > to make subsequent |SET_CUR| requests to the Playback Volume co=
ntrol
> > > > > > on Feature Unit 2 ineffective.
> > > > > >=20
> > > > > > I also tested the complete Mic SET_RES sequence used by snd-usb=
-audio:
> > > > > >=20
> > > > > > SET_RES 128
> > > > > > SET_RES 64
> > > > > > SET_RES 32
> > > > > > SET_RES 16
> > > > > > SET_RES 8
> > > > > > SET_RES 4
> > > > > > SET_RES 2
> > > > > > SET_RES 1
> > > > > >=20
> > > > > > All requests return success, while GET_RES remains 256. After t=
hat
> > > > > > sequence, Playback SET_CUR also remains ineffective for more th=
an 1200
> > > > > > ms.
> > > > > >=20
> > > > > > Interestingly, the Mic control itself still works after this. I=
n an
> > > > > > ALSA-like Mic probe I could successfully change Mic Volume from=
 0 dB
> > > > > > to -64 dB and then +1 dB, with GET_CUR reflecting those changes
> > > > > > essentially immediately (~0.3 ms). Playback remained broken aft=
erwards.
> > > > > >=20
> > > > > > I also checked whether SET_RES on the Playback Feature Unit its=
elf
> > > > > > causes the problem. It does not:
> > > > > >=20
> > > > > > Playback GET_RES =3D 256
> > > > > > SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
> > > > > > GET_RES still =3D 256
> > > > > > Playback SET_CUR(-8 dB)
> > > > > > GET_CUR changes successfully after 87.7 ms
> > > > > >=20
> > > > > > So the problematic operation appears specifically to be *SET_RE=
S on
> > > > > > the Mic Feature Unit affecting the Playback Feature Unit*.
> > > > > >=20
> > > > > > I also clarified the separate advertised-minimum issue:
> > > > > >=20
> > > > > > Playback SET_CUR(-64 dB):
> > > > > > no change after >1200 ms
> > > > > > followed by SET_CUR(-8 dB):
> > > > > > works normally after 54.9 ms
> > > > > > Playback SET_CUR(-63 dB):
> > > > > > works after 75.8 ms
> > > > > > followed by SET_CUR(-8 dB):
> > > > > > works after 43.6 ms
> > > > > >=20
> > > > > > Therefore the broken -64 dB endpoint does not leave the device =
in the
> > > > > > broken state; it is a separate issue. -63 dB works normally.
> > > > > >=20
> > > > > > I also captured usbmon/pcapng traces for both a working direct-=
libusb
> > > > > > SET_CUR sequence and the failing snd-usb-audio initialization, =
so I
> > > > > > can send those as well if they are useful.
> > > > > >=20
> > > > > > This also seems to explain why the sticky-check changes did not=
 help:
> > > > > > by the time snd-usb-audio reaches the Playback Volume sticky ch=
eck,
> > > > > > the earlier Mic SET_RES sanity test has already put the device =
into
> > > > > > the state where Playback SET_CUR no longer takes effect.
> > > > > >=20
> > > > > > Let me know if you would like me to test a patch or capture any
> > > > > > additional traces.
> > > > > >=20
> > > > > > Thanks,
> > > > > > Alexander
> > > > > >=20
> > > > > >=20
> > > > > > Am 16.08.2026 um 17:08 schrieb Rong Zhang:
> > > > > > > Hi Alexander,
> > > > > > >=20
> > > > > > > On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
> > > > > > > > Hi Rong,
> > > > > > > >=20
> > > > > > > > Sure. The libusb tests were direct USB Audio Class 1 contro=
l transfers
> > > > > > > > to the headset using libusb/PyUSB, not ALSA mixer operation=
s.
> > > > > > > >=20
> > > > > > > > I accessed Feature Unit 2 on AudioControl interface 0, mast=
er
> > > > > > > > channel 0,
> > > > > > > > with the UAC1 Volume control selector:
> > > > > > > >=20
> > > > > > > > wValue =3D 0x0200 /* Volume control, master channel */
> > > > > > > > wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
> > > > > > > >=20
> > > > > > > > I used the standard class-specific requests directly, inclu=
ding
> > > > > > > > GET_CUR,
> > > > > > > > GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit l=
ittle-endian
> > > > > > > > volume values in 1/256 dB units.
> > > > > > > >=20
> > > > > > > > The device reported:
> > > > > > > >=20
> > > > > > > > GET_CUR: 0 ( 0 dB in that test)
> > > > > > > > GET_MIN: -16384 (-64 dB)
> > > > > > > > GET_MAX: 0 ( 0 dB)
> > > > > > > > GET_RES: 256 ( 1 dB)
> > > > > > > >=20
> > > > > > > > For the timing tests I issued SET_CUR for a target value an=
d then
> > > > > > > > repeatedly queried GET_CUR until the value changed or the t=
imeout
> > > > > > > > expired.
> > > > > > > >=20
> > > > > > > > Valid values became visible after roughly:
> > > > > > > >=20
> > > > > > > > -1 dB ~81 ms
> > > > > > > > -2 dB ~52 ms
> > > > > > > > -4 dB ~47 ms
> > > > > > > > -8 dB ~47 ms
> > > > > > > > -16 dB ~52 ms
> > > > > > > > -32 dB ~47 ms
> > > > > > > >=20
> > > > > > > > The advertised -64 dB minimum behaved differently: SET_CUR =
returned
> > > > > > > > successfully, but GET_CUR did not change even after 1000 ms=
.
> > > > > > > >=20
> > > > > > > > To access the AudioControl interface with libusb, I unbound=
 the
> > > > > > > > AudioControl interface from snd-usb-audio for the duration =
of the test.
> > > > > > > >=20
> > > > > > > > I did not intentionally open a playback stream during those=
 libusb
> > > > > > > > tests. Because the AudioControl interface had been unbound =
from
> > > > > > > > snd-usb-audio, I also do not believe there was an active AL=
SA playback
> > > > > > > > stream at that point.
> > > > > > > Thanks for the information.
> > > > > > >=20
> > > > > > > Unfortunately, I still don't exactly see why the device behav=
ed
> > > > > > > differently when GET_CUR/SET_CUR requests were sent from snd-=
usb-audio
> > > > > > > compared to your libusb tests.
> > > > > > >=20
> > > > > > > snd-usb-audio also tries SET_RES to test the sanity of GET_RE=
S. Could
> > > > > > > you
> > > > > > > test if it breaks your device's GET_CUR?
> > > > > > >=20
> > > > > > > Maybe comparing them with usbmon can show some clues. You can=
 use
> > > > > > > Wireshark to sniff /dev/usbmon*.
> > > > > > >=20
> > > > > > > Hint: a Thunderbolt port usually corresponds to a dedicated U=
SB root
> > > > > > > hub.
> > > > > > > If you have one, plug the device to it to get pure usbmon tra=
ce results
> > > > > > > with no noisy URBs from other devices.
> > > > > > >=20
> > > > > > > Thanks,
> > > > > > > Rong
> > > > > > >=20
> > > > > > > > If the open-stream state is important, I can repeat the exp=
eriment
> > > > > > > > specifically controlling for playback-stream-open versus
> > > > > > > > playback-stream-closed.
> > > > > > > >=20
> > > > > > > > Thanks,
> > > > > > > > Alexander
> > > > > > > >=20
> > > > > > > > Am 16.08.2026 um 15:50 schrieb Rong Zhang:
> > > > > > > > > Hi Alexander,
> > > > > > > > >=20
> > > > > > > > > On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wro=
te:
> > > > > > > > > > Hi Rong,
> > > > > > > > > >=20
> > > > > > > > > > I tested the sticky-check part of your patch on the Log=
itech PRO X
> > > > > > > > > > Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc4=
4.x86_64.
> > > > > > > > > >=20
> > > > > > > > > > Since your patch is based on a newer tree, I used a min=
imal
> > > > > > > > > > backport of
> > > > > > > > > > the new ~16-value / 10 ms sticky-check logic to the 7.1=
.8 code. The
> > > > > > > > > > GET_CUR-broken handling from the newer tree was not inc=
luded; GET_CUR
> > > > > > > > > > itself succeeds on this device.
> > > > > > > > > >=20
> > > > > > > > > > Unfortunately, the playback control is still classified=
 as sticky:
> > > > > > > > > >=20
> > > > > > > > > > 2:0: sticky mixer values (-16384/0/256 =3D> -3840), dis=
abling
> > > > > > > > > >=20
> > > > > > > > > > I then instrumented the check and tried an additional d=
iagnostic:
> > > > > > > > > > after
> > > > > > > > > > every successful SET_CUR, wait 100 ms and perform anoth=
er GET_CUR
> > > > > > > > > > before
> > > > > > > > > > issuing the next SET_CUR.
> > > > > > > > > >=20
> > > > > > > > > > For the playback volume, the saved value was -3840 and =
GET_CUR
> > > > > > > > > > remained
> > > > > > > > > > at -3840 for every tested value, even after 100 ms, for=
 example:
> > > > > > > > > >=20
> > > > > > > > > > test=3D-15104 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > > test=3D-13824 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > > test=3D-3584 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > > test=3D-2304 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > > test=3D-1024 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > > test=3D0 immediate=3D-3840 after100ms=3D-3840
> > > > > > > > > >=20
> > > > > > > > > > So in this case the issue does not appear to be simply =
that the
> > > > > > > > > > accumulated 10 ms sleeps are too short. During the prob=
e-time sticky
> > > > > > > > > > check, SET_CUR succeeds but GET_CUR for the playback co=
ntrol remains
> > > > > > > > > > unchanged even when each SET_CUR is given 100 ms before=
 the next one.
> > > > > > > > > >=20
> > > > > > > > > > This differs from my previous direct libusb tests with =
the
> > > > > > > > > > AudioControl
> > > > > > > > > > interface unbound, where valid SET_CUR values became vi=
sible through
> > > > > > > > > > GET_CUR after roughly 47=E2=80=9381 ms.
> > > > > > > > > Really interesting. Maybe the mixer changes its value onl=
y when
> > > > > > > > > there is
> > > > > > > > > an opened playback stream.
> > > > > > > > >=20
> > > > > > > > > Could you clarify your "libusb tests"?
> > > > > > > > >=20
> > > > > > > > > Thanks,
> > > > > > > > > Rong
> > > > > > > > >=20
> > > > > > > > > > The first debug line I saw with |saved=3D0| was from th=
e Mic Capture
> > > > > > > > > > Volume control; that control changed immediately and re=
turned as
> > > > > > > > > > non-sticky. The sequence above with |saved=3D-3840| is =
the
> > > > > > > > > > problematic PCM
> > > > > > > > > > Playback Volume control.
> > > > > > > > > >=20
> > > > > > > > > > I'd be happy to test another version or run additional =
diagnostics if
> > > > > > > > > > useful.
> > > > > > > > > >=20
> > > > > > > > > > Best regards,
> > > > > > > > > > Alexander
> > > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> > > > > > > > > > > Some mixers are asynchronous, and some have broken mi=
n/max. They are
> > > > > > > > > > > mistakenly considered sticky due to how the check is =
implemented.
> > > > > > > > > > >=20
> > > > > > > > > > > Check sticky mixers more precisely by checking approx=
imately 16
> > > > > > > > > > > values
> > > > > > > > > > > and adding a msleep(10) between each check, so that a=
synchronous
> > > > > > > > > > > mixers
> > > > > > > > > > > have enough time to change the value and mixers with =
broken
> > > > > > > > > > > min/max are
> > > > > > > > > > > checked properly. Additionally, mark GET_CUR as broke=
n when
> > > > > > > > > > > get_cur_mix_raw() fails, instead of returning success=
fully.
> > > > > > > > > > >=20
> > > > > > > > > > > Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
> > > > > > > > > > > Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a=
1c7-9c5d12636f4b@gmx.de
> > > > > > > > > > >=20
> > > > > > > > > > > Signed-off-by: Rong Zhang<i@rong.moe>
> > > > > > > > > > > ---
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51
> > > > > > > > > > > ++++++++++++++++++++++++++++++++++++++++++++-------
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+)=
, 7 deletions(-)
> > > > > > > > > > >=20
> > > > > > > > > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > > > > > > > > index 703c118f9d4e..3d0f97730a06 100644
> > > > > > > > > > > --- a/sound/usb/mixer.c
> > > > > > > > > > > +++ b/sound/usb/mixer.c
> > > > > > > > > > > @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(=
struct
> > > > > > > > > > > usb_mixer_elem_info *cval, int ch, int idx)
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_c=
ontrol(struct
> > > > > > > > > > > usb_mixer_elem_info *cval,
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel, int saved)
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 {
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cv=
al->min, cval->max };
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0 int test, check, i;
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 int test, check, res;
> > > > > > > > > > > +
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 va=
lues (15 intervals).
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not =
fine enough, check fewer values.
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - =
cval->min, 15);
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->=
res) : cval->res;
> > > > > > > > > > > +
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min=
) is not a multiple of
> > > > > > > > > > > cval->res, we still
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max an=
yway.
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < c=
val->max + res; test +=3D res) {
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test =
> cval->max)
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 test =3D cval->max;
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0=
; i < ARRAY_SIZE(sticky_test_values); i++) {
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D =
sticky_test_values[i];
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (test =3D=3D saved)
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_u=
sb_set_cur_mix_value(cval, channel, 0, test) ||
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 get_cur_mix_raw(cval, channel, &check) ||
> > > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 check !=3D saved) /* SET_CUR effective, non-sticky. */
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_u=
sb_set_cur_mix_value(cval, channel, 0, test))
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;
> > > > > > > > > > > +
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_c=
ur_mix_raw(cval, channel, &check))
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 goto get_cur_broken;
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check=
 !=3D saved) /* SET_CUR effective, non-sticky. */
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > > > > > +
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * L=
eave some time for asynchronous mixers to change the
> > > > > > > > > > > value.
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * N=
ote that there is no need to wait between SET_CUR and
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * G=
ET_CUR, as we don't care whether the GET_CUR value
> > > > > > > > > > > matches
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * t=
he SET_CUR one. IOW, what we expect is just a
> > > > > > > > > > > GET_CUR value
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * d=
iffering from the saved one.
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * M=
ixers of most devices are synchronous. The should have
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * r=
eturned early without extra sleep. Asynchronous
> > > > > > > > > > > mixers will
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * r=
eturn once the accumulated time is enough for them
> > > > > > > > > > > to change
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * t=
he value.
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10=
);
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check aga=
in after the last msleep(). */
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel=
, &check))
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_=
cur_broken;
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > > > > > > > +
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval=
->head.mixer->chip->quirk_flags &
> > > > > > > > > > > QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
> > > > > > > > > > > +get_cur_broken:
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 usb_audio_info(cval->head.mixer->chip,
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D>
> > > > > > > > > > > %d)\n",
> > > > > > > > > > >   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cval->head.id,
> > > > > > > > > > > mixer_ctrl_intf(cval->head.mixer),
> > > > > > > > > > >=20
> > > > > > > > > > > ---
> > > > > > > > > > > base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> > > > > > > > > > > change-id: 74676fce-uac-precise-sticky-check-94474a22=
b57d
> > > > > > > > > > >=20
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Rong
> > > > > > > > > > >=20
