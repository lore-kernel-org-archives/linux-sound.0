Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5770830;
	Thu, 19 Dec 2024 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734604093; cv=none; b=kVC/sr46X7Blqza9BRgjN9u2ari8T9koE9Ivel1FWzI4jSpB2RxyCskr5biAvbdIlg87KHDJK3H495gLhg4Ksh3e14ldO4rwwtw/Pn9baIxGh34dECKwRu9OkHJ1BuQDhCrx/wlNr+aCif9ZTpntdrhZZozB1U1LktLMJAG3fD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734604093; c=relaxed/simple;
	bh=vbjgYXgAaj+OQ26jSZv78m406ZCR7buNFpK25ZTqmwI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuKl5re/nB4NYi2yNaB3NE9bFzDtFkbWLHXRChbrNbi5G8N09sBATwiqwKTYfBiQnz0PQjKTlco61SDfjIfqNn5RMCM0nfi3kxNpGrZVPss1Gv6xhLhC5K2kVxyGQh3PhLNTdY4pXzdi3MrMoaJ848CVHB7EfWfU1RXbh+fcWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lXxEozbA; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lXxEozbA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ6tKZg001446;
	Thu, 19 Dec 2024 04:27:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=v4N0PpayvPjannWYX8
	1+HBHqZT6yrzsS82uAS/39vpA=; b=lXxEozbAysxdleNtSRxnqpRNd8GBCg60pb
	EyGCVmT4jur8N7MhLuysgQt3ZlwakukHVm4CrzFjbw+TQ9x8cJOcfe6TjmHSV5Cu
	nxe+9m0lbdTJ8lGkXyx7fq7TAUtBd+CUh5EvzujQA8v8LvPl8Wd1Vz6ATCvNdzZg
	jqVtwS3KW6s0kEE8r1ldxx/BE6CRe6VidbEtMwveU0wTPuBp2HQgUy+eOt/R9WUM
	1CAP1w3OJ1WaJ8xk/HRai0xJaRuI9Vqj/BdEHF0HfxHfv/pfykoeG3sSBsusREnP
	rufrjmIVDqh+8+GxmCwwLKN2VTKSPuBFtpzeVk70j66M89y6sE0A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7ake0e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 04:27:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 19 Dec
 2024 10:27:54 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 19 Dec 2024 10:27:54 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 832D1820247;
	Thu, 19 Dec 2024 10:27:54 +0000 (UTC)
Date: Thu, 19 Dec 2024 10:27:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, <vkoul@kernel.org>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
Message-ID: <Z2P1KVLFig0Kh1h2@opensource.cirrus.com>
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
 <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
 <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
 <9b8ef4d2-e4bd-4336-8980-0fb59d672631@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b8ef4d2-e4bd-4336-8980-0fb59d672631@linux.dev>
X-Proofpoint-GUID: GQTIvAAQn8jyeAI1ZUonLVkjxoArehEl
X-Proofpoint-ORIG-GUID: GQTIvAAQn8jyeAI1ZUonLVkjxoArehEl
X-Proofpoint-Spam-Reason: safe

On Wed, Dec 18, 2024 at 04:40:22PM -0500, Pierre-Louis Bossart wrote:
> I agree that the device should be reachable during the remove(),
> but I believe the scope of expected interaction should be limited
> to a strict minimum. To be clearer, so far not a single device had
> a requirement for any sort of interaction on remove. You would need
> to clarify which codec driver needs this.

Ok I can add that to the commit message.

> I don't see how the 'link_lock' and 'bus_lock' are at different
> levels of the stack, the 'master' device and the 'auxiliary' device
> are both quite thin and I don't quite see what's different between
> the two.

Not sure I follow that, like for example I assume I could just make
the code use the bus_lock instead of adding a lock but to me that
feels like a layer violation, you have a driver directly taking
framework locks. But I guess I don't totally object if everyone
else prefers that.

In terms of other solutions, I could look at redoing more of the
IRQ handling. If rather than using a hard coded linked list, the
IRQs were properly registered as IRQs with the IRQ framework then
we could simply add and remove them using the normal APIs, which
would be a lot cleaner. Of course, fundamentally that is pretty
equivalent but it will then just use a lock from the IRQ framework.

> Having looked at the code in more details, I think there are other issues,
> see e.g. this part of the code called from snd_bus_master_delete().
> 
> static int sdw_delete_slave(struct device *dev, void *data)
> {
> 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> 	struct sdw_bus *bus = slave->bus;
> 
> 	pm_runtime_disable(dev);
> 
> 	sdw_slave_debugfs_exit(slave);
> 
> 	mutex_lock(&bus->bus_lock);
> 
> 	if (slave->dev_num) { /* clear dev_num if assigned */
> 		clear_bit(slave->dev_num, bus->assigned);
> 		if (bus->ops && bus->ops->put_device_num)
> 			bus->ops->put_device_num(bus, slave);
> 	}
> 
> So at this point an interaction with the device is not longer possible, even
> if the Cadence interrupts are kept active, since there's no valid device
> number to use...
> 
> 	list_del_init(&slave->node);
> 	mutex_unlock(&bus->bus_lock);
> 
> ... but this is where the .remove() will take place.
> 
> 	device_unregister(dev);
> 	return 0;
> }
> 
> What am I missing?

Hmm... yes that is a good spot, I will investigate that further.
Certainly I do see these operations happening in the wrong order
but it doesn't seem to cause the register transactions to fail.
Most likely it is best to reverse these two, it makes sense
to not clear the device number until we are finished with the
device, but would be good to understand what is going on first.

Thanks,
Charles
