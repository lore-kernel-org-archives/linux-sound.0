Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC815426693
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018687; cv=pass; b=j9qY2+/CojXKctGQaTXo9ByHknheUS/8Mw8k9zHoQ59EoRKHt+pCAB7KCGBj7DrSuhpyUfa4bcHPGXccNjEgQeBL/q9EFh7uCKqu/wYiafXCkpOhK9EeFCi+fUPAkqTFuNBhqE+/ast7KTd/9nRdOZZRkVZSdFHpRJ+oq6qLaLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018687; c=relaxed/simple;
	bh=v9CkC0IUkTCjijk10hesi2Ux7HcoYWXBGJgEZvYArnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGwWRscadM+LaZvVzxHGrSEW87uLxHV1qkY4YMo3lwb4L0LfgC4q3Zs5h1B5M5suIt3bxvCAPUjd3ypL4HYfFeWmz3hxm54y0bva+2Pmkxkiwii6/Y7jZCERsOWzreYTzCRzJu92e63klxKz/27C5r3e2rcYjfhwNpBOgq93NsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxX+q3+r; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxX+q3+r"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-667b0ced2d3so5454122d50.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784018683; cv=none;
        d=google.com; s=arc-20260327;
        b=oumj4FPQ/MfcuzaHq/QP0o5VrKV76uBNBiS2LN3eIpUk0feYOSrd4+L40/sql2MG1r
         xdfJFFsW55lkum1PTYH5dd2+bbqAFko+9MtYC1TaTyuqrXzsB97B26KCmzZpLZ9VSpLx
         TbmKImQpMbnhKuRPlLSz8FeErphe401d4DgMLuI3Xpx0hqZBTCB+EX1Lw9W4hnmMwVLm
         FoKkHFKm0cBg+srW7WcuDPcY0JNoeIo/gBwkuAbqMxIDD6ZkIC9w2gSNrP8j4ITA2Tk+
         4pau/GyhTgtmf12MCeIKuWprG9IQiLAOAiVsWbt1dqiwAEAqENZrGOm9PWVCDSRpCbbl
         365A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=997t2oDEbZst/e30RzuUFOMAIgJy7wVKg2mw9L5gqmI=;
        fh=YblHzFqwReSA3ahni9mjeQZrgjmy2V64G/FnLxb1bnI=;
        b=bg5nManSUjVpQaIlLDkL/8nPY5MvFjeQhzkuKWm5BwAD9DDECccde8sjqw2WSbYLbO
         2zumT3F4ktYAa6DhqjbOrQI/XOrpVLqBMm/xJXr1SIEgxEo7U6x7ZetGdvAPj5NgB+KK
         PuuN/HNdxaiODBfssYszaWKs3/ArpLrJ66nLESjpHICsfYxmqjWwco7PH8eJOWqQnQLy
         zCpBYmQNf0F/D3Ugwjymc4PQDZ3bsM1FZmbUphE3HZnqS0wPOQZzFfeVmQsOuLncnqex
         IAipg+2Fv86/LW0N6Dck6JVw+Tu30Z0JdLVUs+3Ixj3EfvKQOtdBvQjEjYZb0JrC9upy
         4Pxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018683; x=1784623483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=997t2oDEbZst/e30RzuUFOMAIgJy7wVKg2mw9L5gqmI=;
        b=WxX+q3+r5uGGsE6K5JE/YF/jyvqhW6WncyCvDT2ImOHWBjr4gUBE5DSWBHra1fBIMO
         zOctUGiefVz/A3jHWhaA05YBEIKcNKhFLE3MKcHyWeoX4yfLvQWmhDYKctT+Ot0lOssR
         /5zKc90//20LV5eHbCjB0Dka4n5CXx4wGxeKhJu9HXXhyQJeT4xvi7iKLjWZ1bcEd29X
         iuYG0nJaFq/4kwc7zg3bZDSt8WhwY5YN9jWks8kWew9dfseT4jAYEZvezrLQu/espiqP
         fUIHIki1BZh8P5yWdpUuzJLjo7RngWH8fyEYEbbWU6iNUVyWU7P8txEXFM+57DCnOhPT
         nIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018683; x=1784623483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=997t2oDEbZst/e30RzuUFOMAIgJy7wVKg2mw9L5gqmI=;
        b=cb1pQA4XrKVb+SX70xCJU3R4qVSPBQQJdy3SY1UwP4Sqayq3ZqpEl78peg0Ot4WJ+x
         Sz6dNQOaK47UBr55p7yi+hWcYUxAN+/dlORrsCuOeejt5bxnQHh+KwNZP1pBR/J9fPZo
         JRlZ1tCdYi9GqElf+xlg9mq0uOJCTwVsCsDR0U7CysHAn0YWVl1WwgiixQ+s28klfpU9
         44HePbyz9dKaRdd/VofNnT2feqGrnSEq/l6gUVb6BVx5VGBOYP10Fi6btzd53X7QT+eo
         3sovcjl+GqCa5um1QoTuXTXvVz2eWi8KNj5ZDlQ90gvW++5oy3iJzrOORPlCAYru6ECC
         BFdw==
X-Gm-Message-State: AOJu0YyLpif1MPEGx/RUzl57PXn3NJ9+kpvxYlKG2frJ9AP3GPH/Riw1
	BmavoueUS+wLM0BsAYT/0Z3RgjfOXYDo/d+K2NZGBHnHDtZ4DjNvoVyTWq0DtdJftxoI7cHsARg
	gOdlizWECKclslZ59ZgGDUQCt4gqXXxU=
X-Gm-Gg: AfdE7cn5bK5o2hNcbYgZ6ypUULMaSqkMYofY0JhPSa7uar4/lbhWAN1rqW7f9m+iNQQ
	NBx0LM2XPeQBH0XsTdHJanafhcmvjNDOPL/GVMBMP+2UqDQhz6llDDPzhpYWT9+cGAvpMIYcENE
	PXKYiA86WMZRur+ahUL9nBGisbSam8O/4Ixz4gn99DB1gUXBD39SDVIc10QUF7lW3h7h0x+L2ok
	tIP3Gis4YM+685Y2O9h9Y1N43SZBH0tFQW0fINVNhIJ9Gtd15AYb+CusUKjy9a3ghdz3yrtvA==
X-Received: by 2002:a05:690c:316:b0:81d:2194:6c4a with SMTP id
 00721157ae682-81e9015f77amr87430207b3.47.1784018682806; Tue, 14 Jul 2026
 01:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713071544.35722-1-kunjinkao.jp@gmail.com> <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev>
In-Reply-To: <cf0a24a9-40f1-4669-b616-9e244c1e7876@linux.dev>
From: chang wu <kunjinkao.jp@gmail.com>
Date: Tue, 14 Jul 2026 16:44:31 +0800
X-Gm-Features: AUfX_mxM_m1IgMVwvRU8E6rnRa5qy8VxT2MzQ5MxcMTKDe_z88FPQCS3fTM_p98
Message-ID: <CAMTmk-2mGbujBgBBPVtwKxgF7OQJAoS4kK160mrMgazARrV38A@mail.gmail.com>
Subject: Re: [PATCH] soundwire: stream: validate slave port against DisCo port bitmap
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
>       prop->source_ports = 0x14; /* BITMAP: 00010100 */
>       prop->sink_ports = 0x8; /* BITMAP:  00001000 */
>
> Those properties are really not optional at all, what's optional is that they are blindly read from firmware.

Agreed. Describing source_ports and sink_ports as optional is
inaccurate.So I'll rework the comment.


> This test is a bit odd, there could be cases where only source_ports are defined so you would try to check for a sink_port in sdw_get_slave_dpn_prop()
> It probably works in the end but maybe you could check s_rt->direction with source/sink port first?

I'll select the relevant bitmap based on the stream direction first and
reject a zero bitmap for that direction.
