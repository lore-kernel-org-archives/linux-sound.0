Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C72E54A8
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672158; cv=none; b=JHL4+7K9xUUgeKWPK+sLy2jub1ON92f2YbDx5PvVXUFa672nidM5Z/wBX63hoBY564DRKZlK12oa250wjQSyWISpSV3FSzZly1DZ7jn8TKZwpirABeYHvQL53ML+IHMTS3ZYpxE/S+/ZmTWXcBCW9Sd6adnudicFRTCrfGbkvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672158; c=relaxed/simple;
	bh=py+1Cr1F4NG1AtSq//72CH7hBLffB17NB4Y0s+y9dlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaZTCQ8AYaEVgB6wvJHOccWAJPzclDxbaiRiRPygXsqX1fjgf+De+kDFICH0b/7nmn4yAhvERmfJ8520CwJM47VcsuJ4+VIn0YbzA6Js2Ug6S/FCQsboek2w8LGmIpQnGtxAI1LIOrdJyq87m4KhORdEojJCfNffNmkUivmQSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qj6zWtL0; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qj6zWtL0"
Message-ID: <384bd185-9aad-4590-9251-41c572dde3c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757672154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtEXVGklBgAQoTVuJPYoRtqOxe4y3KHlWqKz0aPdE6Q=;
	b=qj6zWtL0Ocr4XhCqTQzPn/O3Vy06/2JACEKTO8KBjndPpCN2GGTqUmd9SAkXKAuh3A+bdl
	KZD8gNkiVdvDfjDSbnUZiOHd3eehgbrjlPbQJxUBhSVRuPe8KCbW955KByw4gOJyvUOdmB
	7Ismf/tLnqDPi7glzw9Fd5p/qXBQgz0=
Date: Fri, 12 Sep 2025 12:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
 <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
 <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
 <aMLJip1e61LlEjwx@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aMLJip1e61LlEjwx@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/11/25 15:07, Charles Keepax wrote:
> On Thu, Sep 11, 2025 at 02:33:46PM +0200, Pierre-Louis Bossart wrote:
>>> Once these timeouts exist we have to pick values for them,
>>> because SDCA is a huge huge fan of asking you to wait for
>>> something but not saying for how long. If you have any thoughts
>>> on this that would be appreciated too, but mostly I will just
>>> pluck some vaguely reasonable sounding values as I did for the
>>> existing FDL timeouts.
>>
>> The SDCA 1.0 spec defines DisCo properties for UMP timeouts,
>> just do a search for "ownership-transition-max-delay". Table 139
>> page 236 defines this property specifically for XUs and hence
>> the low-level protocol FDL is based on.
>>
>> The description reads:
>>
>> "
>> The maximum time allowed for Device to change the
>> ownership from Device to Host in an Rx UMP when Host
>> Software is waiting for the owner to change back to Host.
>> "
>>
>> As usual it's quite possible that platform firmware is broken
>> with bad values, but the design intent was to provide a timeout
>> value for software to use. Ignoring these properties doesn't
>> seem quite right to me...
> 
> No, I had missed this property! That is excellent. Don't suppose
> you have a similar magic touch with the "Wait until there are
> no new requests for File Download" in the Class Software Load
> Sequence?

Glad I was able to help!

The FDL state machine is rather complicated, I can't pretend understanding it fully :-(

My limited understanding is that the Host doesn't control which firmware files need to be downloaded. The Device will provide detailed information back to the host. That's how I interpret the vague statement in Figure 213:

"Device interprets
FDL_Host_request and perhaps
requests one or more new
FDL_Set_Index(es)."

IOW the number of sets to download is indicated in the FDLD_Needs_set control. Based on the bit pattern in Table 240, there can be up to 8 sets (3 bits).

The main issue I have is that the files will be transmitted by chunks. I am not quite sure who defines the size of the chunks, but each chunk should be handled by the same "ownership-transition-max-delay" property. It's rather odd that the timeout doesn't depend on the size of the chunk, but assuming this is correct the time to download should be bound by number of sets x number of chunks per set x ownership-transition-max-delay.

That's the limited extended of my FDL "magic touch" I am afraid...

