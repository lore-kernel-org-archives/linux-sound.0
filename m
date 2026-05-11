Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0703659FD
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526964; cv=none; b=TfnxYFNE0ujn0qwQeVWqvWhi6cec0FaUDzNOTrLdbzyfmdIPzErvpCG0yaNUWLDJRTw7u5qru4J+rr7uNnr9+EN88H1psGgRXpG8xP9BRmMp+exjnUkgux02CyQy3LUqZQ5iB2RfgbkwYFtwHD5WKr6X/1Ptwafub1w3PuFgX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526964; c=relaxed/simple;
	bh=DqWKsXdNwI+6DvTJwGOHRu+xKSgk9VjMV1EF/5XovQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHn83Q1ddzInCvuK5qEPGKKcAVx4oHeDBFQtzOLrm77Dg8unnQYiSJTe4/e1dr4bO1JxpT6KUA2T5WaNCjeBCyr351k0QaLHUKTSN/kRRpcsFDRg1Fyn3UdcXEoCxtFaWjWMkn/FrK8XqcjwjG7EEGSOoWfzntx2WWB3NhYbm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXiMprZd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXiMprZd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so79952665e9.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526962; x=1779131762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfMtmCT2x1dJSsSaie8YscBU2lbIVtCJp8bSnMzPXUM=;
        b=CXiMprZdzYDdk1O+IgGN67vhwp3rwCU5MpD/gB2SxJwJoK8yEtnGRCyIc9nJMQUzQO
         dWVv9xXHquF1YsVkM0kIi3vi5GdqMOTPf65BhxNjqWyVY77GuPSrUDetKIDfvtPHK6tS
         /RvyGR+gp2cvilDjGQKi/bCvjvkyv/MyV4tPmTWqrKW5YObvMnknpV3d5DS6+Accv63p
         9TYo8vG7RWdrxTPbOv2dqOG5F3gJtIMsuDw3/xIp1+N+0s3Lc2PBJnZEuFwqOhcu4mBx
         ZgjxTVmoUPB19OGsDRtiqR2cXF0GwRsa/94nOkvV2Q3C8hD818Hi1aaFC1KiSkZi0wLQ
         Sppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526962; x=1779131762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfMtmCT2x1dJSsSaie8YscBU2lbIVtCJp8bSnMzPXUM=;
        b=XMZ4xcREKz1sBqQy7yfRKpwqN+2EvmhH12aDyBHMRhrOoK03QikK4d0xuDjXjuhZAu
         CiU1+rNxbD9zT9bVTSHMve2MIu2hlY2Ob1QFpJ0iOX/RtoLjtV7JskVgGbqX+Ax06dsq
         b41VXXGEh428em3KNk9OtOVPDUWhk7SVKoG5+x/iPZOZUIPjVHiju+79i+4/26pvbBGT
         sw9WLGzgO11tU1ywSjsFvopBj5k3or4A9/h2OxcubiEYUa/vaD94F0VrIT3Aa6pOc6Ik
         eYlhs0HfjrrUkUK9h8zo6HX/TvD2/Ic3FwERfadCsBAtKOEpJV5ttmxn2aAVUwyEtBd7
         8Xbg==
X-Forwarded-Encrypted: i=1; AFNElJ9q6ea4mNVSrKkX+YBsyw5oB5SdJ+FmijO7Z2T/hhEcKU2/Td/X34Gr3SZLqqAOngJFi7KRF88R6KstTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhwflwlhjOGhRR+geoJWMNDyLnisvt+w5klhlqs0nQbXZrxi8
	uTrlNGIQeS8x6StmCqeTWgUqjAtfTAtlpo74Gk9LHa2EeSw/JioUocaI
X-Gm-Gg: Acq92OEGYHg8LpaD4YIPkENscgQlkdY5RSEnFPNTEcE1/okbBenD8W8msTPrbyaA9Ay
	Iy0zn2GZPFIjMs20WWXg60Ii4O9WKiQhjuw/+TtVnWkDa/Uk/oG7f/MvPhj9Iq8p48DFiXIYapq
	1Gbq+yT9zPVdpoF8X/Lt1XNwPtkWwsApuL0977TC40cBswT78xO5S7HaDt02ZTUQXVBDNXYMs6l
	B+B1/S4jOrgV+FlvTnqztxQ9WVpLv3SwMOi2ePTt4o6dWmi4GnwpCym0TmwQvmtsCTl4doo/9zZ
	BgDw5GjURZvYsl1iyafLP7qi6Tonpx+9gtzXH/4b2DBaSTqWGMeAi22JvVujIDkY6znSRWfptYe
	c69NdpGXO+c2ha0QcTLb8+nhACJLh+eEtjIcOzYON4qKghJCaV2lINDNMIo4VRSMmBMcx0xFL83
	FC7ZlZX/+uBkboMiuY1Jf+wkBBjLGK8UI4QM5AglL9C9g2bNLMD5H+cWiQ2lEU
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr294515085e9.0.1778526961570;
        Mon, 11 May 2026 12:16:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm27086942f8f.17.2026.05.11.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:16:01 -0700 (PDT)
Date: Mon, 11 May 2026 20:15:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Purdea <andrei@purdea.ro>, Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>, Geraldo Nascimento
 <geraldogabriel@gmail.com>, "Alexander A. Klimov"
 <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-edac@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511201559.2a9fc8e8@pumpkin>
In-Reply-To: <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
	<20260510230853.154050a2@pumpkin>
	<agExLK2GR0w0Z_N2@geday>
	<CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
	<20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
	<CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
	<20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 14:51:37 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, May 11, 2026 at 11:59:34AM +0000, Andrei Purdea wrote:
> > No, the current code copies "error_ip" with null termination, and it
> > drops the "c" suffix.  
> 
> Pfff, that wasn't really clear to me from the explanation of strscpy...
> 
> > And that seems buggy. And that's what I requested to explain the effects of.  

It is a new(ish) driver.
It looks like just a bug.
Although the name itself looks strange.

> 
> Shubhrajyoti, does that have any visible effects when using the driver?
> 
> > strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);  
> 
> No, as said "[h]owever, just to make this safer, we should min the size".
> 
> IOW:
> 
>          strscpy_pad(chinfo.name,
>                      amd_rpmsg_id_table[0].name,
>                      min_t(size_t, strlen(amd_rpmsg_id_table[0].name) + 1, RPMSG_NAME_SIZE));

That is just pure crap.
	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);
will DTRT pretty much regardless of any obscurities - including the case where the
source array isn't '\0' terminated (although you might get a nasty run-time
error message if it is shorter than the destination).

Note that the inlined 'mess' generated for strscpy() in fortify_string.h isn't
ideal for all sorts of reasons.
(Not least because the 'hard' cases should be out of line.)
But that is an unrelated issue.

It would be better if amd_rpmsg_id_table[] were 'const' - in that case the strscpy()
call should 'degenerate' into a memcpy().

-- David


> 
> In case someone goes and changes that amd_rpmsg_id_table[0].name in the
> future.
> 

