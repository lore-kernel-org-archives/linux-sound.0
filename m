Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9221FF2E
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 22:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771454732; cv=none; b=BgLE5iHtaIKTD6SqfRjUpRiIjTwusfOsFG9fN/Y+c1AcKZQIbMTNYoqbWAW8gZzadnUUZz7mT66tUxu334fu/QcVTl5Ssq0wa/Klgt/e4Jv4CnWT+zbpK0Yg07u4ZT68YaanV57DpHKJraADA+vUEf1bHVCq9bx/1NQBui9CRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771454732; c=relaxed/simple;
	bh=AnM104S1r6iwHGiyNexvZNE4VCfd99SLmovq/8pbc0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIXX5BVSHcg/hJGeTjQ+UEMMiqho6H4X2YkiT0Gi8l1tOFP8DJDYdUhCdq/lRI7YhDsYpV21mMOYWPq8tZ246EM1JdVn5YlDkOge6mS0vmKEqO/8L2+7j68LQ5ohYBagWiiGygzi2sjMmcY3VpiQCYaKCH44T/a0VN/4+4gWFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMcA9b5d; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMcA9b5d"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b883787268fso53736766b.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771454730; x=1772059530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Omq69PVtzUakJe73el69HdkBb1Z6AdKJRH0nDsT2Rn8=;
        b=DMcA9b5dikF2slQNiXwwF1rIIFHdVad8Z4wIT9Ox+0RpoiQ03IVqVeCeqYUoCoLlK5
         MG72szisxwTDDcxjn9mrtEEy5nKgdnKwnIdtRtaH+2sf3tUgfaHQB91ocmWA+oQpoLm6
         mfpjtdD1RfymOIx9THuf+AnBVJJNHK77x9eU/lq9ijdueQIPZ+U6U+amU9CUsp59pUcu
         vzHZ+guL1mmDxQUlpL7RFmLeKa+PtKKDXcxH2yqJT9eUtKgoy616dTMOr/OAw1snVRMF
         ni4CI4UZzwG8T7u+vQBf41gctZyU6QLQKzCQwdKH1VtvI9TW+x20GjfoVC7/JusmUlAv
         YzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771454730; x=1772059530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omq69PVtzUakJe73el69HdkBb1Z6AdKJRH0nDsT2Rn8=;
        b=C4cD/mjHSjHk6mWp7wXGN+KE3Uo/1xZ306IPtzFYnOECKTOLcryWZxq04jqyl43xTK
         XWjllYq9N42MwAoTR2uK//7KbzatLQKOsM5O7iEj3bZPjfIm9NWKVjdKQdeybKYdTp1M
         q2G4f7bscTmF6pIwX5V3nya8x8rUOQD79rMkyhWCnN6dspA+BcAOEtqOruyLgTuV2Gtk
         +80FVW+Xr3EGCmavQ6isVM3wcBuYSI0V1ajdyCathTjy4Yuy/hgpNl3/Oi+r5Mv7rTOm
         UxvHdh7/QETdsO3zrn6RefSC/UaNveLVp5HkGnoVqyJURv3+a0kc8zcFe4mED7yONex/
         SlhQ==
X-Gm-Message-State: AOJu0YxNlcoOQt8NxwfnpnDz4Jaa52gi6Uedkps6orKAu9pucIcFgN0q
	Q7swza6uPxXodDErveaGBzqfVAF3TCIlW+MAIHtysIE7cNtBo4FK5/neG+srkg==
X-Gm-Gg: AZuq6aLi/OLEJ6DYS2AolIDjoyrUBbI5G06mkYhGX7WAGJWDtwzly7mXSlFMnuAmXHm
	WUo4plSzL/XpCQvghLIHVCd8dwwtoGkWUxN/MXAsOJU89R1Zwgu9xStXxis2s4B7bpiQvrhGTPG
	+hhMZAn7IpAa+mZEcO5GzZWKuh843isBR+EEjULHReBo9ZYusdQ1rXbs39tKyFwdgrFpF3iMAhL
	JJMxYhuWQl8XPges9TGwQz2luque0D6HGgCqrtMJcxpjpnxZOOiGbjUtHYlYEwagHZSZ8aZXrlB
	G/2JGN92p5BFSL1IARxXA8EaHYjLiMbd6Q1ftOQw/fLWocmZhVYhsQbKpO3kDzfiQ6VYMo3Eoci
	kJ5RQLZIM9z/z+o0E5WM6GaFZLzrZc0UCuLx3fKcdWSMiUjFCyNiAgyykWSjClj2vU84Mfn4VRN
	ywoYij3njqud1pBA==
X-Received: by 2002:a17:907:2d21:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-b8fc3ceea42mr873970466b.49.1771454729485;
        Wed, 18 Feb 2026 14:45:29 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm503674966b.57.2026.02.18.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 14:45:29 -0800 (PST)
Date: Thu, 19 Feb 2026 00:45:28 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v1 2/2] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Book
 entries
Message-ID: <aZY_YEMQzqJlUpBu@jekhomev>
References: <20260217231324.1319392-1-jekhor@gmail.com>
 <20260217231324.1319392-3-jekhor@gmail.com>
 <3ff76f35-be88-4281-be92-ec8f1e160651@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ff76f35-be88-4281-be92-ec8f1e160651@linux.dev>

On Wed, Feb 18, 2026 at 11:35:12AM +0100, Pierre-Louis Bossart wrote:
> On 2/18/26 00:13, Yauhen Kharuzhy wrote:
> > Lenovo Yoga Book YB1-X91 device uses a Cherry Trail SoC and has a valid
> > ACPI DSDT entry for the RT5677 codec. This entry has some non-standard
> > resource definitions, such as jack detection chip information, and
> > hardware has some additional GPIO controls so use 'cht-yogabook'
> > for the driver name instead of some default (like 'cht-bsw-rt5677').
> > 
> > Lenovo Yoga Book YB1-X90 device (Android version of the tablet) has the
> > same hardware configuration but lacks a valid ACPI DSDT entry for the
> > codec. To match this device, extend the existing quirk designated for the
> > Lenovo Yoga Tab 3 Pro YT3-X90 and make it more generic: select a matched
> > machine using the dmi_check_system() quirk mechanism.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Looks ok to me, but since this is touching 10-yr old stuff maybe it's worth having a patch that only merged the existing quirks together.
> Then you can add a new set of entries. Easier to review/test/bisect.

Agree, that sounds reasonable.

What about the driver naming? In this patch, I used 'cht-bsw-rt5677' as
the default driver name, but this driver doesn't exist (and I doubt it
ever will in the future). Should we use this 'template' approach, or
add a 'cht-yogabook' driver entry only, or rename 'cht-yogabook' to the
generic 'cht-bsw-rt5677'?


-- 
Yauhen Kharuzhy
