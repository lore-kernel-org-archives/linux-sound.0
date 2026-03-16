Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FBB33688C;
	Mon, 16 Mar 2026 04:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773633989; cv=none; b=VH+eF6mF+G7RlAckh0fuQS2hd1ZIMBK7QIz13JhaR6TlIZ84hx7R2sDE9Uqz/u+xeO2HITz1jgzwhGsP9nep/yLFnKfoPYyTO5TEKEOGoeHNrW8U7c4r2wW9dTQroXZuDKLokkTAukIScldK75GJjCE9ltw8zvXTDoEMpn7HKxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773633989; c=relaxed/simple;
	bh=qnOG/GVvRW6PcbZjJFGlSSDP/ti4p/zkCDstNstK57c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBoaEZoe0jd20KonRwL5NEPcDBLtubGFUJGr3OJFS9ca3b8wsCajMez/ulkhjTQWGXEORucmaGOcxVQ6ucYAi7K0KPg4byunZnAhl1NTkdsqc3qoRA4Jc/VMXlX8jWyg5m65SLkm13+nGRuZDG+OqStbfVjCzoKfgQMvp3me6h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=GKpnHmXs; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="GKpnHmXs"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68F67285FFD;
	Mon, 16 Mar 2026 05:06:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1773633986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1Wf4sGyn2m7qyNirOgotHh/Tl7R6XdbECBXcjzpSfuo=;
	b=GKpnHmXsvC6v1EIDZD69Aily4AQ0biGfJ9vB06O9lg4rRH8ZfSqvNhJxFjf+eBKpfzYvYI
	gdLQEmw1je9qw1flH9VFfO43ZSjQSkAxSR6mI3Sh8mso0iPMLXhifKO6Vm+TnQejlE/e9i
	bFYPqjjj4ghNwev+TyZ90FYjjVSiSSSa3qLHverfitfH/XM8IFnE50XRYz7FeS9TiN+LgS
	JpMIkNtJHZ9PqHX4eA/mibEghty52XBfgiHLyzWYJJWsJPcdCwk9pP8NVXMsIE3QZY1K01
	wd9ce7QUJbwSTPxatKww9/nELz5gZN+DCSkpKanpSCIagvMlvr0Adq8fsrj+Uw==
Message-ID: <e4e86f49-1d70-4cc6-aaa8-76eaa1d5bee5@cachyos.org>
Date: Mon, 16 Mar 2026 04:06:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXTERNAL] Re: [PATCH] ALSA: hda/realtek: Use
 ALC287_FIXUP_TXNW2781_I2C for ASUS Strix Gxx5
To: "Xu, Baojun" <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrzej Hankus <andrzejh07@gmail.com>
References: <20260315160939.191265-1-dnaim@cachyos.org>
 <640ef064-3f41-4642-bf13-8800d8f7adbb@cachyos.org>
 <4ad2197cf43a45ac9fbab4a9da5a5671@ti.com>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <4ad2197cf43a45ac9fbab4a9da5a5671@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/16/26 8:47 AM, Xu, Baojun wrote:
> Hi Eric,
> 
> Have you applied the patch below?
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=1d1b8b0734af5149946e687415bf6be05ae55bd6
> 
> Best Regards
> Jim

Hi Jim,

This patch has been in the kernel since 6.19-rc1 so yes it is applied.

Also cc-ing Andrzej as the reporter.

--
Regards,
  Eric
