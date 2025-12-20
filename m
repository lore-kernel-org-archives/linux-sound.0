Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2621487E9
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766231284; cv=none; b=VwDu03jtlxbtvRkfnjPS6SCxRyuddlfXy3CZmxOtiOMTmB2NDCpr4ogBKhBvfUEWZ96YV/PhMbrs3eT9wZriFS8OcmvG1br2bbW7tYAu91S/PM4Xm0JINav8hkCBx+iJ3dC8/CzYIAS7lN9P+9ddd7hzlLo591OxlMBPQ6IUP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766231284; c=relaxed/simple;
	bh=8xP4h1x5zTczBTAUGzvhza3H0E/IeC/SZPhPm+uI/5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3ENeSwE2f42noYLoRdjACHrlCUTc750sNKNe8g/Mnw1Mo+BNp1z2VZrXOydhRgzwtHVKxtuJK5bXJAHYoHkmtwZc0N9aiEqLjN12c0cO+63kJh2v3kAXWWhAR2o5BC9LBPtUn2dwDEc5zt3lL5xH3Dpwiln1LRXIlRW0xsOrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LnhKJBlP; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LnhKJBlP"
Message-ID: <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766231279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZw4/12a/XYdkf/K6VK1rPqt/icWiiK+13TCk8R9hIQ=;
	b=LnhKJBlPWpfd3cqHQuYcGezsZokh/uVHc3Dc7UQVNsIJA22hYFmYkhI+DdBjxSOFdl3AwQ
	sl1DxDrBfvhb9/RGJjzCQy4/0j4vtKIvRXt+PgVogdgEK7nnGsXVhdv7K3s/zFA/5kPLDk
	oskVwgrWSOlok6bCkjbtkRlGal3tBoI=
Date: Sat, 20 Dec 2025 12:04:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/10/25 10:55, Charles Keepax wrote:
> On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
>>> That is some scary stuff there, that is basically working around
>>> the fact that with those drivers the soundcard is created before
>>> the hardware is actually ready. But its one aspect of that and
>>> there are likely many knock on effects/races hiding in there. At
>>> some point we should probably revisit the whole enumeration
>>> thing in soundwire it does cause a lot of scary code.
>> I don't see how we can revisit this, the codec probe happens
>> based on ACPI information even before the bus is started. The
>> card driver is also probed when the PCI driver creates a platform
>> device.
> 
> I mean in general the fact SoundWire probes devices before they
> are available. It introduces a lot of scary things, as basically
> the whole kernel is setup to believe that when a device is probed
> it is ready. I mean I know why we did it, because we might need
> to setup some things (resets/regulators) to cause the SoundWire
> device to enumerate, but it does result in scaryness.
> 
>>> That said... the class driver doesn't have the same problem
>>> however, because of the two layer nature of the auxiliary driver
>>> stuff. The soundwire driver binds to the device and completes
>>> probe, but it is the auxiliary drivers that are used in the
>>> soundcard and those are only probed once the device itself has
>>> enumerated in class_boot_work(). This means the sound card is
>>> only created after the device has enumerated, so the same problem
>>> isn't present and we can have a more normal PM runtime startup.
>> Humm, that's an important detail indeed that I completely missed...
>>
>> You could also have registered the function subdevices based on
>> ACPI information *before* the whole enumeration. I can see why
>> you took that function-register-after-device-enumeration route,
>> but I have mixed feelings about having separate mechanisms for
>> vendor- and class-drivers.
> 
> At least currently you have separate mechanisms regardless
> of the choice of probe time since all existing vendor drivers
> register a single driver and the class driver registers many
> through auxiliary. The difference is only in the secondary
> drivers that the vendor drivers don't have anyway.
> 
> Personally I like the only registering the functions when the
> device has enumerated approach as keeps interactions with other
> kernel subsystems within the expectations those subsystems have
> of the driver. There is a lot less to think about.
> 
> Ultimately, I think the long game solution here is probably that
> we move SoundWire to internally have two devices. An initial
> device the gets registered and does the probe setup and then a
> child device that probes on enumeration. Basically, the same
> setup as we have for the auxiliaries in SDCA but internal to
> SoundWire. But in the mean time I think using MFD/auxiliary to
> introduce a 2 step probe seems like a really neat solution.
> 
> Additionally, there arn't that many SDCA vendor drivers at the
> moment, a handful of Realtek ones and a TI one. If we wanted
> to standardise I would suggest standardising on the better
> solution, which to my mind is clearly this approach.

I am not against having a single mechanism, and that change would be relatively minimal.

The only issue I have with it is whether one would deregister the child device on a soft reset or whenever the device loses sync? It'd be somewhat ugly to do so, but then again we have the issue that for the second enumeration we already have a probed child driver, which would bring us back to an async model really.
The 'beauty' of the current model is that the probe does nothing really, everything happens at enumeration/sync loss. If we dynamically add/remove child devices it'll be 'fun' really quickly.

>> Note that things will be interesting when we use the new
>> ACPI aggregation information to create the card, we're missing
>> a means to re-trigger deferred probe checks as devices become
>> functional. I had a patch on this a couple of years ago, look
>> for "driver core: export driver_deferred_probe_trigger()",
>> we probably need to revisit the entire scheme...
> 
> Apologies if I am misunderstanding but is this not another example
> of the advantages of probing when the device enumerates? If I
> understand correctly the problem those patches are solving is
> resources that become available outside of a probe break deferred
> probe. By tying the probe of the auxiliaries to the enumeration
> of the device, we ensure that link between probe and resource
> availability. I think the point Greg is making in that thread
> is that the kernel expects resources are available once probed,
> so if one is going to break that assumption it should really
> be handled exclusively in the driver that does that. But the
> simplest solution to my mind is just to not break that assumption
> then everything works as expected.

That's precisely the problem, the model assumes something that is broken left and right in practice.
Exhibit A is the PCI/HDaudio parts where we rely on an async probe due to the module handling.
You also have devices that require firmware download to be functional, or some sort of internal ramp-up needed.
Assuming a perfect behavior where all resources are available at probe time is naive IMHO. In the specific case of the machine driver probed with ACPI information that isn't tied to the bus status, it's a guaranteed fail.


