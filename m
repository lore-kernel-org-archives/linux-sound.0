Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F84207A
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757676645; cv=none; b=khz+l/Oh+7e/kaXASyKi1vmkexQ/FWb4Ls3VhEm/DeFfxIs4ReiKjpXypoyxZlq76f+CgRh5RnMHEfbldbZ9hsLawzBTkDs07La3TZApYoEkjJvWvDjBfOfmjV9Oo6I/l0WW09455Xxk5MbXkoulJffapFAR5VTG7yKfxbPIEAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757676645; c=relaxed/simple;
	bh=wwNEPQ8Ub2Bi1rTK+y9jv2+BOVxcYgElrlEKhsxKZg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buR1/SaKZFuFwZhGhcyyZesKbn+o7tf8+BoDIpQw51211TY8h2cq1Kx0uU6gDaSOdpbQxC63LkmaNBFaev6JQW7Oue1MS0vwYpRbfzEoAyjef73BjL2RTvlCrlNLbs7e3REGplyj83ioMLiXb5/DlClvMUOMd3ZPwJ+sugLmJPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N4CcQPLT; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N4CcQPLT"
Message-ID: <baa8bf28-d5fc-44d5-b846-d3d110b91e1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757676641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGgJJctjU086CxZN0zvG4DX897rv1zFpRePhmYCqJRQ=;
	b=N4CcQPLTRy6UOKGv7dpgIGJWIqPIUVAN/dXeteOv5hRjAt9n+WypmGZb3VIQDgxf1SXpi8
	T6OPq2UphGTU1APDujt47KQgI59Uf1U4AoMmGW5F14Pj43z9AfVb8DSVFsgJ8qB7Xmp8XM
	5sMI4NvK6Qd6KjvyLAtv/slNwqST8lQ=
Date: Fri, 12 Sep 2025 13:30:23 +0200
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
References: <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
 <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
 <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
 <aMLJip1e61LlEjwx@opensource.cirrus.com>
 <384bd185-9aad-4590-9251-41c572dde3c2@linux.dev>
 <aMP25yy/pxSlshf/@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aMP25yy/pxSlshf/@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> Yeah mainly my question was that it says "wait until" but I have
> never been able to define what that wait is. One possible
> interpretation is as soon as you see the device not requesting
> FDL you can progress, but perhaps a safer interpretation is if
> you see X milliseconds without an FDL request you can progress
> which is what we have gone with in the code for now. Was really
> just hoping you were going to be like "you also missed this other
> useful DisCo property" :-)

I don't think DisCo defined anything related to FDL. 

The only thing I see in the spec are Device-initiated status changes, i.e. the loops would look like

do {
	do {
		send_chunk()
		wait for FDLD_Chunk_OK();
	} while (!FDLD_File_OK)
	get_next file();
} while (!FDLD_Complete or !FDLD_Request_Reset) {

BTW, FDLD_Request_Reset (bxxx1Rxxx) and FDLD_Need_Reset (b0001r000) are probably the same concept using different names, not sure if this was clarified in a edit.

Like you said this can probably be discussed in a follow-up thread, it'll take time to limit and adjust the many degrees of freedom in the spec to what vendors actually implemented :-)


