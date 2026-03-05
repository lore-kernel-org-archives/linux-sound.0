Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A43A5E90
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718501; cv=none; b=KLvBYzl4r5Vbpq28wc03eZ1gWuQJlhdDy5XDQ+fTgPvK/BpWI5hz+rramSNLaG7pgKMSofwXkoIKhPFF8i3qEpuPGQlVvLceSkivjdPSQ2Ki0fvDKOaMe6888VJUVYHXP/ZNMQIGni32ctX31ezSeIphuJM+OlNpgBZj72RRdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718501; c=relaxed/simple;
	bh=Y/U6dzr8HYlcVBpXU4s6771KLXs28Td3POcYpRPGCJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJnNOOKHZ8TDaJOkNW9e4yeWnIbyiqSFgt30FGO1JssTXxAI5P6oa8Sm31c8U3ujx1fkI4M1j9Ma63/Ltk+j5XQl0V7ZuIq+DtEjZLHDVIwJEwbCvpEMSpRmJL5u1gMiVwFDZmEokmrZz92yeMhHJo0AvmT6vr8IBey5p0kGWHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVzYgefu; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVzYgefu"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50698970941so97813361cf.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 05:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772718498; x=1773323298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMO5RCduv8sVFWa2cW8ITVOFRe4ocA/ZvzJGrJ1mPoo=;
        b=GVzYgefu1RfwzovModpfyW+4bBhj66JC88XpnT1AIRfwCzQvD5/g3ht/99AoCJ2ZOb
         GgrOD5Wd0EaLgsHAE3cvQYHP1S4AwXwk/rwl/AklP5b5oNwJ6ml7C4ww6GyVQd/9LJtv
         zftdGHUgFBT9rvfYZ6jfKshZ7d0vvbMBbKYPCUik6e7Y1IZLYAQB0vBboypYB2ogpJHU
         GwHTdHIj+A/MWEra2F/ojUJFJ5XP1BpydGbxXsnFmLmnU5Hb4ahucCARh/IgkuUVFprN
         ArkzabX+vtqhYOYHZ+IyNF+hauJpaZrBhhmEX5zOXwmcT65vLkGQxK1KEV8+oFOGSfYs
         V4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718498; x=1773323298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMO5RCduv8sVFWa2cW8ITVOFRe4ocA/ZvzJGrJ1mPoo=;
        b=LdFdd69dm9tPV0UeOAfgxGh9mCKFq5WSdPpnMa+Rhgj0eqLEZWJpkQZPWQIDLOyGdd
         6HmBCkfc3z5zSnjQfdKjGnocotWCdvHbn2UemM0fHcnmR/7GJA8eiVIJILCKv28YwTeu
         2GrEiwcvtAWMZU1/Bmd/Xl181FlITmqcAPTriotfbxCkJJUBterXCvVDE2pNyhJkT9MQ
         t5FLBEPqvisvpftbG0Bnps+mPAKme+ssx17AQzKkK+jHRhqIQJW2fzgBor1uEB/TbMjV
         brZESyHDXrUqDCF1HJVxKfG2h+TXLc1YEZ37XFUE+JdKHgCjJgdWEiH9fH7SBVJXtHNQ
         S76A==
X-Forwarded-Encrypted: i=1; AJvYcCVPtI4XiadScSqYNO4gLX/RBJWo/An7tj1tYtddDg9OR1gaF/9NLDBbehgFi6sTJvPTe5bAJPheP6Y8yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBRsiuu3ORcfs+y3GqogjzoOeKM8+pOHoOxh0jn8aVK6j57e71
	+JEPKg/feavwSREOt60xEGcD18xlhn6BIkC15O1F4k/HfETDSQ3NGwMu+eU4lw==
X-Gm-Gg: ATEYQzyYXCHyxBLuarnm3JaGG//+sgWciU1cShCC/30Uu8u1h1LNVbOm7W/3iLx9Hjn
	FShpij6qkHbDGQW44twfGOgFzxM9I7BUv3BfPgyE0HN2FwxkQCFqOAkBFxctCHHMAXK1V+OYwSd
	+zpOXbjP+8+3tehYnbCcqyMqm0FfbSSi9bB5wZ7/P2OaJILxhlmSx59eDLm1JJGjYYKBxnxyYPs
	INODrSE116QFoHwLrlEGCV5zx7aa+cf5kJYkCGDF+KP/xNj4OAXUuXiOaZaHQpP5OVtQFqUL7qe
	i4/N3j45azdTN6uvMPzIalDJ6PWMhNrHG3v4uoTpmDN22MJWAD2WNO8Ytnva12Ykuj0Ny5vSwbx
	MAcrgt/C6F/najpxq3toFmLeneJOwOmUZJyyuMLo20G4Kstq83nEpkPcOQ5o1heMDns6uOJsHWG
	id6j8+boycm22r7KZ3pIXstHi9STrXi7N477SW
X-Received: by 2002:a05:622a:144:b0:505:d647:645b with SMTP id d75a77b69052e-508db35a613mr71690511cf.42.1772718497953;
        Thu, 05 Mar 2026 05:48:17 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f8ad5b8asm119142016d6.0.2026.03.05.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:48:17 -0800 (PST)
Date: Thu, 5 Mar 2026 08:48:48 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org
Subject: Re: [PATCH v3 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
Message-ID: <aamJwMvex4aF6eah@rdacayan>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 01:06:58PM +0000, Srinivas Kandagatla wrote:
> This patchset contains few fixes for the bugs hit during testing with
> Monza EVK platform
> - around array out of bounds access on dai ids which keep extending but
>   the drivers seems to have hardcoded some numbers, fix this and clean
> the mess up
> - fix few issues discovered while trying to shut down dsp.
> - flooding rpmsg with write requests due to not resetting queue pointer,
>   fix this resetting the pointer in trigger stop.
> - possible multiple graph opens which can result in open failures.
> 
> Apart from this few new enhancements to the dsp side
> - add new LPI MI2S and senary dai entries

Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.

It sounds different from INT_MI2S so I can rebase my patches to depend
on this series.
