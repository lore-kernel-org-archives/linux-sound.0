Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEA3B1B3
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141378; cv=none; b=AozXvMuTGvBNHtzTOpBvmE8gLGBQu+wwwkyZn/1+H/VaAaN/Av7o/YyZKQ5Qev2fjbfF0Hngb54g96ifXbHZigRgZcgg1UncqBwxHbMPuldsCp83fUEUZdRtxtxCPtDzrVNQlj46U9LWzJE0lUnDesf0/PHBsjYhXJKS/Fl7n7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141378; c=relaxed/simple;
	bh=VZoV5SXJsmugTO0y0IK4PUzsNpNkji8fdpOkCWKCiPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmsFHegbeAy2WaSkO/I1AGfHusJp5Q+jHie54mHHfTPxCF7ewwUbBsKxsrzc40RLkORsYDgN3usxdiGjYhl+5DZ5w3VQVrpHetsN2YJND6JTHvQWraL1LtuzNepdm9F+ryYYWEdEqUCOVPPGmamQp7YNjehiGj85i78e7u2+VYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JUE72RUD; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JUE72RUD"
Message-ID: <8fc99b6a-d174-4539-ad3d-5e4adfa7cdbd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785141373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hARYizpRHIi0hlAG18qFwHO3XgV7Ksdad0VuOSBvaA=;
	b=JUE72RUDg7iUj8sv/K0qw/L/Gz6WM7kXy884nShgzzWP5X5YDxSlpta7y2qGRWGio1Pkaa
	eV0EzaoJTgfnVcPOTmUEdUpfurxKBS51wK+cX3shWoPXq11LxRT7WZmmvYRVTt8b52iMg2
	6S5d8l60H8ryofQYYuTZVrlDoEwhcBM=
Date: Mon, 27 Jul 2026 10:32:42 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: HP OmniBook Ultra (Panther Lake) Speakers not functioning:
 TAS2783 Firmware download failed
To: Lu & Thijs <cat-basement@schoevaars.eu>, shenghao-ding@ti.com,
 kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com
Cc: linux-sound@vger.kernel.org
References: <7092d274-2e22-4838-9070-e0b2e6477cf3@schoevaars.eu>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <7092d274-2e22-4838-9070-e0b2e6477cf3@schoevaars.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/26/26 18:04, Lu & Thijs wrote:
> [1.] HP OmniBook Ultra (Panther Lake) Speakers not functioning: TAS2783
> Firmware download failed
> [2.] The speakers on the HP Omnibook Ultra (Panther Lake version do not work at all, this is due the kernel trying to load the firmware but the device sending a NACK after the first block.
>      When starting, the slave initialization fails with code -61 and the update slave status fails with code -5.
> [3.] Keywords: Sound
> [4.] Kernel information
> [4.1.] Kernel version (from /proc/version): Linux version 7.1.4-204.fc44.x86_64 (mockbuild@7bf2e6b0278e48518d21d9f513bd2a35) (gcc (GCC) 16.1.1 20260515 (Red Hat 16.1.1-2), GNU ld version 2.46.1-1.fc44) #1 SMP PREEMPT_DYNAMIC Wed Jul 22 16:25:06 UTC 2026

you probably want to try with a bleeding edge kernel, these sort of
configurations are pretty new.

> [4.2.] Kernel .config file: attached
> [5.] Most recent kernel version which did not have the bug: None so far tested
> [9.] Bugzilla report of the issue: https://bugzilla.kernel.org/show_bug.cgi?id=221782
> 

