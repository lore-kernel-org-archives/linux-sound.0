Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEFB3DA5A9
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018150; cv=none; b=FItvECGGcoo8KD01Q8qzvtC1vFpGEfKIlJwNpjYNQUPleAxegNwo53j6oQQpYXSRw8f/WQ8tyQQdPYfMMxuBVkK29zhvhwEVOm2ck4yKjf1EB78KOT87CAHlW/T6DlvPM2O1w7enWIblqfM1kGDFIzOpzhUWiIqUnVbNSSaXrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018150; c=relaxed/simple;
	bh=NxY3IEzBUQWhhn//m/oJS8ynj77rccs7GmYDWdMsC/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJCYJU5yw7Vq+T7+IejQJbzE347sYhOlEJdGRfVIpQuDhiF62k0nkC/35NmkGHSlqphp/+3J4xFV38KyxOFPVoui+uIG4h0O9aMpvlBhDJebRhtuJa/W3xrFziXTX1owIiAVxZrgrbZOroOgomv+CxDEgxTnEZIhL0geR+0YsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwF8N9Jv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwF8N9Jv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cedda2ce6fso11126785ad.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018138; x=1784622938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=997t2oDEbZst/e30RzuUFOMAIgJy7wVKg2mw9L5gqmI=;
        b=KwF8N9JvWHKkyVVR+ZPSVmL/Z/DqRsoW9cjTcqdvh5tLL0jzSL5ivh76tgBnN4wGcD
         vFx2ZYSq7h6lDgEnwD/UBLtcoyZG7R23tw9NVFZwEIr1AppEKvUL7m6TYnuqG8XU7qfi
         Bnzvp8N5O1N7UnL5yJkLLkeAHRHqjWo1SYOjTVkp3y8AhzgFOcWdccJJkd6A3JGwQKW5
         ZOjp8hzBY9qulUm5aGfcE75nyBLk7iGcgtZBIzjunhChxUD63tT8GDPdf1UR8L5aGCzN
         0gXf0X30SexchzkVC5p6NwDTj33QbO8+KfKzPa2dQ0h8+k7/tOUqA/1GoMr22UMgVseQ
         z2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018138; x=1784622938;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=997t2oDEbZst/e30RzuUFOMAIgJy7wVKg2mw9L5gqmI=;
        b=lf3gq98LTpUjuN/J2/6WNv9Wgh+G48pPRVw0/+YQqVjXf+RwwLy56MwbznAFNZIJya
         wkmH2K4qEPjmR+PhKgTd6NyDHmkT+j8HIz+LtKkVSEufhK8IcH2rBZtedIBg3M2WVRcN
         KqzRMzvMEB2kCZDn4M8Q6HwALil4TdPgvM3N6wg0Cl2/uhyiMhoUm8NubwOq/ObulDJm
         +7q3po+8uzFRS89O7wn1PBNr7v0CIJFf+w/rYpNnMFHVDwVrjRam/cBAULKBzJ9TafKQ
         ES35/hihBt3ei8ptFgK70CRNBBJfiRAQpwC1A4d946C+fmBxcdcBF75QmuY7q3qX3JnP
         OiLw==
X-Gm-Message-State: AOJu0YzrJt0En6RtyaA1GWGZmPAibQ70k9j0OrXW5WBz2npDhjZvdcXC
	qNfVCBkvDSslZHKLd7aj+8Zb2b5pUvQYOnXrkuKX4QjxJBLub6pi4Hyd
X-Gm-Gg: AfdE7cnk2hlLb3S0uct0BxHZjwMpZWVEcL0tn/RIDDvqs9HBorKq5rLmpzcwjXzwJ6X
	8A0ebvQgrN24/qIHZVaaPgjWhomMt6MbxTvEwbDBF7OU2LwV5VeyKH8HoafKQto79ssVtjSA+yn
	enKye8/3HOZcaFJo8iq0YjB2Mkl1wPXtfb+YKwYSTTcQuZDNNW0SOLjlANpHVV8KqLdvY7SA9qe
	40X825KmQIeo7vev9fVjQptaDF16+XH9H4ozy3ZyPquaGq06NPlOZTI1HaovkZKyB77QaAdUH/Z
	ZCEK43YC8wwGBVgvNSjpzAnb7D7XSDZwJEZ4FwenJrkUx+aexgG7c7ZOkQyyHPiqWK/WRNxsqUt
	u22kgMfo+Crl/+HFE7/1fjBCNLt+pGR3VpYjknbFpmhunGxOj9u96cUt/b8UHQMbaBh+O7vet6+
	4Y0G4lt813pq4x+H7Psw==
X-Received: by 2002:a17:903:1c7:b0:2ce:ceef:6632 with SMTP id d9443c01a7336-2cef143bb16mr17673375ad.26.1784018138448;
        Tue, 14 Jul 2026 01:35:38 -0700 (PDT)
Received: from [198.18.0.1] ([188.253.118.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea74sm112691955ad.41.2026.07.14.01.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:35:37 -0700 (PDT)
Message-ID: <48f0b6d7-6cf8-4f61-aee7-927660f063b6@gmail.com>
Date: Tue, 14 Jul 2026 16:35:28 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: validate slave port against DisCo port
 bitmap
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713071544.35722-1-kunjinkao.jp@gmail.com>
 <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev>
From: Eric Wu <kunjinkao.jp@gmail.com>
In-Reply-To: <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Smart, good idea. I would recommend adding the first sentence as code comments, I had to look up the code to figure out what it did.

I'll add a short comment explaining that the generic range check does
not verify whether the Slave exposes the port for the requested
direction.

> That's a problem in general, maybe push this patch first through the Intel/SOF CI to check that some SoundWire platforms are tested?

I'll run the updated patch through the Intel/SOF CI before posting v2.

> That comment is a tad misleading.
> 
> In the real world, all drivers ignore DisCo properties provided by platform firmware, and hard-code the values, e.g.
> 
> 	prop->source_ports = 0x14; /* BITMAP: 00010100 */
> 	prop->sink_ports = 0x8; /* BITMAP:  00001000 */
> 
> Those properties are really not optional at all, what's optional is that they are blindly read from firmware.

Agreed. Describing source_ports and sink_ports as optional is 
inaccurate.So I'll rework the comment.


> This test is a bit odd, there could be cases where only source_ports are defined so you would try to check for a sink_port in sdw_get_slave_dpn_prop()
> It probably works in the end but maybe you could check s_rt->direction with source/sink port first?

I'll select the relevant bitmap based on the stream direction first and
reject a zero bitmap for that direction.



