Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112114A3406;
	Tue, 14 Jul 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044976; cv=none; b=AzLpTQjEqgOxmOSmOovidAorPnrydP6noTOa/DNOBlpJ70hqqP211aUjSPWY7vIZEVE4mRFQsVzNfqSUm4v6Zgg91a3n0VGepz0KAaZSyAdnCHwJfJaRC48x/uSbXf/sa9Q6hKN6q4MT1m2ZPqCu7FKajhmUq0yyvLW9hIDSqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044976; c=relaxed/simple;
	bh=RPQzbFp42095DqTzHnLdLEMCluqFcqhtfKiJYRSTEG4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q07mPITMV0b2mlcfpWwZ0n0yN4H9vNXRv1g99pAsLAf7oWvVAyAfACM6NdFDBErpEKl1hBKnDEeXOe0YRF62nAij9Jgl95xYYyo3wYjTZ2jQtzg3QIAjLBGupTkHlhKWwFCTPLR9RkcJK4A4NNERNYfZwJ1SbkEdbvuRUZDASok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PTY6zM2l; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PTY6zM2l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7nN5GbMz2pX/C2hqinG3iHem3CBL/RHh2Lj+bj6Coew=; b=PTY6zM2li9KkBPMrSYiKyWNbWj
	kvAsWzD0rektMS0X5iCsA0g/X26qkFG6ZAlgaZlbDNDbrYsFaNiUW7f8Wmthu2UvQYNnTAPeOXw+L
	CxeUxqISVuHLANcdeRIdJY/mEiq4AvIJZBAdXGomw0/LmDS+R3CcRJ0mo1t6WJ6OSPqs/7NWAZ2eI
	YwtssM+36WqlioZv+yRv9ha94b3zkktdjbcaCB8x+selLQx8Rh4JvJ1ZuGbbBqOedx+gDpb4/4Q/W
	sIASCrpibEAl08bmqyBusPFhiF/uSJb40XbSErP4ZvoDBs796dKCnLGS4/W1B/E2alO5iuQxz2wi+
	uVsjLdMw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfar-0000000CcJ4-1tsW;
	Tue, 14 Jul 2026 16:02:49 +0000
Message-ID: <4bafe3da-893a-4888-8194-b588ac899cec@infradead.org>
Date: Tue, 14 Jul 2026 09:02:48 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc
 format
From: Randy Dunlap <rdunlap@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-2-rdunlap@infradead.org>
 <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
 <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Content-Language: en-US
In-Reply-To: <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/14/26 8:57 AM, Randy Dunlap wrote:
> 
> 
> On 7/14/26 3:20 AM, Mark Brown wrote:
>> On Mon, Jul 13, 2026 at 06:44:32PM -0700, Randy Dunlap wrote:
>>> Don't use "/**" for a non-kernel-doc comment.
>>> Use kernel-doc notation to document the parameters and return value of
>>> ntpfw_load().
>>
>> As mentioned in submitting-patches.rst when submitting a patch series
>> you should supply a cover letter for that patch series which describes
>> the overall content of the series.  This helps people understand what
>> they are looking at and how things fit together.
> 
> Are you saying that my cover letter was insufficient?
> 
> https://lore.kernel.org/all/20260714014445.569992-1-rdunlap@infradead.org/
> 

Ah, somehow I missing sending that one directly to you. My bad.

Should I resend the series?

thanks.

-- 
~Randy

