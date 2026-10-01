Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC038DC6C
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835566; cv=none; b=W4AjXFUkdw0Xe8iORITZByIH30appvoEQdK4L705ZW6NWY3NrIhn4c2jOg9Skc5Gkop3PKR0MIaraOA4btpmmkzJswofbMgihgR+ika6Ee5i87o8mZe3JqYBLtmSCC0fvFqwVKAtaFgRKJqjt1XOerWroMTA4jM2abTFvIyBAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835566; c=relaxed/simple;
	bh=XgOZL8VL7t8WMhOEN+UNXwfg7OTwlqhbVy0JzjyeRL8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JovZFijkv2Wc69RsmB8L9BfGZ0qAxicHBy3v+fXiwubuLaShZDC0cEfMVNhq7jBl0W5OuKQmjFIRJPYrg0Nbt3MWdr59o0QI+CsgtoT+7/NUPvC/YEX/mO1SvRQOstsy8od4j30YpAsSrd4UaD+vcExd/f7pchqLCP3MjgqL3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fPUs9rlo; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fPUs9rlo"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6916Ifh762714209, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790835522; bh=9ZSglyz/2PA/M6l9tvrwTy4CGBHafjl2+NswqSOJdpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fPUs9rlot50l4gxCfxAWAPz/fS7e0uryM5QSOX7bxvS+BfirxvQJCz4Cz3OhpkFpr
	 J6fFMsdD3zzLIoFuGIDs8/k5fC4Cx21tKDDbBaXAQdE1JKgKifpMgDWHqRHY+Av8Q7
	 mCrZyskiVsX08q8i4Uus7B+SZVhDG/Uwgh3gZR8j+hWsejDtC2LpdXcDsDjgSFXdzC
	 JHd1lFNyfMG2IIke5KrXQDtgsgCRn42oIKBVGiaptr2ejK6Z+7GyQ6ZlS0EIw2UhC7
	 uFksO39a3ri7ZEeGM8zMBBj98Lfarprbmtpz18ugaiKa+tME5XBrR+ralqCd6GLkuY
	 JuBjXrAYOM4Og==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6916Ifh762714209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Oct 2026 14:18:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 14:18:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Thu, 1 Oct 2026 14:18:41 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, Zeyu Li <13776528859@163.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: RE: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
Thread-Topic: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode
Thread-Index: AQHdT0f361EnBtapw02eXzCCvoImG7boOi9A
Date: Thu, 1 Oct 2026 06:18:41 +0000
Message-ID: <f67a320a35814d6eab280dc65d04e039@realtek.com>
References: <20260926140336.27896-1-13776528859@163.com>
 <8733ut5ylq.wl-tiwai@suse.de>
In-Reply-To: <8733ut5ylq.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



-----Original Message-----
From: Takashi Iwai <tiwai@suse.de>=20
Sent: Monday, September 28, 2026 8:50 PM
To: Zeyu Li <13776528859@163.com>
Cc: linux-sound@vger.kernel.org; Takashi Iwai <tiwai@suse.com>; Jaroslav Ky=
sela <perex@perex.cz>; Kailang <kailang@realtek.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add ALC235 support for headset mode


External mail : This email originated from outside the organization. Do not=
 reply, click links, or open attachments unless you recognize the sender an=
d know the content is safe.



On Sat, 26 Sep 2026 15:58:00 +0200,
Zeyu Li wrote:
>
> The ALC235 (0x10ec0235) is registered as the ALC255 codec variant in=20
> patch_alc269(), but the headset mode functions were missing a case for=20
> it, so the CTIA/OMTP jack type detection and routing never ran on this=20
> codec. As a result, a plugged-in headset is detected (jack presence=20
> works) but the microphone signal is never routed, leaving the capture=20
> stream permanently silent.
>
> Verified on an ASUS M5451GA laptop (HDA:10ec0235,10431814): with the
> ALC255 coef sequence applied, the headset microphone works correctly.
>
> Signed-off-by: Zeyu Li <13776528859@163.com>
> ---
>  sound/hda/codecs/realtek/realtek.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/hda/codecs/realtek/realtek.c=20
> b/sound/hda/codecs/realtek/realtek.c
> index db365a746..bc5226fad 100644
> --- a/sound/hda/codecs/realtek/realtek.c
> +++ b/sound/hda/codecs/realtek/realtek.c
> @@ -1292,6 +1292,7 @@ static void alc_headset_mode_unplugged(struct hda_c=
odec *codec)
>       }
>
>       switch (codec->core.vendor_id) {
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_process_coef_fw(codec, coef0255);
>               break;
> @@ -1407,6 +1408,7 @@ static void alc_headset_mode_mic_in(struct hda_code=
c *codec, hda_nid_t hp_pin,
>       };
>
>       switch (codec->core.vendor_id) {
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_write_coef_idx(codec, 0x45, 0xc489);
>               snd_hda_set_pin_ctl_cache(codec, hp_pin, 0); @@ -1562,6=20
> +1564,7 @@ static void alc_headset_mode_default(struct hda_codec *codec)
>               alc_process_coef_fw(codec, coef0225);
>               alc_hp_enable_unmute(codec, 75);
>               break;
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_process_coef_fw(codec, coef0255);
>               break;
> @@ -1663,6 +1666,7 @@ static void alc_headset_mode_ctia(struct hda_codec =
*codec)
>       };
>
>       switch (codec->core.vendor_id) {
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_process_coef_fw(codec, coef0255);
>               break;
> @@ -1780,6 +1784,7 @@ static void alc_headset_mode_omtp(struct hda_codec =
*codec)
>       };
>
>       switch (codec->core.vendor_id) {
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_process_coef_fw(codec, coef0255);
>               break;
> @@ -1881,6 +1886,7 @@ static void alc_determine_headset_type(struct hda_c=
odec *codec)
>       }
>
>       switch (codec->core.vendor_id) {
> +     case 0x10ec0235:
>       case 0x10ec0255:
>               alc_process_coef_fw(codec, coef0255);
>               msleep(300);

>I'm not sure whether it's 100% safe to apply this, and I'd like to hear fr=
om Realtek.

>Kailang, could you check it?  Can ALC235 be fully compatible in this manne=
r?

Yes, it's compatible.

>thanks,

>Takashi
