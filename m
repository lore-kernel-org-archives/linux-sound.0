Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471120;
	b=F2/i6n+XJWvGB+j/v81aEi02mv0Vocy5RH8R0EwV8NwbVItd6DPPBOateW2n3FP7zWGQ
	 HalbM0U2v3Tsxx4AQ7syWKsYkwC3iNXnBNX8wDf7atKCSQ43xmf3RNywcudfYR12NlSlE
	 retpStBu02kiQxeT+cGrEGHXXP+UWgivbe8gIbcWSUolCIXb7WfIVzOcBGPo38xATbKCq
	 jIkcrAPP9Ksi9OhIi/OY43mKVuJEpEo8Fa9iEnQm+SLQvihQHWBMgq2esEGveBirzkRBS
	 oV1JiMPtcf3SCOMLJ+jmAFH55Yo3QUG5OsLUYnQMPeLyk3cg5IjtgpDSkP9xViu603A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471120;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=McIZmaGpPMOXjPPsjKu9t77cCTo+al4fqqHFl0JVXT8=;
	b=gOya6QA/zVbPmZIsLLpr9bcO2X9190AqGNLz0Qf5mElYGINvuZiZoyz04fdKZG3aiZeu
	 EGfzRHjRQ1LqKbfXDnWbQkRsMK7JHEkfrkBQlFkqHjFSsfxTsIXEkuK8t7LMxytkoOakZ
	 NmAXDMTVrm88EMBqfrLpC2g64vMJxYzf0EwVuEd2XWXbsmPy0pIvBbwumwil0pGngyqM0
	 kURg9oJISJqu7edFanpcLu7lbPwCO41BA5bdbf128Mk3q10sCoJmWjwio9WlXzWvpykr6
	 5AaI7aax9+nsOT0i12H9lSPTup7Inw4Iu+KXuyFXNpaaXf2HxlYsP8huw0b9pr9GBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZaNR1Tbe;
	arc=none smtp.remote-ip=95.215.58.230
Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1E60A382C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 08:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D1E60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZaNR1Tbe
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U5IaE73OL1o1Rt6QlRFwjegd0n2omyditaJKMgT0+hU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471118; v=1; x=1795075918;
 b=ZaNR1Tben4IKR+y5GPHCP7t0sPyKh0czelzN5rQuKZNHO/onUkipmcHbUvmFrx8pDyU57Xc1
 kMk4eVCG0YdkWg1Lr9Fj891svDgD7isS8YjHDDqLTxNVAfPY3m97N0xPiYipKUBtV+hueu0awi9
 oZSHG3mIIJicCXQqPzhzZlGw=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c156e9d0543595a4;
	Thu, 12 Nov 2026 08:11:57 +0000
X-Mizu-Trace-ID: c156e9d0543595a4
X-Migadu-Flow: FLOW_OUT
Message-ID: <69e3aa67-aa99-4d27-abd7-8faf2d58a3a9@linux.dev>
Date: Thu, 12 Nov 2026 08:56:50 +0100
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
Subject: Re: [PATCH v3 0/2] Update handling of min and max channel in DisCo
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 17:24, Charles Keepax wrote:
> The DisCo properties "mipi-sdw-min-channel-number" and
> "mipi-sdw-max-channel-number" are both channel indexes rather than
> counts. Update the kernel code to more accurately reflect this.
> 
> There are a few Qualcomm drivers that likely specify these incorrect,
> min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
> should work fine as the number of supported channels is equivalent.
> If people feel strongly I can send another series to fix those up.
> 
> Changes since v2:
>  - Moved the parsing of min/max channels to only be processed if
>    num_channels is missing
> 
> Changes since v1:
>  - Update wording on min_ch/max_ch comments
> 
> Charles Keepax (2):
>   soundwire: Improve channel min/max comments
>   soundwire: Assume default maximum valid channel if not specified
> 
>  drivers/soundwire/mipi_disco.c | 14 ++++++++------
>  include/linux/soundwire/sdw.h  |  4 ++--
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

