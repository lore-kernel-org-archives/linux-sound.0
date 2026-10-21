Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541088;
	b=xwzJEg6xMCrsgOEkvKI19SMD2Mm5xmDpQtltehorDM4yfmROs9LjmPzlRQen0CLvKcNF
	 IlS4C5+fKp2qvzQ3RvDdwWbzrOKnV6V8jTF4FtdsivJnISVGnhprfhd5h2MtSzk+HEcEY
	 lOkK14a8nphYKkt1TMdSYBuA1xSKyhtbzi78o7xGoUsrY/KpwyKYB9Z4Xwka9jVTvTEjL
	 QoaTn1W0oK4S9LCa7b86PaUvA+2MoDsB6y2TR/yoOdHHZGEZFkzxdZrm82Q9x8mwqo2LC
	 fJjlmr18jJ9bItG9kmMDfLuGIbNbeT+tdW9YwpY6iYk1ol2y3h4/lac3vkoXs//TwoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541088;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JfyNI7fUT1Ams9OJuY2Atk9nQVrmQbtJG0VUOpyrabQ=;
	b=abVmxr3OUgOe6CVeI12mVdcffbIFk36MweJcpA+j410Ax+j4xvAVTBj/As+5Zn6YgSqz
	 Xq1711s0CLAnhP1vfhe1S6PH4cTG34K87hFVWbae6yAb4vt/HuHNg7/1X3iGEBauTXSg/
	 T5Y4IspSbGiM3qbDZxVbLDqb75PoEbpb2mXbrecM/y26u3WDBhNc+erx4MDcPziRxKYID
	 gJ8GDDMYDZH/Q1fS66qu7Uh9Fs9RntCv7V5Xra4DaoXAJZH4G2ff8sFcaUGTyGhpSWjmf
	 2OzoVH8fO2jUWK1zlSiS1TnArFdFMQJrd1Qm5YtOrC353XSFVNU8E5lHOzKERCds5sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T0Ts2mg8;
	arc=none smtp.remote-ip=95.215.58.206
Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B43B606A31A
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 00:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B43B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T0Ts2mg8
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JfyNI7fUT1Ams9OJuY2Atk9nQVrmQbtJG0VUOpyrabQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792541084; v=1; x=1793145884;
 b=T0Ts2mg8y1N7Iit2ZMWZRr9h9FYQWvwUwT+GqV6rSKzFaxPYA20+3+vcTu+fg0mSH2HTlkjs
 DC7+cyWvLBRDcppEUIH93h8dwHI2BZOZ2BzBHteAIjN/e3MLRQjsMZuegOjKvdH+H9lXbD5dieF
 v5DNz1psl8O3lkiyVBibH5fc=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ab1c28563a218ee;
	Wed, 21 Oct 2026 00:04:44 +0000
X-Mizu-Trace-ID: 4ab1c28563a218ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <eef7a85e-4cde-4941-817a-cca48b230db0@linux.dev>
Date: Tue, 20 Oct 2026 17:04:40 -0700
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: tas2783-sdw: keep the volume settings across
 resets
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: Lee Mann <leepaulmann@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrey Golovko <andrey.golovko@gmail.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-2-matthew.schwartz@linux.dev>
 <bdc967fd-c056-492d-b970-db5630f21b95@linux.dev>
 <4c1a8b04-d873-4395-badb-2762e6c40f59@linux.dev>
 <caf02dc9-cd1a-4acb-b7eb-b65d46b89f9d@linux.dev>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <caf02dc9-cd1a-4acb-b7eb-b65d46b89f9d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 1:41 PM, Pierre-Louis Bossart wrote:
> On 10/19/26 19:53, Matthew Schwartz wrote:
>> On 10/19/26 8:56 AM, Pierre-Louis Bossart wrote:
>>> On 10/18/26 22:00, Matthew Schwartz wrote:
>>>> The register cache is dropped when the amp attaches uninitialized and
>>>> again after the firmware download, so the Amp Volume and Speaker Volume
>>>> registers are not cached while the amp is runtime suspended, and every
>>>> read or write of those controls fails with -EBUSY. On a platform that
>>>> powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
>>>> X20, the amp is also reset and initialized again on every wake, so a
>>>> volume set while it was awake is lost the next time the link idles.
>>>>
>>>> Keep both settings in the driver, as the cache has to be dropped
>>>> whenever the reset and the firmware download change registers behind
>>>> it. Reads return the kept value, a write reaches the device only while
>>>> it is runtime active and initialized, and the settings are programmed
>>>> again after every init and resume. Until userspace sets a control, the
>>>> value the firmware leaves after each init is adopted instead, so its
>>>> tuning stays in effect. Waking the amp for a control access would
>>>> instead cost a full init of both X20 amps, about 0.2 s each.
>>>>
>>>> Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")
>>>
>>> Erm, not sure what to think about this fix of a fix.
>>>
>>> This commit b627da430357 introduced the regcache_drop_region() for all
>>> kinds of reasons, and now this new patch introduces a manual management
>>> of the volume registers - but why limit this management to volume
>>> settings only? Shouldn't other features such as e.g. bass boost or EQ
>>> also be restored?
>>>
>>> It really feels like the problem is that the regmap is not properly
>>> restored...at the end of the day, this driver is missing a
>>> regcache_sync(), no?
>>
>> The driver only has the two volume controls, there's no bass boost or
>> EQ control. The rest of the tuning comes from the firmware, which
>> tas_io_init() writes again on every init, apart from a retained PRAM.
>>
>> A regcache_sync() can't restore these two because the firmware
>> download writes registers with sdw_nwrite_no_pm(), behind the cache,
>> and that includes AMP_LEVEL. Of the 72 TAS2783 files in linux-firmware,
>> 44 set it to something other than the 0x28 in tas2783_reg_default[],
>> mostly levels 9 to 16, and two set DVC to 0x04 instead of 0x00.
>> Syncing the default values would replace that per-platform tuning with
>> full gain. So the driver has to know whether userspace set a value,
>> which needs restoring, or left it alone, in which case the firmware's
>> value should stay, and regmap doesn't track that per register.
>>
>> The volume was also lost before b627da430357, since the sync ran
>> before the reset wiped it. The Fixes tag is for the -EBUSY that commit
>> added when reading an uncached volume register while the amp is
>> runtime suspended.
>>
>> Certainly open to suggestions for improvement here if there's a simpler
>> way to fix this.
> I am afraid I don't fully grasp the intended design, with a regmap
> default, a firmware download that modifies volume settings but doesn't
> update the regmap value, and last a userspace-defined volume that can
> override a platform-specific tuned value. It's a recipe for inconsistent
> register settings...

Yeah, I certainly can't argue with you there... I think we need vendor input
to get a better understanding of how these are meant to work together.

This was broken on real hardware, so my patches were pretty focused on trying
to unbreak that specific device. Speaking candidly, I'm not sure I'm in a
position to take on all of the tech debt that's been surfacing here.

