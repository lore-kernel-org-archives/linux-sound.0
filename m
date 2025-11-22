Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB91AA1D2;
	Sat, 22 Nov 2025 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763802051; cv=pass; b=lUIFdlrxAZCAg1laLtsLo7hxb0on029BIQLAjfssWvIRhV3WniWFElbp1Q/q6WpZhejXT+zopaDPINwxsqGtgBQVw7cwRlBmKCq+P5EQzCDUJ+Fuqwf5wYpmnazgoKY4bzZwd9drQGGRUpgB/sfLj/Mo4nPdgjYL7/rT38ac+y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763802051; c=relaxed/simple;
	bh=HeZdwSZpf0MHeMQRZusQb8XFb4keqBtJhk/itbDRZmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mut5OI4BzS7a6VLUbnxelxcvHKBoK7PYdMJF0SAvdUEYoiLJJm86zBlJJRw18/5cuvBvxIoBrOLyZOYJ3PVmlHvCTAxNXBvn9A8lHLbRUDypeFLWPmkKuIDLogQ4XhIxBugqgEI6UJrgVhIi9daSM4TsZCxadzWqgSFuGFrbWNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=Ock1CTzi; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="Ock1CTzi"
ARC-Seal: i=1; a=rsa-sha256; t=1763802037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hhtpn4aWnMkhrRApXOVdXtqrUVLNsu97OozOdzMWsH5hT5yQFjCDe+wIbqjhNL9bl+NF3xC0Whlext0a0s7ArWWELq1y6xl+3zghqieKEPO1KxH+WFmGX5F4FwO/A2JwdX+vhF9N61qE3UQh7H5VAElmSaj4tbmjj3d40E4efsA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763802037; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Aa0PNm7eSRAnqVxNA6Kx/Xi0feHls8qnK8Bnec2jpog=; 
	b=V3f7DwNYJsd8g3J2gkMBbPRLS6uyjB2+1k+8qO4kNJKcmM0tZ+RHPUbOH5eBXyNWowrW+zob0EYVX1SBT4k+CB+tsaoWmbiw/RdN9h9J8WF65KbouQ7h4U2dhi/7bXvFLGXex907YHLy7V0CSHFkYY9gNydQ3jUNbOaNgPqZI7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763802037;
	s=zmail; d=harin.net; i=me@harin.net;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Aa0PNm7eSRAnqVxNA6Kx/Xi0feHls8qnK8Bnec2jpog=;
	b=Ock1CTzivPY4vD4aHo6qML+3FHJWIbYvSoT+Ni849g8dcD5YMQDpzduuEJqBhe9c
	+DMqB9yL5XqANLkV8fEOYTX5bQ79oDdROERDWi8ksOF3rQfZgABwue2qFFlu9ohD9g8
	jj4tYWgOYwKIkdpFDYrNYg0nFRCivcHgWsfvPdzxYEEnNUmFiYJJZVPzrdGJILSKCGF
	/ByIAYMYUVIt53ub4xY5MgcbP5xm3rIWYCjBDga8KZoEqAuktaTai9ObhN7vD7LAkFj
	lPvn/ZUTg3KoAjFuWSGj778nM4BcI6vRk5gGCMwnIdt5qoPQ3HovJ4YCk3E3xYmPWzC
	WphYtVMTQQ==
Received: by mx.zohomail.com with SMTPS id 1763802034569544.1679830349775;
	Sat, 22 Nov 2025 01:00:34 -0800 (PST)
Message-ID: <4df3c2ac-88cd-42d1-9f1e-c5c2c5a2b00f@harin.net>
Date: Sat, 22 Nov 2025 18:00:29 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ALSA: ctxfi: Add support for Onkyo SE-300PCIE
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251121152221.1152523-1-me@harin.net>
Content-Language: en-US
From: Harin Lee <me@harin.net>
In-Reply-To: <20251121152221.1152523-1-me@harin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

I noticed that 'rca_state' in patch 5 uses 'unsigned char'. While it is
safe due to the bounds check, I plan to switch it to 'unsigned int' for
strict correctness.

I also have two questions regarding conventions:

1. ALSA control name (on patch 5): Is "Dedicated Output Playback Enum"
acceptable, or would you prefer a simpler name?
2. CA20K2 port logic (on patch 6): The condition
'if ((idx < 4) && ((hw->model != CTOK0010) || (idx < 3)))' handles
the non-standard RCA port mapping. Does this line require additional
comments or a helper function for better readability?

Please let me know if you would prefer me to send a v3.

On 11/22/25 12:22 AM, Harin Lee wrote:
> I added support for the Onkyo SE-300PCIE (OK0010), a Creative X-Fi
> CA20K2-based sound card with dual TI PCM1798 DACs, a single TI PCM1681
> DAC for 7.1ch output, and a CS5364 ADC. This model differs
> significantly from other CA20K2-based variants.
> 
> Since official driver support for this hardware was discontinued a long
> time ago, this patch series enables the card to be used on modern
> platforms.
> 
> This patch series was developed using QEMU vfio tracing, and PCIe BAR
> dumps. Tested with analog output (up to 192kHz) and line/microphone
> input (up to 96kHz) at various sample rates.
> 
> Changes in v2:
>   - Fix coding style issue (mixed declaration and code) in
>     dedicated_rca_put().
> 
> Harin Lee (6):
>    ALSA: ctxfi: Add hw parameter to daio_mgr_dao_init()
>    ALSA: ctxfi: Add ADC helper functions for GPIO
>    ALSA: ctxfi: Use explicit output flag for DAIO resources
>    ALSA: ctxfi: Refactor resource alloc for sparse mappings
>    ALSA: ctxfi: Add support for dedicated RCA switching
>    ALSA: ctxfi: Add support for Onkyo SE-300PCIE (OK0010)
> 
>   sound/pci/ctxfi/ctatc.c      | 97 ++++++++++++++++++++++++++----------
>   sound/pci/ctxfi/ctatc.h      |  8 +--
>   sound/pci/ctxfi/ctdaio.c     | 18 ++++---
>   sound/pci/ctxfi/ctdaio.h     |  3 ++
>   sound/pci/ctxfi/cthardware.h |  4 +-
>   sound/pci/ctxfi/cthw20k1.c   |  3 +-
>   sound/pci/ctxfi/cthw20k2.c   | 79 ++++++++++++++++++++++-------
>   sound/pci/ctxfi/ctmixer.c    | 73 +++++++++++++++++++++++++--
>   8 files changed, 223 insertions(+), 62 deletions(-)
> 

