Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603755;
	b=jD3ny9hLHQKaPjYJNY8kHlxgsjvs6z1orHeOGMk2Z2MBw2aBoq3MOvg9nkgUb5TzoBJ3
	 Z7Ca9b+mEKW4WalhSfQUjzqPFzQFUFMxQLRDDmisuQS15lGludWIidod4EYykU2mzHJYW
	 X+TtJhrSGR5tz8GUc0HkIfNF6LQNMGoFT2qKkPyxGk4efgFnIXPQGEoZ074/wA5SjbUXq
	 UovAZaKx+35XoYrKOYf2rTkoqa4L7yuBvEmDUsYhl7HJM84i1xLjHQ76A1DpksMiJwijD
	 KuaPrvYySkGxDo0Quj7si4HhJjodQDCzzgOfeQeal4qjHCOo7VEg2l7c3ypuqN/vu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
	b=YYibyLK/KnVkBqJNF5KRW54Z5JBIZHPB6vLAawgRETJsUudSGViKfXfYwBsB/9frqZyR
	 tuW+729TEBLWBZYai9P8295e6NaEW8hQxwZdITG1d4qYeZ1Xx3J+juAM0idLKCX1XbUs8
	 9VOVL8DPL0IlmgAlybus/7u7/hyPnojj/jYU3nMc5qZ8vx4/I676ONgtrunyigj/hVZVb
	 i/i5kkPjkqxuHrvF75iLc8MvkaOzT6AroTX8TMyfwgUqq3Cjvh1TSD87dOp6Q2Sombgvo
	 5JFs/nE7nMCtIn8y1UtokUq9F9nuCXdwbTmQkyF3S69voIBvfuUCfAORCKO+4Ho696g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C665606A331
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C665606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso19508775e9.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603754; x=1795208554; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=0S20X9Bzah2+Tfz2ZQZw1RqrYJZoCU9ymtgMPp6uzL8ErAT7IJhcPcjTW62UYeCDR2
         tKfBYXayDMZmeIzcu001CRANf/r0KwcFunyPz9WusvFx7EBIlRSQMGj6LM1BgqCUguO2
         SAVSd0/U8H4U0XTIVhOwG2aiq8jNrQ70Vj5HtxtBJ0YqXz7q9qGQN5oeqnAfnNAvZVhg
         TR0MsIdEueeVx97MS/+trojKIKAnvpsn6deSKdRtUqiR2TEPre+hN5cRvp4oFdGnTyZr
         e0028uedLhvG271P78vpW2+1KWYpsNLpWtKC67NWDeUSCewzmQsCnB5dx5rOzn5rQiBn
         hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603754; x=1795208554;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=y93Zp8VqZ/NIXnOIS90uEmfs7hmzTvSzKdqNlAutomsBs7md7mXAtakGxqfecSkleH
         JK+zFw09runPXaIyQa6cPRPizk2rJgdN1NdQQpYeEl05RvmJLA8cAs14fNu8uGb0BBNS
         DRV7yrPtk12LMuScoXXeyZELV1zjINzic1GMUgBjELr8q6nXo6GcjpFefyB0I61Vif4P
         wziqgD0sSYpFYYZp4/3fK2yXcR2Cuq5OOiSHtHuXeo+x2lDs8b1fssaFcU4SFGKzUlDD
         ZG/mDaaqgmKxrdus3gohlUKUj3cwtloG3toBwQHEDfwPWQTIV9aPw6BzMKWCmluJMBNf
         Fvdw==
X-Forwarded-Encrypted: i=1; AL+hErGNx23QHRQRBAWttmzar0pysbbL/pzNLKCfpBChPuuCm+xogGK/kNeNCeOIHGLo8jOZJa5+gkDVSv85nw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bdgT/ss9un0gCQLfrHpaYF1iH1/pLWpslU1Mf0UR98X9Ua56w
	xnwZeJ1dIZiQAKvKONNHTHp/7WyM5tsEbvgRs+NEHS6Ixc53YzAbAc0C
X-Gm-Gg: AYBFou28AaIZl6T7F3ofCBc7aKRilwLzpcGIuQc3P3rlnIh9g0XvUfMYOw7Y9QkJxm2
	kGx9Cosn4MHnj5H0A8AJZ1X7aLj1lPv3FckziVn8YOqz2cPBVVS9+vzGpIqUeJO2K2fCusUU7jJ
	bGjQlSsHU/zUwaRFdUuLHYEaYFiK4Nq9DDIE74UHEWd0v74qPETGmViv0fKfM291NlIMPK4d2P9
	Vt371vmHhSb7S8BVCauQZdy7cipqvZ1CadIEYs8Omus0KnUxJysZRJlmqOI4VtfgIPWfq+57iXL
	GB7dwA6kzZ7QxmSVpRP7UDk+Us8+VGuPiAHVa5H1AQeWJ/3rOF/vihzuS62jhqBZ+egZVmEbFZ+
	nrzxAuCgiyYPKL9hPC/+to6/XY/s016s9Bghp0zUs8DNyvbzbY/ZgB1eSWcnGgDLnB1LjgSC/A5
	xs3obeUGFQegU9kzXl+gK5NJJbSTyIV16yZOuJUSm4RT/xPXdRzptq+wvdc6Fr1hsikpaaJ83+k
	HCYKGo98qfX6FCeGUShVhrcVRmEwVEcY7QAeAdjsoctNPIw4zLu
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr53419345e9.34.1794603753909;
        Fri, 13 Nov 2026 13:02:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA - v3 series
Message-ID: <0a29235e23b24698adc59fd117e0a222@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MyBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHRoZSBT
YXNoaWtvIHJldmlldyBvZiB2MjoKCi0gYXJtNjQvZHRzOiBhZGQgL2RlbGV0ZS1ub2RlLyBmb3Ig
cG1jODM4MF82LCBwbWM4MzgwXzZfdGhlcm1hbCBhbmQKICBwbWM4MzgwXzZfZGllX3RlbXAsIHdo
aWNoIGFyZSB1bnBvcHVsYXRlZCBvbiB0aGUgWDFQLTQyLTEwMAogIChtYXRjaGluZyB0aGUgVml2
b2Jvb2sgUzE1IGRldmljZSB0cmVlKS4KLSBhcm02NC9kdHM6IGFkZCB0aGUgbWlzc2luZyBxY29t
LGRtaWMtc2FtcGxlLXJhdGUgYW5kCiAgdmRkLW1pY2Itc3VwcGx5IHByb3BlcnRpZXMgb24gbHBh
c3NfdmFtYWNyby4KLSBhcm02NC9kdHM6IGFkZCB0aGUgLWVsMiBjb21wb3NpdGUgZGV2aWNlIHRy
ZWUgYmxvYiB0YXJnZXQgYW5kIGZpeAogIHRoZSBNYWtlZmlsZSBhbHBoYWJldGljYWwgb3JkZXJp
bmcuCi0gYXJtNjQvZHRzOiBjb3NtZXRpYyBjbGVhbnVwcyAoc2luZ2xlIHJvb3Qgbm9kZSwgZ3B1
X3phcF9zaGFkZXIgdXNlZAogIGRpcmVjdGx5LCBzb3J0ZWQgbGFiZWwgb3ZlcnJpZGVzKS4KLSBB
U29DL3NvdW5kd2lyZTogbWFyayB0aGUgTFBBU1MgbWFjcm8gYW5kIFF1YWxjb21tIFNvdW5kV2ly
ZSBkcml2ZXJzCiAgUFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUyBzbyB0aGUgYm91bmRlZCBjbG9j
ay1hY3F1aXNpdGlvbiByZXRyeQogIGRvZXMgbm90IGJsb2NrIHRoZSBwcm9iZSBvZiB0aGUgY2xv
Y2sgc3VwcGxpZXIgb24gdGhlIHNpbmdsZQogIHNlcXVlbnRpYWwgcHJvYmUgdGhyZWFkLCBhbmQg
c2hhcmUgdGhlIHJldHJ5IGhlbHBlcnMgdGhyb3VnaAogIGxwYXNzLW1hY3JvLWNvbW1vbi5oIGlu
c3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlbSBwZXIgZHJpdmVyLgotIHNvdW5kd2lyZTogY2hlY2sg
Y2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZhbHVlcyAoc2VwYXJhdGUKICBwYXRjaDsgcHJl
LWV4aXN0aW5nIGlzc3VlIGluIHRoZSBkcml2ZXIpLgoKU2VyaWVzOgpbMS80XSBkdC1iaW5kaW5n
czogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzRdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzRdIEFTb0M6IHFjb206IGxwYXNzIG1hY3JvIC8gc291bmR3aXJlOiBhc3luY2hyb25vdXMgcHJv
YmUgd2l0aCBjbG9jayByZXRyeQpbNC80XSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVw
YXJlX2VuYWJsZSgpIHJldHVybiB2YWx1ZXMKCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQz
OSBhdCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFu
aWVsIENhcnRlcgo=
