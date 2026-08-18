Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDA391E7C;
	Tue, 18 Aug 2026 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064107; cv=none; b=rlGzzfQfHzQwRdQz1aya+6pKa7OJAd+xkQXtrP2RAQG7ky1wqefVqg9bbs/VD0c+KTLUHzkgi9O/IVNVPw34r6Aers6DEUHL52xNvZN2ITmeg0Ei5ELziH/FoCOx+PKDTxqS4h/go0LqFF5q2217f5D/UATdgaB8bQzmBnTCgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064107; c=relaxed/simple;
	bh=MLqm3wgUtHvXcgu2CtnthJzDmCL0nJ+Qb/mzbjIdrYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgN4LSf4QxuvjYwv2b9fpLL9n6RYhogV7lEKc0tTK0X4YwdiCOw771tGDofBsTzvw7N6KhOiN/qF2jt8+gXR/c+39s2k5fywz/0129DxUjQ/dKcX3iQWuOahl58snB88Uwde8Vq40X6x046bJQVkACnFBRjjItCFsshjZe6rX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=avnprOvW; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="avnprOvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787064098; x=1787668898; i=adventurefan@gmx.de;
	bh=+lsmBtf3RFs8lkyDbTN8MmUisCHOzt6MEwgmmzS4ycY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=avnprOvWsmOulw+vYIoupg6tRr+8WInje5VqJrA2SJEqLBwVqazncbxVSdvx3QmD
	 aOyck8bnIcaB/UQB2fs10bhA+Lp31mJ1cMbETN37QZdNgp5qTI5Jbk0No3hDhXtkC
	 6tvz3TKy66gGQT78OY6pzmz2luczXKQlrKNb6aVT/0HSIlF+pNugURNMI4AbxmAWv
	 1fQpdKvfKMhUaLkQloXJf3gs0hOrsOkGFeByEU8K49Ft5dVphQXqfANTCp4SltBlN
	 BDOSKTnONCDCkUutHPLlwIzv9TDyueDFIUOozKE6SKp8JkOLnNquR9IOGO83Ezn9j
	 d4Q9ydvlWm7Ap5oz7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1wdhjC0Etw-00snrA; Tue, 18
 Aug 2026 16:41:38 +0200
Message-ID: <0b04f4ea-03bf-4fad-a467-2b378331137f@gmx.de>
Date: Tue, 18 Aug 2026 16:41:39 +0200
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
From: Alexander Niemeyer <adventureFAN@gmx.de>
In-Reply-To: <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kXFh/DBpvVcd/xEMKJkE94pX4Zc2Ou5EaA+QjERZgqFtdBR6X+V
 NKLQJApvmdnha1bpx2LfvOKkqTjy2xjG1bLxEUPenOwchqc3R+Kylhp6KuUBXY4O/31C5we
 xnEW6AkJZjPFaMT6EQuWxpUCyJIS10AsSfGrLHNQWvhQFXIi5l0s6XRieg6PGnXQYYI7aeS
 h66jUnyT6y//glo98gNLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OvLR4KRgRWo=;WezkSd6sz+VOpKVvVYNjMAeQiN8
 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
 y91ReuCPSF0Tcem9GehQuIDwpp3aaKt7e/8APQ=

Hi Rong,

I think we found the reason for the different behavior.

I reproduced the snd-usb-audio initialization sequence step by step with=
=20
direct libusb UAC1 control transfers and isolated the problem to SET_RES=
=20
on the *Mic Capture Volume control (Feature Unit 3)*.

A fresh-device control test looks like this:

Mic GET_RES =3D 256
no SET_RES
Playback:
GET_CUR =3D -3840 (-15 dB)
SET_CUR =3D -2048 (-8 dB)
GET_CUR changes to -2048 after 68.0 ms
Result: PASS

After another power cycle, I repeated the same test but issued just=20
*one* SET_RES request to the Mic Feature Unit first:

Mic GET_RES before =3D 256
Mic SET_RES(128) =3D success
Mic GET_RES after =3D 256
Playback:
GET_CUR =3D -3840 (-15 dB)
SET_CUR =3D -2048 (-8 dB)
GET_CUR remains -3840 for more than 1200 ms
Result: FAIL

So a single successful |SET_RES(128)| on Feature Unit 3 is sufficient to=
=20
make subsequent |SET_CUR| requests to the Playback Volume control on=20
Feature Unit 2 ineffective.

I also tested the complete Mic SET_RES sequence used by snd-usb-audio:

SET_RES 128
SET_RES 64
SET_RES 32
SET_RES 16
SET_RES 8
SET_RES 4
SET_RES 2
SET_RES 1

All requests return success, while GET_RES remains 256. After that=20
sequence, Playback SET_CUR also remains ineffective for more than 1200 ms.

Interestingly, the Mic control itself still works after this. In an=20
ALSA-like Mic probe I could successfully change Mic Volume from 0 dB to=20
-64 dB and then +1 dB, with GET_CUR reflecting those changes essentially=
=20
immediately (~0.3 ms). Playback remained broken afterwards.

I also checked whether SET_RES on the Playback Feature Unit itself=20
causes the problem. It does not:

Playback GET_RES =3D 256
SET_RES 128 -> 64 -> 32 -> 16 -> 8 -> 4 -> 2 -> 1
GET_RES still =3D 256
Playback SET_CUR(-8 dB)
GET_CUR changes successfully after 87.7 ms

So the problematic operation appears specifically to be *SET_RES on the=20
Mic Feature Unit affecting the Playback Feature Unit*.

I also clarified the separate advertised-minimum issue:

Playback SET_CUR(-64 dB):
no change after >1200 ms
followed by SET_CUR(-8 dB):
works normally after 54.9 ms
Playback SET_CUR(-63 dB):
works after 75.8 ms
followed by SET_CUR(-8 dB):
works after 43.6 ms

Therefore the broken -64 dB endpoint does not leave the device in the=20
broken state; it is a separate issue. -63 dB works normally.

I also captured usbmon/pcapng traces for both a working direct-libusb=20
SET_CUR sequence and the failing snd-usb-audio initialization, so I can=20
send those as well if they are useful.

This also seems to explain why the sticky-check changes did not help: by=
=20
the time snd-usb-audio reaches the Playback Volume sticky check, the=20
earlier Mic SET_RES sanity test has already put the device into the=20
state where Playback SET_CUR no longer takes effect.

Let me know if you would like me to test a patch or capture any=20
additional traces.

Thanks,
Alexander


Am 16.08.2026 um 17:08 schrieb Rong Zhang:
> Hi Alexander,
>
> On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
>> Hi Rong,
>>
>> Sure. The libusb tests were direct USB Audio Class 1 control transfers
>> to the headset using libusb/PyUSB, not ALSA mixer operations.
>>
>> I accessed Feature Unit 2 on AudioControl interface 0, master channel 0=
,
>> with the UAC1 Volume control selector:
>>
>> wValue =3D 0x0200 /* Volume control, master channel */
>> wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
>>
>> I used the standard class-specific requests directly, including GET_CUR=
,
>> GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-endian
>> volume values in 1/256 dB units.
>>
>> The device reported:
>>
>> GET_CUR: 0 ( 0 dB in that test)
>> GET_MIN: -16384 (-64 dB)
>> GET_MAX: 0 ( 0 dB)
>> GET_RES: 256 ( 1 dB)
>>
>> For the timing tests I issued SET_CUR for a target value and then
>> repeatedly queried GET_CUR until the value changed or the timeout expir=
ed.
>>
>> Valid values became visible after roughly:
>>
>> -1 dB ~81 ms
>> -2 dB ~52 ms
>> -4 dB ~47 ms
>> -8 dB ~47 ms
>> -16 dB ~52 ms
>> -32 dB ~47 ms
>>
>> The advertised -64 dB minimum behaved differently: SET_CUR returned
>> successfully, but GET_CUR did not change even after 1000 ms.
>>
>> To access the AudioControl interface with libusb, I unbound the
>> AudioControl interface from snd-usb-audio for the duration of the test.
>>
>> I did not intentionally open a playback stream during those libusb
>> tests. Because the AudioControl interface had been unbound from
>> snd-usb-audio, I also do not believe there was an active ALSA playback
>> stream at that point.
> Thanks for the information.
>
> Unfortunately, I still don't exactly see why the device behaved
> differently when GET_CUR/SET_CUR requests were sent from snd-usb-audio
> compared to your libusb tests.
>
> snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Could yo=
u
> test if it breaks your device's GET_CUR?
>
> Maybe comparing them with usbmon can show some clues. You can use
> Wireshark to sniff /dev/usbmon*.
>
> Hint: a Thunderbolt port usually corresponds to a dedicated USB root hub=
.
> If you have one, plug the device to it to get pure usbmon trace results
> with no noisy URBs from other devices.
>
> Thanks,
> Rong
>
>> If the open-stream state is important, I can repeat the experiment
>> specifically controlling for playback-stream-open versus
>> playback-stream-closed.
>>
>> Thanks,
>> Alexander
>>
>> Am 16.08.2026 um 15:50 schrieb Rong Zhang:
>>> Hi Alexander,
>>>
>>> On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
>>>> Hi Rong,
>>>>
>>>> I tested the sticky-check part of your patch on the Logitech PRO X
>>>> Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
>>>>
>>>> Since your patch is based on a newer tree, I used a minimal backport =
of
>>>> the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. The
>>>> GET_CUR-broken handling from the newer tree was not included; GET_CUR
>>>> itself succeeds on this device.
>>>>
>>>> Unfortunately, the playback control is still classified as sticky:
>>>>
>>>> 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
>>>>
>>>> I then instrumented the check and tried an additional diagnostic: aft=
er
>>>> every successful SET_CUR, wait 100 ms and perform another GET_CUR bef=
ore
>>>> issuing the next SET_CUR.
>>>>
>>>> For the playback volume, the saved value was -3840 and GET_CUR remain=
ed
>>>> at -3840 for every tested value, even after 100 ms, for example:
>>>>
>>>> test=3D-15104 immediate=3D-3840 after100ms=3D-3840
>>>> test=3D-13824 immediate=3D-3840 after100ms=3D-3840
>>>> test=3D-3584 immediate=3D-3840 after100ms=3D-3840
>>>> test=3D-2304 immediate=3D-3840 after100ms=3D-3840
>>>> test=3D-1024 immediate=3D-3840 after100ms=3D-3840
>>>> test=3D0 immediate=3D-3840 after100ms=3D-3840
>>>>
>>>> So in this case the issue does not appear to be simply that the
>>>> accumulated 10 ms sleeps are too short. During the probe-time sticky
>>>> check, SET_CUR succeeds but GET_CUR for the playback control remains
>>>> unchanged even when each SET_CUR is given 100 ms before the next one.
>>>>
>>>> This differs from my previous direct libusb tests with the AudioContr=
ol
>>>> interface unbound, where valid SET_CUR values became visible through
>>>> GET_CUR after roughly 47=E2=80=9381 ms.
>>> Really interesting. Maybe the mixer changes its value only when there =
is
>>> an opened playback stream.
>>>
>>> Could you clarify your "libusb tests"?
>>>
>>> Thanks,
>>> Rong
>>>
>>>> The first debug line I saw with |saved=3D0| was from the Mic Capture
>>>> Volume control; that control changed immediately and returned as
>>>> non-sticky. The sequence above with |saved=3D-3840| is the problemati=
c PCM
>>>> Playback Volume control.
>>>>
>>>> I'd be happy to test another version or run additional diagnostics if
>>>> useful.
>>>>
>>>> Best regards,
>>>> Alexander
>>>>
>>>>
>>>> Am 15.08.2026 um 23:47 schrieb Rong Zhang:
>>>>> Some mixers are asynchronous, and some have broken min/max. They are
>>>>> mistakenly considered sticky due to how the check is implemented.
>>>>>
>>>>> Check sticky mixers more precisely by checking approximately 16 valu=
es
>>>>> and adding a msleep(10) between each check, so that asynchronous mix=
ers
>>>>> have enough time to change the value and mixers with broken min/max =
are
>>>>> checked properly. Additionally, mark GET_CUR as broken when
>>>>> get_cur_mix_raw() fails, instead of returning successfully.
>>>>>
>>>>> Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
>>>>> Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4=
b@gmx.de
>>>>> Signed-off-by: Rong Zhang<i@rong.moe>
>>>>> ---
>>>>>     sound/usb/mixer.c | 51 +++++++++++++++++++++++++++++++++++++++++=
+++-------
>>>>>     1 file changed, 44 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>>>>> index 703c118f9d4e..3d0f97730a06 100644
>>>>> --- a/sound/usb/mixer.c
>>>>> +++ b/sound/usb/mixer.c
>>>>> @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct usb_mixe=
r_elem_info *cval, int ch, int idx)
>>>>>     static int check_sticky_volume_control(struct usb_mixer_elem_inf=
o *cval,
>>>>>     				       int channel, int saved)
>>>>>     {
>>>>> -	int sticky_test_values[] =3D { cval->min, cval->max };
>>>>> -	int test, check, i;
>>>>> +	int test, check, res;
>>>>> +
>>>>> +	/*
>>>>> +	 * Check approximately 16 values (15 intervals).
>>>>> +	 * If the resolution is not fine enough, check fewer values.
>>>>> +	 */
>>>>> +	res =3D DIV_ROUND_UP(cval->max - cval->min, 15);
>>>>> +	res =3D res ? roundup(res, cval->res) : cval->res;
>>>>> +
>>>>> +	/*
>>>>> +	 * If (cval->max - cval->min) is not a multiple of cval->res, we s=
till
>>>>> +	 * want to test cval->max anyway.
>>>>> +	 */
>>>>> +	for (test =3D cval->min; test < cval->max + res; test +=3D res) {
>>>>> +		if (test > cval->max)
>>>>> +			test =3D cval->max;
>>>>>    =20
>>>>> -	for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
>>>>> -		test =3D sticky_test_values[i];
>>>>>     		if (test =3D=3D saved)
>>>>>     			continue;
>>>>>    =20
>>>>>     		/* Assume non-sticky on failure. */
>>>>> -		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
>>>>> -		    get_cur_mix_raw(cval, channel, &check) ||
>>>>> -		    check !=3D saved) /* SET_CUR effective, non-sticky. */
>>>>> +		if (snd_usb_set_cur_mix_value(cval, channel, 0, test))
>>>>> +			return 0;
>>>>> +
>>>>> +		if (get_cur_mix_raw(cval, channel, &check))
>>>>> +			goto get_cur_broken;
>>>>> +		if (check !=3D saved) /* SET_CUR effective, non-sticky. */
>>>>>     			return 0;
>>>>> +
>>>>> +		/*
>>>>> +		 * Leave some time for asynchronous mixers to change the value.
>>>>> +		 *
>>>>> +		 * Note that there is no need to wait between SET_CUR and
>>>>> +		 * GET_CUR, as we don't care whether the GET_CUR value matches
>>>>> +		 * the SET_CUR one. IOW, what we expect is just a GET_CUR value
>>>>> +		 * differing from the saved one.
>>>>> +		 *
>>>>> +		 * Mixers of most devices are synchronous. The should have
>>>>> +		 * returned early without extra sleep. Asynchronous mixers will
>>>>> +		 * return once the accumulated time is enough for them to change
>>>>> +		 * the value.
>>>>> +		 */
>>>>> +		msleep(10);
>>>>>     	}
>>>>>    =20
>>>>> +	/* Check again after the last msleep(). */
>>>>> +	if (get_cur_mix_raw(cval, channel, &check))
>>>>> +		goto get_cur_broken;
>>>>> +	if (check !=3D saved)
>>>>> +		return 0;
>>>>> +
>>>>>     	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_=
CUR_BROKEN) {
>>>>> +get_cur_broken:
>>>>>     		usb_audio_info(cval->head.mixer->chip,
>>>>>     			       "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D> %d)\n",
>>>>>     			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
>>>>>
>>>>> ---
>>>>> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
>>>>> change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
>>>>>
>>>>> Thanks,
>>>>> Rong
>>>>>
