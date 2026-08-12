Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAD279DB6
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503596; cv=pass; b=kh1SuTakBlwg27puzBXQb8TzfR3ERfu0XQ5pL7n5QPmJwYYhYE6c8X1YrTfkbByoCqIPGwiIPV0n2T5GKQZbam9uFe3K+0Z5CFrnuskBL9mRvTADExI0TamaR+8Iuee36C9NTRzzwVA+oHBhakiGN6WM3Tv7PMzukdhQOsmSOek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503596; c=relaxed/simple;
	bh=lQzeT2dKS7kEGW7IRBakdkWLghutWxNsSH8s7coYrLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLzcXBQ7B0AX5Zyc0nnP/qmKRg6cj/LdGCWelV6/ofHW0AXyn+b0e2CEyMOg1EoOZcbvsPi5mlzXFHhF7k9HlhPQXtkUmbYzBJVGCkQ5KAAmpw6jEupaVPI6/T72thZhuNl0eXe9YhhI6OA55fRSzTV+/j11kf8Io/9dIB23gY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MovntalX; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MovntalX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc97653887so7463835ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 19:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786503594; cv=none;
        d=google.com; s=arc-20260327;
        b=iC0HRnTdS8dGIKC95SQ7IJ6+ZvFLQ/FEwqSWJTJgpKPzXrU+Z4iRyZ1mceSVU8QjYL
         wWfNQ7x1ZuTFIy9tqetcOviWc1tnTdfP2iH61wGnHeXubAnRxCokB+Axu62j7sKhO4sJ
         /tpamv2SQ24MoWkCNmT6F55ZWar8FjqtNqRLAVI+caHAdldMdOp3vuF/fk3097WPeEto
         qoufKIs8f+MWvUJK5J7pPJARPMkcp0JnDzeVHCkKoTBhFtZQ0Bhvhlcj/okzTehmakUo
         1mO8EdnOtUIyARzhhHn1YLaepdQfiI9ErFt3XACDJzc+e9m4ikG8/ek6T0CMStASGxwY
         V8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mSHYKrsjFQuscIK7U4N8K8Md4xETKMq2JFcVnt2JG3M=;
        fh=J4bIgnK4UmCSPaoVeBSxzYV7GCpw5QJjfsja1bkK11A=;
        b=UFzXcFDTthsqwCsImxTcc/v20nWkQrPFnRupOerBZa2MKYJmiFU/FnZScDW2AfelRx
         gHlk4aIV0f4Im35yeBksMVcipwGOZn/W44eZTylE+ZZdDNlOzA1M3+K2g3kcpGoDv3yA
         2QHnCsMkM/JMyOrf5Y7T5OD7x/n7GM58ixlFzZqtXHVcbC/VTOXCwD56zvbMjU22yCQs
         ihIAhf+oUH8sMLjgTNH8G7g2CVvv1GYB0qJmkNnB543Z+w/7w5jug+23rCCCamm1OSYL
         C0UDc8YJULpFha+AWR4gXFvOR5P6XdlULKS4T60APQsAsHGk6Trur54XApAdmLEXbMQU
         OdUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786503594; x=1787108394; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSHYKrsjFQuscIK7U4N8K8Md4xETKMq2JFcVnt2JG3M=;
        b=MovntalXZ4Tr5GI3FFiJFJ9em337qWLAGzPdUyTLal6ErrJtjurHbi5Y9OqxXsHXu3
         yHJC1XkyeU1pHxaiKR2r6M5XYgAY2jMs/kFm//pFpBgvMmPiuGhU8lg01h4wH2xPOHKZ
         MTmC2k2ukq9ZGKfnyr2Vh0bYm3obqFXe5IXqRFQtBHF/93dZmG+ugio+z6eXJ25o4f7g
         h+A9KG2Ws0OG974iLEmkEYLlZq0DfUza3EFnqhI1XAekUSboJIM9+YWcbr5uz4tgGGJK
         CWJub3/68RjPW+azrn135KDxhvTcyx96O8/kgtfO6V0toHVtV5SZsuAwsAuO1FjK5Dpi
         jaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786503594; x=1787108394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mSHYKrsjFQuscIK7U4N8K8Md4xETKMq2JFcVnt2JG3M=;
        b=AsrwYNTDYibyI1Up5MxubWHJKXEw7QOuV1uPrcXyTpOOrc1zEtPl+AouOZ2zeE9iLH
         umRHmQi1OHRomk/EOMA7+FOuIQv5Po6Sc7iOOscpbou53vFyQ9gkp0cqdKspg6cvFHPW
         btVTs/BlmFWEevFkeQHME9/ogEMg6WnJuW7B6Z1ueXlyRMhzcLYk0r43pNCV4gDIznQi
         8v358q3dNWz4TqLE4XxZxtSKz2sDQbN/nUuDjsSmIU3I9YDlRxNNs5P/vWXKLDIF/nBw
         7d97MccR6LB8QvlWqdbzkrdJnXRnVw/+UAA1RRX8E29aw05t4WHs5breVuutgwf/j3wG
         XXLQ==
X-Gm-Message-State: AOJu0Yy6DmAMARRW/Uzkm6IFKCmUGG1s8brId+gnKkhbWgnipwT4DoAB
	bBwcQk8xIAz9hdKCrMrPIzBFAIUWBmj8pmx870eLF03gNCQBsL19eQel2ywBRVacQZBnBkj0j5o
	ZgM6nRonT+5ABkwedW7Wv8QBnU8zpNvM=
X-Gm-Gg: AR+sD13nz4YhZefpVVAgBvH+XIyI7/DLN1nNZGUKAOpiebXzElWYneZuvVFfc4iXK6T
	51v1diTE0y1qVXwTRh73RzoJWUhMcCPia3sgXBdg1nvC1FvZv6kQWjg8icnTq+fkcqclemQpkLV
	R0ow3bBe69MUSIr3i1xLqEkuhbP6ljQrpRb36BaGBJrZG5UKXcc5YkK8AP4snwjYErWZWNRRpb4
	OPg9sRczFZAMMZs3VZtl5FJeu1e0GBJi7zsq+Rxqzoj7ArVT53DIwGg+eLXUxmTkjizg4oOyN01
	GNfiVrJlyvEWxLx4RpDW3fWNt69ABwm6+7yA/SUpdRWZhAWWNy6t/N/SwgU7eHzUEb8eJQt79ca
	TSEuOhZoQzS7yVrZbyU0E1ijlPeqDcOt1DDw4zkHSnmw0eAcDzgknzHd4
X-Received: by 2002:a17:902:fc4d:b0:2d0:cc92:f7a7 with SMTP id
 d9443c01a7336-2d34569b00fmr22686725ad.13.1786503593917; Tue, 11 Aug 2026
 19:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811090550.38930-1-phucduc.bui@gmail.com> <20260811090550.38930-3-phucduc.bui@gmail.com>
 <cbceffb2-e573-4c4d-a81b-e6f368050c2b@intel.com>
In-Reply-To: <cbceffb2-e573-4c4d-a81b-e6f368050c2b@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 09:59:42 +0700
X-Gm-Features: AUfX_mxSgPWyFO3ZzeqLhQ5MeImuqzlCSC283lac5ZqvEYXkSN9R6crs-94rbXs
Message-ID: <CAABR9nGxPv+XUmaRBUoS=sU3vaUdfRT533NyqZFq5fGkTzz30w@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: samsung: aries_wm8994: Drop redundant probe
 error messages
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

>
> To be fair, xxx_snd_soc_register_component(), both the devres and the
> non-devres equivalent do not report anything.  The
> component_initialize() and component_add() do though, most of the time.
>

Yes, you're right. I checked and all the error paths before returning already
log an error, except for -ENOMEM, which by convention doesn't need to be logged.

I'll update the commit message to clarify that the error is logged deeper in
the call chain rather than by the function called directly. Something like:

-------
The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.
-------
Does this look accurate to you?

Best regards,
Phuc
