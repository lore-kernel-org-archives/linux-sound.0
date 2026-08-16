Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7E282F17;
	Sun, 16 Aug 2026 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857290; cv=none; b=AZgNPEBNHNr9fQ05wD7t1kmbLlk7VWFz8vTlD3lIzQepy1AGjMSwlRvXwVZGtiSj5lEQqmsvmrYZUR7wBpuIWQXyahO7vTv3omnyc5VmVi92HmXLn1JScsi0DNSKcttisXX7QUTGMZjhQ6vaX7QOF1CkXyBSo4SwIA67zb/vHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857290; c=relaxed/simple;
	bh=pnmEDTjMpZ8Ys73PqLsy2jrVpgKh+Sb3rVynJJzpSUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juYldwiKE+jvAcQIkl7x/M5UF+O0Im3QnErsawqFOGyrLQ7nSqm6EUrSrPW/7rUUcd93ZhxxTIa/4ziquUqyKXNF5C1rAU6Dzr/rfOSEQSjLymKn6iGCXURsI4HSX6FmPEOqVC1Xbgm83NIuJlGRTjqop6ymYOKCzm+wjBTsWbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b=QL/SajaG; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=adventurefan@gmx.de header.b="QL/SajaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1786857270; x=1787462070; i=adventurefan@gmx.de;
	bh=om5cKKQxoyylXDYSASHe3r1VMKEY/K8HWZzvgqi8AoM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QL/SajaGwzEEErSm4aqDXrG+5ilZAo6m6TPOe7O9GFPl5yutu1mB1BBLWPRajo6Q
	 30M57Gom0BKclVdpu2eLQjNsBy2diMg0dp75MBLh1TYX0+lZt/g8XUu4vuCo2J/gB
	 0C78ZjcmbGYC2Si+QyYlXWZB9cwdSQoRUcPH6rnYe89frl7WSzkdSnUzGY6qqU+m8
	 xOo38Ekf2ex37A9TgaC5yeEp1UI76IXtIdwRwIZV9yy1WcmG40kybIYzobHeq2vtH
	 WyeH5FZHZefu34iY0fTrRg/ZOewHzLF7hBML3TVUXgxb790qvcyabsZRhc9Nq96fW
	 Q90non7G7NOvg1kf5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1wxg7y2MBM-00Dk22; Sun, 16
 Aug 2026 07:14:30 +0200
Message-ID: <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
Date: Sun, 16 Aug 2026 07:14:28 +0200
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
From: Alexander Niemeyer <adventureFAN@gmx.de>
In-Reply-To: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:10m1a9NcMMGfsj3fhh5aBqHiF8UfvLBRBO6tFIfOGGEwLL1sMvD
 GIRfS0yagDCgkq8YL3qsM0vKQi8ObXTSzcWZWHWVVjz3K7kAdsrr5X+8VNXtVz5aBGFdBNz
 X7CKR2TtYukAYgOlLVgbZVfIVlzRN+K/8wt08j95ZdE0g8cwJrxpMeECmYi4oDAoHquy6nh
 suaKiG71rMlFhAerIdfTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C41rTox19f0=;BbS7fYb4ukarEiNof0qugI2F7eJ
 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

Hi Rong,

I tested the sticky-check part of your patch on the Logitech PRO X=20
Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.

Since your patch is based on a newer tree, I used a minimal backport of=20
the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. The=20
GET_CUR-broken handling from the newer tree was not included; GET_CUR=20
itself succeeds on this device.

Unfortunately, the playback control is still classified as sticky:

2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling

I then instrumented the check and tried an additional diagnostic: after=20
every successful SET_CUR, wait 100 ms and perform another GET_CUR before=
=20
issuing the next SET_CUR.

For the playback volume, the saved value was -3840 and GET_CUR remained=20
at -3840 for every tested value, even after 100 ms, for example:

test=3D-15104 immediate=3D-3840 after100ms=3D-3840
test=3D-13824 immediate=3D-3840 after100ms=3D-3840
test=3D-3584 immediate=3D-3840 after100ms=3D-3840
test=3D-2304 immediate=3D-3840 after100ms=3D-3840
test=3D-1024 immediate=3D-3840 after100ms=3D-3840
test=3D0 immediate=3D-3840 after100ms=3D-3840

So in this case the issue does not appear to be simply that the=20
accumulated 10 ms sleeps are too short. During the probe-time sticky=20
check, SET_CUR succeeds but GET_CUR for the playback control remains=20
unchanged even when each SET_CUR is given 100 ms before the next one.

This differs from my previous direct libusb tests with the AudioControl=20
interface unbound, where valid SET_CUR values became visible through=20
GET_CUR after roughly 47=E2=80=9381 ms.

The first debug line I saw with |saved=3D0| was from the Mic Capture=20
Volume control; that control changed immediately and returned as=20
non-sticky. The sequence above with |saved=3D-3840| is the problematic PCM=
=20
Playback Volume control.

I'd be happy to test another version or run additional diagnostics if=20
useful.

Best regards,
Alexander


Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> Some mixers are asynchronous, and some have broken min/max. They are
> mistakenly considered sticky due to how the check is implemented.
>
> Check sticky mixers more precisely by checking approximately 16 values
> and adding a msleep(10) between each check, so that asynchronous mixers
> have enough time to change the value and mixers with broken min/max are
> checked properly. Additionally, mark GET_CUR as broken when
> get_cur_mix_raw() fails, instead of returning successfully.
>
> Reported-by: Alexander Niemeyer <adventureFAN@gmx.de>
> Closes: https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@g=
mx.de
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>   sound/usb/mixer.c | 51 ++++++++++++++++++++++++++++++++++++++++++++---=
=2D---
>   1 file changed, 44 insertions(+), 7 deletions(-)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 703c118f9d4e..3d0f97730a06 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct usb_mixer_el=
em_info *cval, int ch, int idx)
>   static int check_sticky_volume_control(struct usb_mixer_elem_info *cva=
l,
>   				       int channel, int saved)
>   {
> -	int sticky_test_values[] =3D { cval->min, cval->max };
> -	int test, check, i;
> +	int test, check, res;
> +
> +	/*
> +	 * Check approximately 16 values (15 intervals).
> +	 * If the resolution is not fine enough, check fewer values.
> +	 */
> +	res =3D DIV_ROUND_UP(cval->max - cval->min, 15);
> +	res =3D res ? roundup(res, cval->res) : cval->res;
> +
> +	/*
> +	 * If (cval->max - cval->min) is not a multiple of cval->res, we still
> +	 * want to test cval->max anyway.
> +	 */
> +	for (test =3D cval->min; test < cval->max + res; test +=3D res) {
> +		if (test > cval->max)
> +			test =3D cval->max;
>  =20
> -	for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> -		test =3D sticky_test_values[i];
>   		if (test =3D=3D saved)
>   			continue;
>  =20
>   		/* Assume non-sticky on failure. */
> -		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
> -		    get_cur_mix_raw(cval, channel, &check) ||
> -		    check !=3D saved) /* SET_CUR effective, non-sticky. */
> +		if (snd_usb_set_cur_mix_value(cval, channel, 0, test))
> +			return 0;
> +
> +		if (get_cur_mix_raw(cval, channel, &check))
> +			goto get_cur_broken;
> +		if (check !=3D saved) /* SET_CUR effective, non-sticky. */
>   			return 0;
> +
> +		/*
> +		 * Leave some time for asynchronous mixers to change the value.
> +		 *
> +		 * Note that there is no need to wait between SET_CUR and
> +		 * GET_CUR, as we don't care whether the GET_CUR value matches
> +		 * the SET_CUR one. IOW, what we expect is just a GET_CUR value
> +		 * differing from the saved one.
> +		 *
> +		 * Mixers of most devices are synchronous. The should have
> +		 * returned early without extra sleep. Asynchronous mixers will
> +		 * return once the accumulated time is enough for them to change
> +		 * the value.
> +		 */
> +		msleep(10);
>   	}
>  =20
> +	/* Check again after the last msleep(). */
> +	if (get_cur_mix_raw(cval, channel, &check))
> +		goto get_cur_broken;
> +	if (check !=3D saved)
> +		return 0;
> +
>   	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_CUR_BR=
OKEN) {
> +get_cur_broken:
>   		usb_audio_info(cval->head.mixer->chip,
>   			       "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D> %d)\n",
>   			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
>
> ---
> base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
>
> Thanks,
> Rong
>
