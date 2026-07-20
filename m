Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B5D2C15BE
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558696; cv=none; b=kd8zzn91mkPL/I3XfLey6Nup/BXkIfBmorzAzUjuEtOc/UJCKeCk1GyBuTc7c7hvyR80CWlQ7+5/9xou6m1WNrWgGE4qm/01O9IB2FWyCK32tGxrv57XcrQuHYYGs3t4UaxMSJj3P29X0ikctYx6rg4bO67CHYgoM3lv0ZDbZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558696; c=relaxed/simple;
	bh=Qq54eCqoo8mhA3m2Vhb4X7f73n7G0M/o49ejGd3T5vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aeZv+dHEEdDndl4pkOFl9B5gZk8rqN1U+b3BjQDON5xEgd7/4ubzgvIikrrnBipuoGUKZvBX82O5Y3N3F4gVLOQih0JGPLJm35HteUZO5JT6jx7aNTl6kRvOWzbOXaJSJkuX9BsibMiU8DjRClCmoU3bzfjaomIWDtd1RIjoH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WiBV6OVa; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WiBV6OVa"
Message-ID: <305305e9-6f41-46bf-96fa-0495ef27062a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784558691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/hXMC4PVOUA66FmAQhsN1W7k0FDEdNarCI1eusd9NTA=;
	b=WiBV6OVahpVWpTIDiAIqPgR1J9MssZN1KtrPy5pLNSuTnMMq4jza0bTxv6chsCsISbhFeB
	vNB8uIPD4+EBuGEWYUzaxrXl41oCSa7myzYjJ4Tbwd4jHXncpl0EP0MisaTyOQfuazmP3L
	Id5eOmWM9cvfcKhL0Ttc9Yys2e5Y3AA=
Date: Mon, 20 Jul 2026 16:44:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, "shumingf@realtek.com" <shumingf@realtek.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
 <bcd410d4-9736-427e-a921-831fffd37c5e@linux.dev>
 <al4yqpvM6iwG0kjo@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <al4yqpvM6iwG0kjo@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/20/26 16:37, Charles Keepax wrote:
> On Fri, Jul 17, 2026 at 10:42:46PM +0200, Pierre-Louis Bossart wrote:
>> On 7/16/26 16:26, Charles Keepax wrote:
>>> Currently, the IRQ data (attached Entity/Control/etc) is populated
>>> as the IRQ is requested. However, this can cause issues as
>>> occasionally the setup process wants to access specifics of
>>> an IRQ before the IRQ is actually enabled. To facilitate this
>>> cache all the IRQ data during sdca_irq_populate_early() and make
>>> sdca_irq_populate() simply request the outstanding IRQs. This
>>> also has the advantage that sdca_irq_populate() can now just
>>> iterate through the IRQ array which is much smaller/faster than
>>> going through every Entity in the Function for Controls.
>>>
>>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>>> ---
>>
>> I may be splitting hair but shouldn't this patch be moved
>> earlier?patch1/3-4 seem to be completely tied with the introduction and
>> use of the fixup_controls() callback, I am not sure I see the link with
>> the IRQ stuff. Or conversely move this last if this makes more sense.
> 
> It can be moved to the start of the series, probably not worth a
> spin on its own but if we end up with changes from Mark's
> comments I will do so.
> 
> This is slightly related though as sdca_jack_set_jack is called
> before all the controls are registered and we populate the jack
> masks in there, so moving the IRQs to later means we need that
> information ready at that time which this accomplishes. Although
> it does also just generally make things a bit neater.
> 
>> Also while I am at it, I wouldn't hurt to have an explanation of the
>> races conditions earlier, it's only in patch3 that the race condition is
>> described in details.
> 
> Yeah I should have probably included that in the cover letter
> more. Likewise, I will update that if we end up with another
> spin. If either you or Mark feel strongly enough on these points
> to warrant another spin just for them just let me know.

I do have a new question triggered by the last patch from Shuming: what
happens to the existing users of sdca_irq_populate(), do they also need
to use the new sdca_irq_populate_early()? See my comment in the other
patch "ASoC: rt766: add RT766/RT767 SDCA driver"

If there is no impact no need for a new spin IMHO.
