Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FFC211A28
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370705; cv=none; b=o1yQUMf+qAX1A3n4Cf17EtxGjaYZ+2J0ftANtuc3vcyguSz9o6ngthEINCOsTuWKyFMI8hltRhEydjedj40bKgr2Mf0+VtUA2iIM3YWtSYvopceNR1YLnllNfhQtP95+TfNNlDSszAt5NzPAs9kpx5CISKlkC0Or1CJTdwZ0c1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370705; c=relaxed/simple;
	bh=2zy7PECL9qwiU0u4m4MUwfS4gdqrHzVDi9Mu44y+5Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXWwevLMbIfL+QpSKShbJQ/kVwlKeMpjY8gm11aRLxv/lcUTwzkcpC9VCOxpHi+SobVNadUa5dE93unAxusv3WWhNrsnDBcTeiE00mMLiGhzUF3vc6z1Ua/0xopHZ3Vw6fpO1pXab4pvGsjg4FuxIA7sZwtcHAvwMuK3BvtNc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KhBX0iCo; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KhBX0iCo"
Message-ID: <63015dba-c88d-4de3-970e-769c5319366c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779370701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0o7Gti5kJKgo5c1AlJ4EIGVjEpBMz1HgcGB3kuN6vqo=;
	b=KhBX0iConQRHTuw4213llfbL9Vhpku/mvmaT843CwWDhgARRoQkUyZcj5eSzmMNCAVKcMA
	8SdZat2t6a5Vau6rXxuS2NIGUPR5Q3Knq68iiY9gySvpcoILjjW87EPNtd8hE5zXOBz8EO
	xVzEw/HtwlnugnWsGl0s4irFJI9iYVQ=
Date: Thu, 21 May 2026 15:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, vkoul@kernel.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
 <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
 <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
 <ag6/q8O737wtHB/z@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <ag6/q8O737wtHB/z@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/21/26 10:17, Charles Keepax wrote:
> On Wed, May 20, 2026 at 07:16:55PM +0200, Pierre-Louis Bossart wrote:
>> On 5/20/26 18:36, Charles Keepax wrote:
>> Could we filter instead those 'ghost' devices if they fail to
>> appear in the new ACPI table that describes all the endpoints
>> and card topology?
> 
> Eventually perhaps once that makes it out of the standardisation
> process (I believe the committee is looking at it), but for now
> that is all Microsoft magic that I would rather avoid.

Nothing prevents developers from reverse-engineering DSDT contents. I remember seeing all the information needed in the DSDT of one of the Dell devices.
The standardization was supposed to happen before Covid, I looked at this in 2020-2021. If it hasn't happened by now it's unlikely it ever will...
This DSDT information is interesting for Intel platforms, it could help probe a generic machine driver for the card but raises other problems with deferred probe,
c.f. https://lore.kernel.org/alsa-devel/20210817190057.255264-2-pierre-louis.bossart@linux.intel.com/

Anyways this patchset isn't wrong either, so 

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

