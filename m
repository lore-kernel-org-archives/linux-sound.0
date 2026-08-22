Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C8282F12;
	Sat, 22 Aug 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787412081; cv=none; b=Y0QlArkaDUTiiDRpQAeLAnVF+MRgBOaovP5GG2YJ/PpDjwKHteD8/hPQpZvWoztcymJEgVJ+qGLvqexXfNb3Sf++lQWz1NygnchgFjguyPXNGPqlKl1G5P31evTuH2eUq16aRidS8BxbAobSh3QTvaF94v/lEECz5R2M2GcLMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787412081; c=relaxed/simple;
	bh=T94twWXCFx8BtTI+lC1rno0eFwzZEYK3U7HBxmWWZVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1t7JonZ7Oa9koE7CRWDc8aJfLTzwn3SwogZb2Pz6nTvplRko25ibl3kfQtS1V78BWBxcJAR9JjbH2ekYYBQPkFgqgxhIH4H5E2FNXwU4y/qBJ12OU8inzlQkMpfbGu938vXdszWl9coR9RZgBIPhE/xnR9FNp7kjR5Y1AZ6xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=s+khEKZi; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s+khEKZi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sxPMAnFppI9PaRRi3qLwjoYr8in5wU5HrZps0PY83dg=; b=s+khEKZiXE8ZQHzIOnxOMQ9nB4
	0KLISxt95v8D/tgsy6663C3lZzjI/oRamW70iiBqPjHv4lIjfozvJrvi6zJY/qRb5pkWj0rFwErZH
	qGuWd57GWUu/ZqGar9ZR5tGdfD0izJDS8EvEf6JwW6UROY8lsL2OsWlt+Q0SoLAq6hLwXtaXsC50q
	7N3GdXSAPtJ+iy9rLNR8jfMK/C7wMZb2Cq/nZEt9GA4hqZIdnKUqK0NoFqUk+p89juBzR288bUCG2
	eFp67lwWOn2KUhw2IdSRsRp/OXEIKMKulOxurCv2vVVhY8sxkmrP49Ati5Qnx+1mr4vWZ7yrSUEg9
	DNAleP/w==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxnWs-00000001aKK-0rhH;
	Sat, 22 Aug 2026 15:21:06 +0000
Date: Sat, 22 Aug 2026 16:21:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] ALSA: pci: add PreSonus Quantum PCI driver
Message-ID: <aom-YjzhIG5BN2ks@casper.infradead.org>
References: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
 <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>

On Thu, Aug 20, 2026 at 04:36:46PM +0800, Nicholas Johnson wrote:
> Add an ALSA PCI driver for PreSonus Quantum PCIe/Thunderbolt audio
> interfaces.

Hi Nicholas,

I see you've attracted the attention of the Elfring bot.  Please feel
free to ignore everything he says; most of us do.  He may have some good
points, but you should not feel obliged to address any of them.
