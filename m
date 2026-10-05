Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC74BFE85
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213476; cv=none; b=bIcw7epidpy66/whWHgK328jiXNK1R+4xM7Cc56PjCNsKAtwq5sUKZe80TKeSBH9vz3Tve+njljci0D2XuFVWtIionl9CdzgIj9qrZ2ab8s8Y1BFFNh4BLuX0L2HCpRTxE5oRQwipmyZQ16gKfzr3sicziJ8CmPHVWYE+XbxhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213476; c=relaxed/simple;
	bh=bWy6Sw0/f+sMoQ0i4GJD9LgVSVwWxBSy2Kd3p432A04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRjQXGZLHvyOINVTWjpDreWZfB9iWaEMejqXmiZqnlCDDIgwLx4n6SHTMSplntOEFz3EySQnv5i0gvhgF4wY4Y53pK4b7c4G52AFst4kTLH5t7sPoDKZ52x1YGyOA/CpDV3q6JzfdN4yJObyOibb7/Jhm46CVYC6goz1+PNToFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZCOuHI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZCOuHI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474E31F000FF;
	Mon,  5 Oct 2026 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791213475;
	bh=n5ZT8UFlnArfcrqzxXQu6hLn7MyNvlD5v3Lbox02cOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZCOuHI45Up34qRW97t91VZv385yMVDtLWiVGvK3qcgXvST9YvYIZd6/JlgI+TiwC
	 nyl4j38Hgc3ahE21NM+7xRptTYUmgQegbRO7ewD+om+UAok80A7WQvol07cDsLOvZl
	 qB1g3gksxZrgjuS50dDbkmFcYmUj84zvjqPN2kz5TTJvLNX/vhBC4i1eYt2+p5aUdR
	 utaz06a4qIWsTWXgVkbu7rdlrHoz8eg9zcm5/zd97LSg0i+uXwnOBQAsoSfbYlkXtI
	 l2ncjeSV+IEX/TfvlpB2I8tIf1gZUAqnE7tmJw1ArcQJMgpjxJbTeSytd53qecBpXI
	 33iaqyAxuM8pg==
Date: Mon, 5 Oct 2026 17:17:51 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asO_n_eKvS_Ns1hV@parshuram>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
 <87ik3gs37v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik3gs37v.wl-tiwai@suse.de>

On 05-10-26, 15:10, Takashi Iwai wrote:
> On Fri, 02 Oct 2026 18:41:33 +0200,

> > So, the conference will be opening on the next Monday, and we still
> > haven't planed yet -- business as usual :)
> > 
> > I put people who showed interests in Cc.  If more people are
> > interested to join, heartedly welcome!
> > 
> > If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> > AM/PM), let us know.  Or, since there aren't so many people, we can
> > just have a lunch or dinner meeting, too.  If you have any preference,
> > speak up, please.
> 
> It seems that a lunch meeting would be fitting at b.
> 
> How about Wednesday's lunch?  Does anyone have a conflict?

works for me. I hope we get to finally meet Jaroslav :-)

-- 
~Vinod
