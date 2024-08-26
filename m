Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F81547FF
	for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724672231; cv=none; b=ULu8uctR8kS3uiQE2eqYREVbIKaUv/0DvV9CH3EyKGgh1dvsdfDsZj3qge7P9c2jaX1YJHYc7Mbz70Itcmwk9EsL8kqQIY1q91SuR0oBHVI7APdsvZNX/Arh9/2RwowEJILgvAAiTpHBZVzAQd6DLeO+Etb59HoZpg0PcFhImQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724672231; c=relaxed/simple;
	bh=C2nusbgSKYLv+U14MfvhPK5qtdt30OwBoMb18XviAAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j22+9cZswb1KPICDTbFiNS++p+qNEON7/bOClW0VWyVpk8zZtHx8eeG/NbEYjVnFMc3jgAX86uW0rtMgkcf8PjZqo0fTBMxvLoAJ2HGj6EPsbxqcLRYDz3b2KARg9SM6HZtA1jQ0KNoKUUn4U+8o9xIKl1/1cz8EwCiy0ByR9l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZJGD9Zb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZJGD9Zb"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6c91f9fb0d7so16040107b3.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Aug 2024 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724672229; x=1725277029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2nusbgSKYLv+U14MfvhPK5qtdt30OwBoMb18XviAAQ=;
        b=eZJGD9ZbcW+dcYOqEfx8zlH+5Sxt9YQ+yaCfwMwmY+F4GpsOJ5I//Phx941+OLojuU
         NuGsN6zW/Se3esfURLrlJl5F2GP2bKQz5PQrqzvqV5x9vhkr/LJPHW20wRb/6wojwGw4
         NrR6VkAF1nGnZ1x1/ZPIE8G+Z4vDhIiVF56ff7QQGoG3FvIkTQy3N3Pg1+WBfu3f8juG
         0kpJpklCt3huxgWiHZdBoFqwi/GLXTwg0uAQjwV3+UMn13lm/K+YXyu4CtWXe/Wx8jxW
         /5Bpwmiur8AhHlIOG2h/krNBweE30+yNlDn/86OP/NHIa6aqeNPBzfrdkAgqsOl4vBwy
         HDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724672229; x=1725277029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2nusbgSKYLv+U14MfvhPK5qtdt30OwBoMb18XviAAQ=;
        b=SUZLV1SRZscF8LHzYNY7KnLmr5a9g6hdNQgmo7JRcFS37JJJngZWBGD7x5lqq3rmo2
         +Q/wAn1ndhw2/eXjQ1FgdCNgfpcqWilEaFPec/raOqO/xVCPD51gOHmnk1vk8vR+FmQm
         n0ZeCbrp5CUvtVyGDDfmneluWP8i33u4wd9VU5ubqc/q5EoHgmkEYPhP+VhFgoCUIcfv
         o526h3OZlvuy+5aQIJspCDxmwlllzDOvJcuQZFDXeuB4rdAfFb+xRkbdCxVhb8Qik0LO
         k647seOQSj/YZGTyTVyhMg1zXJa4xhcB6Knb6bhwGtxNGh2KPg8PjuazNCzd6L1yPNqX
         bHag==
X-Gm-Message-State: AOJu0Yy6uOMslRNiaVDLR3HhCPCYvaP+cGESxeJ+ZpfhBMnuPCB+uyfi
	MYGRwOAAo2O39Cl4N254yZE7YhuShNIdgKnETWNvbu+7DTy3MDH9
X-Google-Smtp-Source: AGHT+IH/Z4XSeejd3n0RkqsVzvQciplpnjeHsiN7dfasjVeb7FM1jKiUypYbCrFdm+mjLq7ub71CMw==
X-Received: by 2002:a05:690c:4585:b0:65f:dfd9:b672 with SMTP id 00721157ae682-6c624fb6c9emr88562897b3.11.1724672228515;
        Mon, 26 Aug 2024 04:37:08 -0700 (PDT)
Received: from [192.168.50.200] (99-7-180-181.lightspeed.brhmal.sbcglobal.net. [99.7.180.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb569esm15013487b3.14.2024.08.26.04.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 04:37:08 -0700 (PDT)
Message-ID: <5db86032-f0eb-46e0-ab79-43c5fc321ffc@gmail.com>
Date: Mon, 26 Aug 2024 06:37:07 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASUS GA605WI Tinny sound - No Amp?
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <a8a1bdb3-bd25-45c9-82b2-e96765fc1168@gmail.com>
 <5a554db6-b278-4cd2-a637-3cc15a3b9caa@opensource.cirrus.com>
Content-Language: en-US
From: Walt Holman <waltholman09@gmail.com>
In-Reply-To: <5a554db6-b278-4cd2-a637-3cc15a3b9caa@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yNi8yNCAwNDowMiwgUmljaGFyZCBGaXR6Z2VyYWxkIHdyb3RlOg0KPiBPbiAyNC8w
OC8yMDI0IDIxOjM5LCBXYWx0IEhvbG1hbiB3cm90ZToNCj4+IEhlbGxvLA0KPj4NCj4+IEkg
anVzdCBwdXJjaGFzZWQgYW4gQVNVUyBaZXBoeXJ1cyBHMTYgMjAyNCBsYXB0b3AgbW9kZWwg
IyBHQTYwNVdJLiBUaGlzIGlzIGEgYnJhbmQgbmV3IG1vZGVsIGxhcHRvcCB3aXRoIHRoZSBB
TUQgQUkgMzcwSFggYW5kIFJhZGVvbiA4OTAgc2V0dXAuIFRoaXMgcGFydGljdWxhciBtb2Rl
bCBhbHNvIGhhcyBhbiBOdmlkaWEgNDA3MCBkaXNjcmV0ZSBHUFUsIGJ1dCB0aGUgaXNzdWUg
SSdtIGhhdmluZyBpcyB3aXRoIHRoZSBzb3VuZC4gVGhlIGFtcGxpZmllciBkb2Vzbid0IGFw
cGVhciB0byBiZSB0dXJuaW5nIG9uIHRoZSBhZGRpdGlvbmFsIHR3byBzcGVha2VycywgYW5k
IHRoZSBzb3VuZCBpcyBvbmx5IGNvbWluZyBvdXQgb2YgdGhlIHR3ZWV0ZXJzLCBzbyBpdCdz
IHdlYWsgYW5kIHRpbm55LiBUaGlzIGxhcHRvcCByZWxpZXMgb24gdGhlIENTMzVMNTYgYW5k
IHdoYXQgYXBwZWFycyB0byBiZSBhIGNvdXBsZSBvZiBhbXBzIGFjY29yZGluZyB0byBkbWVz
Zy4gRnJvbSBldmVyeXRoaW5nIHRoYXQgSSd2ZSByZWFkLCBJIHRob3VnaHQgdGhhdCBtYXli
ZSBpdCBkaWRuJ3QgaGF2ZSB0aGUgY29ycmVjdCBfRFNEIHNldHVwIGNvcnJlY3RseSwgYnV0
IGFmdGVyIGZvbGxvd2luZyBhIGd1aWRlIGZvciB0aGUgUk9HIGxhcHRvcHMgZm9yIGNyZWF0
aW5nIHRoZSBwcm9wZXIgZW50cmllcyBhbmQgc2V0dGluZyB0aGVtIHVwIGFzIGFuIGVhcmx5
IGxvYWQgZnJvbSBncnViLCBJIGJlbGlldmUgdGhhdCB0aGV5J3JlIGFscmVhZHkgdGhlcmUu
IE9uY2UgSSBkaWQgdGhhdCwgZG1lc2cgcmVwb3J0ZWQgdGhhdCB0aGVyZSB3YXMgYWxyZWFk
eSBhIFNQS1IgaTJDIHRhYmxlIHRoYXQgY29udGFpbmVkIHRoZSBlbnRyaWVzLCBzbyBJJ20g
ZmFpcmx5IGNlcnRhaW4gdGhhdCBpdCdzIG5vdCB0aGUgQUNQSSAvIEVGSSBtaXNzaW5nIGl0
LiBJIG5vdGljZWQgdGhhdCBpbiB0aGUgc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMg
ZmlsZSB0aGVyZSB3YXMgDQo+PiBhIHF1aXJrIGFscmVhZHkgZm9yIHRoZSA2MDVXLCBidXQg
c29tZXRoaW5nIG11c3QgYmUgbWlzc2luZyBzdGlsbCBmb3IgdGhpcyBtb2RlbC4gSSdtIHJ1
bm5pbmcgNi4xMS4wIG1hc3RlciB3aXRoIHRoZSBsYXRlc3QgZ2l0IGZpcm13YXJlIHRyZWUu
IFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGluZm9ybWF0aW9uIEkgY2FuIHByb3ZpZGUgdG8g
aGVscCBnZXQgdGhpcyB0aGluZyBydW5uaW5nIHByb3Blcmx5IDopwqAgQmVsb3cgaXMgc29t
ZSByZWxldmFudCBpbmZvcm1hdGlvbiByZTogdGhlIENTMzVMNTYgZnJvbSBkbWVzZyBpZiBp
dCBoZWxwcy4gTGV0IG1lIGtub3cgd2hhdCBlbHNlIEkgY2FuIGRvLiBUaGFua3MsDQo+Pg0K
PiANCj4gSXQgbG9va3MgbGlrZSB5b3VyIGxpbnV4LWZpcm13YXJlIHdhcyBub3QgaW5zdGFs
bGVkIGNvcnJlY3RseS4NCj4gRGlkIHlvdSBydW4gdGhlIE1ha2VmaWxlIHRvIGluc3RhbGwg
aXQsIG9yIGFyZSB5b3UganVzdCBtYW51YWxseSBjb3B5aW5nDQo+IGZpbGVzIGZyb20gdGhl
IGxpbnV4LWZpcm13YXJlIGdpdCByZXBvPyBJZiB5b3UgY29weSBmaWxlcyBtYW51YWxseSwg
eW91DQo+IGFsc28gbmVlZCB0byBtYW51YWxseSBjcmVhdGUgdGhlIHN5bWxpbmtzIHRoYXQg
YXJlIGxpc3RlZCBpbiB0aGUgV0hFTkNFDQo+IGZpbGUuDQo+IA0KPiBTcGVjaWZpY2FsbHks
IHlvdSBzZWVtIHRvIGJlIG1pc3NpbmcgdGhpcyBzeW1saW5rOg0KPiANCj4gTGluazogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwNDMxZTgzLXNwa2lkMS53bWZ3IC0+IGNzMzVs
NTYvQ1MzNUw1Nl9SZXYzLjExLjE2LndtZncNCj4gDQpUaGF0IHdhcyBpdC4gVGhhbmsgeW91
IGZvciBoZWxwaW5nIG1lIG91dC4gSSBoYWQgYmVlbiBqdXN0IGRvaW5nIGEgZ2l0LWNsb25l
LCBnaXQgLXB1bGwgbm93IGFuZCBhZ2FpbiBhbmQgbmV2ZXIgZXZlbiBub3RpY2VkIHRoZSBN
YWtlZmlsZS4gVGhhbmtzIGFnYWluLA0KDQotV2FsdA0KDQo=
