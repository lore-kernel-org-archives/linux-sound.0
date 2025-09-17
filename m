Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2D27E049
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140556; cv=none; b=uJcyJCxHKHacUZ5vNemi7xBTkqHcobBbnHpOr8mRkWm/au2P5BUvDq6k+IwsmLxGgaGc0YiP9dPSfBN+AAB8Oc/HmSAjnCPy/Mag9wCqNWfHZJkm1okK6BRrhN1vXrHk2xvkNT3UooNeMJjjblYXWtav6SPk4n8TbnE60QnJArM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140556; c=relaxed/simple;
	bh=2nt2lGQpLbJLQi/uGzvhicTXwcBRyJ3aoXEsqO8L5z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhsvpsPiYK3NyVhJdQdGMz5MfpH/GEXvb2xjxPIalJxFdfgbosr30MUnfD3AMn+qBMGpwcZ0/vaTj9T8ss8GdL6PjKu1fV/VNez1G6xKFqjP5bc07KfZfhDoGZWZzTCGYRnHD4jIHq21xx4omoP1sj8JjLdgRgQQwZQeoEV+bMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=liiy4l4N; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="liiy4l4N"
Message-ID: <a7a5340b-6fc2-4df0-b4d8-ba76b901f464@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GYgrnM+cYQNRy1r3d9s6V+4Gb7XcDgD9XneIP752s3A=;
	b=liiy4l4NUzaTxly6gz63xQF1XIy6pWQXVvnRgelYZ/jHnYFzbq9CKFA2F6HKPJ1tmNyrnd
	mRTcHMMUJ7IKHn0BrhcJI/AOcJp39B0hNE7SRYD3zN5PHAHrgvItzDlE8kCbiGgSm1HNJK
	AiLSq8yRS6EVnE/bTmENRLVoPKzvCzQ=
Date: Wed, 17 Sep 2025 22:20:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/20] Add SDCA UMP/FDL support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/12/25 12:34, Charles Keepax wrote:
> Next installment of the SDCA changes, hopefully the next series after
> this should be the full class driver. It is worth noting this series has
> a build dependency on a patch working its way through the PM/ACPI tree:
> 
> commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
> 
> But we can probably worry about that later, as normally there is a
> reasonable amount of review on these SDCA series'.
> 
> This series broadly breaks down into 3 chunks, first there are several
> changes to remove the assumption that the struct device used for SDCA
> purposes represents the SoundWire slave. This is because the SDCA class
> driver will be made of an auxiliary driver for each SDCA Function, thus
> the SoundWire slave will be on the parent device for each individual
> driver. Then there are patches to add support for UMP/FDL. And then
> finally since the rest of the HID support is there and UMP was the last
> missing part required a small patch to add a function to allow reporting
> of HID events from SDCA devices.

This is starting to look quite good... 
There are still a number of opens on the UMP flows, but I won't be able to follow-up until late Fall so no objections from me if this is merged and later improved.
Thanks Charles and Maciej for this contribution!
