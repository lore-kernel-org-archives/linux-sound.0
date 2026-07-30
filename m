Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B526056C;
	Thu, 30 Jul 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447622; cv=none; b=YJGWQ7gASFbs3F7wZo3RzgsMwRMxUiVVF62B8azE/Dg8F0DsoiOiZk80VZfwic2paoioRlrk3HBbAMg+g8LYliL2tCfkeMuXsBYgtXw/PvzKQMYwf6g60oidI0RPpjv7LlQsYw4pBDVaB9NCcZ/B0REr8QLkvngwN1nKW8QweS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447622; c=relaxed/simple;
	bh=4RkAgyxytOqI1hxNSSQn+lStglJaJ3UPpomIaRFygw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwQzt7sClYSXkMqGPMXSAgOc74JoIeVS8tCotwfjAcAp/+DCpmhH/+aqzKly+uKfqhFTHOQrgyzY+rWu10YICBJm+LiwXzM9zt1BktqzJ6LM2CzfyHcMenpO6IZqaMKMkga/LWaG105GowJqEqnEQUDR2S0pWPUBv5IeCTRcsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PjNSME4i; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PjNSME4i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2N0jFtLuU9Ioc8kchzs+cXudHwRGezPIm42RHKzrbGY=; b=PjNSME4ifRVNNL+BlX+/GZXy62
	t4eAlLUuZwcR3gCYSqWbmufzfxgnFML3l4UyLGm28R9kGzLz1Ax6pZjEWWAGgwO4hG9pFOwvWe6Zc
	cYpRwmoCo4mvO1Eb71YzbMCIIw0UfMO7HYqLGG9OAf9kjGwVi4FubpRfbgNJXmJtDw0fWnrDDf4Ds
	NYYlWbXzHq/v8RkvV2lRgmmDZkiidNlSf7mmX67f2zT2XEFTrEeBCmOHFoH4csjWr07hEkpV7dGNp
	13KPSD4azNvLeRHoKCYe9WROlJbPr13dAoFkUzND/k58Wrj5vw+map2tg9n+IOYr/MhLiZpkm9ROI
	6KIIbjGA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpYUC-0000000BOqb-2LFY;
	Thu, 30 Jul 2026 21:40:17 +0000
Message-ID: <ae2d6aa5-1093-4ec1-ab29-ac9af791fb5d@infradead.org>
Date: Thu, 30 Jul 2026 14:40:14 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 30 (sound/soc/sdca/)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>
References: <amtnlbQl2KLongvo@sirena.org.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <amtnlbQl2KLongvo@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/30/26 8:02 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260729:
> 

When # CONFIG_SND_SOC_SDCA_FDL is not set:

../sound/soc/sdca/sdca_interrupts.c: In function ‘sdca_irq_populate_early’:
../sound/soc/sdca/sdca_interrupts.c:471:56: error: ‘sdca_fdl_free_state’ undeclared (first use in this function); did you mean ‘sdca_jack_free_state’?
  471 |                                 interrupt->free_priv = sdca_fdl_free_state;
      |                                                        ^~~~~~~~~~~~~~~~~~~
      |                                                        sdca_jack_free_state



-- 
~Randy

