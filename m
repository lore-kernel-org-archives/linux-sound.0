Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4D230AD10
	for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771703602; cv=none; b=Sr3C6Y1Czc9dtdw1EF6HB62qDc02VLeC7dQ/OOvUNmPNSezC9ogv7/Vzj8eytDKjm7QNq2MZkPecrpMUt1c6n59q52Jyrytz4G2kBFzZ8RLez6sb5D7e57TU1Br/5YsMYx/tbkohVRxETIO1rojFSuB2/pdKBm/urtsnrx5rH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771703602; c=relaxed/simple;
	bh=2cH/jP8PR65zntl1Pn74rr5Xd5vT9vGJDk5z+nQ0ypM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ItyhQHq9lFjFn3WD/9taJvWQxbThekIAmot+xFZbZyr+SZwqNe7OlDYe4X7waTmp62oIcEE2W+Uz9XOCIjsF4q2BXXUTDhDY1hcIRgdVt9g9RyRpsSgCv24VrDOgxwMx0924L6f0f8emGVB87c+rRIQHLE+zw0GtVCip7pUpLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=XHthcOUV; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="XHthcOUV"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DEF87240104
	for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 20:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1771703599; bh=2cH/jP8PR65zntl1Pn74rr5Xd5vT9vGJDk5z+nQ0ypM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=XHthcOUV/z1qsuIflLLnrCMiPBJz8PYj+yF/o23JG5oAsA+nzW5bSUpCtifdCHhbr
	 1beQtGD4CE6aJ23CYT+iiVvi2LdVmwLr8LHq/KE4cikMwL8zSU31KeGANzDiuhSzH0
	 hMe9wkJk1m7XtC3MYEj2rgDiWcD5SLlwznjgr07d7/rXFFqXpgJ177vssgXVvARna4
	 oytePjpkRfem9cHLKmxhMi/42EUfZfmdfLdK9+7gEwdn71++1ol2WC+BHeTYNIDtfq
	 s7n+Cd9Hsmga5fyB52/PVgrZEJZ6qvxwyNUPTG5VuCAXRiMkFvSIZtNUrvF7lhhtCT
	 urgPOCZiAGxEQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fJHq30dQsz9rxD;
	Sat, 21 Feb 2026 20:53:19 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
In-Reply-To: <20260221-fix-detect-mic-v1-1-b6e427b5275d@posteo.net>
References: <20260221-fix-detect-mic-v1-1-b6e427b5275d@posteo.net>
Date: Sat, 21 Feb 2026 19:53:19 +0000
Message-ID: <87wm057u1d.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Panagiotis Foliadis <pfoliadis@posteo.net> writes:

> The Acer Aspire V3-572G has a combo jack (ALC283) but the BIOS
> sets pin 0x19 to 0x411111f0 (not connected), so the headset mic
> is not detected.
>
> Add a quirk to override pin 0x19 as a headset mic and enable
> headset mode.
>
> Cc: stable@vger.kernel.org
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221075
> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
> ---

Thanks for taking care of this Panagiotis.

Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>

Cheers,
C. Mitrodimas
