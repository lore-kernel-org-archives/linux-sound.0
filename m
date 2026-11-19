Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103189;
	b=WZe5BlX8KBL4X/tfLaVbHSW/i84EryTZOa4ejjOWssLephrAuZ3VZMS91Y2WCmRMs9DY
	 K51yEH+9T2K6zevIRYHavl+GRgr4pM5XvaWlP9AXfaQ4Cy1Kt14Twc5PnZaNmUpbOyrWW
	 T7fHAQNXy0VWKbT2HttUrZaZg8LoWmeq+ZzJAbfmHyw/73y3kywfWE5r3roIzrQn0n01M
	 NUvftuK0LCDFyZkXrJQoenU5hdK0SpBuIi0AanMs9rlFnsrUGy5K4vEhlBdDVv8gUi4SX
	 QdHIy5rkWvZvaiNpJJLq1GywGN/xYsfafLI36gRL6ePnBYIIMeTK9AgQhAxk4Q0CiDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103189;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:
	 Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=OXTwuVZlVHedrGwWOFwrRezFcp/6SMEzqMKu+mA01F4=;
	b=RaEXgf9t2IzOEWCswi7H55Lq2bZF68ZOP3F2O6R355Qo4nFEnWiQai1BZXUnPxMdg2AA
	 uvEwjZoF0Pr2San+L7rG3DrrRGnIku3QLrCelykqmMhZOh9ucTQKl+8xd1NyqMzaEcIRM
	 vT+zXNWnWgxoTFuQEaS6mq3PGE7AInfD0E8mgI8SB3NeIF/1b1TM+S2ZNcjTrAx2EMego
	 pUSKIZQYIEfzwpOr+sKs6pZYMpfMvEprEXG2210abVu9pVWCCWda76mGjuwtrRis0bpiT
	 /JB1AHpxrPpGtB/syN92vfSQ0gQ8sGqJ1PCEozfWPTIsxVu2mwFIpP0CYc7FtNkBI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=KEEnD8IH;
	arc=none smtp.remote-ip=198.252.153.129
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE2606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 15:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28BE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=KEEnD8IH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795103188; bh=OXTwuVZlVHedrGwWOFwrRezFcp/6SMEzqMKu+mA01F4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEEnD8IH4nOirW4mtJboEWmU4BeQJU4nDDGct2kKAa5342+P1gmeBzNPbaL+fZ/Wu
	 Cu+ctAumOf4kkJDSnk56KUIin88CIEd0hWcVok1uOdyRB94JICAaYTBQAuUPuGA2x+
	 oWmOgje08+H72Q8Osbbp6e/qs/WUyZGGiRbe7iXQ=
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4jVjW83MqpzDqJp;
	Thu, 19 Nov 2026 15:46:28 +0000 (UTC)
X-Riseup-User-ID: 0134883AA8A5186901CBB2A9160B5686AA8998DA49C25BEC5E254E4DAB949AEB
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4jVjW64s2nz1xxB;
	Thu, 19 Nov 2026 15:46:26 +0000 (UTC)
Message-ID: <22d8075e-c737-4e29-8f63-f42c3393ce99@riseup.net>
Date: Thu, 19 Nov 2026 15:46:24 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: wm8731: power the converters together, activate the
 interface last
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
References: <98d2b656-a944-47c6-af47-126b46c5a953@riseup.net>
 <16044ae8-679a-4e4b-83e4-1e2bc2c0554b@sirena.org.uk>
Content-Language: en-US
From: Rafael Diniz <rafael@riseup.net>
Autocrypt: addr=rafael@riseup.net; keydata=
 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
In-Reply-To: <16044ae8-679a-4e4b-83e4-1e2bc2c0554b@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rvyBFfchzmqY7r7zfYD0gQz7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rvyBFfchzmqY7r7zfYD0gQz7
Content-Type: multipart/mixed; boundary="------------63B8jBhX02V280UBesExDznZ";
 protected-headers="v1"
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org
Message-ID: <22d8075e-c737-4e29-8f63-f42c3393ce99@riseup.net>
Subject: Re: [PATCH] ASoC: wm8731: power the converters together, activate the
 interface last
References: <98d2b656-a944-47c6-af47-126b46c5a953@riseup.net>
 <16044ae8-679a-4e4b-83e4-1e2bc2c0554b@sirena.org.uk>
In-Reply-To: <16044ae8-679a-4e4b-83e4-1e2bc2c0554b@sirena.org.uk>

--------------63B8jBhX02V280UBesExDznZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U29ycnkgYWJvdXQgdGhpcywgSSdsbCBzZW5kIGl0IGFnYWluIGluIGEgcHJvcGVyIHdheS4g
QnR3LCB0aGlzIGlzIGZvciANCnRoZSBzQml0eCBIRiByYWRpbyB0cmFuc2NlaXZlciwgd2hp
Y2ggSSBzdGFydGVkIHRvIHNlZSAib25jZSBpbiBhIHdoaWxlIiANCmJvb3RzIHdoZXJlIHRo
ZSBpbnB1dCB3YXMgdG90YWwgc2lsZW5jZS4NCg0KQmVzdCByZWdhcmRzLA0KUmFmYWVsIERp
bml6DQoNCk9uIDExLzE5LzI2IDM6MzQgUE0sIE1hcmsgQnJvd24gd3JvdGU6DQo+IE9uIFRo
dSwgTm92IDE5LCAyMDI2IGF0IDAzOjA1OjE4UE0gKzAwMDAsIFJhZmFlbCBEaW5peiB3cm90
ZToNCj4+IFRoZSBkYXRhc2hlZXQncyBwb3dlci11cCBzZXF1ZW5jZSBwb3dlcnMgdGhlIGNv
bnZlcnRlcnMsIHNldHMgdGhlIG90aGVyDQo+PiByZWdpc3RlcnMgYW5kIGFjdGl2YXRlcyB0
aGUgZGlnaXRhbCBhdWRpbyBpbnRlcmZhY2UgbGFzdC4gIFRoZSBkcml2ZXINCj4+IGhhcyBB
Q1RJVkUgYXMgYSBzdXBwbHkgd2lkZ2V0LCB3aGljaCBEQVBNIHBvd2VycyBhaGVhZCBvZiB0
aGUgQURDLCBEQUMNCj4+IGFuZCBsaW5lIGlucHV0LCBhbmQgZ2l2ZXMgZWFjaCBjb252ZXJ0
ZXIgYSB3aWRnZXQgb2YgaXRzIG93biwgc28gYQ0KPj4gY2FwdHVyZSBzdGFydGluZyBuZXh0
IHRvIGEgcnVubmluZyBwbGF5YmFjayBwb3dlcnMgdGhlIEFEQyB1cCB1bmRlciBhbg0KPj4g
YWN0aXZlIGludGVyZmFjZS4NCj4gDQo+IFlvdSd2ZSBub3QgcHJvdmlkZWQgYSBTaWduZWQt
b2ZmLWJ5IGZvciB0aGlzIHNvIEkgY2FuJ3QgZG8gYW55dGhpbmcgd2l0aA0KPiBpdCwgcGxl
YXNlIHNlZSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCBm
b3IgZGV0YWlscw0KPiBvbiB3aGF0IHRoaXMgaXMgYW5kIHdoeSBpdCdzIGltcG9ydGFudC4N
Cj4gDQo+IEkgdGhpbmsgdGhlIHBhdGNoIGlzIG1hbmdsZWQgYXMgd2VsbC4NCg0K

--------------63B8jBhX02V280UBesExDznZ--

--------------rvyBFfchzmqY7r7zfYD0gQz7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhwy1rTUmyiCmsezSosoy7GG8TlwFAmr/GdEFAwAAAAAACgkQosoy7GG8TlwR
BxAAqmfVGWw+hkcgmJXRu41sJMACUhsV1QcIKxt1/7xEW9T8n8GzRtz60li2dzWHEpvWUmUzmQJ9
+zTYtCQG1xROyXy8EqI1/ZEXhq9mLe/RaKRdX/WlUnIoVll7WFy5Gbwv9bqKc5/8nORd91UmJCLr
NswToilBT0ehXJGBLkxWb934UMWv1IIjppc/2txzZlDd87U0D3h6Ond7hjPrpQArPUiM5p7McQsN
B1+owgxcQqKwnzxg5zIEGNQQtcggFx/aNABZZ4CUqm5/80tPOL8L8uA3xSOFjtbHQmUB0stay4zL
srvEMudUExFh6ilp4idbe2d2DensT6tQSIrv/TzBWs6NQgX9AopYeZeb8UWUQmjDdk8gVrUXnBPx
Q3yiVJ539tgeo/dKn1pllLcH9S2g9LTQVNRNDmwPuEeOFuGOXriBLrXzXNtxQuyVdcl4sWqM2Rg9
q7tSGj/t9kzoK7uLj06FOvPuGuNfVmjpvenY3kwQSVq7KbJhbnBoVHLL2Cc7u1pVsw0ObqEkCa0/
7Xn7RGkiPu+WV6UslOsNzHAXjc7w4b/ndvIYppT1P8ofaER9ETN2NhFacNbg1ZFh9Vf6Ucv/fTkc
pndegi0RuNN8uoPADyGTqTgt2Voc8Iq0qakU5BB46ros6QxanSbSD4+I2Ck7PWoUW2JCH3CBgSWf
ccc=
=HqKh
-----END PGP SIGNATURE-----

--------------rvyBFfchzmqY7r7zfYD0gQz7--
