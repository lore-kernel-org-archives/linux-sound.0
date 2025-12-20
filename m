Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205A02E62D9
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231288; cv=none; b=txknoTuLj+/GupWPRagZOfRl+tLdkZWWdHaT0VWaZ4VsXZkO8wH4HXRMWUIWFHhjLPKuZxmX7VbsK1jlaSzwzSqTY6WIpWFg5RS+u7rPMVu81Yd/jo+HxtU0qn0WqF2PNWOhTKPrjZgbrqck+yTSRFR1+83mpvGFJLQDbv0SLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231288; c=relaxed/simple;
	bh=3wasvRr+WJiRtSHn1dzUDf+dQn+4lwrd0AvcKQhxn+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW6hzwTcuG7UPI0LIvMiWDvbx+zH2aVF0CEnq+CRE/WxU61R7dlIFpU+DvgaJvFKFLHPC4JiWPKlxriKPC4tQE8DPKpSLf8IQs5fYVAHG3FgpAcSsZdrXewJSS+5ecBgPKjmaQuXL0C0pFIUXVr1oniOLPOBBK9h4EkOhoJZAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R4h4XsJ9; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R4h4XsJ9"
Message-ID: <66292133-9a4e-4b29-9795-8b90e84c669b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mftnVkH2zI2Ubw9NZmyHqEwwF50QoGNakDlx6FzqsaI=;
	b=R4h4XsJ9DW1xk7ngqo2YxUGfKjaGHsbl/NAGBJJtwypPdEwoqE1a8LECBgd+uny1IDrNbV
	X7eNYzz3spqeXAma7KFp4Qt5nbxMVsDh7kjjsasg24eIxKATx7ObAXSZXHKAabA0AqZ3QZ
	fYV7gqEnslERAHBQWGky6I4rVMimAbw=
Date: Sat, 20 Dec 2025 12:22:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ASoC: SDCA: Factor out jack handling into new c file
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-2-ckeepax@opensource.cirrus.com>
 <b4e00b53-c87d-48e5-9e95-18531a23bde8@linux.dev>
 <aTmgaKR0/MCBjc29@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aTmgaKR0/MCBjc29@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/10/25 17:31, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:00:24PM +0000, Pierre-Louis Bossart wrote:
>>> +	switch (val) {
>>> +	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
>>> +	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
>>> +		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
>>> +				   interrupt->entity->id,
>>> +				   SDCA_CTL_GE_SELECTED_MODE, 0);
>>> +
>>> +		/*
>>> +		 * Selected mode is not normally marked as volatile register
>>> +		 * (RW), but here force a read from the hardware. If the
>>> +		 * detected mode is unknown we need to see what the device
>>> +		 * selected as a "safe" option.
>>> +		 */
>>> +		regcache_drop_region(interrupt->function_regmap, reg, reg);
>>> +
>>> +		ret = regmap_read(interrupt->function_regmap, reg, &val);
>>> +		if (ret) {
>>> +			dev_err(dev, "failed to re-check selected mode: %d\n", ret);
>>> +			return ret;
>>> +		}
>>
>> The detected_mode is reported by hardware and copied into the
>> selected_mode, but that's not the end of it.
>> We should capture with at least a comment that the intent of
>> the SDCA design was to let the user or additional vendor-specific
>> override the selected mode. If/when we have to deal with the
>> complicated multi-jack topologies it'll be required.
> 
> So the theory is we are already supporting this. The jack handler
> here will report the "safe" accessory type returned by the device.
> But the detected mode and selected mode are exposed as ALSA
> controls to user-space, so if the user wants to adjust the
> accessory type they can just set the selected mode control. If
> vendors want to do in driver vendor magic they will need to
> register their own IRQ handler for the detected mode control, but
> we provide for that through the sdca_irq_request() API.

Sounds good, thanks for the clarification.
