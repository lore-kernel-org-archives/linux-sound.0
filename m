Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65D1FAC29
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734558033; cv=none; b=J20mi0adhQz+8uH/FzTUV0lMQQKbH4fuC32u+xFayVcp6WAgACH8P+lNVEzDyMZB3bLIcttNVXmc3q3sQnm2uY+paWcxel2vuvIQxMGpX+dEsNvLKrCXE7Rh0TKg2+9Lp4WvGMFNroeeEI6L0RtkW3CqC3BKbWb/eMoDg7Xfq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734558033; c=relaxed/simple;
	bh=M5+aN/TeZf208thp0N2b0Q1ExXiYG7IDVmnwWyLtJGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=f8swAXQowy/2V4SeCjSJTxDHM8MMnyDgldP5kOnjM70sPyaEK7uI/llolEU01jghskFibjD0QOK3hmzDHhanMyvWto+TvO/fC6sSW/6xEeeBeJwVYks80on0XE+be89TmcnUW01rGN8XOtZLijVvYLhNIa8Gw0VpQAZHMOw8/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RAOFfPmN; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RAOFfPmN"
Message-ID: <9b8ef4d2-e4bd-4336-8980-0fb59d672631@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734558028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2MwVZcsygSjA4aR3oTfseFaUSf7ETmYSOSCwzE4KBQ=;
	b=RAOFfPmNnTJXow4tiS2DBaTXZtULZ2JD6X/9yWqVUMHryNxWRzxRIIa9hnKXxfCq/9mQsI
	v/8vAJB902XaDEsLqgY6r7Ym1bZYDv2ruG/DtlXhcJrLA48X870Qi6IpIG8u5kMY+czbDn
	7WCDaJbB3FCKBHyRQklBq/iqAfrq6Ac=
Date: Wed, 18 Dec 2024 16:40:22 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
 <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
 <Z2KbELGGjeH3NQdY@opensource.cirrus.com>
 <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
Content-Language: en-US
In-Reply-To: <7479a25e-6729-4aa0-b67e-7781bf8232da@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>> Or do you object to
>> the way I have solved that problem? I am certainly open to other
>> solutions, if you have any suggestions?

Having looked at the code in more details, I think there are other 
issues, see e.g. this part of the code called from snd_bus_master_delete().

static int sdw_delete_slave(struct device *dev, void *data)
{
	struct sdw_slave *slave = dev_to_sdw_dev(dev);
	struct sdw_bus *bus = slave->bus;

	pm_runtime_disable(dev);

	sdw_slave_debugfs_exit(slave);

	mutex_lock(&bus->bus_lock);

	if (slave->dev_num) { /* clear dev_num if assigned */
		clear_bit(slave->dev_num, bus->assigned);
		if (bus->ops && bus->ops->put_device_num)
			bus->ops->put_device_num(bus, slave);
	}

So at this point an interaction with the device is not longer possible, 
even if the Cadence interrupts are kept active, since there's no valid 
device number to use...

	list_del_init(&slave->node);
	mutex_unlock(&bus->bus_lock);

... but this is where the .remove() will take place.

	device_unregister(dev);
	return 0;
}

What am I missing?

