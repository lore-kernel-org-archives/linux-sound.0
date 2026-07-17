Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AE21ABBD
	for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321186; cv=none; b=BGjrYshqwsDDDTkVl0Z1qLAedsMun0TMNmnkcUbEtM5eqYS1N46f2TP6e2uRq5K4FpDqTV1mZEDKnjU9tpDPJaMqtOv4SpNP03UV7ee/QMKE1SQh68gnN5JcN4JIyhtLc9UHrouET83tq3jphULEc0TPaYBNo8aslpqi7R+Xh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321186; c=relaxed/simple;
	bh=35SKmivwvmyXQPAk/cuGeNvDV8IC5bM5NZ/4gYGGOnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvOJcey9gK80uuPzQSEE2V9C+Y5yILIyU2cGBd9vjL63cT5/z90Zld0iudiPK72zDUJBGVaW3MkgmGOAJNofgRNFHrjHSY2h6Fyii88jt/TTypy8+znLyPSAGgnzxOxGTGsyIZ23wPY5jolEQ9rFe9O0CzJTdn5P3BuLM+WCIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D+3Lr1gi; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D+3Lr1gi"
Message-ID: <bcd410d4-9736-427e-a921-831fffd37c5e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784321182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJXIuWC94S9kSygckRbwbucpc0ykgIOX09JHCObUxsk=;
	b=D+3Lr1gi5Fvay+hTTy48sCo/OkjKNjj8z6BXXCO8YjSt8dYuP2jkpq9TqugMrWLmSDCaYF
	+d5py5cNYfHL2vkzATzcX9diFgNIHoXTT9ofwnrbhG+FPK5h9lz+VryBCyzepNxcCA7oaN
	AU9yEdp0Y+mTwIaA7/eqUJHyAWMrV/k=
Date: Fri, 17 Jul 2026 22:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/16/26 16:26, Charles Keepax wrote:
> Currently, the IRQ data (attached Entity/Control/etc) is populated
> as the IRQ is requested. However, this can cause issues as
> occasionally the setup process wants to access specifics of
> an IRQ before the IRQ is actually enabled. To facilitate this
> cache all the IRQ data during sdca_irq_populate_early() and make
> sdca_irq_populate() simply request the outstanding IRQs. This
> also has the advantage that sdca_irq_populate() can now just
> iterate through the IRQ array which is much smaller/faster than
> going through every Entity in the Function for Controls.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

I may be splitting hair but shouldn't this patch be moved
earlier?patch1/3-4 seem to be completely tied with the introduction and
use of the fixup_controls() callback, I am not sure I see the link with
the IRQ stuff. Or conversely move this last if this makes more sense.

Also while I am at it, I wouldn't hurt to have an explanation of the
races conditions earlier, it's only in patch3 that the race condition is
described in details.


