Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB97628641E
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788935; cv=none; b=GU1sHb4jqE4dDeyxa0YQtQhQ6gcSgveD7tUUKwoKW2F5+orMi1hN17I7woxyeAIhw3MSmy6u7EPerSW0qCR7/9C3u/kYRd3xoNCuwtHk4mS+xoQfZV+ET9aTE0kTApQHjChBcV2VaUVNeShEUmw8qz5BeiRO1AKBGzh+1ntHKEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788935; c=relaxed/simple;
	bh=QvKnMXmmDo0+lzkFQodY2klTvKL/mHJfUdNmsHWN0mA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=qhfTDBrCYXm9gAMepGR9hsqqmbjm0ZzCvjKeujdL0iSXhTAg0cQGR7ofJW2RErjTqgebmCMSBORmN8FAkU6fjOBP4M74NyixWdW8rttSLL0b5ntgP1Q8is1hY9cqwSkQk4DqcB6Ue9mjNU9yQvSivtI0dVoMt/SISfwr5/rRTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tONBRW6c; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tONBRW6c"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260618132211euoutp016a5d1612c447f21c98d5ce595d57509d~6L5erWWhC3040130401euoutp01S
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 13:22:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260618132211euoutp016a5d1612c447f21c98d5ce595d57509d~6L5erWWhC3040130401euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781788931;
	bh=uX7MkCXEEgWrd5SmyQVnV2G88949gJSfTDGIoWOMU2M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tONBRW6cXdmg3Uo4mdvwAxzeDzSnIYMC8i4lAAVfd6U9OerEv0wZ5qcgiEyknzb+c
	 fbQC+s87xl5JBox3Ae5PpYGk68j/SyDO9T9+yk7Z/jFNhG+NkI0byv/Rzxdh8lH/it
	 H0XiCZt8SNqjiEoq5gmMuBl/ZdF+bngMh6DDL86k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260618132210eucas1p2eddc2eb8d3ea196806cb57f49e9b7782~6L5eVseWl2329623296eucas1p2I;
	Thu, 18 Jun 2026 13:22:10 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260618132209eusmtip25a5eea7fe89aa9cbe37b42c76a01bf49~6L5dsKlnV2457124571eusmtip2x;
	Thu, 18 Jun 2026 13:22:09 +0000 (GMT)
Message-ID: <4d8b5ea3-299c-4a03-86be-696ce51afd9c@samsung.com>
Date: Thu, 18 Jun 2026 15:22:08 +0200
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
In-Reply-To: <6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260618132210eucas1p2eddc2eb8d3ea196806cb57f49e9b7782
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
X-EPHeader: CA
X-CMS-RootMailID: 20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
	<CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
	<4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
	<b9e3f7cd-2329-43b0-89ca-0243e4916c16@opensource.cirrus.com>
	<c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
	<6af1deff-8d1b-472a-8ef3-04f47321689e@opensource.cirrus.com>

On 18.06.2026 15:12, Richard Fitzgerald wrote:
> On 18/6/26 13:58, Marek Szyprowski wrote:
>> On 18.06.2026 13:22, Richard Fitzgerald wrote:
>>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>>> In snd_soc_bind_card() create a device_link from card to all components
>>>>> to ensure correct order of system_suspend. The card is the consumer and
>>>>> the components are the supplier, so that the card will system_suspend
>>>>> before any of the components.
>>>>>
>>>>> The PM core will normally system_suspend drivers in the opposite order
>>>>> that they registered. This ensures children are suspended before their
>>>>> parents, for example users of a bus driver should suspend before the bus
>>>>> driver suspends.
>>>>>
>>>>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>>>>> that the components are still able to communicate with their hardware.
>>>>> Previously there was nothing to ensure this ordering, because there is
>>>>> (usually) no relationship between a machine driver and component drivers.
>>>>> If the machine driver registered before the codec drivers, the codec
>>>>> drivers would be suspended before the machine driver snd_soc_suspend()
>>>>> runs, so that ASoC is attempting to stop audio on a driver that has
>>>>> already suspended.
>>>>>
>>>>> Creating a device_link is safe if there is already a device_link between
>>>>> those devices because of multiple components sharing the same dev.
>>>>> device_link_add() kernel doc says:
>>>>>
>>>>>    "if a device link between the given @consumer and @supplier pair
>>>>>     exists already when this function is called for them, the existing link
>>>>>     will be returned regardless of its current type and status ...
>>>>>     The caller of this function is then expected to treat
>>>>>     the link as though it has just been created, so (in particular) if
>>>>>     DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>>>>     explicitly when not needed any more"
>>>>>
>>>>> For the same reason it is safe if the codec driver or machine driver
>>>>> later call device_link_add() to create a link between the same two
>>>>> devices.
>>>>>
>>>>> (I have tested creating multiple links between the card->dev and a
>>>>> component->dev and did not encounter any problems with suspend/resume or
>>>>> module unloading.)
>>>>>
>>>>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>>>>> the probe() function of that device. This isn't guaranteed in ASoC card
>>>>> binding because of deferred binding. The exact behavior and consequences
>>>>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>>>>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>>>>> explicitly when the card unbinds or if the bind fails.
>>>>>
>>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>>> ---
>>>>
>>>>
>>>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>>>> soc-core: Create device_link to ensure correct suspend order"). In my
>>>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>>>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>>>
>>>> # dmesg | grep vc4
>>>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>>>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>>>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>>>> vc4-drm gpu: adev bind failed: -22
>>>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>>>
>>>
>>> Where in device_link_add() does it fail?
>>>
>>
>> It fails the following check at drivers/base/core.c line 766:
>>
>>         if (!device_pm_initialized(supplier)
>>              || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
>>                    device_is_dependent(consumer, supplier))) {
>>                  link = NULL;
>>                  goto out;
>>          }
>>
>> because device_is_dependent(consumer, supplier) is true for fef00700.hdmi and
>> hdmi-audio-codec.1.auto.
>>
>>
>> Best regards
>
> Is the machine driver the parent of the codec driver?


Yes, so this change fixes the issue:

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ac9b2269c26e..5e00ad0bc7cf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2304,7 +2304,8 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
                if (card->dev == component->dev)
                        continue;

-               if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
+               if (component->dev->parent != card->dev &&
+                   !device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
                        dev_warn(card->dev, "Failed to create device link to %s\n",
                                 dev_name(component->dev));
                        ret = -EINVAL;


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

