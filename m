Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299379;
	b=VTbSuadi3fCdat3EAdmmtdWqZEfl7XiOVovdrBR0zSgx/T8aleacpIkA4bCnpO0EyPh1
	 BQzP4fEOnkiDpmwhFfpcU++pg8UHmwp0PtCoNkqxGBticXdBK36KwjzNeX5gxPJHYH6Ww
	 SJaB1fiNUSKxwoIkjknBdo+pCi+laOI3enL2Qa616SH+RwDZxUNokMbdnHMQuxLzLV6Ao
	 CE05mJVVtDn4ExdQ431vZypebIXbkCsoHKTmTwaUW9TqFBp40eMr0SnkhdNf6DlYhguR/
	 rO6dwO4XOeWyDvX1R3zvhRfXlojQXejDsDQfENqsRP+aZynvbPtqA/C/zDWb+2EH9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tirkdGWdTsgezXW4Y/VcOfnawt6KAEbHYQuWL52223c=;
	b=ZdzLolJGphuP9Cj7Adv65ylgsgwFoyqBWBHsnhNifQXn+dLrROAHANhy34L4f1MQ6paf
	 vieCJlpPtABMHFmuaYwSrk4X1voTLOq+fq5vrf3wFGtZAkqaWWvo0ezQP7x8ifdtt99Xc
	 YSm+i55tSFCBZ/wyeA32dvoIhlOiUhwUMZdf/B/OoyTJf530DeEXeokcPVtCUHVVaKLxG
	 xEii4stbkhA33eV6Q48UJBOjY371afnn4U/7+kwHek5/3up4tOYZaiBY5TEom6qG0YF6/
	 eIEhfD0FfccoaWHEcJXmQoZMQK9POhgxR8qBct068CPPeEvlYNp02KlSlI4HkHfIB4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mvwsFlqI;
	arc=none smtp.remote-ip=91.218.175.236
Received: from mta0.migadu.com (out-236.mta0.migadu.com [91.218.175.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819660A6F46
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 08:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8819660A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mvwsFlqI
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=niYzEsywKo6X66sxpMa4+p9kCOB99Q2cXGxQIJQRNYE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794299376; v=1; x=1794904176;
 b=mvwsFlqI3s7xAFCwFGKHzl+NELCnlu0SA5/yNjOVd5C9ouaO51o82lCM9wbef5auChzB8wvL
 2WZEt0lyZqIbgt/pOlljM/MQCR/RKRZtFgCt9m8mc3N+B4V4JiUKaumICGvgGk1Fk9U26ukTRNK
 u0E3GBimHIOYbbRt+TtxZ6DQ=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a69dc8e0cb53bc1d;
	Tue, 10 Nov 2026 08:29:36 +0000
X-Mizu-Trace-ID: a69dc8e0cb53bc1d
X-Migadu-Flow: FLOW_OUT
Message-ID: <42f25327-cb1e-4e16-a302-b9d367f30087@linux.dev>
Date: Tue, 10 Nov 2026 09:29:00 +0100
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH 1/2] soundwire: Improve channel min/max comments
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
 <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 18:38, Charles Keepax wrote:
> Presently, the comments for the minimum and maximum channels are
> misleading. In the SDCA specification these are actually channel
> indexes not a count of the number of channels. So for example
> min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
> Update the comments associated with the structure to make this
> more clear.

It's the DisCo spec, not SDCA.

The DisCo spec reads:

"
mipi-sdw-min-channel-number : This optional integer Property shall
indicate the minimum Channel Number for this Audio Port, if the
Audio Port uses consecutive inclusive Channel Numbers.
"

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/linux/soundwire/sdw.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index f710e5932b4b2..22fb7158bb709 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -289,8 +289,8 @@ struct sdw_dp0_prop {
>   * @ch_prep_timeout: Port-specific timeout value, in milliseconds
>   * @imp_def_interrupts: If set, each bit corresponds to support for
>   * implementation-defined interrupts
> - * @max_ch: Maximum channels supported
> - * @min_ch: Minimum channels supported
> + * @max_ch: Index of the maximum channel supported
> + * @min_ch: Index of the minimum channel supported

that's also ambiguous.

Maybe just use the spec definition "minimum Channel Number of this Audio
Port"

>   * @num_channels: Number of discrete channels supported
>   * @num_ch_combinations: Number of channel combinations supported
>   * @channels: Discrete channels supported

