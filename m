Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129B37880B
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452517; cv=none; b=tGDN/5tPUcdhz5KZWthrCmJdK9vAyRrjzarDZSedZLGGmAIvsTrYLKEiSVIl/Kvcswfq354dOdIq5IQ37cQz5clHHGAgCq+0Lmjkc9X0SqoDrUN4mhyy05cWMZsR30dbr5ZlgRqh/VZIRymnIiEzTCqxkImt0DzroC+cJ7Id1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452517; c=relaxed/simple;
	bh=MZhC7lbipwfzWOsFyEJwR1zpFUXH2yoI5ksH7Xn9vdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MddyMG3EpV8TveUSOQRbxAa4K5ywBhgVusSRfhHpojYD3SSwBr3K/fm7BEI5Hhx46u7P8l+cTROdkSXMdOnls31dnN4bmHslyGGRVTllaMasVBok5HG1btI4tziVXgCXYX9Z4g8zizqXvCJfDaqTrgFAtiHaSX4/E6qNElxEm+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH7Krz3W; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH7Krz3W"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3042dffd80bso3004034eec.0
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779452514; x=1780057314; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZhC7lbipwfzWOsFyEJwR1zpFUXH2yoI5ksH7Xn9vdQ=;
        b=lH7Krz3W1Y1pXOknwSL4Hkfiiytqcqwzqcqm5AxpVV4k5dSz2HcU9rPlex/ZCzALgr
         wVZyQ0ih+dQM1QTC5n4d2avZYHlRpAjnpOxanAxQX5zOFNJ6001Ajqf1f6L0OjsgBBe3
         y/ETSx88zHgREi+Z/6Iv+sIUtQUmea5n2d8luQlPSnR1VamB9kyCwtbHnaaw6Q+Vrux6
         XJF0Jbe0pbrWKW8B/WWGcGU1TA6eLYKrap/HSV+I90Asl2M5amL+f5AiBGJCBPo6xOpO
         vMsVTny91besMuZUdmvFxZikiR9DdpRIvxleBDjgTlh1G6zyOoOJ2OABUdIbSy2Xp5PO
         UZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452514; x=1780057314;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZhC7lbipwfzWOsFyEJwR1zpFUXH2yoI5ksH7Xn9vdQ=;
        b=V7OUK9lIRbJuFBpnOGVc+j9B6sjbHT3dxukJWyfNM7KConAsetddG/NeeOFWrLitvm
         mjHBkRXx5LB4VXv4TsOvV9NQLeM6z5RDiL6TKXyx0cjQpniAVC/v6kk6kr4COSK7Lvd4
         jqOjsl4h5y29auzyU4dmSfHTccu4occI0pDvAa/6v6fVvPmGN2wOZ8xOx2Q86qKH8E+s
         Pjl35qEqm2e5Mrl137VbOHZvxtHRLh1QqQuUo0jQJhP/VXj3+5WRLZ2Dd9+Owkk33C3s
         eTsjGOARcR2mJcBIMTj4rMAhOBJBomqy5PDR0Rrq5tiTeOMZem8LsVTuQ379XmzgkUVi
         nQ0Q==
X-Gm-Message-State: AOJu0YzwBOsKlUJpD1aQ/8XTPX93k6i887Uz1l8pN+9W++PV/Ib0xCKu
	S/ztO21VY4z+nXsfmWFWv4qxN4wYONTTu70uh+13JbrJSjlsqFGSYnvi
X-Gm-Gg: Acq92OGZZnr/LSsOZRqwnIoEzS4Z4yUl/G/JAmx3H/czBv/Y4Bi4NIX5CQKuAh3EDPD
	6EpjYE0nkidCDV/eZVWw29hoTBmJxdqv7KqvQIEdR3MhIaYYsgbaf9EhqcgYWKIM6tpeszXPCpi
	GQRhlM/tscZd0oVV5LgMCQeHOxXgnNZwguN0sTeopBuNdyM3ZsjIP3bpNC0ABDo7/XimaAvcXgo
	OKhQDt+QnTwsj9HHcshZw/YOzz98brxI3CRnAxrwyDLj/Tdjyx61tXeubxIA9mEy6N9fLd/Zy3Q
	zmpjO/XTgq3AR2hzXNK4Wj3gMkxuxfSG6TMWy55e+Gdwgo93A/dgBqPdnPEZxc2ZSv5lY7l15f8
	aG/cP0z4ft/mSS/mZ2NkK4d8swG81VX1F+BT9dYbP5U5Xoj9rRJsBoaNg4ZmpYb3rC55p5Y6V+R
	dqjQoVCtEn5qm7LdBuxiHnAUoztveNTpCjIVZbMgvwXJzndW4kmshGVdZMuSGWtpg1NFBof2eaL
	g==
X-Received: by 2002:a05:7300:ec11:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-304491856famr1543107eec.18.1779452514009;
        Fri, 22 May 2026 05:21:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304522314a4sm874130eec.18.2026.05.22.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:21:53 -0700 (PDT)
Message-ID: <ef725379-ebaf-4d6b-9fde-25a73b24736e@gmail.com>
Date: Fri, 22 May 2026 09:21:48 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda: cs35l56: Fix system name string leaks
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com>
 <6f4a69ee-d338-4c22-a2cc-bf8e8596cb60@opensource.cirrus.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <6f4a69ee-d338-4c22-a2cc-bf8e8596cb60@opensource.cirrus.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5o3eoJOSSLwCBK0tJJF3CrWX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5o3eoJOSSLwCBK0tJJF3CrWX
Content-Type: multipart/mixed; boundary="------------G9X3IjI1AgtsFF6aojjpJV5W";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Message-ID: <ef725379-ebaf-4d6b-9fde-25a73b24736e@gmail.com>
Subject: Re: [PATCH v3] ALSA: hda: cs35l56: Fix system name string leaks
References: <20260521-alsa-cs35l56-system-name-leak-v3-1-9dd4e2dcb473@gmail.com>
 <6f4a69ee-d338-4c22-a2cc-bf8e8596cb60@opensource.cirrus.com>
In-Reply-To: <6f4a69ee-d338-4c22-a2cc-bf8e8596cb60@opensource.cirrus.com>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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

--------------G9X3IjI1AgtsFF6aojjpJV5W
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gNS8yMi8yNiAwODo0OCwgUmljaGFyZCBGaXR6Z2VyYWxkIHdyb3RlOg0KPj4gQEAgLTEx
MTgsNyArMTEyMCw4IEBAIHN0YXRpYyBpbnQgY3MzNWw1Nl9oZGFfcmVhZF9hY3BpKHN0cnVj
dCBjczM1bDU2X2hkYSAqY3MzNWw1NiwgaW50IGhpZCwgaW50IGlkKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBsaW5lIGFuZCByZXNldCBhbGwgdGhlIGFtcHMNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgICovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCAhPSAtRUJV
U1kpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZShj
czM1bDU2LT5iYXNlLmRldiwgcmV0LCAiRmFpbGVkIHRvIGdldCByZXNldCBHUElPXG4iKTsN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGNzMzVs
NTYtPmJhc2UuZGV2LCByZXQsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJGYWlsZWQgdG8gZ2V0IHJlc2V0IEdQSU9cbiIpOw0KPiAN
Cj4gU3B1cmlvdXMgY2hhbmdlLiBOb3QgcmVsYXRlZCB0byBzeXN0ZW1fbmFtZS4NCg0KT2ss
IEknbGwgZHJvcCB0aGF0IGluIHY0Lg0KDQotLSANClRoYW5rcywNCkPDoXNzaW8NCg0K

--------------G9X3IjI1AgtsFF6aojjpJV5W--

--------------5o3eoJOSSLwCBK0tJJF3CrWX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCahBKXAUDAAAAAAAKCRDQXT8aWv/ugwq9
AP9J0x6jaL2gD/O0qvHWy+INu54PmhYag92kjWglCBBkxgD/TOkeD0y+UR1XCYxMVwbkqCwW45MN
oHGSUabHl4hu3g0=
=SUVi
-----END PGP SIGNATURE-----

--------------5o3eoJOSSLwCBK0tJJF3CrWX--
