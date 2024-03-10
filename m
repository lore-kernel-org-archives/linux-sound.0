Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45119BDC
	for <linux-sound@vger.kernel.org>; Sun, 10 Mar 2024 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710067266; cv=none; b=Zft5lOY9/WfZYOjcJP4fEzDLBd+f/RKYgfYMFn3bXvygY8ZDwWLnQsJdIBEg2/zlj8YbFg915Z+fG96zvZBU35Ed2E4doRlv8+doCzWFvZCORHDXPLnOD5+pik1ywxDvrJMfRGD1drp9T2L3L6CVNbmantBbCEkQVeLoVBWfY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710067266; c=relaxed/simple;
	bh=ImZjJQl7sHbQf8rIW0iFDfEk9luRNUmmCRXpu0lkb3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sn9z+qdUxVVuwFCXwd3mMCh6+k00lo6yNEoUdcn4WvUrRCoxqDsU3VENJM6UTqsm63rPo5zShGaNPyIcsbCDEkSw1zb/lcbY+LeQVzITP1qkvN6ckVunHnnKIl4TGPgvC3zzelNW4kAssf5oXgd35xXy2949viKjZtuXu054+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=chyMk1NB; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="chyMk1NB"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 6CBEA602835A; Sun, 10 Mar 2024 21:04:09 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 6CBEA602835A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710066849; bh=9ncvisTfLHPeveiWGJ6h3+HFvnu/oiF35TgjGlCU50k=;
	h=Date:From:To:Cc:Subject:From;
	b=chyMk1NBic0lONt1yJcOFEoUwFE+AhXg8MSq/X9wmL7PTepFKjKUZ0WnDy5kdp2tt
	 2DSzOGfuFE7cUENZeQiX9At9JTDLX206yPACfcSVxOH/2arRH1AKoYKf/Xabs0NRWD
	 tOamGoIcd1K3jCt6kolklkGym4icUxkzv3JSbVF2+tC3mpOuPAC1MNIC8ZbO7+jfC+
	 4fCZ+4Capzy9AL0EwDqBV5o7x4WX03l7xL9RzAz/dIeAw/+wP2OmiOil3TIejrWefd
	 hAfkVc2PzEIwC9i8HyVeA1nAtY9Z5N3s7exhgkmujwRv8P5eAj6IRats2hVkqGFPpU
	 KaOLg+6jWA0jA==
Date: Sun, 10 Mar 2024 21:04:09 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: scarlett2: Scarlett 4th Gen fixes for 6.8
Message-ID: <cover.1710047969.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

I have three minor fixes for the Scarlett 4th Gen driver in 6.8:
- The low-voltage indication is now being read from the correct offset
- The autogain status values are now all correctly interpreted
- The input gain range is now correct

Regards,
Geoffrey.

Geoffrey D. Bennett (3):
  ALSA: scarlett2: Fix Scarlett 4th Gen 4i4 low-voltage detection
  ALSA: scarlett2: Fix Scarlett 4th Gen autogain status values
  ALSA: scarlett2: Fix Scarlett 4th Gen input gain range

 sound/usb/mixer_scarlett2.c | 85 ++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 39 deletions(-)

-- 
2.43.0

