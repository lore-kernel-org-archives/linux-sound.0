Received: from mxout0bln1.prossl.de (mxout0bln1.prossl.de [91.233.87.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E518A6D4
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.233.87.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813006; cv=none; b=vB14PTgzV0jqFsE/jAQMJEAEWzQlef3qMlFbxeZ0vIFoycsytNdDWq3iXlCpITzMWq3cFmAaL63iJtCKe0blMXsOv/M1Ie/EZdZNpOEJdmlHTXa0Uf8hFv1LGhZ7TCG7G8XAhcC0bk2bkKIR7VoxJgpDQLodpfX4f0NvzE1+ODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813006; c=relaxed/simple;
	bh=o+lztccrPENBdk8NkGcm3q4+1BJwNxPxhT0Z7tlhsmg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cWIo9kt95A6WdPxsSItQd0WD9wUEph7FXgzWz/udYjPOpoYXhAa0bS8W6X6Ay7dvYTEHUyF5TD03Q4CMKfIw1ew9cR015ERg4ciZ9kfELsMxqpd/ZnsjN1VjP2pFTbhP0yvMW6KUMPjKOmRRarYq820u/dkbZeDvkW8Tly8J4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org; spf=pass smtp.mailfrom=kuechler.org; dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b=sS2T9uD7; arc=none smtp.client-ip=91.233.87.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuechler.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuechler.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prossl.de header.i=@prossl.de header.b="sS2T9uD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prossl.de; s=prho21;
	t=1779810932; bh=heHX7C/LNO851SYljN9WKtDv5Pe6RGMZQ9j6HVGYs9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sS2T9uD7rC5tfaJ6XN2+kyjsKSpGzePx0F5AKVq6UXFfNRg5cvNb3dY3tZY3HYjlw
	 nc5rXwyJJIoqxIn1pePKQSIWFZBL6MHMbNUi0kuNput0/6x6NaA5FdCzYATK9rTgOF
	 cJAMmB+ME8hFYoa2MTQnxGPPS9NpX7Bkwt+/9HfM=
Received: from mx1bln1.prossl.de (localhost.localdomain [127.0.0.1])
	(authenticated bits=0)
	by localhost.localdomain (8.18.1/8.18.1) with ESMTPA id 64QFtWkZ085257;
	Tue, 26 May 2026 17:55:32 +0200
Received: from
 8/DGk5CxK+Lqiu6Iv+usXxSA7uXF01jHYVfkl2IB0+fdnWZyzAnQNA+wKQJo1FY4
 (j2IyS5vYhfDvr6L9Oo2+SalL5DsXXTgDLbbnOAlPoEE=)
 by mx1bln1.prossl.de
 with HTTP (HTTP/2.0 POST); Tue, 26 May 2026 17:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 26 May 2026 17:55:32 +0200
From: =?UTF-8?Q?Uwe_K=C3=BCchler?= <uwe@kuechler.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
In-Reply-To: <87mrxmxmq8.wl-tiwai@suse.de>
References: <20260526133517.17485-1-uwe@kuechler.org>
 <87mrxmxmq8.wl-tiwai@suse.de>
User-Agent: prohost webmail
Message-ID: <e051f3bf3f9b23fdee72c78d49a97ddd@kuechler.org>
X-Sender: uwe@kuechler.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Null-Tag: 1382cd895b5913366cd9c16e7cf16143



On 26.05.2026 16:35, Takashi Iwai wrote:
> On Tue, 26 May 2026 15:35:17 +0200,
> Uwe Kuechler wrote:
>> 
>> Add a device-specific quirk for the Novation Mininova synthesizer
>> (USB ID 1235:001e) to enable proper recognition and functionality
>> as a MIDI device.
>> 
> 
> A very slight optimization is to use QUIRK_DATA_RAW_BYTES(0) like
> Novation Speedio or Nocturn (see the entries above yours).  Also, you
> don't have to pass vendor_name and product_name fields unless the
> firmware gives something bogus, too.
> 
OK, I tested your suggestions in a new build and everything (MIDI 
in/out, Extra Data, identification) works as expected.
Revised patch coming up in a minute.

Thanks, Uwe
