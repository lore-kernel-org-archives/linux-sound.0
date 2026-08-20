Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CD258EE9;
	Thu, 20 Aug 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238081; cv=none; b=HT+uzRv0tcDK6AnpwUHIqP5gTNCu89RS/zssVEHc3C4gOnleHaRPBNxPcRKVlDAg36bDkBZnyH+XOUltzEv6OmHOAz3DVAo3vs7iv6Hm9M15UlAx/bpQxuGiQ8tDfezTqawEi6OtLD6jdsUc2TdnILXOejEbWMxE91hTsIFJnqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238081; c=relaxed/simple;
	bh=gXUOyILhKog2640RfRRToddVz+6SUUTqtsrTFcj4HOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MePDpckLGnmxYGiN/MwLBz/Jr38487Ui2EUWJBCLNyLFqZ1LZZ2heNueKyT27loyPoxMf4sguSQdHYvjgFw3VLKL6E88dPuG8v1Ol+acHEgbsw4EhtLnbf2267rkYBAMm3IjAGPMB5Hu0wBuu5lXtQ7UweioiAB8ANsiFEVloV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=SxlcMQRB; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="SxlcMQRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787238072; x=1787842872; i=adventurefan@gmx.de;
	bh=lyVqfLn8MfQAQWnyRB/dc4CQ+1aNIX3TMLCCQ6mM6b8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SxlcMQRBrYxgLbZ9u1Shi6Wr8RXQ9/6Lt3yCcBVzXODmxII5kENgMWgasi2K+36q
	 a5EH/oZZBrX8fT8QBcoM2tFw4CMFXLbOmXi/Cs7EvROr724mZAHJKbBc4IB+1d3Ax
	 K5DiqrJrTZeq3HkJdW7GYlLX/++18Yg9/oEEHgUoCt1ReeqGWE2U/PWroD1ve7LR1
	 dH1ZbmU0vWfoAoQrutEgLLgxyvhqUFHhCUHqoyI5jXDwf7pZ6FnfFkwq71R8J6KeD
	 NF+40uecvPNJD+r8U6NDdMAo781TCiSnD4a+akwBlMXgszreJYN4O/qvHSMLd8MjT
	 4vE51q1ghI1o0dlRpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1x0clX1mcd-00GOku; Thu, 20
 Aug 2026 17:01:12 +0200
Message-ID: <3d635888-4004-436f-b488-a683225642d6@gmx.de>
Date: Thu, 20 Aug 2026 17:01:12 +0200
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
 <9dc9681c-a491-46bb-a64c-eccce0150398@gmx.de>
 <f60339edc65efc277986ec01b1134ae8d4c4cd81.camel@rong.moe>
From: Alexander Niemeyer <adventureFAN@gmx.de>
In-Reply-To: <f60339edc65efc277986ec01b1134ae8d4c4cd81.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+61IJLJJYsiNeCBwPc+O7SM4PVjM3SVYuhsic7jv+LbEYjTyEqK
 KM25Gyapi21QBa3qJ4WNLwj5BG4AjBiuLQtYarinzKHehrmyzbh+HnsRAuxeTIBL7lBer8V
 zUj/YT+MT9AddZoEvtYgEScaBIerZwu28RZ9Vn7Fn2IfsX1+FMtVxyeC2hUHFDPWDpirqcg
 4LCJtH+Tm5t0QH7NMy+VQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XScsz4+W+0c=;666vneGsNYdIfUQOa85/GPhSpoL
 +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

Hi Rong,

thanks. I repeated the MIXER_GET_CUR_BROKEN test with the complete
upstream commit and also performed the two additional tests you asked
for.

First, a correction regarding my previous test:

My earlier "minimal backport" of QUIRK_FLAG_MIXER_GET_CUR_BROKEN was
incomplete. In particular, it did not include the get_cur_broken checks
around cache invalidation in snd_usb_mixer_notify_id() and
snd_usb_mixer_interrupt_v2().

I have therefore discarded that result and repeated the test properly.


1. MIXER_GET_CUR_BROKEN with the complete upstream commit

I started from a clean Linux 7.1.8 source tree and applied the complete
upstream commit:

 =C2=A0 ad2c7d2c42af943a3e711bdc1e4fd55b76fcbe55
 =C2=A0 ("ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN")

Before applying it, I verified that the relevant 7.1.8 source files were
byte-identical to freshly extracted copies from the Linux 7.1.8 tarball.

The complete patch then applied with fuzz=3D0. There were only line-number
offsets due to the older source tree.

I also explicitly verified that the resulting source contained the
get_cur_broken handling in both:

 =C2=A0 snd_usb_mixer_notify_id()

and:

 =C2=A0 snd_usb_mixer_interrupt_v2()

The external snd-usb-audio module built successfully for:

 =C2=A0 7.1.8-200.fc44.x86_64

and was signed with my enrolled module-signing key.

I then loaded snd-usb-audio with:

 =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken

The detachable microphone boom was physically attached for this test.

On initialization the kernel reported:

 =C2=A0 2:0: broken mixer GET_CUR (-16384/0/256 =3D> -3840)

and the PCM Playback Volume control remained exposed:

 =C2=A0 Capabilities: pvolume pvolume-joined pswitch pswitch-joined

The initial values were:

 =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A047
 =C2=A0 PipeWire: 0.52

I then turned the physical headset volume wheel significantly down.

Afterwards:

 =C2=A0 ALSA:=C2=A0 =C2=A0 =C2=A031
 =C2=A0 PipeWire: 0.28

KDE's volume OSD also reacted correctly while turning the wheel.

So the previous observation is reproducible even with the complete
QUIRK_FLAG_MIXER_GET_CUR_BROKEN implementation.


2. evtest on the headset Consumer Control interface

I tested:

 =C2=A0 Logitech PRO X Wireless Gaming Headset Consumer Control
 =C2=A0 USB 046d:0aba

The physical volume wheel does emit multimedia key events.

Turning the wheel down produced repeated:

 =C2=A0 KEY_VOLUMEDOWN

events, and turning it up produced repeated:

 =C2=A0 KEY_VOLUMEUP

events.

For example:

 =C2=A0 EV_MSC=C2=A0 MSC_SCAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 c00ea
 =C2=A0 EV_KEY=C2=A0 KEY_VOLUMEDOWN=C2=A0 1

and:

 =C2=A0 EV_MSC=C2=A0 MSC_SCAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 c00e9
 =C2=A0 EV_KEY=C2=A0 KEY_VOLUMEUP=C2=A0 =C2=A0 1

This corrects my earlier observation that evtest did not show volume-key
events.

So your suggestion was correct: the device does emit HID multimedia
volume events.

This also explains why software volume can still follow the physical
wheel even when mixer GET_CUR is treated as broken.


3. Continuous-tone SET_CUR test with the microphone boom detached

For this test I physically detached the microphone boom and replugged
the dongle so that the device initialized in that state.

I stopped the desktop audio services and used ALSA directly.

I played a continuous 1 kHz tone.

The initial playback volume was:

 =C2=A0 43 =3D -20 dB

While the tone continued playing, I issued:

 =C2=A0 23 =3D -40 dB

The tone became quieter immediately when SET_CUR was issued. I could not
perceive any delay between issuing SET_CUR and the physical volume
change.

The amixer command itself completed in approximately 10 ms, but I only
mention that as command timing. I did not measure the actual hardware
latency with instrumentation.

So the useful observation is:

 =C2=A0 Playback SET_CUR -> physical volume change:
 =C2=A0 no perceptible delay


Therefore the current results are:

- Your revised sticky check still classifies the Playback Volume control
 =C2=A0 as sticky, including with the detachable Mic boom attached.

- With the Mic boom detached, Playback SET_CUR is physically effective.

- Playback GET_CUR can remain stale/delayed after SET_CUR in the
 =C2=A0 Mic-detached state.

- The physical response to Playback SET_CUR appears immediate to the
 =C2=A0 listener.

- With the complete MIXER_GET_CUR_BROKEN implementation, physical wheel
 =C2=A0 changes still propagate to PipeWire/KDE.

- The volume wheel emits KEY_VOLUMEUP / KEY_VOLUMEDOWN HID events, which
 =C2=A0 explains how the software volume can follow the wheel without rely=
ing
 =C2=A0 on mixer GET_CUR notifications.


I should also mention that I am not a kernel developer and my technical
knowledge is not sufficient to prepare or review this kind of driver
change on my own. I am using ChatGPT (Plus) to help me understand your tes=
t
requests, prepare the test setup and backports, and make sure I collect
the requested results as carefully as possible.

I still want to help with testing this hardware, so I am happy to
continue running any tests you need and report the observations and raw
results back to you.

Let me know if you would like me to test anything else.

Thanks,
Alexander

Am 20.08.2026 um 14:51 schrieb Rong Zhang:
> Hi Alexander,
>
> Thanks for testing.
>
> On Wed, 2026-08-19 at 20:37 +0200, Alexander Niemeyer wrote:
>> Hi Rong,
>>
>> thanks. I have now completed the three tests you asked for.
>>
>> 1. Your sticky-check patch with the detachable Mic boom attached
>>
>> I tested the same minimal 7.1.8 backport of your ~16-value / 10 ms
>> sticky-check logic again, this time with the detachable microphone boom
>> physically attached.
>>
>> The external snd-usb-audio module was rebuilt and loaded successfully
>> (the module taint was "O"), and the old 100 ms diagnostic changes were
>> removed before this test.
>>
>> The result is still a failure:
>>
>>   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>
>> The PCM control exposes only:
>>
>>   =C2=A0 Capabilities: pswitch pswitch-joined
>>
>> and no Playback Volume control.
>>
>> I repeated this once more with another dongle replug, without changing
>> the module or touching the volume wheel, and got the same result again.
>>
>> So:
>>
>>   =C2=A0 your sticky-check patch + Mic boom attached
>>   =C2=A0 -> still classified as sticky
>>   =C2=A0 -> reproduced twice
>>
> I didn't expect that, but I will take your result anyway. Your device
> seems to have more mysterious behavior, sigh.
>
>> 2. Is Playback SET_CUR really broken after Mic SET_RES with the boom
>> detached?
>>
>> For this test I detached the microphone boom.
>>
>> I used a test version of snd-usb-audio which:
>>
>> - performed the Mic UAC1 resolution probe,
>> - kept the Playback Volume control exposed,
>> - clamped the known-broken advertised -64 dB minimum to -63 dB,
>> - and bypassed the normal ALSA mixer cache so that mixer reads fetch
>>   =C2=A0 GET_CUR from the device.
>>
>> The initial Playback value was:
>>
>>   =C2=A0 43 =3D -20 dB
>>
>> I played a 3-second 1 kHz test tone and listened to its level.
>>
>> Then I requested:
>>
>>   =C2=A0 23 =3D -40 dB
>>
>> The immediate output from the cset operation still showed:
>>
>>   =C2=A0 values=3D43
>>
>> I waited two seconds and issued a fresh cget. It then returned:
>>
>>   =C2=A0 values=3D23
>>
>> I played the exact same test tone again, and the second tone was clearl=
y
>> quieter.
> Just curious: could you play the test tone throughout the entire process
> and see how long does the device need to change its physical volume?
>
>> So Playback SET_CUR is physically effective.
> OK then. I will propose a patch to demote the sticky check to
> informational warning. Before that, I need to reconfirm your test result=
s
> about MIXER_GET_CUR_BROKEN.
>
>> At least in this test, the effect after Mic SET_RES with the boom
>> detached is not that Playback SET_CUR stops working. Instead, GET_CUR
>> can remain stale for some time after SET_CUR and later reflect the
>> actual value.
>>
>> In short:
>>
>>   =C2=A0 before:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043 (-20=
 dB)
>>   =C2=A0 SET_CUR requested:=C2=A0 23 (-40 dB)
>>   =C2=A0 immediate result:=C2=A0 =C2=A043
>>   =C2=A0 GET_CUR after 2 s:=C2=A0 23
>>   =C2=A0 physical volume:=C2=A0 =C2=A0 clearly quieter
>>
>>
>> 3. QUIRK_FLAG_MIXER_GET_CUR_BROKEN and mixer change notifications
>>
>> Linux 7.1.8 does not contain QUIRK_FLAG_MIXER_GET_CUR_BROKEN yet, so fo=
r
>> this test I made a minimal backport of the flag behavior to the otherwi=
se
>> stock 7.1.8 mixer code,
>>
> What was "a minimal backport of the flag behavior"? Commit ad2c7d2c42af
> ("ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN") is already
> minimal and must be backported as a whole.
>
>> without your new sticky-check patch.
>>
>> I loaded snd-usb-audio with:
>>
>>   =C2=A0 quirk_flags=3D046d:0aba:mixer_get_cur_broken
>>
>> The kernel detected the constant GET_CUR condition and kept the Playbac=
k
>> Volume control exposed:
>>
>>   =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>   =C2=A0 PROXTESTC: treating constant GET_CUR as broken
>>
>> For this test the microphone boom was attached.
>>
>> Before turning the physical headset wheel:
>>
>>   =C2=A0 ALSA cget: 56
>>   =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.72
>>
>> I then deliberately turned the physical volume wheel further down.
>>
>> Afterwards:
>>
>>   =C2=A0 ALSA cget: 47
>>   =C2=A0 wpctl:=C2=A0 =C2=A0 =C2=A0Volume 0.52
>>
>> KDE's volume OSD also reacted normally while I turned the wheel.
>>
>> So, on this device, using MIXER_GET_CUR_BROKEN did not break propagatio=
n
>> of physical mixer changes through the audio stack:
>>
>>   =C2=A0 physical wheel
>>   =C2=A0 -> ALSA value changed
>>   =C2=A0 -> PipeWire value changed
>>   =C2=A0 -> KDE OSD reacted normally
> Did you properly backport QUIRK_FLAG_MIXER_GET_CUR_BROKEN? In particular=
,
> did you backport the change in snd_usb_mixer_notify_id()?
>
> If you backported the change properly, your test results imply that your
> device doesn't depend on mixer interrupts at all -- does the volume whee=
l
> emit HID events to ask software to tune the mixer value on its behalf?
> Please try `evtest' to see if it emits multimedia key events.
>
> Thanks,
> Rong
>
>>
>> Therefore the current picture seems to be:
>>
>> - Your revised sticky check still rejects the Playback Volume control,
>>   =C2=A0 both with the detachable Mic boom attached and detached.
>>
>> - With the Mic boom detached, Mic SET_RES can make Playback GET_CUR sta=
y
>>   =C2=A0 stale after a Playback SET_CUR, but Playback SET_CUR itself is=
 still
>>   =C2=A0 physically effective.
>>
>> - At least on this Logitech device, treating GET_CUR as broken did not
>>   =C2=A0 prevent physical wheel changes from reaching ALSA/PipeWire/KDE=
.
>>
>> Let me know what you would like me to test next. I have kept the Fedora
>> test environment and module-signing setup intact.
>>
>> Thanks,
>> Alexander
>>
>> Am 19.08.2026 um 18:39 schrieb Rong Zhang:
>>> Hi Alexander,
>>>
>>> On Tue, 2026-08-18 at 17:24 +0200, Alexander Niemeyer wrote:
>>>> Hi Rong,
>>>>
>>>> one important follow-up to my previous message:
>>>>
>>>> I realized that the detachable microphone boom was not physically con=
nected
>>>> to the headset during the direct libusb tests I reported earlier.
>>>>
>>>> I therefore repeated the relevant tests with the boom microphone atta=
ched,
>>>> and the result changes in an important way.
>>>>
>>>> With the boom microphone attached, on a fresh device:
>>>>
>>>> Mic GET_RES =3D 256
>>>> no SET_RES
>>>>
>>>> Playback:
>>>>    =C2=A0 GET_CUR =3D -3840 (-15 dB)
>>>>    =C2=A0 SET_CUR =3D -2048 (-8 dB)
>>>>    =C2=A0 GET_CUR changes to -2048 after 65.3 ms
>>>>
>>>> Result: PASS
>>>>
>>>> After another power cycle, with the boom still attached:
>>>>
>>>> Mic GET_RES before =3D 256
>>>> Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
>>>> Mic GET_RES after=C2=A0 =3D 256
>>>>
>>>> Playback:
>>>>    =C2=A0 GET_CUR =3D -3840 (-15 dB)
>>>>    =C2=A0 SET_CUR =3D -2048 (-8 dB)
>>>>    =C2=A0 GET_CUR changes to -2048 after 66.3 ms
>>>>
>>>> Result: PASS
>>>>
>>>> I also repeated the complete Mic SET_RES sequence:
>>>>
>>>> SET_RES 128
>>>> SET_RES 64
>>>> SET_RES 32
>>>> SET_RES 16
>>>> SET_RES 8
>>>> SET_RES 4
>>>> SET_RES 2
>>>> SET_RES 1
>>>>
>>>> All requests return success, GET_RES remains 256, and Playback
>>>> SET_CUR(-8 dB)
>>>> still works afterwards, with GET_CUR changing after 76.0 ms.
>>>>
>>>> However, with the boom microphone attached, the stock Fedora 7.1.8
>>>> snd-usb-audio driver still reproduces the original failure:
>>>>
>>>>    =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>>>
>>>> and no PCM Playback Volume control is exposed.
>>> Could you test my patch with Mic attached?
>>>
>>>> So I need to correct the conclusion from my previous message:
>>>>
>>>> The Mic SET_RES behavior is real, but it depends on whether the detac=
hable
>>>> microphone boom is physically connected.
>>>>
>>>> With the boom disconnected:
>>>>    =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequent =
Playback
>>>>    =C2=A0 SET_CUR ineffective for more than 1200 ms.
>>>>
>>>> With the boom connected:
>>>>    =C2=A0 both a single Mic SET_RES(128) and the full SET_RES sequenc=
e leave
>>>>    =C2=A0 Playback SET_CUR working normally.
>>>>
>>> Thanks for your tests.
>>>
>>> Let me conclude:
>>>
>>> - Mic detached: SET_RES on Mic breaks Playback
>>> - Mic attached: SET_RES on Mic breaks nothing
>>>
>>> Still, I doubt if Playback SET_CUR is really broken in the first case.
>>> There is a chance that Playback SET_CUR is effective while GET_CUR
>>> becomes broken.
>>>
>>> Could you test:
>>>
>>> - Leave the Mic detached
>>> - SET_RES on Mic
>>> - GET_CUR on Playback
>>> - Play some audio, listen to it
>>> - SET_CUR on Playback
>>> - GET_CUR on Playback
>>> - Play some audio again, listen to it, and tell if the physical volume
>>> has changed
>>>
>>> The procedure can be achieved by hacking into the snd-usb-audio driver
>>> and nullifying its cache mechanism, so that you can fetch GET_CUR valu=
es
>>> from standard ALSA mixer interface.
>>>
>>> If you can notice physical volume changes, it implies SET_RES on Mic
>>> break Playback GET_CUR without breaking SET_CUR. Otherwise, it break
>>> Playback SET_CUR.
>>>
>>> If it only breaks GET_CUR,=C2=A0it implies the methodology of sticky c=
heck is
>>> problematic. In this case I would probably consider demoting the stick=
y
>>> check's severity.
>>>
>>> I am also thinking about how we should demote the severity. Could you
>>> also test if applying QUIRK_FLAG_MIXER_GET_CUR_BROKEN (without this
>>> patch) breaks mixer change notifications? I.e., tune the volume with t=
he
>>> buttons/knobs on the device and see if the audio stack reflects the
>>> change.=C2=A0I guess it will break the notifications, but I would stil=
l like
>>> to wait for your confirmation.
>>>
>>> Thanks,
>>> Rong
>>>
>>>> Therefore Mic SET_RES alone does not explain the complete snd-usb-aud=
io
>>>> failure in all device configurations. There must be another differenc=
e in
>>>> the full snd-usb-audio initialization path when the boom is attached.
>>>>
>>>> The separate Playback -64 dB minimum issue I reported remains unchang=
ed:
>>>> -64 dB is ineffective, -63 dB works, and attempting -64 dB does not p=
revent
>>>> subsequent valid Playback SET_CUR requests from working.
>>>>
>>>> Sorry for not noticing the detachable-microphone state earlier. I wan=
ted to
>>>> send this correction as soon as I confirmed it.
>>>>
>>>> I still have the usbmon/pcapng captures and can run further targeted =
tests
>>>> if useful.
>>>>
>>>> Thanks,
>>>> Alexander
>>>>
>>>> Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
>>>>> Hi Rong,
>>>>>
>>>>> I think we found the reason for the different behavior.
>>>>>
>>>>> I reproduced the snd-usb-audio initialization sequence step by step
>>>>> with direct libusb UAC1 control transfers and isolated the problem t=
o
>>>>> SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
>>>>>
>>>>> A fresh-device control test looks like this:
>>>>>
>>>>> Mic GET_RES =3D 256
>>>>> no SET_RES
>>>>> Playback:
>>>>> GET_CUR =3D -3840 (-15 dB)
>>>>> SET_CUR =3D -2048 (-8 dB)
>>>>> GET_CUR changes to -2048 after 68.0 ms
>>>>> Result: PASS
>>>>>
>>>>> After another power cycle, I repeated the same test but issued just
>>>>> *one* SET_RES request to the Mic Feature Unit first:
>>>>>
>>>>> Mic GET_RES before =3D 256
>>>>> Mic SET_RES(128) =3D success
>>>>> Mic GET_RES after =3D 256
>>>>> Playback:
>>>>> GET_CUR =3D -3840 (-15 dB)
>>>>> SET_CUR =3D -2048 (-8 dB)
>>>>> GET_CUR remains -3840 for more than 1200 ms
>>>>> Result: FAIL
>>>>>
>>>>> So a single successful |SET_RES(128)| on Feature Unit 3 is sufficien=
t
>>>>> to make subsequent |SET_CUR| requests to the Playback Volume control
>>>>> on Feature Unit 2 ineffective.
>>>>>
>>>>> I also tested the complete Mic SET_RES sequence used by snd-usb-audi=
o:
>>>>>
>>>>> SET_RES 128
>>>>> SET_RES 64
>>>>> SET_RES 32
>>>>> SET_RES 16
>>>>> SET_RES 8
>>>>> SET_RES 4
>>>>> SET_RES 2
>>>>> SET_RES 1
>>>>>
>>>>> All requests return success, while GET_RES remains 256. After that
>>>>> sequence, Playback SET_CUR also remains ineffective for more than 12=
00
>>>>> ms.
>>>>>
>>>>> Interestingly, the Mic control itself still works after this. In an
>>>>> ALSA-like Mic probe I could successfully change Mic Volume from 0 dB
>>>>> to -64 dB and then +1 dB, with GET_CUR reflecting those changes
>>>>> essentially immediately (~0.3 ms). Playback remained broken afterwar=
ds.
>>>>>
>>>>> I also checked whether SET_RES on the Playback Feature Unit itself
>>>>> causes the problem. It does not:
>>>>>
>>>>> Playback GET_RES =3D 256
>>>>> SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
>>>>> GET_RES still =3D 256
>>>>> Playback SET_CUR(-8 dB)
>>>>> GET_CUR changes successfully after 87.7 ms
>>>>>
>>>>> So the problematic operation appears specifically to be *SET_RES on
>>>>> the Mic Feature Unit affecting the Playback Feature Unit*.
>>>>>
>>>>> I also clarified the separate advertised-minimum issue:
>>>>>
>>>>> Playback SET_CUR(-64 dB):
>>>>> no change after >1200 ms
>>>>> followed by SET_CUR(-8 dB):
>>>>> works normally after 54.9 ms
>>>>> Playback SET_CUR(-63 dB):
>>>>> works after 75.8 ms
>>>>> followed by SET_CUR(-8 dB):
>>>>> works after 43.6 ms
>>>>>
>>>>> Therefore the broken -64 dB endpoint does not leave the device in th=
e
>>>>> broken state; it is a separate issue. -63 dB works normally.
>>>>>
>>>>> I also captured usbmon/pcapng traces for both a working direct-libus=
b
>>>>> SET_CUR sequence and the failing snd-usb-audio initialization, so I
>>>>> can send those as well if they are useful.
>>>>>
>>>>> This also seems to explain why the sticky-check changes did not help=
:
>>>>> by the time snd-usb-audio reaches the Playback Volume sticky check,
>>>>> the earlier Mic SET_RES sanity test has already put the device into
>>>>> the state where Playback SET_CUR no longer takes effect.
>>>>>
>>>>> Let me know if you would like me to test a patch or capture any
>>>>> additional traces.
>>>>>
>>>>> Thanks,
>>>>> Alexander
>>>>>
>>>>>
>>>>> Am 16.08.2026 um 17:08 schrieb Rong Zhang:
>>>>>> Hi Alexander,
>>>>>>
>>>>>> On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
>>>>>>> Hi Rong,
>>>>>>>
>>>>>>> Sure. The libusb tests were direct USB Audio Class 1 control trans=
fers
>>>>>>> to the headset using libusb/PyUSB, not ALSA mixer operations.
>>>>>>>
>>>>>>> I accessed Feature Unit 2 on AudioControl interface 0, master
>>>>>>> channel 0,
>>>>>>> with the UAC1 Volume control selector:
>>>>>>>
>>>>>>> wValue =3D 0x0200 /* Volume control, master channel */
>>>>>>> wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
>>>>>>>
>>>>>>> I used the standard class-specific requests directly, including
>>>>>>> GET_CUR,
>>>>>>> GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-e=
ndian
>>>>>>> volume values in 1/256 dB units.
>>>>>>>
>>>>>>> The device reported:
>>>>>>>
>>>>>>> GET_CUR: 0 ( 0 dB in that test)
>>>>>>> GET_MIN: -16384 (-64 dB)
>>>>>>> GET_MAX: 0 ( 0 dB)
>>>>>>> GET_RES: 256 ( 1 dB)
>>>>>>>
>>>>>>> For the timing tests I issued SET_CUR for a target value and then
>>>>>>> repeatedly queried GET_CUR until the value changed or the timeout
>>>>>>> expired.
>>>>>>>
>>>>>>> Valid values became visible after roughly:
>>>>>>>
>>>>>>> -1 dB ~81 ms
>>>>>>> -2 dB ~52 ms
>>>>>>> -4 dB ~47 ms
>>>>>>> -8 dB ~47 ms
>>>>>>> -16 dB ~52 ms
>>>>>>> -32 dB ~47 ms
>>>>>>>
>>>>>>> The advertised -64 dB minimum behaved differently: SET_CUR returne=
d
>>>>>>> successfully, but GET_CUR did not change even after 1000 ms.
>>>>>>>
>>>>>>> To access the AudioControl interface with libusb, I unbound the
>>>>>>> AudioControl interface from snd-usb-audio for the duration of the =
test.
>>>>>>>
>>>>>>> I did not intentionally open a playback stream during those libusb
>>>>>>> tests. Because the AudioControl interface had been unbound from
>>>>>>> snd-usb-audio, I also do not believe there was an active ALSA play=
back
>>>>>>> stream at that point.
>>>>>> Thanks for the information.
>>>>>>
>>>>>> Unfortunately, I still don't exactly see why the device behaved
>>>>>> differently when GET_CUR/SET_CUR requests were sent from snd-usb-au=
dio
>>>>>> compared to your libusb tests.
>>>>>>
>>>>>> snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Cou=
ld
>>>>>> you
>>>>>> test if it breaks your device's GET_CUR?
>>>>>>
>>>>>> Maybe comparing them with usbmon can show some clues. You can use
>>>>>> Wireshark to sniff /dev/usbmon*.
>>>>>>
>>>>>> Hint: a Thunderbolt port usually corresponds to a dedicated USB roo=
t
>>>>>> hub.
>>>>>> If you have one, plug the device to it to get pure usbmon trace res=
ults
>>>>>> with no noisy URBs from other devices.
>>>>>>
>>>>>> Thanks,
>>>>>> Rong
>>>>>>
>>>>>>> If the open-stream state is important, I can repeat the experiment
>>>>>>> specifically controlling for playback-stream-open versus
>>>>>>> playback-stream-closed.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Alexander
>>>>>>>
>>>>>>> Am 16.08.2026 um 15:50 schrieb Rong Zhang:
>>>>>>>> Hi Alexander,
>>>>>>>>
>>>>>>>> On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
>>>>>>>>> Hi Rong,
>>>>>>>>>
>>>>>>>>> I tested the sticky-check part of your patch on the Logitech PRO=
 X
>>>>>>>>> Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
>>>>>>>>>
>>>>>>>>> Since your patch is based on a newer tree, I used a minimal
>>>>>>>>> backport of
>>>>>>>>> the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. =
The
>>>>>>>>> GET_CUR-broken handling from the newer tree was not included; GE=
T_CUR
>>>>>>>>> itself succeeds on this device.
>>>>>>>>>
>>>>>>>>> Unfortunately, the playback control is still classified as stick=
y:
>>>>>>>>>
>>>>>>>>> 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>>>>>>>>
>>>>>>>>> I then instrumented the check and tried an additional diagnostic=
:
>>>>>>>>> after
>>>>>>>>> every successful SET_CUR, wait 100 ms and perform another GET_CU=
R
>>>>>>>>> before
>>>>>>>>> issuing the next SET_CUR.
>>>>>>>>>
>>>>>>>>> For the playback volume, the saved value was -3840 and GET_CUR
>>>>>>>>> remained
>>>>>>>>> at -3840 for every tested value, even after 100 ms, for example:
>>>>>>>>>
>>>>>>>>> test=3D-15104 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>> test=3D-13824 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>> test=3D-3584 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>> test=3D-2304 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>> test=3D-1024 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>> test=3D0 immediate=3D-3840 after100ms=3D-3840
>>>>>>>>>
>>>>>>>>> So in this case the issue does not appear to be simply that the
>>>>>>>>> accumulated 10 ms sleeps are too short. During the probe-time st=
icky
>>>>>>>>> check, SET_CUR succeeds but GET_CUR for the playback control rem=
ains
>>>>>>>>> unchanged even when each SET_CUR is given 100 ms before the next=
 one.
>>>>>>>>>
>>>>>>>>> This differs from my previous direct libusb tests with the
>>>>>>>>> AudioControl
>>>>>>>>> interface unbound, where valid SET_CUR values became visible thr=
ough
>>>>>>>>> GET_CUR after roughly 47=E2=80=9381 ms.
>>>>>>>> Really interesting. Maybe the mixer changes its value only when
>>>>>>>> there is
>>>>>>>> an opened playback stream.
>>>>>>>>
>>>>>>>> Could you clarify your "libusb tests"?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Rong
>>>>>>>>
>>>>>>>>> The first debug line I saw with |saved=3D0| was from the Mic Cap=
ture
>>>>>>>>> Volume control; that control changed immediately and returned as
>>>>>>>>> non-sticky. The sequence above with |saved=3D-3840| is the
>>>>>>>>> problematic PCM
>>>>>>>>> Playback Volume control.
>>>>>>>>>
>>>>>>>>> I'd be happy to test another version or run additional diagnosti=
cs if
>>>>>>>>> useful.
>>>>>>>>>
>>>>>>>>> Best regards,
>>>>>>>>> Alexander
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Am 15.08.2026 um 23:47 schrieb Rong Zhang:
>>>>>>>>>> Some mixers are asynchronous, and some have broken min/max. The=
y are
>>>>>>>>>> mistakenly considered sticky due to how the check is implemente=
d.
>>>>>>>>>>
>>>>>>>>>> Check sticky mixers more precisely by checking approximately 16
>>>>>>>>>> values
>>>>>>>>>> and adding a msleep(10) between each check, so that asynchronou=
s
>>>>>>>>>> mixers
>>>>>>>>>> have enough time to change the value and mixers with broken
>>>>>>>>>> min/max are
>>>>>>>>>> checked properly. Additionally, mark GET_CUR as broken when
>>>>>>>>>> get_cur_mix_raw() fails, instead of returning successfully.
>>>>>>>>>>
>>>>>>>>>> Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
>>>>>>>>>> Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12=
636f4b@gmx.de
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Rong Zhang<i@rong.moe>
>>>>>>>>>> ---
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51
>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++-------
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+), 7 deleti=
ons(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>>>>>>>>>> index 703c118f9d4e..3d0f97730a06 100644
>>>>>>>>>> --- a/sound/usb/mixer.c
>>>>>>>>>> +++ b/sound/usb/mixer.c
>>>>>>>>>> @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct
>>>>>>>>>> usb_mixer_elem_info *cval, int ch, int idx)
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_control(str=
uct
>>>>>>>>>> usb_mixer_elem_info *cval,
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 int channel, int saved)
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 {
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cval->min, c=
val->max };
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0 int test, check, i;
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 int test, check, res;
>>>>>>>>>> +
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 values (15 i=
ntervals).
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not fine enoug=
h, check fewer values.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - cval->min,=
 15);
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->res) : cva=
l->res;
>>>>>>>>>> +
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min) is not a=
 multiple of
>>>>>>>>>> cval->res, we still
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max anyway.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < cval->max +=
 res; test +=3D res) {
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test > cval->ma=
x)
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 test =3D cval->max;
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRA=
Y_SIZE(sticky_test_values); i++) {
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D sticky_tes=
t_values[i];
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (test =3D=3D saved)
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur=
_mix_value(cval, channel, 0, test) ||
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_cur_mix_raw(cval, channel, &check) ||
>>>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 check !=3D saved) /* SET_CUR effective, non-sticky. */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur=
_mix_value(cval, channel, 0, test))
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return 0;
>>>>>>>>>> +
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw=
(cval, channel, &check))
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto get_cur_broken;
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check !=3D save=
d) /* SET_CUR effective, non-sticky. */
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>> +
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Leave some =
time for asynchronous mixers to change the
>>>>>>>>>> value.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that t=
here is no need to wait between SET_CUR and
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * GET_CUR, as=
 we don't care whether the GET_CUR value
>>>>>>>>>> matches
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the SET_CUR=
 one. IOW, what we expect is just a
>>>>>>>>>> GET_CUR value
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * differing f=
rom the saved one.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Mixers of m=
ost devices are synchronous. The should have
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * returned ea=
rly without extra sleep. Asynchronous
>>>>>>>>>> mixers will
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return once=
 the accumulated time is enough for them
>>>>>>>>>> to change
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the value.
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10);
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check again after t=
he last msleep(). */
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel, &check))
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_cur_broken=
;
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>> +
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval->head.mix=
er->chip->quirk_flags &
>>>>>>>>>> QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
>>>>>>>>>> +get_cur_broken:
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 usb_audio_info(cval->head.mixer->chip,
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
%d:%d: broken mixer GET_CUR (%d/%d/%d =3D>
>>>>>>>>>> %d)\n",
>>>>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
val->head.id,
>>>>>>>>>> mixer_ctrl_intf(cval->head.mixer),
>>>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
>>>>>>>>>> change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Rong
>>>>>>>>>>
