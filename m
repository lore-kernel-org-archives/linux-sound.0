Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514A3E5EDE
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943598; cv=none; b=p+reUCJNUEcUMOfANtk04ktJ0QufDiPFEQjF2ODScy/68UCv9ATXu2Dno27HyYrnULIbjsu35f0kBU4Lnj1rJvLvlvGVQWC0JKG3NJ/diZwKuIqALbB4u6H7MHgY8n2JxaIdol4B4nKJm01diR1QMDb3jcbrHAiiMLCi2WseQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943598; c=relaxed/simple;
	bh=dU9xNgFDbx2kQ2NQXvuHFDuKaeO8ZHmpz5PoVlN6u3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzrTfJi5vEbZHYWssDEBz/we6/KdGJS0cNxI0+JuYvEhYOi+h53OMlffrLXfgFqvRJ0g8vyI8Qw/uF0xe3CMqJCQONS6tOGJ4VWzoKoaaX86kRriID8ntjCL/i1edsX5Ro9iQnLx9j8mnGcO60vtqxURGl6dIobRdIZKJfsGTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oO2cN6mq; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oO2cN6mq"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a535e7c00so76239997b3.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776943597; x=1777548397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvXLdkmJR7FtJxo7bxydgohDlS+pxyJJHlXN3C0yd9c=;
        b=oO2cN6mqcVkXope/R6niVk15HKM8gy/sfOpexhcCTUF8xgrRFlUqf0bONgWfow0A0v
         qMAjcrkBrMQQekWsvalvR0HgzKgq/kH5ZQ2Cra6N2qfFv9M02a1zPntt1TT/MC1aEgvz
         ST5fBBObeKqsv7g/lolr19BYXqgRtG7pufJpju1xEpqzjlm3zGO/e2ZWcw7YBU4OLGKs
         dpLqZtiRuocFIICJzHuNB1VSLTfLO7DC9gpejIcgJeIqYSaLXiMbU61HtMiltOPS0WT1
         voZq967J54rRKo9EPlPXQuy34A9OC9iRr3yi1Aq9oU7SEUqgOivXLbokD0Mace9X5TV0
         /XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943597; x=1777548397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvXLdkmJR7FtJxo7bxydgohDlS+pxyJJHlXN3C0yd9c=;
        b=ZosIMV74NwvVPpEDlmDfrL13PR3OeXGdKQQePo17NyNyiWE3gLXo9Mbe+uoAZkvqF9
         v+wvHY74rz2HRWcc7FLxUIFAgbKCeh4WArsNMDh1GGziw8ej0N9Qc3unHstQZ9EjMPXq
         GXhQ1BStjfdawTEjunM3LsMF/4wW97/Lu0CUthpsHfzFy5jOoa7ITskHRk9O5DVYQQRO
         TQzTTZMK7+QqMiuznpBOICLkkErIRbuhQKGj3ynvxdqKlxKH7ntGNzsSFT/1e0+iWJtX
         U7hI7metbiYDGIeyH7B/yVOBZBG/ljKJ1L+LkeNkmplPHGifD7/f120dBHKb/C06hxw9
         bGxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rCru3SmYakmOe/vMGkJOZ6P3a/vuTR+Z/WQgbYts4jk/Wt3WjnkUs8g0msExVcfopWqobRXXBwD+26A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHdQHqJeynSgZvCQA+0xEIyKqFnF7i6M2UQHGXGigmL7kWj8z
	jrHDr+0Kkpho8LNIc0CbKMT/MlIPaSFuf45wvb1XIECUg1J9F44E7OrLQfXhOfOkfJI=
X-Gm-Gg: AeBDiesaN7YTZG2O3Mdw7rPcqHjjG8XFKK1L6q5muYgR2qCQV5RIFNlsYzhg0+yRESB
	R23Tg1hrEz/bBTmMJP9GHetHVM8eTuUGdCPY/q0CGT8HJQJ/7QPkXWD1wcuaMokFVAknObFUhrf
	okRQT3EUe6UWRGInYEEh+A0ePV/zg+UM1vjGLEsRF9xwPg6pV73uFAHWBFYAOG8dfmDlxWy09/D
	fuZBhSEEPkTXSHuVeFEyJQPj3pC9Opd+RQQ2Z7pmy5fBAhgpS6bQZGoPzGXBMv3wiFhA9ODf78U
	/t0/3P0xNJDOCC5+S5Zv2+Z5JuJqBc6F6iWfvLo0u6TVBcTl0Sa6LLHUc53rMHqYWiIpp1UX0gp
	2cw7aXhvgPsNi9+YGkn2dl5Ay5lLMeWMl4V4ZYD/OOy7G+uYEXv3JZW7CCkBW6dvkM6ArOmKkes
	mpfhunDzTBulzKsAYK2NalXNpC8fVV5HRzzK0SJuw=
X-Received: by 2002:a05:690e:408a:b0:654:2882:42b8 with SMTP id 956f58d0204a3-654288246a1mr16369040d50.35.1776943596702;
        Thu, 23 Apr 2026 04:26:36 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6541a84063asm7486713d50.0.2026.04.23.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:26:35 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:26:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
Message-ID: <aeoB5h-VPs1Oaebw@stanley.mountain>
References: <aenFqUC8X2CucQwb@stanley.mountain>
 <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>

On Thu, Apr 23, 2026 at 11:09:35AM +0100, Richard Fitzgerald wrote:
> On 23/04/2026 8:09 am, Dan Carpenter wrote:
> > The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
> > NULL, it returns error pointers.  Update the checking to match.
> > 
> > Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >   sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
> > index 636d0f3198b8..bb0cfd9d5db2 100644
> > --- a/sound/soc/codecs/cs-amp-lib-test.c
> > +++ b/sound/soc/codecs/cs-amp-lib-test.c
> > @@ -2360,7 +2360,7 @@ static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
> >   				   cs_amp_lib_test_get_efi_vendor_sysid);
> >   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
> > -	KUNIT_EXPECT_NOT_NULL(test, got);
> > +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
> >   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
> >   }
> 
> No, this is incorrect because we are expecting to get -ENOENT but now it
> will fail the KUNIT_EXPECT_NOT_ERR_OR_NULL() and not proceed to the next
> line where we assert that we got the expected error.
> 
> The asserts are:
> 1. It should never return NULL (because it returns ERR_PTRs)
> 2. It should return ERR_PTR(-ENOENT)
> 

Ah...  Ok.  Thanks.

regards,
dan carpenter

