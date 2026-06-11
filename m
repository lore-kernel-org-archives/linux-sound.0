Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C53BADA3
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176580; cv=none; b=TkBrPEieQTp5oEAw0wlMe30hTRWFftaEkJHqz8wQp5pYa2/C96DA/FH9YixquGlzvTVURlSOaerUQwCorym7kHYXSSoAkZ9EXVENbk9D/DgR6FZo45lD+57ECKEITTr/X8E+M+DLkC+kGxAwANftcODDmqQOr3YlEw3uXC8iu0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176580; c=relaxed/simple;
	bh=YlbM8A/UhTCp1E8f+BtUXADU6/zze6MLlFnaiTU0inI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Vn6ET6k1/2AnDGMtyUAY2iJHv2+MxcGpxDEeFx6bEoKSd2hgiLxDuZtWmLWLDEP1/FaTM5ueT/lw9PkKfDhwZmROkvrD3jl6S92NOJTEz+aIdGkJ9nL/kTIWSP46IQM/t1qepY+EgEw+cup1V8BPbXt2trEvy9l7U1SZteoCoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A98F900006A30; Thu, 11 Jun 2026 19:16:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3A95675138FD48AB90898CD2D9990B6D
X-SMAIL-UIID: 3A95675138FD48AB90898CD2D9990B6D-20260611-191610
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-sound@vger.kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Thu, 11 Jun 2026 19:16:08 +0800
Message-Id: <20260611111608.5691-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c6d33f8d-fcd3-4b23-81d0-6583d943b9d9@kernel.org>
References: <c6d33f8d-fcd3-4b23-81d0-6583d943b9d9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> This was v1:
> https://lore.kernel.org/all/20260608083540.12581-1-zhangyi@everest-semi.com/
> 
> Then you send v2 calling it v1:
> https://lore.kernel.org/all/20260609025605.16945-1-zhangyi@everest-semi.com/
> 
> Then you sent it again:
> https://lore.kernel.org/all/20260609030623.17404-1-zhangyi@everest-semi.com/
> 
> And now you send v4 (??!?) calling it v1:
> https://lore.kernel.org/all/20260611031824.4628-1-zhangyi@everest-semi.com/
> 
> All within three days. And in the same time you never responded to
> actual feedback.
> 
> This is not acceptable. Please stop spamming the list with the same
> version and respond to the feedback. I expect addressing EVERY email you
> received with reviews.

First of all, I apologize for sending several identical patches.

Actually, I haven't ignored your feedback;
I've responded to all the feedback you've provided so far, but I haven't received any further comments.

As for the several patches with identical content,
this is because the AI responded to the patches from the previous versions,
and my email indicated that my patches had been bounced. So I assumed you hadn't received them.

Also, I haven't heard back from you since I replied to your feedback, so I'm not sure if you saw my reply.
So I submitted another version of the patch and included an explanation in the comments addressing the feedback you provided earlier.
If there's any other feedback I may have overlooked, please let me know. Thank you.

By the way, if you can see this email, please reply so I can confirm that you can view what I sent.
