Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66695235045
	for <linux-sound@vger.kernel.org>; Sat, 24 Jan 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769252984; cv=pass; b=mXcu2mUxT0Zp0REuZ64i/WHxoXDrepmMGHkgGoSlmX3Kv4x4Obg5Cqaqer/97iZHietdZaW341iRFH6BaFB9R8qd7CByFAvVekMInbEMlU+UE+2hVZS+dm4dtdoumDBDkWKUN1hvYnWRu0UBlVREfkcgcRaVUWncN5N98QA7Q9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769252984; c=relaxed/simple;
	bh=QKrYL9aihiJwxRBP6mDxbcpTsrvfQe+GkuuKTqeM6r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JExjlN0uj2KiblzfZ6TUUNxf0dZNh4LcI52SNXIWHx6JG7scpFSZnmuqfzJP7Mnp8bd7hvO606HxKgIfuBghmmByJK8Q9RiWNhWbV+NSbMcnX5qZz0M8kjk9tv5rj7w3JMGjyqGBpy4ec/4pLBhHeQ0+Xg6TM0W/I4YaKwpg+Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=fabio@redaril.me header.b=PHi4gVfG; arc=pass smtp.client-ip=136.143.169.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=fabio@redaril.me header.b="PHi4gVfG"
ARC-Seal: i=1; a=rsa-sha256; t=1769250224; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=A0a6zEe6KR2OpfGD9O1AEjHXHhI/MWoEuMDgmA0DPcROKPHVJmezEPXomNT48FkJdHN4AdZBfUMzCjqIgUZ0rT/g14b9tGLD8IozCVBRt2lUF9D2ONy9vnVU9B92PlFMBx02PGinYkHkLs+N0aXIAjWtaIDG53urv2U3S2MYoUI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1769250224; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KIYSVtBqNa4XuBPgdrmFtHkegABa1183QDaLDy3JwVg=; 
	b=XN63KxaarmKQP4/jsWsZKKWfUtPAp917O39BhuAPFrU14XPlh2Dm9RiGlV7ymm7lXPyeiLEoHh00KR3kq2pYXj8E39HgN0+PGDgNA42CDg66mSWM26G8qyyOjDPl6gB4mvuFEEaLtT/trjaZ0VnEL2QdtOmMEeO0Pv4dL7hojtQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=fabio@redaril.me;
	dmarc=pass header.from=<fabio@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769250224;
	s=zmail; d=redaril.me; i=fabio@redaril.me;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KIYSVtBqNa4XuBPgdrmFtHkegABa1183QDaLDy3JwVg=;
	b=PHi4gVfGN+T6Hal00bMXyUMu+zhWuXoQmRWIEvNQBgQmAV7SdvAsYYJPQFHbQS5m
	T7s3E+4yq6XZJ+unq2/aGeb4B9iIv+4OozGWG/DvK5vHmt008M+9gITUWhYygAxRxL/
	k3rZs4IOCHK/3tqpmZAFxyPZ7sH6JIeDz+nerhRs=
Received: by mx.zoho.eu with SMTPS id 1769250221556239.67266786730363;
	Sat, 24 Jan 2026 11:23:41 +0100 (CET)
Message-ID: <10a207cc-7a9b-4cb7-a76d-04dd0c5a55e1@redaril.me>
Date: Sat, 24 Jan 2026 11:23:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] ASoC: simple-card: Split alloc and init logics in probe
 function
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Fabio Forni <development@redaril.me>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260112231855.193030-1-development@redaril.me>
 <20260112231855.193030-4-development@redaril.me>
 <87tswqp7gl.wl-kuninori.morimoto.gx@renesas.com>
 <0a2a46e6-f1b2-4820-8d75-60b8f51cae66@redaril.me>
 <87a4y8rdyp.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Fabio <fabio@redaril.me>
In-Reply-To: <87a4y8rdyp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, here I am.

> But I have thought that the style like below can easy for people ?
> (A) part checks something and return error, then indicate error reasons.
> (B) part returns error because the called function returns error.
> 
> 	func () {
> 		...
> (A)		if (...)
> 			error("indicate error reason1")
> (A)		if (...)
> 			error("indicate error reason2")
> 		...
> 	}
> 
> 
> 	main() {
> 		...
> 		ret = func();
> (B)		if (ret < 0)
> 			error("func() error")
> 		...
> 	}

Hm, I think you're being too abstract for my comprehension, sorry about that.
Let me assume main() is the probe function, and func() is whatever function
that probe() calls. If my assumptions are correct, then:

- In (A), are we letting child functions print the reason of their own error? If so,
   I like the idea! In C we only return errors codes without a message, so the actual
   reason of, say, EINVAL is only known where the error was thrown. Outside of the
   context of the function an EINVAL just means "something was invalid". So yeah, I'd choose
   option (A).
- In (B), I think it's the approach already being used for simple_parse_of(), isn't it?
   You cannot know the reason of the error for sure, again because of error codes without
   a message being carried together. The best you can do here is thinking of a generic error
   message like I did.

Option (A) requires more work, of course.
