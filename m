Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1B440658;
	Wed, 19 Aug 2026 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164668; cv=none; b=pAoL/o25AWIwXEdS4qJ4ilIae0vfIpS93yr5VgLCvR7x1/3+zUr57Nf5JPSipj2DR3B5ktPTxIB7pKQXTiwFhc44BZTIwiktX4B3aEsEcQOERCCrGGNTdtIoXt3P7tXW0mT5X/E812m1bEuo8ETLKl8p1ejUMluJ1DI1yWDtF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164668; c=relaxed/simple;
	bh=ik/hoIO1Q1vaEdw+xI9d30BiytOMWdp8J7GaJ++/4qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1SsNicgfNY8oHNeOmsxGfX1ATi9QlUaQ/8h3L7tMURtfE+l+rEMnBzgUwdfH3stPg7WUUG8bh3/qbM2DZFt9w59NGHkm3Br8S9v1W6rtqKo/+MiO5//R41Sy/zzhrCIg5TtdZr+Pyzdv5kyurX1KqMM6Qn6aBtN2TYznQs0+Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=fWJuNVuB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="fWJuNVuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787164645; x=1787769445; i=adventurefan@gmx.de;
	bh=Tclo0cZa8XVXTqpQxv5CiKyvT7fFZ7ywSZFBVLJE160=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fWJuNVuBIbrjzJIvfNdIBhaOKPdrNNkn/OvX0VYh4tOLJLtpcaXadkMmJYPXUS0l
	 EK9VVNQIi7hbfce8fv2aKP42v0qllAPhzkoAP3iomxrel/LorO0VQRCmboCwhMFy1
	 39fn0VniGRunQp+U6LRwu47H8lfu6fEd08AoRNM7vfkUfd1sIvIDdyUurPISH0Z/L
	 QK0RRrr1MfLUT/qkk4Je+4SDQ2bkyOLPIDKNPNfRQKUoXBlYUtQvjC8Qvc8FY4XFG
	 nzw67GTI6cbG+vcV1ROTP5E/rm4UY7murfMm3RlxAanJjYcBGxJBy5lkMMt4OWdMq
	 Gm4wnnZf0FNjYmcG9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1wWScY0lal-00lq3f; Wed, 19
 Aug 2026 20:37:25 +0200
Message-ID: <9dc9681c-a491-46bb-a64c-eccce0150398@gmx.de>
Date: Wed, 19 Aug 2026 20:37:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
To: Rong Zhang <i@rong.moe>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
 <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
 <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
 <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
 <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
 <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
 <72776889dc0368b955e569d7a4ae7fca6ca82729.camel@rong.moe>
From: Alexander Niemeyer <adventureFAN@gmx.de>
In-Reply-To: <72776889dc0368b955e569d7a4ae7fca6ca82729.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GTi6cnfveeCURjGwZkZJ02DdHPo4LldYDKY/hi4UDyfEr0UshbV
 jOyB0aaJeeFQnBGTxVSzWzA1Bc1Oefw4J2k9bNLEUEBchQw5IiwDhMPcPqdbCpVX+INsooh
 pvoVhSprT85FVrCQbsHqxqv6nav14u4U9dUOYfEHvjPF6hWizrnHGchvwqA4Hts4LErCnd/
 1zKeJCf2omeV7ZPiru0lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sQw0qvooq4E=;neH87ybmBLHNzoLsJ8EbDzh6SAC
 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

Hi Rong,

thanks. I have now completed the three tests you asked for.

1. Your sticky-check patch with the detachable Mic boom attached

I tested the same minimal 7.1.8 backport of your ~16-value / 10 ms
sticky-check logic again, this time with the detachable microphone boom
physically attached.

The external snd-usb-audio module was rebuilt and loaded successfully
(the module taint was "O"), and the old 100 ms diagnostic changes were
removed before this test.

The result is still a failure:

 =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling

The PCM control exposes only:

 =C2=A0 Capabilities: pswitch pswitch-joined

and no Playback Volume control.

I repeated this once more with another dongle replug, without changing
the module or touching the volume wheel, and got the same result again.

So:

 =C2=A0 your sticky-check patch + Mic boom attached
 =C2=A0 -> still classified as sticky
 =C2=A0 -> reproduced twice


2. Is Playback SET_CUR really broken after Mic SET_RES with the boom=20
detached?

For this test I detached the microphone boom.

I used a test version of snd-usb-audio which:

- performed the Mic UAC1 resolution probe,
- kept the Playback Volume control exposed,
- clamped the known-broken advertised -64 dB minimum to -63 dB,
- and bypassed the normal ALSA mixer cache so that mixer reads fetch
 =C2=A0 GET_CUR from the device.

The initial Playback value was:

 =C2=A0 43 =3D -20 dB

I played a 3-second 1 kHz test tone and listened to its level.

Then I requested:

 =C2=A0 23 =3D -40 dB

The immediate output from the cset operation still showed:

 =C2=A0 values=3D43

I waited two seconds and issued a fresh cget. It then returned:

 =C2=A0 values=3D23

I played the exact same test tone again, and the second tone was clearly
quieter.

So Playback SET_CUR is physically effective.

At least in this test, the effect after Mic SET_RES with the boom
detached is not that Playback SET_CUR stops working. Instead, GET_CUR
can remain stale for some time after SET_CUR and later reflect the
actual value.

In short:

 =C2=A0 before:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043 (-20 dB)
 =C2=A0 SET_CUR requested:=C2=A0 23 (-40 dB)
 =C2=A0 immediate result:=C2=A0 =C2=A043
 =C2=A0 GET_CUR after 2 s:=C2=A0 23
 =C2=A0 physical volume:=C2=A0 =C2=A0 clearly quieter


3. QUIRK_FLAG_MIXER_GET_CUR_BROKEN and mixer change notifications

Linux 7.1.8 does not contain QUIRK_FLAG_MIXER_GET_CUR_BROKEN yet, so for
this test I made a minimal backport of the flag behavior to the otherwise
stock 7.1.8 mixer code, without your new sticky-check patch.

I loaded snd-usb-audio with:

 =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken

The kernel detected the constant GET_CUR condition and kept the Playback
Volume control exposed:

 =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
 =C2=A0 PROXTESTC: treating constant GET_CUR as broken

For this test the microphone boom was attached.

Before turning the physical headset wheel:

 =C2=A0 ALSA cget: 56
 =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.72

I then deliberately turned the physical volume wheel further down.

Afterwards:

 =C2=A0 ALSA cget: 47
 =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.52

KDE's volume OSD also reacted normally while I turned the wheel.

So, on this device, using MIXER_GET_CUR_BROKEN did not break propagation
of physical mixer changes through the audio stack:

 =C2=A0 physical wheel
 =C2=A0 -> ALSA value changed
 =C2=A0 -> PipeWire value changed
 =C2=A0 -> KDE OSD reacted normally


Therefore the current picture seems to be:

- Your revised sticky check still rejects the Playback Volume control,
 =C2=A0 both with the detachable Mic boom attached and detached.

- With the Mic boom detached, Mic SET_RES can make Playback GET_CUR stay
 =C2=A0 stale after a Playback SET_CUR, but Playback SET_CUR itself is sti=
ll
 =C2=A0 physically effective.

- At least on this Logitech device, treating GET_CUR as broken did not
 =C2=A0 prevent physical wheel changes from reaching ALSA/PipeWire/KDE.

Let me know what you would like me to test next. I have kept the Fedora
test environment and module-signing setup intact.

Thanks,
Alexander

Am 19.08.2026 um 18:39 schrieb Rong Zhang:
> Hi Alexander,
>
> On Tue, 2026-08-18 at 17:24 +0200, Alexander Niemeyer wrote:
>> Hi Rong,
>>
>> one important follow-up to my previous message:
>>
>> I realized that the detachable microphone boom was not physically conne=
cted
>> to the headset during the direct libusb tests I reported earlier.
>>
>> I therefore repeated the relevant tests with the boom microphone attach=
ed,
>> and the result changes in an important way.
>>
>> With the boom microphone attached, on a fresh device:
>>
>> Mic GET_RES =3D 256
>> no SET_RES
>>
>> Playback:
>>   =C2=A0 GET_CUR =3D -3840 (-15 dB)
>>   =C2=A0 SET_CUR =3D -2048 (-8 dB)
>>   =C2=A0 GET_CUR changes to -2048 after 65.3 ms
>>
>> Result: PASS
>>
>> After another power cycle, with the boom still attached:
>>
>> Mic GET_RES before =3D 256
>> Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
>> Mic GET_RES after=C2=A0 =3D 256
>>
>> Playback:
>>   =C2=A0 GET_CUR =3D -3840 (-15 dB)
>>   =C2=A0 SET_CUR =3D -2048 (-8 dB)
>>   =C2=A0 GET_CUR changes to -2048 after 66.3 ms
>>
>> Result: PASS
>>
>> I also repeated the complete Mic SET_RES sequence:
>>
>> SET_RES 128
>> SET_RES 64
>> SET_RES 32
>> SET_RES 16
>> SET_RES 8
>> SET_RES 4
>> SET_RES 2
>> SET_RES 1
>>
>> All requests return success, GET_RES remains 256, and Playback
>> SET_CUR(-8 dB)
>> still works afterwards, with GET_CUR changing after 76.0 ms.
>>
>> However, with the boom microphone attached, the stock Fedora 7.1.8
>> snd-usb-audio driver still reproduces the original failure:
>>
>>   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>
>> and no PCM Playback Volume control is exposed.
> Could you test my patch with Mic attached?
>
>> So I need to correct the conclusion from my previous message:
>>
>> The Mic SET_RES behavior is real, but it depends on whether the detacha=
ble
>> microphone boom is physically connected.
>>
>> With the boom disconnected:
>>   =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequent Pla=
yback
>>   =C2=A0 SET_CUR ineffective for more than 1200 ms.
>>
>> With the boom connected:
>>   =C2=A0 both a single Mic SET_RES(128) and the full SET_RES sequence l=
eave
>>   =C2=A0 Playback SET_CUR working normally.
>>
> Thanks for your tests.
>
> Let me conclude:
>
> - Mic detached: SET_RES on Mic breaks Playback
> - Mic attached: SET_RES on Mic breaks nothing
>
> Still, I doubt if Playback SET_CUR is really broken in the first case.
> There is a chance that Playback SET_CUR is effective while GET_CUR
> becomes broken.
>
> Could you test:
>
> - Leave the Mic detached
> - SET_RES on Mic
> - GET_CUR on Playback
> - Play some audio, listen to it
> - SET_CUR on Playback
> - GET_CUR on Playback
> - Play some audio again, listen to it, and tell if the physical volume
> has changed
>
> The procedure can be achieved by hacking into the snd-usb-audio driver
> and nullifying its cache mechanism, so that you can fetch GET_CUR values
> from standard ALSA mixer interface.
>
> If you can notice physical volume changes, it implies SET_RES on Mic
> break Playback GET_CUR without breaking SET_CUR. Otherwise, it break
> Playback SET_CUR.
>
> If it only breaks GET_CUR,=C2=A0it implies the methodology of sticky che=
ck is
> problematic. In this case I would probably consider demoting the sticky
> check's severity.
>
> I am also thinking about how we should demote the severity. Could you
> also test if applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN (without this
> patch) breaks mixer change notifications? I.e., tune the volume with the
> buttons/knobs on the device and see if the audio stack reflects the
> change.=C2=A0I guess it will break the notifications, but I would still =
like
> to wait for your confirmation.
>
> Thanks,
> Rong
>
>> Therefore Mic SET_RES alone does not explain the complete snd-usb-audio
>> failure in all device configurations. There must be another difference =
in
>> the full snd-usb-audio initialization path when the boom is attached.
>>
>> The separate Playback -64 dB minimum issue I reported remains unchanged=
:
>> -64 dB is ineffective, -63 dB works, and attempting -64 dB does not pre=
vent
>> subsequent valid Playback SET_CUR requests from working.
>>
>> Sorry for not noticing the detachable-microphone state earlier. I wante=
d to
>> send this correction as soon as I confirmed it.
>>
>> I still have the usbmon/pcapng captures and can run further targeted te=
sts
>> if useful.
>>
>> Thanks,
>> Alexander
>>
>> Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
>>> Hi Rong,
>>>
>>> I think we found the reason for the different behavior.
>>>
>>> I reproduced the snd-usb-audio initialization sequence step by step
>>> with direct libusb UAC1 control transfers and isolated the problem to
>>> SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
>>>
>>> A fresh-device control test looks like this:
>>>
>>> Mic GET_RES =3D 256
>>> no SET_RES
>>> Playback:
>>> GET_CUR =3D -3840 (-15 dB)
>>> SET_CUR =3D -2048 (-8 dB)
>>> GET_CUR changes to -2048 after 68.0 ms
>>> Result: PASS
>>>
>>> After another power cycle, I repeated the same test but issued just
>>> *one* SET_RES request to the Mic Feature Unit first:
>>>
>>> Mic GET_RES before =3D 256
>>> Mic SET_RES(128) =3D success
>>> Mic GET_RES after =3D 256
>>> Playback:
>>> GET_CUR =3D -3840 (-15 dB)
>>> SET_CUR =3D -2048 (-8 dB)
>>> GET_CUR remains -3840 for more than 1200 ms
>>> Result: FAIL
>>>
>>> So a single successful |SET_RES(128)| on Feature Unit 3 is sufficient
>>> to make subsequent |SET_CUR| requests to the Playback Volume control
>>> on Feature Unit 2 ineffective.
>>>
>>> I also tested the complete Mic SET_RES sequence used by snd-usb-audio:
>>>
>>> SET_RES 128
>>> SET_RES 64
>>> SET_RES 32
>>> SET_RES 16
>>> SET_RES 8
>>> SET_RES 4
>>> SET_RES 2
>>> SET_RES 1
>>>
>>> All requests return success, while GET_RES remains 256. After that
>>> sequence, Playback SET_CUR also remains ineffective for more than 1200
>>> ms.
>>>
>>> Interestingly, the Mic control itself still works after this. In an
>>> ALSA-like Mic probe I could successfully change Mic Volume from 0 dB
>>> to -64 dB and then +1 dB, with GET_CUR reflecting those changes
>>> essentially immediately (~0.3 ms). Playback remained broken afterwards=
.
>>>
>>> I also checked whether SET_RES on the Playback Feature Unit itself
>>> causes the problem. It does not:
>>>
>>> Playback GET_RES =3D 256
>>> SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
>>> GET_RES still =3D 256
>>> Playback SET_CUR(-8 dB)
>>> GET_CUR changes successfully after 87.7 ms
>>>
>>> So the problematic operation appears specifically to be *SET_RES on
>>> the Mic Feature Unit affecting the Playback Feature Unit*.
>>>
>>> I also clarified the separate advertised-minimum issue:
>>>
>>> Playback SET_CUR(-64 dB):
>>> no change after >1200 ms
>>> followed by SET_CUR(-8 dB):
>>> works normally after 54.9 ms
>>> Playback SET_CUR(-63 dB):
>>> works after 75.8 ms
>>> followed by SET_CUR(-8 dB):
>>> works after 43.6 ms
>>>
>>> Therefore the broken -64 dB endpoint does not leave the device in the
>>> broken state; it is a separate issue. -63 dB works normally.
>>>
>>> I also captured usbmon/pcapng traces for both a working direct-libusb
>>> SET_CUR sequence and the failing snd-usb-audio initialization, so I
>>> can send those as well if they are useful.
>>>
>>> This also seems to explain why the sticky-check changes did not help:
>>> by the time snd-usb-audio reaches the Playback Volume sticky check,
>>> the earlier Mic SET_RES sanity test has already put the device into
>>> the state where Playback SET_CUR no longer takes effect.
>>>
>>> Let me know if you would like me to test a patch or capture any
>>> additional traces.
>>>
>>> Thanks,
>>> Alexander
>>>
>>>
>>> Am 16.08.2026 um 17:08 schrieb Rong Zhang:
>>>> Hi Alexander,
>>>>
>>>> On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
>>>>> Hi Rong,
>>>>>
>>>>> Sure. The libusb tests were direct USB Audio Class 1 control transfe=
rs
>>>>> to the headset using libusb/PyUSB, not ALSA mixer operations.
>>>>>
>>>>> I accessed Feature Unit 2 on AudioControl interface 0, master
>>>>> channel 0,
>>>>> with the UAC1 Volume control selector:
>>>>>
>>>>> wValue =3D 0x0200 /* Volume control, master channel */
>>>>> wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
>>>>>
>>>>> I used the standard class-specific requests directly, including
>>>>> GET_CUR,
>>>>> GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-end=
ian
>>>>> volume values in 1/256 dB units.
>>>>>
>>>>> The device reported:
>>>>>
>>>>> GET_CUR: 0 ( 0 dB in that test)
>>>>> GET_MIN: -16384 (-64 dB)
>>>>> GET_MAX: 0 ( 0 dB)
>>>>> GET_RES: 256 ( 1 dB)
>>>>>
>>>>> For the timing tests I issued SET_CUR for a target value and then
>>>>> repeatedly queried GET_CUR until the value changed or the timeout
>>>>> expired.
>>>>>
>>>>> Valid values became visible after roughly:
>>>>>
>>>>> -1 dB ~81 ms
>>>>> -2 dB ~52 ms
>>>>> -4 dB ~47 ms
>>>>> -8 dB ~47 ms
>>>>> -16 dB ~52 ms
>>>>> -32 dB ~47 ms
>>>>>
>>>>> The advertised -64 dB minimum behaved differently: SET_CUR returned
>>>>> successfully, but GET_CUR did not change even after 1000 ms.
>>>>>
>>>>> To access the AudioControl interface with libusb, I unbound the
>>>>> AudioControl interface from snd-usb-audio for the duration of the te=
st.
>>>>>
>>>>> I did not intentionally open a playback stream during those libusb
>>>>> tests. Because the AudioControl interface had been unbound from
>>>>> snd-usb-audio, I also do not believe there was an active ALSA playba=
ck
>>>>> stream at that point.
>>>> Thanks for the information.
>>>>
>>>> Unfortunately, I still don't exactly see why the device behaved
>>>> differently when GET_CUR/SET_CUR requests were sent from snd-usb-audi=
o
>>>> compared to your libusb tests.
>>>>
>>>> snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Could
>>>> you
>>>> test if it breaks your device's GET_CUR?
>>>>
>>>> Maybe comparing them with usbmon can show some clues. You can use
>>>> Wireshark to sniff /dev/usbmon*.
>>>>
>>>> Hint: a Thunderbolt port usually corresponds to a dedicated USB root
>>>> hub.
>>>> If you have one, plug the device to it to get pure usbmon trace resul=
ts
>>>> with no noisy URBs from other devices.
>>>>
>>>> Thanks,
>>>> Rong
>>>>
>>>>> If the open-stream state is important, I can repeat the experiment
>>>>> specifically controlling for playback-stream-open versus
>>>>> playback-stream-closed.
>>>>>
>>>>> Thanks,
>>>>> Alexander
>>>>>
>>>>> Am 16.08.2026 um 15:50 schrieb Rong Zhang:
>>>>>> Hi Alexander,
>>>>>>
>>>>>> On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
>>>>>>> Hi Rong,
>>>>>>>
>>>>>>> I tested the sticky-check part of your patch on the Logitech PRO X
>>>>>>> Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
>>>>>>>
>>>>>>> Since your patch is based on a newer tree, I used a minimal
>>>>>>> backport of
>>>>>>> the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. Th=
e
>>>>>>> GET_CUR-broken handling from the newer tree was not included; GET_=
CUR
>>>>>>> itself succeeds on this device.
>>>>>>>
>>>>>>> Unfortunately, the playback control is still classified as sticky:
>>>>>>>
>>>>>>> 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>>>>>>
>>>>>>> I then instrumented the check and tried an additional diagnostic:
>>>>>>> after
>>>>>>> every successful SET_CUR, wait 100 ms and perform another GET_CUR
>>>>>>> before
>>>>>>> issuing the next SET_CUR.
>>>>>>>
>>>>>>> For the playback volume, the saved value was -3840 and GET_CUR
>>>>>>> remained
>>>>>>> at -3840 for every tested value, even after 100 ms, for example:
>>>>>>>
>>>>>>> test=3D-15104 immediate=3D-3840 after100ms=3D-3840
>>>>>>> test=3D-13824 immediate=3D-3840 after100ms=3D-3840
>>>>>>> test=3D-3584 immediate=3D-3840 after100ms=3D-3840
>>>>>>> test=3D-2304 immediate=3D-3840 after100ms=3D-3840
>>>>>>> test=3D-1024 immediate=3D-3840 after100ms=3D-3840
>>>>>>> test=3D0 immediate=3D-3840 after100ms=3D-3840
>>>>>>>
>>>>>>> So in this case the issue does not appear to be simply that the
>>>>>>> accumulated 10 ms sleeps are too short. During the probe-time stic=
ky
>>>>>>> check, SET_CUR succeeds but GET_CUR for the playback control remai=
ns
>>>>>>> unchanged even when each SET_CUR is given 100 ms before the next o=
ne.
>>>>>>>
>>>>>>> This differs from my previous direct libusb tests with the
>>>>>>> AudioControl
>>>>>>> interface unbound, where valid SET_CUR values became visible throu=
gh
>>>>>>> GET_CUR after roughly 47=E2=80=9381 ms.
>>>>>> Really interesting. Maybe the mixer changes its value only when
>>>>>> there is
>>>>>> an opened playback stream.
>>>>>>
>>>>>> Could you clarify your "libusb tests"?
>>>>>>
>>>>>> Thanks,
>>>>>> Rong
>>>>>>
>>>>>>> The first debug line I saw with |saved=3D0| was from the Mic Captu=
re
>>>>>>> Volume control; that control changed immediately and returned as
>>>>>>> non-sticky. The sequence above with |saved=3D-3840| is the
>>>>>>> problematic PCM
>>>>>>> Playback Volume control.
>>>>>>>
>>>>>>> I'd be happy to test another version or run additional diagnostics=
 if
>>>>>>> useful.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Alexander
>>>>>>>
>>>>>>>
>>>>>>> Am 15.08.2026 um 23:47 schrieb Rong Zhang:
>>>>>>>> Some mixers are asynchronous, and some have broken min/max. They =
are
>>>>>>>> mistakenly considered sticky due to how the check is implemented.
>>>>>>>>
>>>>>>>> Check sticky mixers more precisely by checking approximately 16
>>>>>>>> values
>>>>>>>> and adding a msleep(10) between each check, so that asynchronous
>>>>>>>> mixers
>>>>>>>> have enough time to change the value and mixers with broken
>>>>>>>> min/max are
>>>>>>>> checked properly. Additionally, mark GET_CUR as broken when
>>>>>>>> get_cur_mix_raw() fails, instead of returning successfully.
>>>>>>>>
>>>>>>>> Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
>>>>>>>> Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d1263=
6f4b@gmx.de
>>>>>>>>
>>>>>>>> Signed-off-by: Rong Zhang<i@rong.moe>
>>>>>>>> ---
>>>>>>>>  =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51
>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++-------
>>>>>>>>  =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+), 7 deletions=
(-)
>>>>>>>>
>>>>>>>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>>>>>>>> index 703c118f9d4e..3d0f97730a06 100644
>>>>>>>> --- a/sound/usb/mixer.c
>>>>>>>> +++ b/sound/usb/mixer.c
>>>>>>>> @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct
>>>>>>>> usb_mixer_elem_info *cval, int ch, int idx)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_control(struct
>>>>>>>> usb_mixer_elem_info *cval,
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int channel, int saved)
>>>>>>>>  =C2=A0=C2=A0=C2=A0 {
>>>>>>>> -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cval->min, cva=
l->max };
>>>>>>>> -=C2=A0=C2=A0=C2=A0 int test, check, i;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 int test, check, res;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 values (15 int=
ervals).
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not fine enough,=
 check fewer values.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - cval->min, 1=
5);
>>>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->res) : cval-=
>res;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min) is not a m=
ultiple of
>>>>>>>> cval->res, we still
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max anyway.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < cval->max + r=
es; test +=3D res) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test > cval->max)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 test =3D cval->max;
>>>>>>>>  =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_S=
IZE(sticky_test_values); i++) {
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D sticky_test_=
values[i];
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (test =3D=3D saved)
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>>>>>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur_m=
ix_value(cval, channel, 0, test) ||
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_cur_mix_raw(cval, channel, &check) ||
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 check !=3D saved) /* SET_CUR effective, non-sticky. */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur_m=
ix_value(cval, channel, 0, test))
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(c=
val, channel, &check))
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto get_cur_broken;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check !=3D saved)=
 /* SET_CUR effective, non-sticky. */
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Leave some ti=
me for asynchronous mixers to change the
>>>>>>>> value.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that the=
re is no need to wait between SET_CUR and
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * GET_CUR, as w=
e don't care whether the GET_CUR value
>>>>>>>> matches
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the SET_CUR o=
ne. IOW, what we expect is just a
>>>>>>>> GET_CUR value
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * differing fro=
m the saved one.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Mixers of mos=
t devices are synchronous. The should have
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * returned earl=
y without extra sleep. Asynchronous
>>>>>>>> mixers will
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return once t=
he accumulated time is enough for them
>>>>>>>> to change
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the value.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10);
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>  =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check again after the =
last msleep(). */
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel, &check))
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_cur_broken;
>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval->head.mixer-=
>chip->quirk_flags &
>>>>>>>> QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
>>>>>>>> +get_cur_broken:
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 usb_audio_info(cval->head.mixer->chip,
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%d:=
%d: broken mixer GET_CUR (%d/%d/%d =3D>
>>>>>>>> %d)\n",
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cval=
->head.id,
>>>>>>>> mixer_ctrl_intf(cval->head.mixer),
>>>>>>>>
>>>>>>>> ---
>>>>>>>> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
>>>>>>>> change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Rong
>>>>>>>>
