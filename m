Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2137998B
	for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142182; cv=none; b=rhwSMnQ3rUFtAriJeXRTd9g6g1oxQWPjUQYGcw9AwQV5XnS+iPEQhw2YK6TrU650zkw/ikg2ngjOSuJ+53E8VTNyWzoAe2yg0jZqRoSzs5rq7IiEnVLzygL+kyagZceWVU6MBdPpgC1tXx75O4KoZoLmVTN0MN2SGnwPd561DYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142182; c=relaxed/simple;
	bh=c8wwsmifyb2pL3pRoyxMkh0iiOmUNLcnkaqNgFLh19k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fLZk4xAW5zLIPv2YI3kBhO+9H3b4P1BBCjz1L/Y15MpUewaK3Fpg8HA60kLSJ1TEBgBiXfjTl9APsReTMvdrF9NTAFjcjP6wadHtjJ2AV5W8FExfYtPzKoZ68FoTrTr+ksL++Lrs1rB+nQsxAdjulDWVhQIrpBlqe4EldMxt5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cec6CAua; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cec6CAua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782142178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
	b=Cec6CAuajmg3HjYKL5W0ndK6Phu8QSGuuFiayqN8E2XB6mFgNGX9rC8wekotGwK6Er5Lbz
	t4hf7DoWcYSXoV8YkQl+5PNgzEKs7tUDYx8co2HJy30D4OKWk7JKefXS5SNtrRO+6HuOM+
	JF2GNURGJmjFflMb/mn78O6U04coZtc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-fELkWnW9PPmfo5LGZN4hKg-1; Mon, 22 Jun 2026 11:29:37 -0400
X-MC-Unique: fELkWnW9PPmfo5LGZN4hKg-1
X-Mimecast-MFC-AGG-ID: fELkWnW9PPmfo5LGZN4hKg_1782142177
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-519fd49d101so244721cf.0
        for <linux-sound@vger.kernel.org>; Mon, 22 Jun 2026 08:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142177; x=1782746977;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
        b=U5egQLGfChm6gmo3n9coRMIa3hv9kj2pgvgCLL4rJWcmPvo68sx7s2vlZXW5SR51oR
         //l7PVxhNTy5CTRI7OF9XgheQXKMC6mXx8EqGOLr+lO/+j5uQmXU9/tON9P+zteza50O
         5g3RCv6Fj4XZNNjnhiELaYxib1ukY2JfPPbVSAJeR3X3am+xqpBGkxvhsdIy5b1ko5oa
         lFj2aP0OgCe+KH/5FJVyvs85vFfDbGlkMlWaXe0dbOezIv+aiq4eWaNZQbCNaW094z/k
         x2rijSfpxwqdGJr5Dx/HpNRF9dgZK5pODw5OywXZkgjgMlbfx2UoF3YSxcWqA1vmtXX7
         4aIA==
X-Forwarded-Encrypted: i=1; AFNElJ9raSU+o4Gyxbsezy11w/q9FczXM0vnsfIesNWo6YvYHmuWiacbPEkndSrUeGa4E9yr/XcDxlLelFFumg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcsVZdjatnpV/m9DUr4sg05Z9NM0D/7CKLFxzewVAEEdMZ3c8
	QqQ4wQeesznb7tJiq1kQazHWv+RkQ3GLYdwbjSAtpyliKHUKeivs/PnUnO0hoEPltQvq5EeYc/o
	DYK3vywBhbZFvnulaFvcewKBIKBE4s2flJ/W7b8aM//rqVzVSl4a4PNRqfnsX6ZwC
X-Gm-Gg: AfdE7cnJ4EDRhacFmhPeADNQTpA1LTMP2AZY02R0GcIGSOsevb0M6SEAb+zbvtnnR+P
	M5U0hpJLe0NqU6Lp/iJgh4WqOfb92wpe4GyNN+Ge2A/M8u3dgNFoe1+Mnk4E4CBvtVJXGUjD4+S
	Le/2u1AF06+2a/06xmumcpwb5WXeF87cDb9GhwG9aNrmXC+30COGTYNTJ0bPqqebBc+B9Y7Bsgs
	DHbFni9lFMTMPXHvm8tvU4pfdgUCVVyWbc02hPG1+Y9Na2pfMhEu589MfrPIrOkKP4Za6pInGi6
	tqsgaj5HC9+Hc4Y6wkWhXsEK092R2WyRXfvLbM9thf/KkycqTUu6bTnvc0+7HoVBtTygBwuYWU5
	toWRgV3fJ9VzYiWQAN3OMQfiUBMBSh7uI4nG8QVgosTKDBQ==
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr336231cf.0.1782142176815;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr335711cf.0.1782142176280;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0984da98sm70349361cf.15.2026.06.22.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:29:35 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:29:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
Message-ID: <ajlU3AsNUeviLuj8@redhat.com>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZjBbuJBw-tQ6WzDN5icdh5Jp9_8qAy1mtKk0DTIAl6o_1782142177
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2026 at 10:27:10PM +0200, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.
> 
> Convert users of simple PRCMU wrappers to call the DB8500 helpers
> directly.
> 
> The dbx500-prcmu.h header was the result of an earlier attempt to
> abstract several DBx5x SoC PRCMU units to use the same abstract
> header. They are deleted from the kernel and this is not just
> causing maintenance burden and build errors.
> 
> The stub code is using -ENOSYS in a way checkpatch complains about
> so replace these with -EINVAL while we're at it.
> 
> Assisted-by: Codex:gpt-5-5
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

For clk:

Acked-by: Brian Masney <bmasney@redhat.com>

