Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36F328B55
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285551; cv=none; b=sCn1lOVEuRMXKC7mDZqXVrzFbCdNmreCgfvevKsIB/F1Bext3SZd3q4ecNcPBzdp6QE6Ic2N1PaHF0BqnbI55P11xZmRGpgzIzt3hVOcqFMy2+lkobfsUT8MypVlMQUiLLDboLpIO28gV/puQXJdbgiVAyDfZfRLy9U5N7UlJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285551; c=relaxed/simple;
	bh=UWDEE4+zi0tgNlzaAT18z1AZ7C99BqNhxN6/Y/H4XCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tpcar4NPCvd1n53HETJ5AgcDf78a+Mg9J0UxnLkuesIDNygiUuk2Rjfj0DuwpKvbJD10z9Wq717cv9EuPpHTeZGtlNF920tRb3lXOVvZDwhBbULeGY0CmocOxuYDoBuH04zlkO+HmBEObRn55rHYCHigDQWFpV3xiFiOxwAubbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mw8mugCp; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mw8mugCp"
Message-ID: <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwIPuf/m6OXYQLbX39BpgUL1pe5mJ4L6EGamg+31MSk=;
	b=Mw8mugCphEIJ+KnOdanfOzXKJleqnCGOwbX/9ogXXl8Es8bEK8QbpVK2nEG3gSt88bgltG
	qt9sHC4TOgonfqXzpY/Nz9NDa/I6wR3AzfLUVOO0fbAk2/76H5ciYQXOijguKdsaYUF5vj
	B1x1c/iIcqW+LwHZlAkix3ddBnC0L7U=
Date: Tue, 9 Dec 2025 12:47:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aQo0d3UWKinyzTYT@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> That is some scary stuff there, that is basically working around
> the fact that with those drivers the soundcard is created before
> the hardware is actually ready. But its one aspect of that and
> there are likely many knock on effects/races hiding in there. At
> some point we should probably revisit the whole enumeration
> thing in soundwire it does cause a lot of scary code.
I don't see how we can revisit this, the codec probe happens based on ACPI information even before the bus is started. The card driver is also probed when the PCI driver creates a platform device.

> That said... the class driver doesn't have the same problem
> however, because of the two layer nature of the auxiliary driver
> stuff. The soundwire driver binds to the device and completes
> probe, but it is the auxiliary drivers that are used in the
> soundcard and those are only probed once the device itself has
> enumerated in class_boot_work(). This means the sound card is
> only created after the device has enumerated, so the same problem
> isn't present and we can have a more normal PM runtime startup.Humm, that's an important detail indeed that I completely missed...

You could also have registered the function subdevices based on ACPI information *before* the whole enumeration. I can see why you took that function-register-after-device-enumeration route, but I have mixed feelings about having separate mechanisms for vendor- and class-drivers.  

Note that things will be interesting when we use the new ACPI aggregation information to create the card, we're missing a means to re-trigger deferred probe checks as devices become functional. I had a patch on this a couple of years ago, look for "driver core: export driver_deferred_probe_trigger()", we probably need to revisit the entire scheme...
