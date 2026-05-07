Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67FE3ED5D5
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157155; cv=none; b=WWZVPPMXKHomVRViZEKFzfnKlchta2nyq9ToUBXjs6RIbMNgFTbvlvQkaopEnVHdowtPWdjuaroksBzOAiDXUaytrIDKCCP660aVsI9+uJLuMDZPB7Vx/o00I786Fc2nc1f3lYRgYT4gEafziHk4JpxoHZw8DNJcVRZRa0C6TTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157155; c=relaxed/simple;
	bh=5ZXMgOtAWA3co4w22qB+icd0Fj2zyN/xsK3m8Cha/dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYXCUTVe78qkazL4hedW9ulkgsmVLQODfuV8CSlICjdYX+xY71SsQJ+pCfqkcbBh4KRt4/ULVEVRNEz5QP39XVWPlcexN9z0aaFAZroeYxiDOawT+l6a3w9EcclZI/kxnYR5OP2BptogI5iDgMK0NbvfNLO8K+GDnHeTCqesqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rlquN9+F; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rlquN9+F"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gBBTj01zSz9vCl;
	Thu,  7 May 2026 14:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778157145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLHpsfdCywzVFKxZxysoYQlEePhjyG7x3fXfd5oSXWM=;
	b=rlquN9+F6zzWOGxxCWP/akrYPjReqdIoU4JWKg8xL+AW+uzqChKFnLHQ96ckNugNNFihix
	L9U3P/RjnOe5H38L5KJAusfDk1/zyEWFGKB2AjJh3KFhaf3GasRhSM7PqBclQtauqHdGX/
	uZjminwXw4OyqE72ejm/CCOLY2M66ORQCkBpu3P+KMcEj8Tk7FYKRl3Wc/7Ml5SzXMlBqN
	XLqlWkQt3TgEDNAD9OAditcR6vsqDdf3PUctEwFwvqg1VXLcihcb2HZ79qHMexk1xW08rR
	vYnpBHDEuzcdjtS5Id1Zqi3XSzIGAiVPMbU+f81JSz3c5nJk0WsF+AYRcCljgw==
From: Tobias Bachmann <tobac@mailbox.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
 Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther Lake;
 chip stuck across distros and kernels; worked initially;
 still working at hardware level
Date: Thu, 07 May 2026 14:32:21 +0200
Message-ID: <y6AZlQCPSdCp46upW40QCA@mailbox.org>
In-Reply-To: <afxZdCOyzzwocQON@opensource.cirrus.com>
References:
 <cLVwl4lrR76pLtv8VxMSaA@mailbox.org> <afxZdCOyzzwocQON@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-MBO-RS-META: 9o3r4d3tmfgmkzrhdc1empgb5ww6qna3
X-MBO-RS-ID: 4a5db61351b2e9b909c

Hi Charles,

thank you for picking this up so quickly, much appreciated.

On Thur, May 07, 2026, 11:20:52 CEST, Charles Keepax wrote:
> Could I just double check when you say the sound is working
> under Windows/Dell SupportAssist does that definitely include
> the headphones?

You were right to let me check this, headphones via the 3.5mm 
audio jack do indeed not work. They are not even detected, it 
seems. Sound just continues to play through the speakers.

> The cs42l45 (note it is l45 here) only drives the headphones
> and the cs35l57 drives the speakers. On Linux as these are all
> bundled together into a soundcard, the cs42l45 failing to probe
> will be affecting all audio, however on Windows I suspect each
> is treated separately. So the speakers may continue to function
> even if the headphones are broken.

Does this mean faulty hardware is the most likely option? This laptop
is barely a week old. Or is it possible the driver left the chip in a non-
working (but potentially recoverable) state?

Thanks!
Tobias






