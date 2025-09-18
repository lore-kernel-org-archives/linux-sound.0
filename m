Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A85307494
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196686; cv=none; b=KLn0fhROfwkv0b/Yw4+on8zK9gGUXIRDq6HLT7Tmli5zdKrNi0b3LqScLLaZzgu7Tysex9y3sNe4JhIcC1+j8dj4bMtvcYlfJmM5AlLtREA29ZqPC10yzvKk787UgFFj2ltNI5FmtsdsPc7HXTv1bB2UZRW+2WwOBqi6KXcHT00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196686; c=relaxed/simple;
	bh=JdjiP3sDh6I9Sc5Qa79WITfh/ODrEdmN6jjbCRP/lQk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=J7T6+YNjIC+Ljz94NCct5mn4FfDwvMl0eLkB2/0OGmh3a8Y92/24ogYd9n1ZvQuK7Hr6cD0FYMd3uya554ePgQC1TShlB7bTNeUzadvPS81KBHfNiW4cwzK857fpJppRDMYbtbxpOhaGhlVzW3FeHbvTJhhXC4tQW/j7kV1oruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G7ugUkXq; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G7ugUkXq"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758196681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFCFqJJ2yYgftGOHrDOB1eCkuMcyYEeSx/3Uy2cezt4=;
	b=G7ugUkXqxMUCE8FsjPJQ22Hre4q2kdem8h6hk/uCjbvJpROARfJIrnkpR2PvX1RIAGCr0S
	EkqHK+glaXITYC8n6aXQwpimzX3qXHBrkbnQGQAzYxsQHlAJgBQwZEj/b0xou0S6N91qmP
	rVTcAMISTLPphUqyYo8jAbLHn0mIbR4=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] ASoC: pxa: Return -EOPNOTSUPP instead of -EINVAL
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <81926717-0884-4df5-aaf2-a938c58ce892@sirena.org.uk>
Date: Thu, 18 Sep 2025 13:57:47 +0200
Cc: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <56ED1961-1092-46F7-B2B4-218AC279837E@linux.dev>
References: <20250918112102.64314-1-thorsten.blum@linux.dev>
 <81926717-0884-4df5-aaf2-a938c58ce892@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Migadu-Flow: FLOW_OUT

On 18. Sep 2025, at 13:33, Mark Brown wrote:
> On Thu, Sep 18, 2025 at 01:21:02PM +0200, Thorsten Blum wrote:
> 
>> Return -EOPNOTSUPP from mmp_sspa_set_dai_sysclk() instead of -EINVAL for
>> unsupported clock ids, and remove the obsolete comment.
> 
> Why?

The comment says "not supported yet", so returning -EOPNOTSUPP (or
-ENOTSUPP) reflects this more accurately than -EINVAL, unless I
misunderstood something.

Feel free to ignore this patch if it's inconsistent with how other
drivers handle this (I didn't check tbh).

Thanks,
Thorsten

