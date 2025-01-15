Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D12475D6;
	Wed, 15 Jan 2025 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945350; cv=none; b=uByW4r233z+p5dS93f6kS/EegWgm6sNJQhHTL6hGtlIrnzUF1z0sNh6XefPxp5+gEyKBqGr9fMm0bh2vzGkTVQJb1+RcW1WF779vwxaMMSIElPdZsHNrRcrpbNtasJ4QHQhHXkU9v7H2wHXmdvn+pI5zByZTivj0x8NIVSGffo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945350; c=relaxed/simple;
	bh=XMVFWTU2wjHTfgtKPSIXo/jWKR1HSSMHHyq2bM6PNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2odEw4Ew5HqluuBCE5rEqm0Fc5N4LLCal96TBjJUTEZIYovZ+TloJVvFHQyT4LAugc/Ky5Sd1pjjenFOeRLCcGg4J/GBd3QFi1ylcC2trkgTnlGDmxMNaPVtJSuHNA0IWF5qlEDgpYIltVxvMqrJxgUZXcvzBC/FOYLMBygpJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGSNksHI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGSNksHI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216634dd574so77878135ad.2;
        Wed, 15 Jan 2025 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736945348; x=1737550148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iVY+qOO3W9vuDGLvombpUg9JWkQEy6Fimr+WqpogmkA=;
        b=SGSNksHIhe+7XYH/IclJAdSCIMQNUe5sFsd7Q7k6McoGGJB9fc557RuotgxTIlJv8V
         lwV8oIQMfH9nABjZZBmgrbFHTROEmMNvW4Bvu/UklYfUP6ToJFDGOwRjn2s6peW/6KqK
         wMbYLA/Jq9wdnA3Kbt2lGHzoDwFZz2CRfgStacfGgaNImRyWPtDBKRU4Au8iJ0O7hkTk
         TDKm4aAh0QY8sEIfm7FEjs/ZBYyuQD0SEMmzgwOUdmvSgprtSQ+j/mLzPxDO8y3dMzkR
         HoGtYZu2x2JgyAWykOqaLj4irkugJbo46SVxSt+dNlFU4uerhYcDqL5rmPtXDYR5Xvq9
         R9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736945348; x=1737550148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVY+qOO3W9vuDGLvombpUg9JWkQEy6Fimr+WqpogmkA=;
        b=P2LKfo3q4va1+FvhSZerBrr/R6VYykx+BEMTTDO6sFLuAcGzI0OsigoAc7jkcdODfH
         512DFelzzmM71OMSGYQbDwdPF3AzESvQ6QUq/OcI4ulkLmdgV6Vq0eb2gDK43BuTdP++
         QxFjFqwNm7nYCb/6LKpupPd20X+UtI0VwT9cI1ZewWH0zklG4GAoPVIg0Y9x1CtsADtf
         n5aAlblwKjVsxMBIzhVVqUGj0axVf4vK8v6NMbH+AHSzebs/dDlK4L2im7CWmiQMNjfH
         lYsTRqtWZJzVSXg72EaqVg+Dw7XC+raKrFdSkCFv9OVqqhZW6DbolacSMM95WmxNrJEO
         T1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDAhCRGBhY32xA811XtlIx2y4fZ+OMpB0SuKhQIUqLxNcI2bPXAlailc+3dIIFHGonPui3rpbaiqFK/gQ=@vger.kernel.org, AJvYcCWeI52uBsDE8NAvGs1paDYXX0fpJwdwizK3Vv9HT4AwpC+XtrwBaXH5uNo4Uhb9NzBdBdtaTOHL9PUZz/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbG/q+tMnuqpDZiIlPLdC1oPUdpTggZ+bRfopE1kXRLHWpHY5
	VjsDWy0NdCMmE7ok6CAOSoLJX2mJ1rwSUKcf5xsObPhBooVJAAf3
X-Gm-Gg: ASbGncvXEBRkzup8nojtJypzQKA6eYS5zopt7oGIUkjJGgYAtraK/kOSjiu3Ndxlj/R
	9YA0wShhoYTHhJK3YHgiNdY8DYCaYCWoVGaIpakyz+nXNMygu8PYiyK2UgsgKiyooZA7s6O0TXs
	sPj17Vxe+4s4ZR/8r9EpVNjsSr5/W32dbqExwVARSxGM0vNL0IUB+yJ9ciKm7sRGPfAHc8TDT5n
	MX+m7hcKnW4lGF8uA1ePE2LkEiK7rxetXRKeZA4pIyWkxzPamKQEkj+a4FHFMFMY/tUJYjwn6GO
	qokDRM8U
X-Google-Smtp-Source: AGHT+IHj60wXYT9IgHSKSIUXEG+4k0mLOFGknYN9PDBn1S/1RITgpyrlnO2AI3swMbmBLV9Rg07Yyg==
X-Received: by 2002:a17:903:230c:b0:208:d856:dbb7 with SMTP id d9443c01a7336-21a83fe460bmr427919975ad.39.1736945347727;
        Wed, 15 Jan 2025 04:49:07 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f8dcsm82045995ad.66.2025.01.15.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:49:07 -0800 (PST)
Date: Wed, 15 Jan 2025 20:49:02 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Luke Jones <luke@ljones.dev>
Cc: Julian Sikorski <belegdol@gmail.com>, akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org, lkml@sdf.org,
	alexdeucher@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, chuang@cs.nycu.edu.tw,
	hui.wang@canonical.com
Subject: Re: [PATCH 2/2] lib/sort: Optimize heapsort with double-pop variation
Message-ID: <Z4euvhAXAiZXCObx@visitorckw-System-Product-Name>
References: <20240113031352.2395118-3-visitorckw@gmail.com>
 <70674dc7-5586-4183-8953-8095567e73df@gmail.com>
 <651d5c5a228254f20a3e9ddd839ffb3683ec2dc7.camel@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651d5c5a228254f20a3e9ddd839ffb3683ec2dc7.camel@ljones.dev>

(+Cc sound developers)

Hi Luke,

On Wed, Jan 15, 2025 at 04:27:52PM +1300, Luke Jones wrote:
> On Thu, 2024-06-20 at 17:36 +0200, Julian Sikorski wrote:
> > Hello,
> > 
> > it appears that this patch has caused suspend-to-idle regression:
> > 
> > https://gitlab.freedesktop.org/drm/amd/-/issues/3436
> > 
> 
> Another regression from this has been reported here
> https://bugzilla.kernel.org/show_bug.cgi?id=219158
>
Thank you for reporting this regression!

From a quick look, this seems to be caused by yet another broken
compare function. In sound/pci/hda/hda_auto_parser.c, the
compare_input_type() function can lead to sorting issues when both
is_headset_mic and is_headphone_mic are true for a and b. This can
result in a situation where both a < b and b < a hold true, violating
the antisymmetry and transitivity required by sort().

Additionally, the comments about "swap" and "don't swap" seem to make
incorrect assumptions about how sort() works. Regardless of this
optimization patch, sort() may swap a and b without comparing them.

Could you help test the following code? If it works, I'll submit it as
an official patch.

Regards,
Kuan-Wei

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 84393f4f429d..5502ec09b584 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -73,6 +73,8 @@ static int compare_input_type(const void *ap, const void *bp)
 		return (int)(a->type - b->type);

 	/* If has both hs_mic and hp_mic, pick the hs_mic ahead of hp_mic. */
+	if (a->is_headset_mic && b->is_headset_mic && a->is_headphone_mic && b->is_headphone_mic)
+		return (int)(b->has_boost_on_pin - a->has_boost_on_pin);
 	if (a->is_headset_mic && b->is_headphone_mic)
 		return -1; /* don't swap */
 	else if (a->is_headphone_mic && b->is_headset_mic)
