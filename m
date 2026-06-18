Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F43FB049
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787546; cv=none; b=U9qXpVtmAOpn6MAdz51+xtfKd71BonE6023eOWQv24k6XNUPbVzT5Aqqa7V06aQKq/qx4B8eHF8ki6to235wue/nxMCSqJJA79o4eS6R2TlWaC9vEJmyqLYVjcaukA82qGF1wCT4RkXwsPTkuNNr+hjoELll1TQ9SomwPercL3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787546; c=relaxed/simple;
	bh=LaibiY5FSrjmwfA928b8+mAZMgXxHJ3Zv/rLpv+C1nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=e39tcNBKp/87uIW8lfYXRU1tfuQsEp9mxJPloyuJq7STJo0yQ87KswbbTvs3KagpEQT5Px/ttdV3yJQ8Hly38xHUEg1jaaOxDG/MV/wjtUko4Ga7A9c6hkmYe+Q12C5KsOLHrfwvHVBzIPdh13r2VAR7jiKCliP6WrBl/6u0in8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Y5PMfktf; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y5PMfktf"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260618125900euoutp026ea7070c8948f1f9bc3bc966f143bf1a~6LlQCTenw3121631216euoutp02c
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 12:59:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260618125900euoutp026ea7070c8948f1f9bc3bc966f143bf1a~6LlQCTenw3121631216euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781787540;
	bh=yuxjP3PThKOMLVSl+J84JpyTe1P3NczemiUEy6A4d9M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Y5PMfktfY0uKEVouAakcgnxN5XPGmnQIpGMNpdulrIxJAq2m4Mk8Jqqj+L3eBfWwG
	 eVVPFVqyfIzDxxHzIs3upDtWtQ6hKRYf67yApTBv4GLy+/i4LRzDNl6X97sy+LXgM4
	 S6vtk0GcvG/UM8zu3eDDuaPeEm2WCLPq40Xap66U=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260618125900eucas1p2b5efe2bfe87038baaec2295e9ca4a63e~6LlPuo5311628916289eucas1p2L;
	Thu, 18 Jun 2026 12:59:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260618125859eusmtip1b32308c8cbdcae918457411a85534ab2~6LlPGFS_Z1779317793eusmtip1D;
	Thu, 18 Jun 2026 12:58:59 +0000 (GMT)
Message-ID: <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
Date: Thu, 18 Jun 2026 14:58:58 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>, Dave
	Stevenson <dave.stevenson@raspberrypi.com>, linux-rpi-kernel
	<linux-rpi-kernel@lists.infradead.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260618125900eucas1p2b5efe2bfe87038baaec2295e9ca4a63e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
X-EPHeader: CA
X-CMS-RootMailID: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
	<CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
	<4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
	<b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>

On 18.06.2026 13:22, Richard Fitzgerald wrote:
> On 17/6/26 15:10, Marek Szyprowski wrote:
>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>> In snd_soc_bind_card() create a device_link from card to all components
>>> to ensure correct order of system_suspend. The card is the consumer and
>>> the components are the supplier, so that the card will system_suspend
>>> before any of the components.
>>>
>>> The PM core will normally system_suspend drivers in the opposite order
>>> that they registered. This ensures children are suspended before their
>>> parents, for example users of a bus driver should suspend before the bus
>>> driver suspends.
>>>
>>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>>> that the components are still able to communicate with their hardware.
>>> Previously there was nothing to ensure this ordering, because there is
>>> (usually) no relationship between a machine driver and component drivers.
>>> If the machine driver registered before the codec drivers, the codec
>>> drivers would be suspended before the machine driver snd_soc_suspend()
>>> runs, so that ASoC is attempting to stop audio on a driver that has
>>> already suspended.
>>>
>>> Creating a device_link is safe if there is already a device_link between
>>> those devices because of multiple components sharing the same dev.
>>> device_link_add() kernel doc says:
>>>
>>>   "if a device link between the given @consumer and @supplier pair
>>>    exists already when this function is called for them, the existing link
>>>    will be returned regardless of its current type and status ...
>>>    The caller of this function is then expected to treat
>>>    the link as though it has just been created, so (in particular) if
>>>    DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>>    explicitly when not needed any more"
>>>
>>> For the same reason it is safe if the codec driver or machine driver
>>> later call device_link_add() to create a link between the same two
>>> devices.
>>>
>>> (I have tested creating multiple links between the card->dev and a
>>> component->dev and did not encounter any problems with suspend/resume or
>>> module unloading.)
>>>
>>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>>> the probe() function of that device. This isn't guaranteed in ASoC card
>>> binding because of deferred binding. The exact behavior and consequences
>>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>>> explicitly when the card unbinds or if the bind fails.
>>>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>
>>
>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>> soc-core: Create device_link to ensure correct suspend order"). In my
>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>
>> # dmesg | grep vc4
>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>> vc4-drm gpu: adev bind failed: -22
>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>
>
> Where in device_link_add() does it fail?
>

It fails the following check at drivers/base/core.c line 766:

       if (!device_pm_initialized(supplier)
            || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
                  device_is_dependent(consumer, supplier))) {
                link = NULL;
                goto out;
        }

because device_is_dependent(consumer, supplier) is true for fef00700.hdmi and
hdmi-audio-codec.1.auto.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

