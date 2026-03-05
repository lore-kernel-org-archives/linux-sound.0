Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934C4F881;
	Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713802; cv=pass; b=hDk5ZkWJGPfONIzgIPcGpewVjW5O70HukUqXG4TsW0D+DiDH4IQky0pA/P8tbwUxq0y4MhFekxr6AzXXBH2KnsrKfpNL6O+n59mbdu696x2Q5HYMsunomdIQJBJikgn2J041uZ/yg8aEquYZHW7V6QSjP1kjcAevQr99Eextgaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713802; c=relaxed/simple;
	bh=EeaiNREccTw3UhmoaIJAplKN1Fv6O9/hXOfuBTXOabA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YzYAsilSCxDeNvI+FhswWkIBm1Ue9QWf6nmVV6UI8X7qs1dUeheJCuWOh04hbFkOMpnpuPCalyJbU2zVwfAba156Xl58x+1FnoXDOTN0VoGrLWEW4Ni6qfwARnMV+P8ap4cOR9cbTcfMqSHE9KgUqi5tyo6FTjfn83ZjgNZk2Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=EBCQt3BH; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="EBCQt3BH"
ARC-Seal: i=1; a=rsa-sha256; t=1772713779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EoJmAZboTkkvp0gS4LP1M+BXklhWwHjoHyw5FItSlzzqZF1DXiCv3T79kuxnCu8FYUz40BLTBjyQDx9OpY5k6XodWi5ee38deOQRwEJr89sSQ3KWexEWvkbeiErL1AVwcNWDQbD4bmJunxitCI0fPYWpuE9NDWeFjlS/TQ1D9h0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772713779; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/T9+gadZV2ZPB0ydOPdbigsUoe9PEPAqyl5VvpqnprM=; 
	b=UhRRCrieXZxacNGhF9XFRkHb8gAtnUMAM0sa82x0FaKTtlH0obIJb9KWDw+6Je/0B/IT3IR7B8SZANQ6iDpxCtIcFrAb5tmy9bvxU0f6EOd5HK6YR1mHJz4fb0m7TMA7B/9IZm0oYRzfqRKZqakIQ+HKQgG997kRXSeGq638Y9c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772713779;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=/T9+gadZV2ZPB0ydOPdbigsUoe9PEPAqyl5VvpqnprM=;
	b=EBCQt3BH03NalBGvhK2i60E7L8PUgAVlB8PzMfMPD4HvA8uOsPbgIzNhmurqfo2f
	/GgCDNRPT5o8HugMe0F0kUlwaK87AwU84YxRMQm05rNX4RzMTSJzqB7V0r3i+nfzvjQ
	PgnGZSpA+AkFBGPfxXNAaKPTckDieI+9vboM1l6IDcOdq7fKmyRBAHyi/9zPMEAKYBx
	fmgeEm82r4OZ6sU9m+5MYeqRHYu5k6LEGMttZ77UuHn+D6MXNK0lciRMe7dGuf/bxat
	6P9d6yHEZwh9mngN/tB8ouwahoTBnkdzvAn7BzwqPM49BVxmPRR9KAJJftCtIqamyKD
	DxUXlGXbtQ==
Received: by mx.zohomail.com with SMTPS id 1772713776712999.5815094238017;
	Thu, 5 Mar 2026 04:29:36 -0800 (PST)
Message-ID: <a023a8c860b1c4e144898bd0e2dc53dafe89bcd5.camel@rong.moe>
Subject: Re: [PATCH 4/9] ALSA: usb-audio: Support string-descriptor-based
 quirk table entry
From: Rong Zhang <i@rong.moe>
To: Takashi Iwai <tiwai@suse.de>, Terry Junge
	 <linuxsound@cosmicgizmosystems.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Cryolitia PukNgae	 <cryolitia@uniontech.com>, Arun Raghavan
 <arunr@valvesoftware.com>, 	linux-sound@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org, Icenowy Zheng
 <uwu@icenowy.me>
In-Reply-To: <874imuxyyu.wl-tiwai@suse.de>
References: <20260301213726.428505-1-i@rong.moe>
		<20260301213726.428505-5-i@rong.moe>
		<b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com>
	 <874imuxyyu.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Mar 2026 20:24:26 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Takashi and Tery,

On Thu, 2026-03-05 at 13:06 +0100, Takashi Iwai wrote:
> On Thu, 05 Mar 2026 07:13:32 +0100,
> Terry Junge wrote:
> >=20
> >=20
> >=20
> > On 3/1/26 1:37 PM, Rong Zhang wrote:
> > > Some quirky devices do not have a unique VID/PID. Matching them using
> > > DEVICE_FLG() or VENDOR_FLG() may result in conflicts.
> > >=20
> > > Add two new macros DEVICE_STRING_FLG() and VENDOR_STRING_FLG() to mat=
ch
> > > USB string descriptors (manufacturer and/or product) in addition to V=
ID
> > > and/or PID, so that we can deconflict these devices safely.
> > >=20
> > > No functional change intended.
> > >=20
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > >  sound/usb/quirks.c | 82 ++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 82 insertions(+)
> > >=20
> > > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > > index c6a78efbcaa30..495dd46ce515c 100644
> > > --- a/sound/usb/quirks.c
> > > +++ b/sound/usb/quirks.c
> > > @@ -2,8 +2,10 @@
> > >  /*
> > >   */
> > > =20
> > > +#include <linux/build_bug.h>
> > >  #include <linux/init.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/string.h>
> > >  #include <linux/usb.h>
> > >  #include <linux/usb/audio.h>
> > >  #include <linux/usb/midi.h>
> > > @@ -2135,16 +2137,39 @@ void snd_usb_audioformat_attributes_quirk(str=
uct snd_usb_audio *chip,
> > >  /*
> > >   * driver behavior quirk flags
> > >   */
> > > +struct usb_string_match {
> > > +	const char *manufacturer;
> > > +	const char *product;
> > > +};
> > > +
> > >  struct usb_audio_quirk_flags_table {
> > >  	u32 id;
> > >  	u32 flags;
> > > +	const struct usb_string_match *usb_string_match;
> > >  };
> > > =20
> > >  #define DEVICE_FLG(vid, pid, _flags) \
> > >  	{ .id =3D USB_ID(vid, pid), .flags =3D (_flags) }
> > >  #define VENDOR_FLG(vid, _flags) DEVICE_FLG(vid, 0, _flags)
> > > =20
> > > +/* Use as a last resort if using DEVICE_FLG() is prone to VID/PID co=
nflicts. */
> > > +#define DEVICE_STRING_FLG(vid, pid, _manufacturer, _product, _flags)=
	\
> > > +{									\
> > > +	.id =3D USB_ID(vid, pid),						\
> > > +	.usb_string_match =3D &(const struct usb_string_match) {		\
> > > +		.manufacturer =3D _manufacturer,				\
> > > +		.product =3D _product,					\
> > > +	},								\
> > > +	.flags =3D (_flags),						\
> > > +}
> > > +
> > > +/* Use as a last resort if using VENDOR_FLG() is prone to VID confli=
cts. */
> > > +#define VENDOR_STRING_FLG(vid, _manufacturer, _flags)			\
> > > +	DEVICE_STRING_FLG(vid, 0, _manufacturer, NULL, _flags)
> > > +
> > >  static const struct usb_audio_quirk_flags_table quirk_flags_table[] =
=3D {
> > > +	/* Device and string descriptor matches */
> > > +
> > >  	/* Device matches */
> > >  	DEVICE_FLG(0x001f, 0x0b21, /* AB13X USB Audio */
> > >  		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
> > > @@ -2414,6 +2439,8 @@ static const struct usb_audio_quirk_flags_table=
 quirk_flags_table[] =3D {
> > >  	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
> > >  		   QUIRK_FLAG_ALIGN_TRANSFER),
> > > =20
> > > +	/* Vendor and string descriptor matches */
> > > +
> > >  	/* Vendor matches */
> > >  	VENDOR_FLG(0x045e, /* MS Lifecam */
> > >  		   QUIRK_FLAG_GET_SAMPLE_RATE),
> > > @@ -2558,14 +2585,69 @@ void snd_usb_apply_flag_dbg(const char *reaso=
n,
> > >  	}
> > >  }
> > > =20
> > > +#define USB_STRING_SIZE 128
> > > +
> > > +static inline int snd_usb_get_strings(struct snd_usb_audio *chip,
> > > +				      char *manufacturer, char *product)
> >=20
> > Hi Rong,
> >=20
> > This function is not necessary.
> > Both the manufacturer and product strings can be found in struct usb_de=
vice.
> >=20
> > If the device has a manufacturer string then chip->dev->manufacturer po=
ints to it.
> > Otherwise chip->dev->manufacturer is null.
> >=20
> > Likewise, chip->dev->product points to the product string if there is o=
ne, else null.
> >=20
> > > +{
> > > +	int ret;
> > > +
> > > +	if (manufacturer) {
> > > +		ret =3D usb_string(chip->dev, chip->dev->descriptor.iManufacturer,
> > > +				 manufacturer, USB_STRING_SIZE);
> > > +		if (ret < 0) {
> > > +			usb_audio_warn(chip, "failed to get manufacturer string: %d\n", r=
et);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	if (product) {
> > > +		ret =3D usb_string(chip->dev, chip->dev->descriptor.iProduct,
> > > +				 product, USB_STRING_SIZE);
> > > +		if (ret < 0) {
> > > +			usb_audio_warn(chip, "failed to get product string: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 1; /* ok */
> > > +}
> > > +
> > >  void snd_usb_init_quirk_flags_table(struct snd_usb_audio *chip)
> > >  {
> > >  	const struct usb_audio_quirk_flags_table *p;
> > > +	char manufacturer[USB_STRING_SIZE];
> > > +	char product[USB_STRING_SIZE];
> > > +	int got_usb_strings =3D 0; /* <0: error, 0: pending, >0: ok */
> > > =20
> > >  	for (p =3D quirk_flags_table; p->id; p++) {
> > >  		if (chip->usb_id =3D=3D p->id ||
> > >  		    (!USB_ID_PRODUCT(p->id) &&
> > >  		     USB_ID_VENDOR(chip->usb_id) =3D=3D USB_ID_VENDOR(p->id))) {
> > > +			if (!p->usb_string_match)
> > > +				goto apply; /* DEVICE_FLG or VENDOR_FLG */
> > > +
> > > +			/* DEVICE_STRING_FLG or VENDOR_STRING_FLG */
> > > +			if (!got_usb_strings) {
> > > +				got_usb_strings =3D snd_usb_get_strings(chip,
> > > +					p->usb_string_match->manufacturer ? manufacturer : NULL,
> > > +					p->usb_string_match->product ? product : NULL);
> > > +			}
> >=20
> > No need to get the strings as they can be found at chip->dev->manufactu=
rer and chip->dev->product
> > if the device declared them.
> >=20
> > > +
> > > +			BUILD_BUG_ON(!got_usb_strings);
> > > +
> > > +			if (got_usb_strings < 0)
> > > +				continue;
> > > +
> > > +			if (p->usb_string_match->manufacturer &&
> > > +			    strcmp(p->usb_string_match->manufacturer, manufacturer))
> > > +				continue;
> >=20
> > Examples and intent:
> >=20
> > DEVICE_STRING_FLG(vid, pid, "acme", "alpha", flags) // match vid, pid, =
"acme", and "alpha" strings
> > DEVICE_STRING_FLG(vid, pid, "acme", "", flags) // match vid, pid, "acme=
", and device has no product string
> > DEVICE_STRING_FLG(vid, pid, "acme", 0, flags) // match vid, pid, "acme"=
, and any product string
> > DEVICE_STRING_FLG(vid, pid, 0, "alpha", flags) // match vid, pid, any m=
anufacturer string, and "alpha"
> > DEVICE_STRING_FLG(vid, pid, "", "alpha", flags) // match vid, pid, no m=
anufacturer string, and "alpha"
> > DEVICE_STRING_FLG(vid, pid, "", "", flags) // match vid, pid, no manufa=
cturer, and no product strings
> >=20
> > This test would change to something like
> >=20
> > 	if (p->usb_string_match->manufacturer &&
> > 	    strcmp(p->usb_string_match->manufacturer, chip->dev->manufacturer =
? chip->dev->manufacturer : ""))
> > 		continue;=20
> >=20
> > > +
> > > +			if (p->usb_string_match->product &&
> > > +			    strcmp(p->usb_string_match->product, product))
> > > +				continue;
> >=20
> > Same here but product instead of manufacturer.
>=20
> Thanks, that's good to know!
>=20

TIL too :-P

> Rong, could you submit the cleanup patch?  I already applied your
> series, so write on top of sound.git tree for-next branch.
>=20

Sure. I think I would split it into a series of two patches, one
adopting chip->dev->{manufacturer,product} and one refining the
matching logic to allow matching "no string" since they are doing
different independent things.

Thanks,
Rong

> I'll work on a clean up of the other existing code in USB-audio, too.
>=20
>=20
> Takashi
