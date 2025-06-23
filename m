Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181E235BEE
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676763; cv=none; b=c6Jl4mlIgQHKIxARukhM3NFiQ4Q9ilR/EFBTXmiWtpBI4GWcnlcrig9JZSyAY2x1IJY6+PG1Ou8f7I+Kc8o2wOZ4jkqMZ1+j9LDffzDMk0gSHoXnPvm9XnVAIta9RmwTWlVhMLD8Z72EdWjaNhiA71srdeDfVlh9P0CspW+dL+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676763; c=relaxed/simple;
	bh=QpabO/EleQ8Se4XRwNlPydm4qn699xT+iq8UXANpUYY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ShDUzTiogG6wp4peHCubpjX7xVcZIMEQUyt+EwO0Eo7aZKZIg+gBnTAC5hyZcMajCUH2mDucr2wcvXoLmtBbIu4C2y0p/9ZwUHcbUxumgvgA/ldPr0hQY6iIMh4VLDWIVOUDxZ+MPfm0Vv3Xfha8EmrdAyDhcMWx7agyJW6bAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bLfHSV8m; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bLfHSV8m"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750676757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCxU+gyvgQV7d+nuQJ8VRLFjY5neLkUSkgTqQgPXR44=;
	b=bLfHSV8mqn6KwL2eZSirwJAKi3pthBXYjSJRMqxT4cbrGApn5Oc5axeUy4t9QD6tKXAUVp
	hg3f5P5GyW5UHfKNNQyOvqSn5F7NrPx7qZ58mjELsh6G2p+mMljBs/xLueZXK+rl3QePzy
	UFlUhsWYVyCCdzQTxcq8dPUlL6Gxd5Y=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] ALSA: mixer_oss: Replace deprecated strcpy() with
 strscpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87pleyx2bq.wl-tiwai@suse.de>
Date: Mon, 23 Jun 2025 13:05:45 +0200
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F1828F83-882D-4778-A83C-B30CDB28407A@linux.dev>
References: <20250618223631.1244-2-thorsten.blum@linux.dev>
 <20250618224926.GS1880847@ZenIV>
 <DA7484EA-83F7-496A-AB9F-2370BBBC0883@linux.dev>
 <87pleyx2bq.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 20. Jun 2025, at 10:08, Takashi Iwai wrote:
> Al is right, we should optimize it instead.  As it's been already a
> string copied to a kernel, and the string is certainly NUL-terminated,
> hence there is no need to worry about using the pointer.

Thanks - I'll submit a v2.

