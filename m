Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6E466B74
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712285; cv=none; b=SeXhuGtxfqGSMGlXzrIeQuZsrv668VBZ/6V9VHZJB+pOU3wwsfYBpOXElVKGknb76PW1wpXE1yMCTcTZOq7EhPg/ryTaPb45ti0Mby8ry99OYtxrLRnTDu/2pOHYCmL/RGxdFF3D3zBdygEcLpfuf+NmlKue4glR24/OiVzvffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712285; c=relaxed/simple;
	bh=4zt9fRG8i4B404GIocsPe4Sd5IPJaurGxcPlag77gzc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSyJAF45xDvtIFWjqij2ldj9SNta4X/YMBjLuHcSoYEqwJy1Z66UAkBgBpQKMMmvIGLsygGJ/Q3ZZoAQXT2yGqqQGHpD6HhOoimrb/CqXNbbzREiS3NEzVXErsWdkT57TE1jGsDpDUdkunxxAcN//5dILE1VnBnz7b7fVc/ZqTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=KK5bJUsm; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="KK5bJUsm"
Date: Wed, 17 Jun 2026 18:04:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1781712261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMdJ95MnJZSV95mH1JBBCzsuTB3uZGofTVqDEGnqnrg=;
	b=KK5bJUsmiy/Y4vgg0GY9VB1xssW+XN5nU6EywzUeDbobzIem9Yu7Zg/w6HxUx3D33J3bnk
	+/NpbtYo9ETWWBHKiIDWPjXxmDQUsubccTJrgE7n1KS+da86ZLCG5F6Dl6KqvJeVJy4IGd
	LT2kQUUMd6REsMJ6G8mAINoqwB10WqFGwMHIrWSrAxYRQ1xg3VbEcZksed0epfdj6uLx2V
	7ZsVVoFQg42Rds+QiGICu39HBWfh/gSRWkRqPBEC7/aSipx6mwcUNWGH+AayjS6eVxG3Fp
	74Wq7LAcfDqECcdPRcasj0v6A77WMgHXk2rSgF7+7iz7COvO+omRg2M1FJSQHA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH] Revert "ASoC: audio-graph-card2: recommend to use auto
 select DAI format"
Message-ID: <p4xa4sbgp2qbm456urqpqhuxgrm4wfrmxdohzme7yronvfy5fg@yz4busbb6ppm>
References: <20260617145508.327213-1-alvin@pqrs.dk>
 <2867f233-2eb5-4990-91f8-9082e67bcc8b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2867f233-2eb5-4990-91f8-9082e67bcc8b@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT

Hi Mark,

On Wed, Jun 17, 2026 at 04:02:03PM +0100, Mark Brown wrote:
> On Wed, Jun 17, 2026 at 04:55:08PM +0200, Alvin Šipraga wrote:
> > From: Alvin Šipraga <alvin.sipraga@analog.com>
> > 
> > This reverts commit 442cfd58e71260dcd983e393f750e36fe7ab34d0.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks, didn't know this. Is something like the following more correct?

ASoC: audio-graph-card2: don't warn that DAI format is specified by card

And do you want the inline "This reverts commit xxx" dropped too?

Happy to resubmit, just let me know.

Kind regards,
Alvin
