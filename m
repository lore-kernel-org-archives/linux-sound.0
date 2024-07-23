Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2628213B599
	for <linux-sound@vger.kernel.org>; Tue, 23 Jul 2024 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749141; cv=none; b=gg7qdOqjr7VlPcmo4VLvXpA9j4FhGpLJ13cEZIjlxE3firLIcgT2ZOoRRf0Tx7OyN675HwAvnP90ELGzR7iCrvIk6OTZ7L2HwRhDDg+vMz600ln8prkOObxls9l78mKXRx1JMXI6iRMmVSjhZSVu4M/TcnuYSNHotGC8ixc5HC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749141; c=relaxed/simple;
	bh=LqkjbtqpwsvD6irvMKsUzQm23DdSEtCegougaYPwBb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDu5F1ltdOCCZA8TO5MfywIB+hn6RmzaE2mBhH6MsmRjROZINjS0ZxWiQfoxlDgmWcu+gC4YjC0G3RNTUfrYiCCXvPi4PHp876AsU/NtsabXX96hmjzoA9TT+qpBrbSVFqRDkclcw07a9jzGXQCXuMeJEEQnBvtTWxf7Aa4DTxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOu9gLDL; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOu9gLDL"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-704156d0e0dso3256953a34.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jul 2024 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721749139; x=1722353939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrK0UXWlpbKJ090e0e3tzuMfddfgd69GL57oA2q1Do4=;
        b=fOu9gLDLYXFp1mU9tFdpWi+FbNpUtl17XXkaWz46QSZ0ZegMYHtj8VK3px8hzOGzTS
         9uN9Ho1BoBqVpBpy9fAzxKXA6ChLIB5OkDfdKGEf88bVLrVSFpb345q/YncMrJLpNXa4
         YJhTYaedM6V+9gPeE1PmytncMlPGkdaQLtGTdKMSoASnFQldW1TYR4GVT/QR0DfveiZb
         C+4JzvMRj0LiCPgalzwa828VwYM9FELlBPxTJnPZ56PBj9Aq8MW1atqR0+L++9CPiFhy
         BxSrsKQWTjvBTwYrfA8yl1Hh6VBsRLZRk64M2inoepGoTTbQ9X8XsOvyOYdmvBNlaQBS
         lP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749139; x=1722353939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrK0UXWlpbKJ090e0e3tzuMfddfgd69GL57oA2q1Do4=;
        b=A/4mZFIQ3zraxhPgIbW14z501t7xek0zUyH75Wdqn5taUvNEpLHrga522gwqbolvHj
         SQOHrnks4J51lkx2OpClQ/mmOqIHQ5m3V1NHBcZvGb1u55L8aJpgwrqLcmevgTGIsZeD
         iU3IggKyAS5JM7cWtk2kFei3bkCKbRQBDDzM2CXpjZsvTJsQVPcGs+nI9CWcmx974xdS
         l7Jsq9XkNKIclXPcGha1EtVVv5xLVF742wDLwwckyzXsb7Y4IJekIG4T5bmMZ23hB17p
         RbYx9EXuSvTZqAtLi0LIhjhQGXbDz7VIlC24H3MNDGS7oC7uJ54ES/LzbCzdWRITW6cg
         AbhA==
X-Forwarded-Encrypted: i=1; AJvYcCWv13GK8C2nubbKauklCyPhOYrc22/XeaScdL0o0SPvVetf+h/CDznO4al0ien6t9w5tiqkOUNzykfnR+CjpEXQdB8oLSblaAM9EmE=
X-Gm-Message-State: AOJu0YzrfwqhLHtMJK5wZRNV27cJ+rAPe4g9hefUI2Wpm8C7CPeWigqP
	2yfSgNKuTu96QJciyrozOxCdEQ3MRmd9ZP+UGTBs9481b9Ia57sJu+hSuQAcN54=
X-Google-Smtp-Source: AGHT+IG3gOY3GBGSAIwmggul7hffPHMXaMDevCa/MxXDME5o5zKlku823JsGxkRP8YZNuITVW34JGw==
X-Received: by 2002:a05:6830:dc3:b0:704:4948:c4b9 with SMTP id 46e09a7af769-709234a7813mr200705a34.24.1721749139067;
        Tue, 23 Jul 2024 08:38:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708f60ee136sm2084491a34.47.2024.07.23.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 08:38:58 -0700 (PDT)
Date: Tue, 23 Jul 2024 10:38:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [bug report] ASoC: Intel: cht_bsw_rt5645: Set card.components
 string
Message-ID: <7052bf95-3aa2-4dd6-8136-d94833810463@suswa.mountain>
References: <918944d2-3d00-465e-a9d1-5d57fc966113@stanley.mountain>
 <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7572302-7d78-4e72-a470-57f2aa0c8537@linux.intel.com>

On Mon, Jul 22, 2024 at 04:06:58PM +0200, Pierre-Louis Bossart wrote:
> Thanks Dan for the report.
> 
> 
> > Commit f87b4402163b ("ASoC: Intel: cht_bsw_rt5645: Set
> > card.components string") from Nov 26, 2023 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	sound/soc/intel/boards/cht_bsw_rt5645.c:587 snd_cht_mc_probe()
> > 	error: we previously assumed 'adev' could be null (see line 581)
> > 
> > sound/soc/intel/boards/cht_bsw_rt5645.c
> >     570         /* set correct codec name */
> >     571         for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
> >     572                 if (cht_dailink[i].codecs->name &&
> >     573                     !strcmp(cht_dailink[i].codecs->name,
> >     574                             "i2c-10EC5645:00")) {
> >     575                         dai_index = i;
> >     576                         break;
> >     577                 }
> >     578 
> >     579         /* fixup codec name based on HID */
> >     580         adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
> >     581         if (adev) {
> >                     ^^^^
> > The old code assumes adev can be NULL
> > 
> >     582                 snprintf(cht_rt5645_codec_name, sizeof(cht_rt5645_codec_name),
> >     583                          "i2c-%s", acpi_dev_name(adev));
> >     584                 cht_dailink[dai_index].codecs->name = cht_rt5645_codec_name;
> >     585         }
> >     586         /* acpi_get_first_physical_node() returns a borrowed ref, no need to deref */
> > --> 587         codec_dev = acpi_get_first_physical_node(adev);
> >                                                          ^^^^
> > Unchecked dereference
> 
> This looks like a problem in multiple machine drivers sharing similar
> code, if we want to consistently check the output we probably need
> something like https://github.com/thesofproject/linux/pull/5117 ?
> 

These are actually Smatch warnings, not Sparse warnings btw.  (Smatch
uses Sparse as a parser.  Everyone gets them mixed up).

regards,
dan carpenter

