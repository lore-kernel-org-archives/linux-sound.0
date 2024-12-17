Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F311FA829
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479657; cv=none; b=LGzXqSJX6c6FtBuuxl4FS7FynxJ3eUJfMiCHKZhO0HuKNcqiOwt66lSGIbrb03/BmtDOejEkUGQnlDR69IqCI2e9TvDR2PbKMclx3PTDrZEOZRJL7YThbPqLeUz2mNYRgNCTyP7v12yDmrdIswq5taUFESaq7Tie+vMbgKcjwSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479657; c=relaxed/simple;
	bh=Zp+JosGmq0gL0rw+g5kU+282YsY4wmILYqMkg2OYXxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBMXeZHilCuxzNjQG5E6x1Jfa9Lj++fzvtcOno1w1EjK27kAf/7wDpbqVHrnEHKCF7YyGjzIz7p12ycyY7m0vbH6mOOALHPKYUeWCl3GDbEMEGGtjwmx5uRMj55VFQMQi+JOD7lEABsYqY0457azAqqXjuoloSzb5nk8dgZqrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xISdVDbz; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xISdVDbz"
Message-ID: <e6dd9fc3-de55-47d2-a1b5-10884418a66d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734479653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zp+JosGmq0gL0rw+g5kU+282YsY4wmILYqMkg2OYXxQ=;
	b=xISdVDbzX9LMoZIXai7d5p2VtXKY6wUeet5jR8Z/bj574JWEtNyXQJa99JGz6/Adp4uiGP
	KD3vihtK+3VX3q8VG3qaa0g2ViSVK9QC/FMa5MSLc3NRiiiwMdoLtr/DiDB7HNiBMowblW
	kIVm1kSKklp3zC/cTPFZ99yrkFCLrJ4=
Date: Tue, 17 Dec 2024 17:49:17 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soundwire: intel_auxdevice: Don't disable IRQs before
 removing children
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20241212110221.1509163-1-ckeepax@opensource.cirrus.com>
 <3eb98099-75da-4464-97d1-9e8538375e34@linux.dev>
 <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <da4a16f1-0bf6-4597-b1de-55386db85254@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/17/24 4:49 AM, Richard Fitzgerald wrote:
> On 16/12/2024 5:35 pm, Pierre-Louis Bossart wrote:
>> On 12/12/24 5:02 AM, Charles Keepax wrote:
>>> Currently the auxiliary device for the link disables IRQs before it
>>> calls sdw_bus_master_delete(). This has the side effect that
>>> none of the devices on the link can access their own registers whilst
>>> their remove functions run, because the IRQs are required for bus
>>> transactions to function. Obviously, devices should be able to access
>>> their own registers during disable to park the device suitably.
>>
>> What does 'park the device suitably' mean really? That sounds scary. What happens if the manager abruptly ceases to operate and yanks the power? Does the device catch on fire? On a related note, the manager should *never* expect to find the device in a 'suitable' state but always proceed with complete re-initialization.
>>
>> It would be good to expand on the issue, introducing new locks is one of those "no good deed goes unpunished" situations.
>>
>>> It would appear the reason for the disabling of the IRQs is that the IRQ
>>> handler iterates through a linked list of all the links, once a link is
>>> removed the memory pointed at by this linked list is freed, but not
>>> removed from the linked_list itself. Add a list_del() for the linked
>>> list item, note whilst the list itself is contained in the intel_init
>>> portion of the code, the list remove needs to be attached to the
>>> auxiliary device for the link, since that owns the memory that the list
>>> points at. Locking is also required to ensure the IRQ handler runs
>>> before or after any additions/removals from the list.
>>
>> that sounds very detailed but the initial reason for all this is still unclear.
>>
> For example, if the bus driver module is unloaded, the kernel will call
> remove() on all the child drivers. The bus should remain functional
> while the child drivers deal with this unexpected unload. This could
> for example be writing some registers to put the peripheral into a
> low-power state. On ACPI systems the drivers don't have control of
> regulators so can't just pull power from the peripheral.

Answering to the two replies at once:

If the bus driver is unloaded, then the SoundWire clock will stop toggling. That's a rather large piece of information for the device to change states - I am pretty sure the SDCA spec even mandates that the state changes to at least PS_2.
But to some extent one could argue that a remove() should be more aggressive than a suspend() and the driver could use PS_4 as the lower power state - there is no real requirement to restart interaction with the device with a simple procedure.

The other problem I have with the notion of 'link_lock' is that we already have a notion of 'bus_lock'. And in everything we did so far the terms manager, link and bus are interoperable. So adding a new concept that looks very similar to the existing one shouldn't be done with an explanation of what lock is used for what.





