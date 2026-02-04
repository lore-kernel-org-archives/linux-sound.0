Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC9258EF9
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213540; cv=none; b=KKWRi3q+C3R9RqRpSdYfzsSTill8op1h+CsrDysUOztY2pyiRMbc8ABq8OUsbJXzv00rt/pgUjfzQHhFc4RPADfJkfhgB0zHbVB9GuSK0Zvg2nX10/iDfmZQCIrm2ctgx1ZjN4ie+kDNIyZeTsREISMlP8fy+V5W/M+fHQlsIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213540; c=relaxed/simple;
	bh=EOsW/pM14unqR+qscQEaKiyJMJ3jrTh6FO+3jjc3RCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuMF8zz0Wb93Rvy6I/4kDLJtngJ6ATTjSWOsBUl5N7NPiqJfzbceG853mkZ9cf47CCnEi1ChFUQzF4N/NNJ2AqmyOX0rzg+8X8FRaVjDqqOowlcEj3n2P8biv7P4Q42Ba+DmOL1OnA34Tk8BMfGK8sgj4DnulAKp9XbgDTa2OWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z3fP4PYE; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z3fP4PYE"
Message-ID: <e1ebcbcf-ceb3-45de-826c-db5a64b91e77@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770213538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOsW/pM14unqR+qscQEaKiyJMJ3jrTh6FO+3jjc3RCw=;
	b=Z3fP4PYEJoOrNTQYcq6mTpGI4rVTprmkIlf+Iqy+1cJJ7QijDTfrNHOfOiEL+16dj2awro
	pQNHJeuTAsOwfAAMpHzqHQqdkrvsIROtJqQARSSJv7zfixOWtsQsDkoXcsXYPBtJxc/+Ut
	IdQ3fsh94IUeRTSVyOUX5PjNVUFBI44=
Date: Wed, 4 Feb 2026 14:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Minor SDCA Fixes
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/4/26 13:59, Charles Keepax wrote:
> A bit of a mixed bag of minor misc fixes, improve handling
> of volatile SDCA Controls, make some minor bug fixes to jack
> detect, improve the cache syncing by adding some more defaults,
> and improve some FDL error messages.

LGTM, thanks

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

