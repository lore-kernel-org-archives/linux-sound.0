Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E6368287
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788330; cv=none; b=WakU+XQpn+PKGMdaNxISxb9vc9R/AtfaHD05+rUejaHeSD48DfwSXDAg4vr3Y8IjSY6VowtCVxGhQK1oKbt1U54j8Eowhb90aaJ663/I9p7fXYZ4HdnoIE0qUjupeSmcmHnd9agB6RJjQycw1QFJ7l7SAq64BNxuRsYllA3Xs38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788330; c=relaxed/simple;
	bh=OPP01jxN6gKr++PwSjVlbBUBrgWGdZl+9UmaJQWovco=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=DihnXrA/n/cFEIHiVNoFHLbyUz9UVL3USrKDmE4RxUNEyb0vpe4up+Un8JXfWYaeRBcqwEDb8dGZOt01P7x+CAip3DfA3ZH9IMHB/e5v2XA8xRIljXA8r8g4ES30sGo5TuHlN93aYm/efAbJctTWpPHShWMmt4NeGGs+UNxmWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r9vu2xj5; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r9vu2xj5"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260618131205euoutp021e3787f407a8891f37c2a05ea68ce595~6LwqmZrNs1810918109euoutp02j
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 13:12:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260618131205euoutp021e3787f407a8891f37c2a05ea68ce595~6LwqmZrNs1810918109euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781788325;
	bh=YbEmCtcBy6cEjfNQWJNsopKiRX+D8GZNcCpFkkLMSgw=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=r9vu2xj5qWmcj897KZHYvrjVvT0bf9nsPjsGWe8aaHdPPtTFTDuEr44ebZzCEUPVd
	 uAH+sBKWsE7tJiTPbSikmqNRJ18epQgF6DtLfKPEQ1RS/sdNditTtKYXAUwjJ4HzMy
	 QREc2IaWnd3gWU+9tpM/o6wdlo8wANTnY19Rm4bw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260618131205eucas1p175362d12564ff9553210e7bae3323615~6LwqWBOJQ3042730427eucas1p1o;
	Thu, 18 Jun 2026 13:12:05 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260618131204eusmtip13858a303a9398c1b89158ff1d168d172~6Lwp4kZL_2412524125eusmtip1S;
	Thu, 18 Jun 2026 13:12:04 +0000 (GMT)
Message-ID: <1893eabe-29aa-4377-8cba-d1d1cc2972c6@samsung.com>
Date: Thu, 18 Jun 2026 15:12:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>, Dave
	Stevenson <dave.stevenson@raspberrypi.com>, linux-rpi-kernel
	<linux-rpi-kernel@lists.infradead.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>
Content-Language: en-US
In-Reply-To: <c29c5ef0-cb10-428f-8ccd-8a84195dd504@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260618131205eucas1p175362d12564ff9553210e7bae3323615
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

On 18.06.2026 14:58, Marek Szyprowski wrote:
> On 18.06.2026 13:22, Richard Fitzgerald wrote:
>> On 17/6/26 15:10, Marek Szyprowski wrote:
>>> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>>>> In snd_soc_bind_card() create a device_link from card to all components
>>>> to ensure correct order of system_suspend. The card is the consumer and
>>>> the components are the supplier, so that the card will system_suspend
>>>> before any of the components.
>>>>
>>>> The PM core will normally system_suspend drivers in the opposite order
>>>> that they registered. This ensures children are suspended before their
>>>> parents, for example users of a bus driver should suspend before the bus
>>>> driver suspends.
>>>>
>>>> For ASoC, snd_soc_suspend() shuts down any active audio, which requires
>>>> that the components are still able to communicate with their hardware.
>>>> Previously there was nothing to ensure this ordering, because there is
>>>> (usually) no relationship between a machine driver and component drivers.
>>>> If the machine driver registered before the codec drivers, the codec
>>>> drivers would be suspended before the machine driver snd_soc_suspend()
>>>> runs, so that ASoC is attempting to stop audio on a driver that has
>>>> already suspended.
>>>>
>>>> Creating a device_link is safe if there is already a device_link between
>>>> those devices because of multiple components sharing the same dev.
>>>> device_link_add() kernel doc says:
>>>>
>>>>   "if a device link between the given @consumer and @supplier pair
>>>>    exists already when this function is called for them, the existing link
>>>>    will be returned regardless of its current type and status ...
>>>>    The caller of this function is then expected to treat
>>>>    the link as though it has just been created, so (in particular) if
>>>>    DL_FLAG_STATELESS was passed in @flags, the link needs to be released
>>>>    explicitly when not needed any more"
>>>>
>>>> For the same reason it is safe if the codec driver or machine driver
>>>> later call device_link_add() to create a link between the same two
>>>> devices.
>>>>
>>>> (I have tested creating multiple links between the card->dev and a
>>>> component->dev and did not encounter any problems with suspend/resume or
>>>> module unloading.)
>>>>
>>>> The DL_FLAG_AUTOREMOVE_* flags assume that they are being called from
>>>> the probe() function of that device. This isn't guaranteed in ASoC card
>>>> binding because of deferred binding. The exact behavior and consequences
>>>> of the DL_FLAG_AUTOREMOVE_* are also unclear from the documentation.
>>>> So DL_FLAG_STATELESS is used for safety, and the links are removed
>>>> explicitly when the card unbinds or if the bind fails.
>>>>
>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>> ---
>>>
>>> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
>>> soc-core: Create device_link to ensure correct suspend order"). In my
>>> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
>>> 3 and 4 boards due to an issue with hdmi-audio-codec:
>>>
>>> # dmesg | grep vc4
>>> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>>> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
>>> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
>>> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
>>> vc4-drm gpu: adev bind failed: -22
>>> vc4-drm gpu: probe with driver vc4-drm failed with error -22
>>>
>> Where in device_link_add() does it fail?
>>
> It fails the following check at drivers/base/core.c line 766:
>
>        if (!device_pm_initialized(supplier)
>             || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
>                   device_is_dependent(consumer, supplier))) {
>                 link = NULL;
>                 goto out;
>         }
>
> because device_is_dependent(consumer, supplier) is true for fef00700.hdmi and
> hdmi-audio-codec.1.auto.
This hack fixes VC4 probing (I'm aware that drivers/base/core.c change is not
acceptable):

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bd2ddf2aab50..03e0909d5d68 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -300,7 +300,7 @@ bool device_link_flag_is_sync_state_only(u32 flags)
  * Check if @target depends on @dev or any device dependent on it (its child or
  * its consumer etc).  Return 1 if that is the case or 0 otherwise.
  */
-static int device_is_dependent(struct device *dev, void *target)
+int device_is_dependent(struct device *dev, void *target)
 {
        struct device_link *link;
        int ret;
@@ -330,6 +330,7 @@ static int device_is_dependent(struct device *dev, void *target)
        }
        return ret;
 }
+EXPORT_SYMBOL_GPL(device_is_dependent);

 static void device_link_init_status(struct device_link *link,
                                    struct device *consumer,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index ac9b2269c26e..ba70befea0e8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2165,6 +2165,8 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
        }
 }

+extern int device_is_dependent(struct device *dev, void *target);
+
 static int snd_soc_bind_card(struct snd_soc_card *card)
 {
        struct snd_soc_pcm_runtime *rtd;
@@ -2304,7 +2306,8 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
                if (card->dev == component->dev)
                        continue;

-               if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
+               if (!device_is_dependent(card->dev, component->dev) &&
+                   !device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
                        dev_warn(card->dev, "Failed to create device link to %s\n",
                                 dev_name(component->dev));
                        ret = -EINVAL;


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

