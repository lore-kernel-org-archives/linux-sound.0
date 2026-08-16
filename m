Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D713B47DE;
	Sun, 16 Aug 2026 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786893223; cv=pass; b=QkPcWwSC+KUR8GiRBIfwmigorWH3n/5aVxJwJqD0k8Z4DrjtzgLeLQwnhL3s7cd+J1IIm7TWhfRy7R0YkzxQLl5BWpPSQf/bweNlrbmiPNtMH0sdx3j5xQgN1asN0QPVznxiN7UhrJErAgBinNf1QZmZu659AZei7yc0YzCEP+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786893223; c=relaxed/simple;
	bh=p2gDEpXWf5WRIg14luXQm95fV/bj/OrRPmTB0QuVw0g=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UHYkG8GXMe1+znc6eD4AI5o/v6+zh6T8HSg6i75eCuALa6/yyxdZRQAHgZilv6BtkLwngh/1WhU3r0t0KT7fSf2/pOstDOa7XuTZpdzBcww2lnaBXiysq5XmM3L3SIO6+16PIJMHC423SMuvxyL3a6wiGv6N40iB+xZx5/8Jqe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=TyfJuUvN; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="TyfJuUvN"
ARC-Seal: i=1; a=rsa-sha256; t=1786893200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YT1XYC1cw08vqnH0p1vA8/MRcPrBoyJWGzSPBTlwvOrViKfyqXkSBoKhXIx0vpqKcKWKBPleSEWKlYd+YTmIqKsjdxkRvFXhUgwLvdC1a8xjNUSjo4TCjsMC2peJXp3AR2LBx3al4QnHCxt/VmK7murDB5MUzU1j1QPN0noBqnQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786893200; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IfQ9UMGvhRuHJQ2fZ5ZamE9Og/9Ns7WdPQ+wYxxTbZY=; 
	b=I3e7LXe2cwyW9fA/Y2+H6ZwuQF2mqd5eFNC7/t/OZwybhFDM7rV7V2GWE/ZzdP5DG5WU1hmXcI+NZqfkqK+4FR9hkW+lMnKZCgU+J+JDOXS+WILKncvy6EwZD3e0av/aKeC6V6BdVt6kzSi8v1d1ZYn+S9T9tCKCYD+dzt1WqEs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786893200;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=IfQ9UMGvhRuHJQ2fZ5ZamE9Og/9Ns7WdPQ+wYxxTbZY=;
	b=TyfJuUvN3O/MyHxAht+ZOe2/Ri8O0W0zC5V6/fhoLP/wVRqrxPJOvvRQ1PsflczW
	9WtX6HgTKm6MxZ2h8ewJq8pJgbdYkZtivBTFLN6uSFZC3Whq59+sqve53uE98F3z6/2
	2RomcJCBC5pX2bx2cvOK59iKYvpN5QYwdP8+jGbr87Ad0CPxAqcZUiQo0K7l+2/8k6T
	7Ymu4AQ6KFwi6dlgm4j0spB2BK1OccoOfLRjrx42Ft2ZdYB3VClXvvTaNgpp5o6g5kN
	Gn7jKSR6qwvlNy7VNYVy0/fyt2LlcqdjmzwDayvmAp1JXPLZhxxRf8nLb3rN+uGLuxL
	cZGwLnm+3A==
Received: by mx.zohomail.com with SMTPS id 1786893197213275.44428432225686;
	Sun, 16 Aug 2026 08:13:17 -0700 (PDT)
Message-ID: <6acbf6556133790ad093c5c4bb4a451526007e05.camel@rong.moe>
Subject: Re: [PATCH] ALSA: usb-audio: Check sticky mixers precisely
From: Rong Zhang <i@rong.moe>
To: Alexander Niemeyer <adventureFAN@gmx.de>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
References: <20260816-uac-precise-sticky-check-v1-1-00798373dc3c@rong.moe>
		 <d62a54f6-c3dc-4502-b61c-6cdc49fe40f0@gmx.de>
		 <1abcec7c1a99e27f7d354ad35a36761099cfa587.camel@rong.moe>
		 <74ca2e17-8fb8-4ede-8e7e-441be815b5b6@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 23:08:08 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Alexander,

On Sun, 2026-08-16 at 16:09 +0200, Alexander Niemeyer wrote:
> Hi Rong,
>=20
> Sure. The libusb tests were direct USB Audio Class 1 control transfers=
=20
> to the headset using libusb/PyUSB, not ALSA mixer operations.
>=20
> I accessed Feature Unit 2 on AudioControl interface 0, master channel 0,=
=20
> with the UAC1 Volume control selector:
>=20
> wValue =3D 0x0200 /* Volume control, master channel */
> wIndex =3D 0x0200 /* Feature Unit 2, interface 0 */
>=20
> I used the standard class-specific requests directly, including GET_CUR,=
=20
> GET_MIN, GET_MAX, GET_RES and SET_CUR, with signed 16-bit little-endian=
=20
> volume values in 1/256 dB units.
>=20
> The device reported:
>=20
> GET_CUR: 0 ( 0 dB in that test)
> GET_MIN: -16384 (-64 dB)
> GET_MAX: 0 ( 0 dB)
> GET_RES: 256 ( 1 dB)
>=20
> For the timing tests I issued SET_CUR for a target value and then=20
> repeatedly queried GET_CUR until the value changed or the timeout expired=
.
>=20
> Valid values became visible after roughly:
>=20
> -1 dB ~81 ms
> -2 dB ~52 ms
> -4 dB ~47 ms
> -8 dB ~47 ms
> -16 dB ~52 ms
> -32 dB ~47 ms
>=20
> The advertised -64 dB minimum behaved differently: SET_CUR returned=20
> successfully, but GET_CUR did not change even after 1000 ms.
>=20
> To access the AudioControl interface with libusb, I unbound the=20
> AudioControl interface from snd-usb-audio for the duration of the test.
>=20
> I did not intentionally open a playback stream during those libusb=20
> tests. Because the AudioControl interface had been unbound from=20
> snd-usb-audio, I also do not believe there was an active ALSA playback=
=20
> stream at that point.

Thanks for the information.

Unfortunately, I still don't exactly see why the device behaved
differently when GET_CUR/SET_CUR requests were sent from snd-usb-audio
compared to your libusb tests.

snd-usb-audio also tries SET_RES to test the sanity of GET_RES. Could you
test if it breaks your device's GET_CUR?=C2=A0

Maybe comparing them with usbmon can show some clues. You can use
Wireshark to sniff /dev/usbmon*.=20

Hint: a Thunderbolt port usually corresponds to a dedicated USB root hub.
If you have one, plug the device to it to get pure usbmon trace results
with no noisy URBs from other devices.

Thanks,
Rong

>=20
> If the open-stream state is important, I can repeat the experiment=20
> specifically controlling for playback-stream-open versus=20
> playback-stream-closed.
>=20
> Thanks,
> Alexander
>=20
> Am 16.08.2026 um 15:50 schrieb Rong Zhang:
> > Hi Alexander,
> >=20
> > On Sun, 2026-08-16 at 07:14 +0200, Alexander Niemeyer wrote:
> > > Hi Rong,
> > >=20
> > > I tested the sticky-check part of your patch on the Logitech PRO X
> > > Wireless (046d:0aba) on Fedora 44, kernel 7.1.8-200.fc44.x86_64.
> > >=20
> > > Since your patch is based on a newer tree, I used a minimal backport =
of
> > > the new ~16-value / 10 ms sticky-check logic to the 7.1.8 code. The
> > > GET_CUR-broken handling from the newer tree was not included; GET_CUR
> > > itself succeeds on this device.
> > >=20
> > > Unfortunately, the playback control is still classified as sticky:
> > >=20
> > > 2:0: sticky mixer values (-16384/0/256 =3D> -3840), disabling
> > >=20
> > > I then instrumented the check and tried an additional diagnostic: aft=
er
> > > every successful SET_CUR, wait 100 ms and perform another GET_CUR bef=
ore
> > > issuing the next SET_CUR.
> > >=20
> > > For the playback volume, the saved value was -3840 and GET_CUR remain=
ed
> > > at -3840 for every tested value, even after 100 ms, for example:
> > >=20
> > > test=3D-15104 immediate=3D-3840 after100ms=3D-3840
> > > test=3D-13824 immediate=3D-3840 after100ms=3D-3840
> > > test=3D-3584 immediate=3D-3840 after100ms=3D-3840
> > > test=3D-2304 immediate=3D-3840 after100ms=3D-3840
> > > test=3D-1024 immediate=3D-3840 after100ms=3D-3840
> > > test=3D0 immediate=3D-3840 after100ms=3D-3840
> > >=20
> > > So in this case the issue does not appear to be simply that the
> > > accumulated 10 ms sleeps are too short. During the probe-time sticky
> > > check, SET_CUR succeeds but GET_CUR for the playback control remains
> > > unchanged even when each SET_CUR is given 100 ms before the next one.
> > >=20
> > > This differs from my previous direct libusb tests with the AudioContr=
ol
> > > interface unbound, where valid SET_CUR values became visible through
> > > GET_CUR after roughly 47=E2=80=9381 ms.
> > Really interesting. Maybe the mixer changes its value only when there i=
s
> > an opened playback stream.
> >=20
> > Could you clarify your "libusb tests"?
> >=20
> > Thanks,
> > Rong
> >=20
> > > The first debug line I saw with |saved=3D0| was from the Mic Capture
> > > Volume control; that control changed immediately and returned as
> > > non-sticky. The sequence above with |saved=3D-3840| is the problemati=
c PCM
> > > Playback Volume control.
> > >=20
> > > I'd be happy to test another version or run additional diagnostics if
> > > useful.
> > >=20
> > > Best regards,
> > > Alexander
> > >=20
> > >=20
> > > Am 15.08.2026 um 23:47 schrieb Rong Zhang:
> > > > Some mixers are asynchronous, and some have broken min/max. They ar=
e
> > > > mistakenly considered sticky due to how the check is implemented.
> > > >=20
> > > > Check sticky mixers more precisely by checking approximately 16 val=
ues
> > > > and adding a msleep(10) between each check, so that asynchronous mi=
xers
> > > > have enough time to change the value and mixers with broken min/max=
 are
> > > > checked properly. Additionally, mark GET_CUR as broken when
> > > > get_cur_mix_raw() fails, instead of returning successfully.
> > > >=20
> > > > Reported-by: Alexander Niemeyer<adventureFAN@gmx.de>
> > > > Closes:https://lore.kernel.org/r/6262cbbd-d1f2-4c9d-a1c7-9c5d12636f=
4b@gmx.de
> > > > Signed-off-by: Rong Zhang<i@rong.moe>
> > > > ---
> > > >    sound/usb/mixer.c | 51 +++++++++++++++++++++++++++++++++++++++++=
+++-------
> > > >    1 file changed, 44 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > > index 703c118f9d4e..3d0f97730a06 100644
> > > > --- a/sound/usb/mixer.c
> > > > +++ b/sound/usb/mixer.c
> > > > @@ -1256,22 +1256,59 @@ static void init_cur_mix_raw(struct usb_mix=
er_elem_info *cval, int ch, int idx)
> > > >    static int check_sticky_volume_control(struct usb_mixer_elem_inf=
o *cval,
> > > >    				       int channel, int saved)
> > > >    {
> > > > -	int sticky_test_values[] =3D { cval->min, cval->max };
> > > > -	int test, check, i;
> > > > +	int test, check, res;
> > > > +
> > > > +	/*
> > > > +	 * Check approximately 16 values (15 intervals).
> > > > +	 * If the resolution is not fine enough, check fewer values.
> > > > +	 */
> > > > +	res =3D DIV_ROUND_UP(cval->max - cval->min, 15);
> > > > +	res =3D res ? roundup(res, cval->res) : cval->res;
> > > > +
> > > > +	/*
> > > > +	 * If (cval->max - cval->min) is not a multiple of cval->res, we =
still
> > > > +	 * want to test cval->max anyway.
> > > > +	 */
> > > > +	for (test =3D cval->min; test < cval->max + res; test +=3D res) {
> > > > +		if (test > cval->max)
> > > > +			test =3D cval->max;
> > > >   =20
> > > > -	for (i =3D 0; i < ARRAY_SIZE(sticky_test_values); i++) {
> > > > -		test =3D sticky_test_values[i];
> > > >    		if (test =3D=3D saved)
> > > >    			continue;
> > > >   =20
> > > >    		/* Assume non-sticky on failure. */
> > > > -		if (snd_usb_set_cur_mix_value(cval, channel, 0, test) ||
> > > > -		    get_cur_mix_raw(cval, channel, &check) ||
> > > > -		    check !=3D saved) /* SET_CUR effective, non-sticky. */
> > > > +		if (snd_usb_set_cur_mix_value(cval, channel, 0, test))
> > > > +			return 0;
> > > > +
> > > > +		if (get_cur_mix_raw(cval, channel, &check))
> > > > +			goto get_cur_broken;
> > > > +		if (check !=3D saved) /* SET_CUR effective, non-sticky. */
> > > >    			return 0;
> > > > +
> > > > +		/*
> > > > +		 * Leave some time for asynchronous mixers to change the value.
> > > > +		 *
> > > > +		 * Note that there is no need to wait between SET_CUR and
> > > > +		 * GET_CUR, as we don't care whether the GET_CUR value matches
> > > > +		 * the SET_CUR one. IOW, what we expect is just a GET_CUR value
> > > > +		 * differing from the saved one.
> > > > +		 *
> > > > +		 * Mixers of most devices are synchronous. The should have
> > > > +		 * returned early without extra sleep. Asynchronous mixers will
> > > > +		 * return once the accumulated time is enough for them to change
> > > > +		 * the value.
> > > > +		 */
> > > > +		msleep(10);
> > > >    	}
> > > >   =20
> > > > +	/* Check again after the last msleep(). */
> > > > +	if (get_cur_mix_raw(cval, channel, &check))
> > > > +		goto get_cur_broken;
> > > > +	if (check !=3D saved)
> > > > +		return 0;
> > > > +
> > > >    	if (cval->head.mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_GET_=
CUR_BROKEN) {
> > > > +get_cur_broken:
> > > >    		usb_audio_info(cval->head.mixer->chip,
> > > >    			       "%d:%d: broken mixer GET_CUR (%d/%d/%d =3D> %d)\n",
> > > >    			       cval->head.id, mixer_ctrl_intf(cval->head.mixer),
> > > >=20
> > > > ---
> > > > base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
> > > > change-id: 74676fce-uac-precise-sticky-check-94474a22b57d
> > > >=20
> > > > Thanks,
> > > > Rong
> > > >=20
