Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125942F3C3E
	for <linux-sound@vger.kernel.org>; Sun,  9 Aug 2026 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786299298; cv=none; b=WlfNS44l7snn/+6wqe9j4NuW/Kmvuq5E35pQod1L2n3b96cS7JFEY0Sc+5ekqNsQ7Z5RjdnR2ZG2hJdXXhMhvv9sJwUMCmuFOTfq5wKz4YhOfecKTY5/mIKQcR/enqogZYxNnBVX239d2T+tEuelbu64bnHXhGnUdsvIN7GxAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786299298; c=relaxed/simple;
	bh=vxRRdfrzTAe3nV6lMYa0lSyLq1ZXKy4NpjaCD9U6v+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVwfkzW+Cum2+wAWzsD5P9EkESzY9wBQ9NDoKqpT50xNNFVpnj9dkbWG2UI+g32t+L0gx2JOCsg3I9GcOxj+lrtJRWVZrEEoeqSBRWBrIFoaD89ZhuU2WjuGyPZF3t88tRHuwIRQ6HdiqiHAo1yPOCOm4KD1RSc/wfYRKSNtepQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=oMX5xfgv; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="oMX5xfgv"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 44C4D67FD8DC; Mon, 10 Aug 2026 03:35:41 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 44C4D67FD8DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1786298741; bh=R7V2IYYLLWexkgVeIiL3pIHxW5U8HW3DIXmRGsg3+tg=;
	h=Date:From:To:Cc:Subject:From;
	b=oMX5xfgvNz9FrHkn+Oxd+S3AVg/CEAxxbSHo7znGOfFeuoCqxTM3F2ZyEqDQ2adLN
	 vW/eGAXhksipcigcmUsLUQND92Mh29vzUwzxUOiZxuucsQKzujJwQ2eq1F5nQUlq4A
	 jZRuMzRVe7HNhp7jOCz80y36H5vk1T/uzUePDm+akLDqyQPYl1Ii0s47wZiwCyLerq
	 i6e6YEQkco1WDv93oueVGwjay9Wnh1/w9pJQcYQF6+CUZX3+y8YzEdaUwj9nvuLS4I
	 eAC5WztUvnKxmtLVzJojU4QoJGDwEwX5Ad1MSwLWr2CorvQMkbag9WYcHQ1nY/mgsS
	 Gmf5AgT7WUJzw==
Date: Mon, 10 Aug 2026 03:35:41 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/2] ALSA: Don't share mixer->urb with the FCP/scarlett2
 notification endpoint
Message-ID: <cover.1786290885.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Both the FCP and scarlett2 drivers used mixer->urb for their
notification endpoint URB, but that field belongs to
snd_usb_mixer_status_create() and is managed by mixer.c. Sharing it
means the "already set up" check in the driver's init_notify() can be
satisfied by the status endpoint's URB, so the driver's own URB is
never submitted and the first command would crash in
wait_for_completion_timeout() on the still-zeroed cmd_done. mixer.c
can also kill, resubmit or free the URB from under the driver.

Give each driver its own URB in its private data. For scarlett2 this
also means taking over the free/suspend/resume handling that mixer.c
was doing for it.

Tested on an ISA C8X and a Scarlett 18i20 Gen 4 (FCP), and a Scarlett
4i4 Gen 3 and 4i4 Gen 4 (scarlett2) on 7.1.7, including suspend/resume
and configuration save on suspend.

Thanks,
Geoffrey

Geoffrey D. Bennett (2):
  ALSA: FCP: Use a private URB for the notification endpoint
  ALSA: scarlett2: Use a private URB for the notification endpoint

 sound/usb/fcp.c             | 38 +++++++-------
 sound/usb/mixer.c           |  6 +++
 sound/usb/mixer.h           |  2 +
 sound/usb/mixer_scarlett2.c | 98 ++++++++++++++++++++++++-------------
 4 files changed, 92 insertions(+), 52 deletions(-)

-- 
2.55.0

