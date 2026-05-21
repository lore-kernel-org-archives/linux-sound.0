Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C08C3D8117
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367732; cv=none; b=MqIgvSpw3KpcB3qcZOoIW1vXuJjxofjDk7t08s/+qkBKZ22lb8JEiG5x9qVFf5XIZAiGBfX3YhAEuIDCjp7OHAWS0B6GEBVuxuCcmnGyl3OMEMFsk9b6HWCEMhI3pN5ONUuexX5FW46PP6Sxb8jqpAsgBD/3SM7mVGOHrTRSOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367732; c=relaxed/simple;
	bh=uHOWw6i+aVax7nBdYhxijRjhIz3EgIw75oc8FyAC5bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lzvx4MfFU+yUA29l+yMAWzM7TCJSGpmH6TCwZmMgF4uDnYBQT1RerFjZlApTk48e7wBdoZDIpljWXFNa5PhuTHVOpm+J+OSObM4XiRy6zZCenAG6bv5QqT6SSGMDJGOZhfkvqN/v9V95312jE2Wc0a+iOmWpxJKFp9bp1YPY45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwzKSo1H; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwzKSo1H"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-303dbfbec77so6425311eec.0
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779367730; x=1779972530; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHOWw6i+aVax7nBdYhxijRjhIz3EgIw75oc8FyAC5bM=;
        b=fwzKSo1HWvX37qaOgoiYFMZUxXdxPqCsY9CRpA+D+xr4wEZTwFTZ2c7O9SgBUQTM01
         Pz4ufw1EZgJJH0nMcpDciLyYeigXpxUxLonnHBdhKQp5wTgwnYAkjWTgpk9dx956d/P0
         LIbiN/RNDD8xtXvmxTpGSSB3VqH77y9FYXMUQIUEBurpG4HaZArrbjikuc3Cz9qPE+sa
         +zsycdasjOxx5VhREsTrny5fTxiKBC/7Zd+MfcjwPgtGnoKcJyPgM/jI6ZyraTMFndrQ
         TupAlYLKi6ryPU9m2DAzojfRH448g/s+L0jAXiJFs0aWVY1fjX0an10L7U0s3rjXG7As
         dXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367730; x=1779972530;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHOWw6i+aVax7nBdYhxijRjhIz3EgIw75oc8FyAC5bM=;
        b=Nqv3gEmTCRavC227pVzgzQWYPICS7KuqdDJhwSJJ0EQ8p9f2pj8GB7L3Ystyx3V/4p
         V8vx95pCi5zDGOEPdhnN7M1zWs+I30iZppy6IjbTvpAqj2EkKvkaqDN68aEVO6JCaGQj
         0nPD6Ff/nytKOSDNiRFDjB8mNat2VloI+zxq5w7QJLYWm8RR2UIQXeaVpbJqRyR79hr/
         aLWOcc4S/X9c1rYJaURIxkoLmVHaPE5HsSIG8sr4hC6ZCHVdM9Xrxzl2mn7Q0OwRD2Rm
         uC9j7wO0jw+RLOA6o+EScPZ//8Ksxk3qqyIvwEX1v1wFf+7wMDk3IfuEDPVj2RYD8DWD
         mpKA==
X-Gm-Message-State: AOJu0YxXhtuqhzmjFpRShJOqSEu5qpI3P5+uFZ//ukeYELY4CTQNMqjv
	nkEA8aJDRVOslG57AY4hwUT/FcAyfVhooeVYJ0b/Qq+Im60+67Y27LbB
X-Gm-Gg: Acq92OFAK7PNzMEIx7TKy8aorjbRHO2MzfMABqn24cXvDW2xkrDnzeR+52HS4zG6a7u
	tkWUldnAiooKAa2I4piq191J+yPXheP1U44hgGP5ioxcPP16KlmyDbeR7E5QMDJm16eczVJjPwB
	Wh4sNhaEqrjOxinuSsK61LmkV9qyFh1z3NKAIue/y/yMODJ9oYO5+lFU21Kpjt0DbYB10vOU+hj
	3hjAVmrOsCJRGNk8tIfYvh3Djc2Uw8DSKrFAE0VCXisd/ymcHSBTF9pYeK+VYOs0YT/3UNsUojN
	WtwEwGevZAIfxDWg5NnBX1k8Y3A73nHRrUC9qe1zAeZmUSzLJeoARqDPiBnpQk4fYbqfoxjU4Xo
	c4C5qmqyV4k2bXFI5GsF3BspEyvTXzUq/uONTklnw1jhYrSPIVe1OQeWyRvWNGzrq+64+bdExhC
	TuKrlxiHn4btvwXw9VZTn/m8ILkrFWpMDfrwC7CxyUaDKlOpX6fS01CdbFt3IsReYdvMMegfnlU
	/DKhspZN/WB
X-Received: by 2002:a05:7301:678e:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-3042fac9f63mr1383001eec.30.1779367729931;
        Thu, 21 May 2026 05:48:49 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304435c10desm392384eec.27.2026.05.21.05.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:48:49 -0700 (PDT)
Message-ID: <e68491b9-2274-4cba-982a-02516cdd5e51@gmail.com>
Date: Thu, 21 May 2026 09:48:44 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on
 errors
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
 <20260520-alsa-cs35l56-system-name-leak-v2-1-60f26c159023@gmail.com>
 <243581c7-8b17-4415-bd8b-bc8fc4560f1f@opensource.cirrus.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <243581c7-8b17-4415-bd8b-bc8fc4560f1f@opensource.cirrus.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wpm00W1s79MXp30EC4cd22m9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wpm00W1s79MXp30EC4cd22m9
Content-Type: multipart/mixed; boundary="------------KCyIJqdEmyxL32AJbq7v4pfi";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Simon Trimmer <simont@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Message-ID: <e68491b9-2274-4cba-982a-02516cdd5e51@gmail.com>
Subject: Re: [PATCH v2 1/2] ALSA: hda: cs35l56: Free ACPI _SUB string on
 errors
References: <20260520-alsa-cs35l56-system-name-leak-v2-0-60f26c159023@gmail.com>
 <20260520-alsa-cs35l56-system-name-leak-v2-1-60f26c159023@gmail.com>
 <243581c7-8b17-4415-bd8b-bc8fc4560f1f@opensource.cirrus.com>
In-Reply-To: <243581c7-8b17-4415-bd8b-bc8fc4560f1f@opensource.cirrus.com>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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

--------------KCyIJqdEmyxL32AJbq7v4pfi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gNS8yMS8yNiAwOToxNCwgUmljaGFyZCBGaXR6Z2VyYWxkIHdyb3RlOg0KPj4gwqAgLcKg
wqDCoCBzdWIgPSBhY3BpX2dldF9zdWJzeXN0ZW1faWQoQUNQSV9IQU5ETEUoY3MzNWw1Ni0+
YmFzZS5kZXYpKTsNCj4+ICvCoMKgwqAgY29uc3QgY2hhciAqc3ViIF9fZnJlZShrZnJlZSkg
PSBhY3BpX2dldF9zdWJzeXN0ZW1faWQoQUNQSV9IQU5ETEUoY3MzNWw1Ni0+YmFzZS5kZXYp
KTsNCj4+ICvCoMKgwqAgY29uc3QgY2hhciAqc3lzdGVtX25hbWUgX19mcmVlKGtmcmVlKSA9
IE5VTEw7DQo+PiArDQo+IA0KPiBJbml0aWFsaXppbmcgYSBfX2ZyZWUoa2ZyZWUpIHRvIE5V
TEwgaXMgY29udHJvdmVyc2lhbC4gVGhlIGtlcm5lbGRvYw0KPiB3YXJucyBhZ2FpbnN0IGl0
LiBUaG91Z2ggSSB0aGluayB5b3VyIGNvZGUgaXMgdG90YWxseSBmaW5lIGl0IG1pZ2h0IGJl
DQo+IGJlc3QgdG8gYXZvaWQuDQoNCkkgdXNlZCBfX2ZyZWUoa2ZyZWUpIGZvciB0aGUgZGVy
aXZlZCBzeXN0ZW1fbmFtZSB0byBrZWVwDQpvd25lcnNoaXAgdHJhbnNmZXIgbG9jYWwgdW50
aWwgcmVhZF9hY3BpKCkgaGFkIHBhc3NlZCB0aGUgcmVzZXQgR1BJTyBlcnJvcg0KcGF0aCwg
YnV0IEkgYWdyZWUgdGhhdCBpbml0aWFsaXppbmcgYSBjbGVhbnVwIHZhcmlhYmxlIHRvIE5V
TEwgaXMgYmVzdA0KYXZvaWRlZC4NCg0KPiANCj4gSSBjYW4ndCBzZWUgYW55IHJlYXNvbiB3
aHkgd2UgZGlkbid0IHVzZSBkZXZtIGNsZWFudXAgZm9yDQo+IGNzMzVsNTYtPnN5c3RlbV9u
YW1lLg0KPiANCj4gU28NCj4gDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0g
LUVOT0VOVCkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNzMzVsNTYtPnN5c3RlbV9u
YW1lID0gZGV2bV9rc3RyZHVwKGRldiwgc3ViLA0KPiBHRlBfS0VSTkVMKTsNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAocmV0ID49IDApIHsNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjczM1bDU2LT5zeXN0ZW1fbmFtZSA9IGRldm1fa2FzcHJpbnRmKGRldiwgLi4u
KTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4gDQo+IA0KPiBhbmQgZGVsZXRl
IHRoZSBtYW51YWwga2ZyZWUoY3MzNWw1Ni0+c3lzdGVtX25hbWUpIGluDQo+IGNzMzVsNTZf
aGRhX3JlbW92ZSgpLiANCg0KSSdsbCBzZW5kIGEgdjMgd2l0aCB0aGF0IGFwcHJvYWNoLg0K
DQoNClRoYW5rcywNCkPDoXNzaW8NCg==

--------------KCyIJqdEmyxL32AJbq7v4pfi--

--------------wpm00W1s79MXp30EC4cd22m9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCag7/LQUDAAAAAAAKCRDQXT8aWv/ugw25
AQCX1KcwOq99a+O5IFjxkjI7CfJIV+T9594xEbMNnt1QkQEApwQ+o/tfCzh+cqWFgWB+gxi1soyu
qTI2efFmKVV36AA=
=+nFL
-----END PGP SIGNATURE-----

--------------wpm00W1s79MXp30EC4cd22m9--
