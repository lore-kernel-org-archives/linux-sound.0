Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610614;
	b=OuZICK86qCqhXhXeormvGLScMQ+Y63KKoFRHerwHfID7NL536wjASDAPVJRZa6xWFFuS
	 dbJ0E1eyVWAT0kPAoaEr+BK/g7SPNsTx5UfkvEYRHZJ1wr14GSln0SYvY3gfGI4BejBmT
	 AOsr+60T73c/SBfgN/Nr8Fm+mMVNuJifx9nXtJN+m66JdSpnm9aOxQ7HwsitJrB6HYDRb
	 xxwb+hdXhwbZrYgRRLLXileC3jr2t256LgcW9v/UX1FWhqKQxQYIgeFGeHYW2R4AOqUdX
	 qJI4TP4E5llttjgQYKKTxsVVJ2XEBcDED9Qfp4DmyBM57HI2rJs77781h8kJKAXEhzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610614;
	h=DMARC-Filter:Received:X-Originating-IP:Date:X-CM-HeaderCharset:From:
	 To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:References:
	 X-CM-CTRLMSGS:Content-Transfer-Encoding:Content-Type:MIME-Version:
	 Message-ID:X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=5+VrE36iK3rm/NyRlBfQKTTVyoNY7orAQB/U5dy5e7Q=;
	b=VmagkJejNq8w0lDpvDNoB56WkTqqCWRAaQLuHopC/WzWvHfey+CAGmZbuEKdI4TtZOXw
	 Q/mCUYNNYP5NtbhMmeJ10SW6KTGNmla2qM5xrpjS38CWph+LjI67dz+vQvb/mQUf9fv5I
	 ALKhTAir9/ILFTM/xskRwTzEbEBX+fElhsDQTdhARM2ilIfEtKb3NJpTA7aGytwXkA0T4
	 u1/jgRxwvnWDTHCrpJY5KWK7K5LMkF+KiPMWG7qATQBUSxJpEfPhUZISsWMvura8vYRFt
	 ZQYDnmXOXS2qyEdpIOtvZZkpcQDL/SUI7GFB/l5jV2jqX1hHU6Xx0EUKZ94r53UkR3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A09606A31E;
	Wed, 25 Nov 2026 12:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from xuhx$hust.edu.cn ( [10.12.190.107] ) by ajax-webmail-app2
 (Coremail) ; Wed, 25 Nov 2026 20:43:26 +0800 (GMT+08:00)
Date: Wed, 25 Nov 2026 20:43:26 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com
Subject: Re: Re: sound: core: jack kcontrol is published before jack_kctl
 allocation, and the failure path frees it without removing it from
 card->controls (null-ptr-deref)
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2025.3-cmXT6 build
 20260810(6c94e3b5) Copyright (c) 2002-2026 www.mailtech.cn hust
In-Reply-To: <20261124093942.2963-1-sreekuttan2156239@gmail.com>
References: <28bb004a.2ad18.1a2023a6d95.Coremail.xuhx@hust.edu.cn>
 <20261124093942.2963-1-sreekuttan2156239@gmail.com>
X-CM-CTRLMSGS: =?B?rZF7uziH6nJ5xwDR7hwMki1N8jM=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <19953f99.563.1a212bb7d34.Coremail.xuhx@hust.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:IQEQrMAG7xHu1wZrLnUDAA--.4187W
X-CM-SenderInfo: bgsqjkayqyjmo6kx23oohg3hdfq/1tbiAQICB2sGaXQ7IwADst
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

VGhhdCBwYXRjaCBkb2VzIHdvcmssIHRoYW5rcy4KCgo+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0K
PiDlj5Hku7bkuro6ICJTcmVlcmFqIFMgS3VydXAiIDxzcmVla3V0dGFuMjE1NjIzOUBnbWFpbC5j
b20+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMTEtMjQgMTc6Mzk6NDIgKOaYn+acn+S6jCkKPiDmlLbk
u7bkuro6IHh1aHhAaHVzdC5lZHUuY24KPiDmioTpgIE6IGJyb29uaWVAa2VybmVsLm9yZywgbGdp
cmR3b29kQGdtYWlsLmNvbSwgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbGludXgtc291
bmRAdmdlci5rZXJuZWwub3JnLCBwZXJleEBwZXJleC5jeiwgdGl3YWlAc3VzZS5jb20KPiDkuLvp
opg6IFJlOiBzb3VuZDogY29yZTogamFjayBrY29udHJvbCBpcyBwdWJsaXNoZWQgYmVmb3JlIGph
Y2tfa2N0bCBhbGxvY2F0aW9uLCBhbmQgdGhlIGZhaWx1cmUgcGF0aCBmcmVlcyBpdCB3aXRob3V0
IHJlbW92aW5nIGl0IGZyb20gY2FyZC0+Y29udHJvbHMgKG51bGwtcHRyLWRlcmVmKQo+IAo+IEhp
IEhhbnhpYW5nLAo+IAo+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIHJlcG9ydCBhbmQgdGhlIEtB
U0FOIHJlcHJvZHVjZXIuCj4gCj4gPiBUaGUgc2FtZSBmYWlsdXJlLXJvbGxiYWNrIGJ1ZyBoYXMg
YSBkZXRlcm1pbmlzdGljIGNvbXBhbmlvbiBwYXRoOgo+ID4gc25kX2phY2tfbmV3KCkgY2FuIGZh
aWwgYWZ0ZXIgc25kX2N0bF9hZGQoKSBoYXMgYWxyZWFkeSBwdWJsaXNoZWQgdGhlCj4gPiBrY29u
dHJvbCAoZm9yIGV4YW1wbGUsIHdoZW4gaXRzIHN1YnNlcXVlbnQga3N0cmR1cCgpIG9mIHRoZSBq
YWNrIGlkCj4gPiBmYWlscyksIGFuZCBpdCBhbHNvIGRvZXMgbm90IHVuZG8gdGhlIHB1YmxpY2F0
aW9uLgo+IAo+IFRoZSBjb21wYW5pb24gZmFpbHVyZSBwYXRoIGluIHNuZF9qYWNrX25ldygpIHdh
cyBhbHJlYWR5IGZpeGVkIGJ5IG15IHVwc3RyZWFtIGNvbW1pdDoKPiAKPiBjb21taXQgZWJjZTIw
MTk2MzQ2OTA2Y2ZhMzNhODRhMDIxY2U4ZjliZDkxODgwYwo+IEFMU0E6IGphY2s6IEZpeCBqYWNr
IGNvbnRyb2wgY2xlYW51cCBvbiBlcnJvciBwYXRocwo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rpd2FpL3NvdW5kLmdpdC9jb21taXQvP2lkPWVi
Y2UyMDE5NjM0NjkwNmNmYTMzYTg0YTAyMWNlOGY5YmQ5MTg4MGMKPiAKPiBUaGUgcGF0Y2ggaW5p
dGlhbGl6ZXMgamFja19rY3RsLT5saXN0IGFuZCByb3V0ZXMgdGhlIGZhaWx1cmUgcGF0aHMgaW4g
c25kX2phY2tfbmV3KCkgdGhyb3VnaCBjb21tb24KPiBjbGVhbnVwLCBlbnN1cmluZyB0aGF0IHRo
ZSBwcmV2aW91c2x5IGNyZWF0ZWQga2NvbnRyb2wgaXMgcmVtb3ZlZCB1c2luZyBzbmRfY3RsX3Jl
bW92ZSgpLgo+IAo+IENvdWxkIHlvdSBjaGVjayB3aGV0aGVyIHlvdXIgcmVwcm9kdWNlciBzdGls
bCB0cmlnZ2VycyB0aGUgaXNzdWUgd2l0aCB0aGlzIGNvbW1pdCBhcHBsaWVkPwo+IAo+IFRoYW5r
cyBmb3IgcmVwb3J0aW5nIHRoaXMuCj4gCj4gUmVnYXJkcywKPiBTcmVlcmFqCg==
