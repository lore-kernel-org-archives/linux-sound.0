Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132694C80
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 01:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723165262; cv=none; b=A2TXw6OHXabSU2f7sVkAJQG8h7W5kvBgmRUM8lTDYuXGzU+d/NLfNo+yT03Q0/Zlb2YPLWIZiXpt0NODag4PlxGsgnvKpwEr/XfyutP30on7xQYStQyrG8eLxW8kFCSM7B0LsqNmmXJ6g4E/L1pc8MwkN1kWgXdlwf3XRe84k6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723165262; c=relaxed/simple;
	bh=TzrW3y6SzsbNFighfe8q6Qkw+b/AgGKoiKBOEDWYo2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6rIYh5yIZk/PO59Tu8NmYyxWPH2SuJVMMorAblNdHBUztBmjPXt/brDRiS1MkpEddeW0mKp/gP/7qscrh04Ba6xHBcAA6mL2VnNdvtf7M4xhpNxo+eyechtMtap8iZRJJlVdDuvSE91Xr9vrKv0S+aM/WjkaEuogrdqKFb16JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5z8frsL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5z8frsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723165259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FUh2ZcyYR28eZFFdQirdhBUZopZzvCQuM/XbmHwKiM8=;
	b=Q5z8frsLjZLXVXkHJY5crYzK+w7Q9OWS4kM+Ig1HkPbV0xFDKynt+xBLvJA17eJxBRmEH2
	Nt6GOgHfT/5NZwHdhBAYn5GJaKNIu0oRTE56EjxhSJlZudnfryiWI42hhbrLz9Kju3D0at
	bvcSNwmzhESeICA26N75Epv7IaQzrxo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-5hjdLnQtP42zcJyK7MW5VA-1; Thu,
 08 Aug 2024 21:00:54 -0400
X-MC-Unique: 5hjdLnQtP42zcJyK7MW5VA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44FB31945104;
	Fri,  9 Aug 2024 01:00:53 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.45.242.6])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B4BB19560A3;
	Fri,  9 Aug 2024 01:00:49 +0000 (UTC)
Date: Fri, 9 Aug 2024 03:00:44 +0200
From: Eugene Syromiatnikov <esyr@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Artem Savkov <asavkov@redhat.com>, linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] selftests/alsa/Makefile: fix relative rpath usage
Message-ID: <20240809010044.GA28665@asgard.redhat.com>
References: <20240808145639.GA20510@asgard.redhat.com>
 <83d4e1a3-73fc-4634-b133-82b9e883b98b@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d4e1a3-73fc-4634-b133-82b9e883b98b@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Thu, Aug 08, 2024 at 02:20:21PM -0600, Shuah Khan wrote:
> Wouldn't make sense to fix fix this in selftests main Makefile
> instead of changing the all the test makefiles

As of now, the usage of rpath is localised, so it is relatively easy
to evaluate the effect/prudence of such a change;  I am not so confident
in imposing rpath on all of the selftests (and, if doing so, I would
rather opt for runpath, to leave out an ability to override the search
path via LD_LIBRARY_PATH, if such need arises);  in that case it is possibly
also worth to add -L$(OUTPUT) to the CFLAGS as well, as the compile-time
counterpart.  But, again, I was trying to avoid the task of evaluating
the possible side effects of such a change, considering the variability
in environments and setups selftests are run.

> Same comment on all other files.

> It would be easier to send these as series

I hesitated to do so due to the fact that different selftests are seemingly
maintained by different people.

> please mentioned the tests run as well after this change.

I have checked the ldd output after the change remained the same (and that ldd
is able to find the libraries used when run outside the directory the tests
reside in) and did a cursory check of the results of the run of the affected
tests (but not so sure about the BPF selftests, as they don't compile as-is
due to numerous "incompatible pointer types" warnings that are forced
into errors by -Werror and the fact that it hanged the machine I tried
to run them on).

> thanks,
> -- Shuah
> 
> 

