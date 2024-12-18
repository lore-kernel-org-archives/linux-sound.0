Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF4156676;
	Wed, 18 Dec 2024 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515486; cv=none; b=CGQvs0gGOHzFnGTDcRZRWYWAdyLga4Szj5qrHFq+hfVd34kEXtfg6IxBQAJs3JXzUu3spfImu7PIfEVs4vKbxoweOeV+fG7MJwt3XgPcJaqBhssAvTsH+helonKJcLxzjrFEERYDHC9mH1U8+d2wcucsGva32aCJEOpY8lhNzbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515486; c=relaxed/simple;
	bh=w83wjBj8qe873iMhxmJ9HFprzlBw/4WqJSexZhaDNvc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee9JkdrvF+Exr2A/Hirq6YcVwVmP4dVHjvofjseDgHiKHxjYJcKovUYQlGJxLB3HWmgfLdcjD90EN9RlNA+ahj3/aL67NAHNI3niYZ7QOXFtlHW6beiDgh3hbbi2hxTbu6bx+jH1XXvVCvrYuLwvwMvwQthLsyYsFFVEkqWGRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oBaLbM4/; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oBaLbM4/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6hXFK000595;
	Wed, 18 Dec 2024 03:51:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JxSOF+VA27rTSKeb0r
	X4CE1eDOu8ZTQcAn1fCDiw21I=; b=oBaLbM4/jvS2i1h2mqct38MDhL0tkadAyu
	XqlEu8eW3JKjXdu+94Gw3UV36pzXTOCQmcTSZhUl82/f9qyEM8Lj6WUDSa5JUBCV
	c65JzeH5wXRO2T4l5vWLrT540KbkmvJQmwdKVRYBPYNn4jevyvwMYw8aNYNEUfkH
	Bldtox26hn4SsW2QRkmrP1WQLKVC8s4MKNNt35kWVTZQyU3/roU1ZhKQap4/KQaa
	S8YQDXY4Wn6a9CEFXKnhSqOLaweh0zM9YtsFjhKoMCQEOzm91Eux6+ghFCVEdWNM
	Mp8kMkEVNCK+8770QXYVXw9xYHzw1S41CU9d/DDiP+Dp450EQN9Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akckqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 03:51:15 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 18 Dec
 2024 09:51:13 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 18 Dec 2024 09:51:13 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B727D820247;
	Wed, 18 Dec 2024 09:51:13 +0000 (UTC)
Date: Wed, 18 Dec 2024 09:51:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, <vkoul@kernel.org>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
Message-ID: <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
X-Proofpoint-GUID: KkXsdDT07BgSaFGBCmytYt1-7SqRMumb
X-Proofpoint-ORIG-GUID: KkXsdDT07BgSaFGBCmytYt1-7SqRMumb
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 17, 2024 at 05:49:17PM -0600, Pierre-Louis Bossart wrote:
> On 12/17/24 4:49 AM, Richard Fitzgerald wrote:
> > On 16/12/2024 5:35 pm, Pierre-Louis Bossart wrote:
> >> On 12/12/24 5:02 AM, Charles Keepax wrote:
> > For example, if the bus driver module is unloaded, the kernel will call
> > remove() on all the child drivers. The bus should remain functional
> > while the child drivers deal with this unexpected unload. This could
> > for example be writing some registers to put the peripheral into a
> > low-power state. On ACPI systems the drivers don't have control of
> > regulators so can't just pull power from the peripheral.
> 
> Answering to the two replies at once:
> 
> If the bus driver is unloaded, then the SoundWire clock will stop
> toggling. That's a rather large piece of information for the device
> to change states -

The clock should only stop toggling after the drivers have been
removed, anything else is a bug.

> I am pretty sure the SDCA spec even mandates that
> the state changes to at least PS_2.

This code applies to more than just SDCA devices.

> But to some extent one could argue that a remove() should be more
> aggressive than a suspend() and the driver could use PS_4 as the
> lower power state - there is no real requirement to restart
> interaction with the device with a simple procedure.
> 

Not really sure I follow this bit, none of this has anything to do
with when one restarts interacting with the device. It is about
leaving the device in a nice state when you stop interacting with
it.

> The other problem I have with the notion of 'link_lock' is that
> we already have a notion of 'bus_lock'. And in everything we did so
> far the terms manager, link and bus are interoperable. So adding a
> new concept that looks very similar to the existing one shouldn't
> be done with an explanation of what lock is used for what.

I don't see much confusion here, the two locks are at different
levels in the stack. If is fairly normal for a framework to have
a lock and drivers to have individual locks under that. And the
comment with the lock states it is protecting the list.

That said I am not attached to this way of solving the problem
either, all I am attached to is allowing devices to communicate in
their remove functions. I think perhaps the important questions
here are do you object to my assertion that a device should be
able to communicate in its remove function? Or do you object to
the way I have solved that problem? I am certainly open to other
solutions, if you have any suggestions?

Thanks,
Charles
