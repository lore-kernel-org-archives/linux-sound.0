Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC81A01BD;
	Fri, 20 Dec 2024 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717585; cv=none; b=mbKJ1UnqKHMGLogGRX56FeqlUWkRT/bcmA45NzdJ+tRKV3EyqRDbdKnepIhqQgxcOvQKvARbSG6r2XU0EtjxPXZ0xOxsa/BL9Kzc6zMmv3dF+Jxtuz6WWs34Bivtim8SgLfGmGv3Fky0qOD4H/LBeClzvpXdYtibB2lY2pzuzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717585; c=relaxed/simple;
	bh=BZ9gPU1CEwQKTmIp7EajWMRUV319BXdBRT9QZOG9Pco=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVNPqPkAEDqphgzBpe7LDdLEb7egBdbIjRjmEM3ctstPWDTzQbUauTbFj2stgyI9Xn08iOAw7ikxkoi+5yownyxDzHs9JiiN3Ic4oUkQpnqxibnB4dM4ejOPqwonmlON+NhsWHqBt80CyibEoCXfbqwhaROvITVX06KVvGJyHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=djUfC+aR; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="djUfC+aR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKB0b2L025822;
	Fri, 20 Dec 2024 11:59:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BUMeKL1GjyKMsageed
	wQb3QvCErh1A2q5UndvtGWerA=; b=djUfC+aRSFyvvb7NQscU8Q0m8OndDnQypN
	2dGklhqIh+odQIRY6HfPr6sNMjZntgiFLrAFmQsGHksSbewkiuACUpGT8MHFdbth
	AQAykjPtz9ABHA+hauQuZUGLY5hroy+jBUM4U76WoQKWUINR4KdptoFXnv2vy0lZ
	xIAbuj7q5tHShPY8Obs+MK8fHWKFYsXrwVeesksxpTlJGl/YE3JOU6WV//ekFqJU
	vsJLqrsSPykNgERpivfmH+30b49X84Q+8zT2MsBO+tvA4XzgvWPLBezRcL6gKxws
	OWTs8vZkPuWkhJko/u1wv4ZJn2KNJMtfbuDLgkr+0/VFCo4iOXag==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43h8a287n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:59:23 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 17:59:20 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 17:59:20 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B2DBC820247;
	Fri, 20 Dec 2024 17:59:20 +0000 (UTC)
Date: Fri, 20 Dec 2024 17:59:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>, <vkoul@kernel.org>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
Message-ID: <Z2WwdxuPpnNZUBrC@opensource.cirrus.com>
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
 <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
 <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
 <9b8ef4d2-e4bd-4336-8980-0fb59d672631@linux.dev>
 <Z2P1KVLFig0Kh1h2@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z2P1KVLFig0Kh1h2@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: zgigsXu9puH0m61BGc48_FIGW-CeCnfc
X-Proofpoint-GUID: zgigsXu9puH0m61BGc48_FIGW-CeCnfc
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 19, 2024 at 10:27:53AM +0000, Charles Keepax wrote:
> On Wed, Dec 18, 2024 at 04:40:22PM -0500, Pierre-Louis Bossart wrote:
> > Having looked at the code in more details, I think there are other issues,
> > see e.g. this part of the code called from snd_bus_master_delete().
> > 
> > static int sdw_delete_slave(struct device *dev, void *data)
> > {
> > 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> > 	struct sdw_bus *bus = slave->bus;
> > 
> > 	pm_runtime_disable(dev);
> > 
> > 	sdw_slave_debugfs_exit(slave);
> > 
> > 	mutex_lock(&bus->bus_lock);
> > 
> > 	if (slave->dev_num) { /* clear dev_num if assigned */
> > 		clear_bit(slave->dev_num, bus->assigned);
> > 		if (bus->ops && bus->ops->put_device_num)
> > 			bus->ops->put_device_num(bus, slave);
> > 	}
> > 
> > So at this point an interaction with the device is not longer possible, even
> > if the Cadence interrupts are kept active, since there's no valid device
> > number to use...
> > 
> > 	list_del_init(&slave->node);
> > 	mutex_unlock(&bus->bus_lock);
> > 
> > ... but this is where the .remove() will take place.
> > 
> > 	device_unregister(dev);
> > 	return 0;
> > }
> > 
> > What am I missing?
> 
> Hmm... yes that is a good spot, I will investigate that further.
> Certainly I do see these operations happening in the wrong order
> but it doesn't seem to cause the register transactions to fail.
> Most likely it is best to reverse these two, it makes sense
> to not clear the device number until we are finished with the
> device, but would be good to understand what is going on first.

Ok, so yeah nothing on the read/write path checks assigned. So yeah
it has marked the device as not being assigned but that doesn't
actually stop anything from communicating with the device, the
dev_num is still the same one the hardware has. Assigned is only
checked when handling slave status events.

So I think your point is valid this code should also be changed
although the only way it can currently go wrong is if a new device
registered on the bus at exactly this moment and was assigned the
dev_num of the old device.

Likely will be the new year before I get the time to think
through the details.

Thanks,
Charles
