Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5535F216E24
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417973; cv=none; b=uwP9qKNMTCtRX4118IuOz3UCRcgWmMj7bes/Y8sjj8oJwpDuEhMHKn0tX9ma8FiF33BwlefP06fbZAMWrX9r1NZBsKFykyJ3mxqyczSaQoHoUludmKfOYRufb/jXZN2bIovFGSpCJemtENGJBwhcHjRA2wc9+wLZxctI62fB6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417973; c=relaxed/simple;
	bh=FzbfBON4HFJhVd08uFjdTcJCzXau2ERxqh67WjCsu5Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=q3uvUIbZfZFIGuMub2PG0e4Q3soEWllMieh47HP7BhOkCuOVbxzQh+xl3sZrOqJPMmarD3OBPW2o9sRwNEPYKK6YPbLaJPWHz/xJSzAu0Z1ZGCXCoyqVszpv/6DgN1YlwE1xK/OGCvovwcf3Szk40C9lvffEAmDKw/MawHpthSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WgmZwvMs; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WgmZwvMs"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736417953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49YXie7e3JZze1eh2zCsfkQ7iZR8v7hBoZWMwF0iRXo=;
	b=WgmZwvMs5KYEVfpE9dVQhq0QJTozQi1FLlF76JmZGfcDG93idb3buMmulXxDFIr4f2kP9F
	RSDtfbsmVRWTjjKoftr3XMcScmmRDsiX5rUwumXY4KMClDNkeiw97LSJK7xRa0dLNybUvD
	vwMs87L/nYWqj24NknXIz/yxnrBe/7M=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] ALSA: emu10k1: Use str_on_off() and str_yes_no() helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87ldvkqoom.wl-tiwai@suse.de>
Date: Thu, 9 Jan 2025 11:19:01 +0100
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7E7808AD-CE97-4AFF-AC07-45C6272BA20E@linux.dev>
References: <20250109093110.3850-2-thorsten.blum@linux.dev>
 <87ldvkqoom.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 9. Jan 2025, at 11:14, Takashi Iwai wrote:
> On Thu, 09 Jan 2025 10:31:08 +0100, Thorsten Blum wrote:
>> 
>> Remove hard-coded strings by using the str_on_off() and str_yes_no()
>> helper functions.
>> 
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> A part of those changes have been already fixed in sound.git tree
> for-next branch.  Could you rebase and resubmit the missing piece?

Yes, of course.

Thanks,
Thorsten
