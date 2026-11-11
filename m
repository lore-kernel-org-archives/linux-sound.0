Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383254;
	b=jfQqKln49r8MraZg5WiCET8s5xP94kv2VkWVpW7wXjb7BAO56ENcnnsORU7apuQtu92U
	 lk1NLh+betn1gmMd7NV0wBGbKSxVfGFICQL1a7LztLaLevELrtUDWetFtCV9ujH5bO/mf
	 eL17OIVvweNHpS5LZIMF0oUkLf8yj3MPI8vi/wyyI5fctIKw3GxRH8DwMsOU3kso4+hku
	 o4Y6t6Onq2vrom3dkzhfEYS7hd14wMFJM9cib1FnKXML69d6lvMfCoV8ycL7yTlGGZNHF
	 6YSI99opakQlxCt6VPaLiYox7SK9Uot0bhutXVYR9UFhozHiBepgRZBCHMnz2wqd7Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383254;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1KdWfyINBDVmpECfzWKG+89sQbKGuIFC389aq0jB6ts=;
	b=C4CroCNnMJSMCk3FwqEXpJmQZ2xETNju/b2Wa+2vHgJpHbCqfkSY6TQGhUfNzmZOVNcR
	 onhrE6YiU6F80JVIEF6QqPpEvdsXkXx9TE1cya5caCr8b3MYDUS2SfyZbo3tbc3q5BFbZ
	 XMUzsuSj38FdHWL6XikULUbrTznzGo9axSQ1Z6z3rqP2WJmhWCV2Sa6eD0+KRRjANjZmx
	 Q6RVbfhL7Idwnf11xoFgPf43an3Y7xewEei3JR1UtTS1Q9Z5eFCf1/xTV+nlgkURvacxn
	 qZrjqN16PN7amsclAwuqzUodYvDy9VTZmaDrC6rLMU86bAEEUaa7F4+u5lYOlZkCkVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwMH9DPC;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0550606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 07:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0550606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DwMH9DPC
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kptG8gdbXheAZEJtpY4wMBJRt+jn5tdRnTkPgzIw0GQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794383251; v=1; x=1794988051;
 b=DwMH9DPCa5eOtXcy06FUaQs517X35dDhLxNwq947NBZ090ziPDffdVf8/AtGZLdSvNOYG5DB
 Y5JjrlbHjUpckXrBmQwdBI8aPzuzLW2FnsYxDmkT6PwohpiKF2ZbJPqTsVBiyAZ4I4JBQJcx6Rr
 CRt6L+ZpaCyqPFe5uHpvFYUw=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43bd11df09fc416e;
	Wed, 11 Nov 2026 07:47:31 +0000
X-Mizu-Trace-ID: 43bd11df09fc416e
X-Migadu-Flow: FLOW_OUT
Message-ID: <7c2574fe-1741-4119-be48-e7d314015787@linux.dev>
Date: Wed, 11 Nov 2026 08:44:43 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Use Disco FEID and FEV to qualify
 firmware filenames
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
 <20261110164807.1671681-2-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261110164807.1671681-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:48, Richard Fitzgerald wrote:
> Include the FunctionExtensionID (FEID) and FunctionExtensionVersion (FEV)
> values from Disco as qualifiers on firmware names. This mechanism is
> required to support new products that use CS35L56/57/62/63.
> 
> Some manufacturers are starting to re-use SSIDs, and the time between
> re-use is decreasing. The SSID is therefore no longer providing the
> unique hardware identifier intended by the PCI spec.

D'oh! It's crazy that with all the technology available it's still
difficult to define unique IDs...

> To ensure that the audio hardware can be uniquely identified, the FEID
> and FEV will be included in the Disco for new products and must be
> used to qualify the firmware filename (unless FEID==0). For products that
> require an SSID match, the combination of SSID, FEID, FEV will be unique.

until the next time when a firmware person doesn't update the DisCo
properties and reuses an ID from a previous device?

