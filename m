Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4C0282F1E;
	Tue, 18 Aug 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066674; cv=none; b=mMYr3c8l5Wt3Fagc+o5gww+3LP+osDRQjRFS+ak9xr/2pkcHAxg40aHfuDunsJndNs+8KS7gn6iOM9wIDmFRzPErUqwLpWbe+s/Zl0XoX7ajHWj9AcdDnuLX46Hk0z7hB7kOTOwQ3T8WiM4BDmEHULpZPp7WvMOEL4sKD4q31Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066674; c=relaxed/simple;
	bh=YX4JZIJeAlFBwMqpCGocA4Qrm98WZhGTykvTmWOpA70=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=o3BRe7XpVshmFdIVRE0TQeJVHulQ3Re0JjlCG6O/8LYuEyvlYnUd1fHJzSt1Y5QMRUFwRKnudPzXxc80O0DcrSYBZC6JSC7CljoRb08tIpGGhVo/m4Gz71d7/xf/RyWlFPA7IGKiURP30VvaIax52NYzhTq53etZ3/17cAsE02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=I1qShOH4; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="I1qShOH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787066653; x=1787671453; i=adventurefan@gmx.de;
	bh=YX4JZIJeAlFBwMqpCGocA4Qrm98WZhGTykvTmWOpA70=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=I1qShOH4e2ZUz4qIOirVPnN/1T+bPR2lx7JBIx/E2koGfp5qIYD7QcSEsLH4JlXG
	 4Ys3kdRB0jlLf9ubGz5V+xRwuCznT/mo/KUJBVqAXD+KcB239k0LwLnMzbL9PGkW7
	 D8q+zcBbLsNdSN5BjP6p8bDV92lPsoqg4UyECkNAj7UzpzeaWPJOhWbJJtAMc1S2j
	 bvvbXoY9MvF93YVGoqrsEaKOcy4UR3tL00n/dW2y60dxOQF/k3YQaYmfn/vqnFpKL
	 /GQ9NvRvbAujFJlkuxd0m48Z/6H/4ALHzDgZlAGQebL2QxBDxCcfghspn9Eckl+IA
	 IJ1aCCqrhnSQR0yarA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1weY8Y2XYN-00ylje; Tue, 18
 Aug 2026 17:24:13 +0200
Message-ID: <7984832b-86f6-4934-bfc0-1ed70218973a@gmx.de>
Date: Tue, 18 Aug 2026 17:24:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Alexander Niemeyer <adventureFAN@gmx.de>
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
In-Reply-To: <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:csqlmxvXWVzymzpcHLTHvrrJKrL5wzsKpZYyclp3QsIHObUCH5c
 LWy2xzTIV4xeAA/B7bYVWQFhCQ/7+ItLeKR4zm923H/x5Zxadg2bT8eRk1yxtNctl+zowZJ
 8Ok2Rpxx05EWg7Xo64W0xMCxdAbNwOiA3sPrl7LpeJ15RFsyEjZDYWgolWN1t7nXFZIkuR/
 4/DukUAVhTW6UqCy3OwcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wwnSdd2m6Ow=;aClahTVfNgDCRJUBlrxBqyvSHyJ
 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

Hi Rong,

one important follow-up to my previous message:

I realized that the detachable microphone boom was not physically connecte=
d
to the headset during the direct libusb tests I reported earlier.

I therefore repeated the relevant tests with the boom microphone attached,
and the result changes in an important way.

With the boom microphone attached, on a fresh device:

Mic GET_RES =3D 256
no SET_RES

Playback:
 =C2=A0 GET_CUR =3D -3840 (-15 dB)
 =C2=A0 SET_CUR =3D -2048 (-8 dB)
 =C2=A0 GET_CUR changes to -2048 after 65.3 ms

Result: PASS

After another power cycle, with the boom still attached:

Mic GET_RES before =3D 256
Mic SET_RES(128)=C2=A0 =C2=A0 =3D success
Mic GET_RES after=C2=A0 =3D 256

Playback:
 =C2=A0 GET_CUR =3D -3840 (-15 dB)
 =C2=A0 SET_CUR =3D -2048 (-8 dB)
 =C2=A0 GET_CUR changes to -2048 after 66.3 ms

Result: PASS

I also repeated the complete Mic SET_RES sequence:

SET_RES 128
SET_RES 64
SET_RES 32
SET_RES 16
SET_RES 8
SET_RES 4
SET_RES 2
SET_RES 1

All requests return success, GET_RES remains 256, and Playback=20
SET_CUR(-8 dB)
still works afterwards, with GET_CUR changing after 76.0 ms.

However, with the boom microphone attached, the stock Fedora 7.1.8
snd-usb-audio driver still reproduces the original failure:

 =C2=A0 sticky mixer values (-16384/0/256 =3D> -3840), disabling

and no PCM Playback Volume control is exposed.

So I need to correct the conclusion from my previous message:

The Mic SET_RES behavior is real, but it depends on whether the detachable
microphone boom is physically connected.

With the boom disconnected:
 =C2=A0 a single Mic SET_RES(128) is sufficient to make subsequent Playbac=
k
 =C2=A0 SET_CUR ineffective for more than 1200 ms.

With the boom connected:
 =C2=A0 both a single Mic SET_RES(128) and the full SET_RES sequence leave
 =C2=A0 Playback SET_CUR working normally.

Therefore Mic SET_RES alone does not explain the complete snd-usb-audio
failure in all device configurations. There must be another difference in
the full snd-usb-audio initialization path when the boom is attached.

The separate Playback -64 dB minimum issue I reported remains unchanged:
-64 dB is ineffective, -63 dB works, and attempting -64 dB does not preven=
t
subsequent valid Playback SET_CUR requests from working.

Sorry for not noticing the detachable-microphone state earlier. I wanted t=
o
send this correction as soon as I confirmed it.

I still have the usbmon/pcapng captures and can run further targeted tests
if useful.

Thanks,
Alexander

Am 18.08.2026 um 16:41 schrieb Alexander Niemeyer:
> Hi Rong,
>
> I think we found the reason for the different behavior.
>
> I reproduced the snd-usb-audio initialization sequence step by step=20
> with direct libusb UAC1 control transfers and isolated the problem to=20
> SET_RES on the *Mic Capture Volume control (Feature Unit 3)*.
>
> A fresh-device control test looks like this:
>
> Mic GET_RES =3D 256
> no SET_RES
> Playback:
> GET_CUR =3D -3840 (-15 dB)
> SET_CUR =3D -2048 (-8 dB)
> GET_CUR changes to -2048 after 68.0 ms
> Result: PASS
>
> After another power cycle, I repeated the same test but issued just=20
> *one* SET_RES request to the Mic Feature Unit first:
>
> Mic GET_RES before =3D 256
> Mic SET_RES(128) =3D success
> Mic GET_RES after =3D 256
> Playback:
> GET_CUR =3D -3840 (-15 dB)
> SET_CUR =3D -2048 (-8 dB)
> GET_CUR remains -3840 for more than 1200 ms
> Result: FAIL
>
> So a single successful |SET_RES(128)| on Feature Unit 3 is sufficient=20
> to make subsequent |SET_CUR| requests to the Playback Volume control=20
> on Feature Unit 2 ineffective.
>
> I also tested the complete Mic SET_RES sequence used by snd-usb-audio:
>
> SET_RES 128
> SET_RES 64
> SET_RES 32
> SET_RES 16
> SET_RES 8
> SET_RES 4
> SET_RES 2
> SET_RES 1
>
> All requests return success, while GET_RES remains 256. After that=20
> sequence, Playback SET_CUR also remains ineffective for more than 1200=
=20
> ms.
>
> Interestingly, the Mic control itself still works after this. In an=20
> ALSA-like Mic probe I could successfully change Mic Volume from 0 dB=20
> to -64 dB and then +1 dB, with GET_CUR reflecting those changes=20
> essentially immediately (~0.3 ms). Playback remained broken afterwards.
>
> I also checked whether SET_RES on the Playback Feature Unit itself=20
> causes the problem. It does not:
>
> Playback GET_RES =3D 256
> SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
> GET_RES still =3D 256
> Playback SET_CUR(-8 dB)
> GET_CUR changes successfully after 87.7 ms
>
> So the problematic operation appears specifically to be *SET_RES on=20
> the Mic Feature Unit affecting the Playback Feature Unit*.
>
> I also clarified the separate advertised-minimum issue:
>
> Playback SET_CUR(-64 dB):
> no change after >1200 ms
> followed by SET_CUR(-8 dB):
> works normally after 54.9 ms
> Playback SET_CUR(-63 dB):
> works after 75.8 ms
> followed by SET_CUR(-8 dB):
> works after 43.6 ms
>
> Therefore the broken -64 dB endpoint does not leave the device in the=20
> broken state; it is a separate issue. -63 dB works normally.
>
> I also captured usbmon/pcapng traces for both a working direct-libusb=20
> SET_CUR sequence and the failing snd-usb-audio initialization, so I=20
> can send those as well if they are useful.
>
> This also seems to explain why the sticky-check changes did not help:=20
> by the time snd-usb-audio reaches the Playback Volume sticky check,=20
> the earlier Mic SET_RES sanity test has already put the device into=20
> the state where Playback SET_CUR no longer takes effect.
>
> Let me know if you would like me to test a patch or capture any=20
> additional traces.
>
> Thanks,
> Alexander
>
>
> Am 16.08.2026 um 17:08 schrieb Rong Zhang:
>> Hi Alexander,
>>
>> On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
>>> Hi Rong,
>>>
>>> Sure. The libusb tests were direct USB Audio Class 1 control transfers
>>> to the headset using libusb/PyUSB, not ALSA mixer operations.
>>>
>>> I accessed Feature Unit 2 on AudioControl interface 0, master=20
>>> channel 0,
>>> with the UAC1 Volume control selector:
>>>
>>> wValue =3D 0x0200 /* Volume control, master channel */
>>> wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
>>>
>>> I used the standard class-specific requests directly, including=20
>>> GET_CUR,
>>> GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-endia=
n
>>> volume values in 1/256 dB units.
>>>
>>> The device reported:
>>>
>>> GET_CUR: 0 ( 0 dB in that test)
>>> GET_MIN: -16384 (-64 dB)
>>> GET_MAX: 0 ( 0 dB)
>>> GET_RES: 256 ( 1 dB)
>>>
>>> For the timing tests I issued SET_CUR for a target value and then
>>> repeatedly queried GET_CUR until the value changed or the timeout=20
>>> expired.
>>>
>>> Valid values became visible after roughly:
>>>
>>> -1 dB ~81 ms
>>> -2 dB ~52 ms
>>> -4 dB ~47 ms
>>> -8 dB ~47 ms
>>> -16 dB ~52 ms
>>> -32 dB ~47 ms
>>>
>>> The advertised -64 dB minimum behaved differently: SET_CUR returned
>>> successfully, but GET_CUR did not change even after 1000 ms.
>>>
>>> To access the AudioControl interface with libusb, I unbound the
>>> AudioControl interface from snd-usb-audio for the duration of the test=
.
>>>
>>> I did not intentionally open a playback stream during those libusb
>>> tests. Because the AudioControl interface had been unbound from
>>> snd-usb-audio, I also do not believe there was an active ALSA playback
>>> stream at that point.
>> Thanks for the information.
>>
>> Unfortunately, I still don't exactly see why the device behaved
>> differently when GET_CUR/SET_CUR requests were sent from snd-usb-audio
>> compared to your libusb tests.
>>
>> snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Could=
=20
>> you
>> test if it breaks your device's GET_CUR?
>>
>> Maybe comparing them with usbmon can show some clues. You can use
>> Wireshark to sniff /dev/usbmon*.
>>
>> Hint: a Thunderbolt port usually corresponds to a dedicated USB root=20
>> hub.
>> If you have one, plug the device to it to get pure usbmon trace results
>> with no noisy URBs from other devices.
>>
>> Thanks,
>> Rong
>>
>>> If the open-stream state is important, I can repeat the experiment
>>> specifically controlling for playback-stream-open versus
>>> playback-stream-closed.
>>>
>>> Thanks,
>>> Alexander
>>>
>>> Am 16.08.2026 um 15:50 schrieb Rong Zhang:
>>>> Hi Alexander,
>>>>
>>>> On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
>>>>> Hi Rong,
>>>>>
>>>>> I tested the sticky-check part of your patch on the Logitech PRO X
>>>>> Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
>>>>>
>>>>> Since your patch is based on a newer tree, I used a minimal=20
>>>>> backport of
>>>>> the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. The
>>>>> GET_CUR-broken handling from the newer tree was not included; GET_CU=
R
>>>>> itself succeeds on this device.
>>>>>
>>>>> Unfortunately, the playback control is still classified as sticky:
>>>>>
>>>>> 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>>>>
>>>>> I then instrumented the check and tried an additional diagnostic:=20
>>>>> after
>>>>> every successful SET_CUR, wait 100 ms and perform another GET_CUR=20
>>>>> before
>>>>> issuing the next SET_CUR.
>>>>>
>>>>> For the playback volume, the saved value was -3840 and GET_CUR=20
>>>>> remained
>>>>> at -3840 for every tested value, even after 100 ms, for example:
>>>>>
>>>>> test=3D-15104 immediate=3D-3840 after100ms=3D-3840
>>>>> test=3D-13824 immediate=3D-3840 after100ms=3D-3840
>>>>> test=3D-3584 immediate=3D-3840 after100ms=3D-3840
>>>>> test=3D-2304 immediate=3D-3840 after100ms=3D-3840
>>>>> test=3D-1024 immediate=3D-3840 after100ms=3D-3840
>>>>> test=3D0 immediate=3D-3840 after100ms=3D-3840
>>>>>
>>>>> So in this case the issue does not appear to be simply that the
>>>>> accumulated 10 ms sleeps are too short. During the probe-time sticky
>>>>> check, SET_CUR succeeds but GET_CUR for the playback control remains
>>>>> unchanged even when each SET_CUR is given 100 ms before the next one=
.
>>>>>
>>>>> This differs from my previous direct libusb tests with the=20
>>>>> AudioControl
>>>>> interface unbound, where valid SET_CUR values became visible through
>>>>> GET_CUR after roughly 47=E2=80=9381 ms.
>>>> Really interesting. Maybe the mixer changes its value only when=20
>>>> there is
>>>> an opened playback stream.
>>>>
>>>> Could you clarify your "libusb tests"?
>>>>
>>>> Thanks,
>>>> Rong
>>>>
>>>>> The first debug line I saw with |saved=3D0| was from the Mic Capture
>>>>> Volume control; that control changed immediately and returned as
>>>>> non-sticky. The sequence above with |saved=3D-3840| is the=20
>>>>> problematic PCM
>>>>> Playback Volume control.
>>>>>
>>>>> I'd be happy to test another version or run additional diagnostics i=
f
>>>>> useful.
>>>>>
>>>>> Best regards,
>>>>> Alexander
>>>>>
>>>>>
>>>>> Am 15.08.2026 um 23:47 schrieb Rong Zhang:
>>>>>> Some mixers are asynchronous, and some have broken min/max. They ar=
e
>>>>>> mistakenly considered sticky due to how the check is implemented.
>>>>>>
>>>>>> Check sticky mixers more precisely by checking approximately 16=20
>>>>>> values
>>>>>> and adding a msleep(10) between each check, so that asynchronous=20
>>>>>> mixers
>>>>>> have enough time to change the value and mixers with broken=20
>>>>>> min/max are
>>>>>> checked properly. Additionally, mark GET_CUR as broken when
>>>>>> get_cur_mix_raw() fails, instead of returning successfully.
>>>>>>
>>>>>> Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
>>>>>> Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f=
4b@gmx.de=20
>>>>>>
>>>>>> Signed-off-by: Rong Zhang<i@rong.moe>
>>>>>> ---
>>>>>> =C2=A0=C2=A0=C2=A0 sound/usb/mixer.c | 51=20
>>>>>> ++++++++++++++++++++++++++++++++++++++++++++-------
>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 44 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>>>>>> index 703c118f9d4e..3d0f97730a06 100644
>>>>>> --- a/sound/usb/mixer.c
>>>>>> +++ b/sound/usb/mixer.c
>>>>>> @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct=20
>>>>>> usb_mixer_elem_info *cval, int ch, int idx)
>>>>>> =C2=A0=C2=A0=C2=A0 static int check_sticky_volume_control(struct=20
>>>>>> usb_mixer_elem_info *cval,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 int channel, int saved)
>>>>>> =C2=A0=C2=A0=C2=A0 {
>>>>>> -=C2=A0=C2=A0=C2=A0 int sticky_test_values[] =3D { cval->min, cval-=
>max };
>>>>>> -=C2=A0=C2=A0=C2=A0 int test, check, i;
>>>>>> +=C2=A0=C2=A0=C2=A0 int test, check, res;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Check approximately 16 values (15 inter=
vals).
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the resolution is not fine enough, c=
heck fewer values.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D DIV_ROUND_UP(cval->max - cval->min, 15)=
;
>>>>>> +=C2=A0=C2=A0=C2=A0 res =3D res ? roundup(res, cval->res) : cval->r=
es;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If (cval->max - cval->min) is not a mul=
tiple of=20
>>>>>> cval->res, we still
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * want to test cval->max anyway.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0 for (test =3D cval->min; test < cval->max + res=
; test +=3D res) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test > cval->max)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 test =3D cval->max;
>>>>>> =C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE=
(sticky_test_values); i++) {
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test =3D sticky_test_va=
lues[i];
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (test =3D=3D saved)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* Assume non-sticky on failure. */
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur_mix=
_value(cval, channel, 0, test) ||
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 get_cur_mix_raw(cval, channel, &check) ||
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 check !=3D saved) /* SET_CUR effective, non-sticky. */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (snd_usb_set_cur_mix=
_value(cval, channel, 0, test))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return 0;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cva=
l, channel, &check))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto get_cur_broken;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (check !=3D saved) /=
* SET_CUR effective, non-sticky. */
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Leave some time=
 for asynchronous mixers to change the=20
>>>>>> value.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that there=
 is no need to wait between SET_CUR and
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * GET_CUR, as we =
don't care whether the GET_CUR value=20
>>>>>> matches
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the SET_CUR one=
. IOW, what we expect is just a=20
>>>>>> GET_CUR value
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * differing from =
the saved one.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Mixers of most =
devices are synchronous. The should have
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * returned early =
without extra sleep. Asynchronous=20
>>>>>> mixers will
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * return once the=
 accumulated time is enough for them=20
>>>>>> to change
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the value.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msleep(10);
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> =C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Check again after the las=
t msleep(). */
>>>>>> +=C2=A0=C2=A0=C2=A0 if (get_cur_mix_raw(cval, channel, &check))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto get_cur_broken;
>>>>>> +=C2=A0=C2=A0=C2=A0 if (check !=3D saved)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (cval->head.mixer->ch=
ip->quirk_flags &=20
>>>>>> QUIRK_FLAG_MIXER_GET_CUR_BROKEN) {
>>>>>> +get_cur_broken:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
usb_audio_info(cval->head.mixer->chip,
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%d:%d:=
 broken mixer GET_CUR (%d/%d/%d =3D>=20
>>>>>> %d)\n",
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cval->h=
ead.id,=20
>>>>>> mixer_ctrl_intf(cval->head.mixer),
>>>>>>
>>>>>> ---
>>>>>> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
>>>>>> change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
>>>>>>
>>>>>> Thanks,
>>>>>> Rong
>>>>>>
