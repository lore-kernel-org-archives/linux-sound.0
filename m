Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC7D38D007
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776376821; cv=none; b=LRVZTyCtoZAHo+Z1s9tP+RJPMxMvYGzeiKSawM6yUIqb7QvOTMfqfrVcFAk/hgL9aOi09O7lw+FduQCRyaD5WWYBKD1JrqjJ6VzSRia07uWsmlsBRSnHorMW0THLxRT/nwJ8yUZnrd3kxMyjol9MREWuSkFrxL2sRTw2lzXxydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776376821; c=relaxed/simple;
	bh=h2xmR7XJXlb9X4WKO5vZom7rfk+J4QiVNdg1pOwS6NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWJT8PvuqxGdM95rUpgVuqcoTDLrFDCvvPGuNmUx2DKW4IyaSu+hWujrl3H79qMcdoUltuP3HmfQN/jxvLSgoQsyn/uTTSGLBEs3RJzfXzyS4AKwsvOhY2gj79oCpug42qJ+0xATiYcs+hx/4UfxGVhFIXPnZa61YrE0dKfV+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t/MnLWux; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t/MnLWux"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BIkexp4Rywlr6FJgr26gIxhh50PfpXiKRSEk6JFAXFQ=; b=t/MnLWuxTwIsZYu2XQ3hux0BW+
	23Zo2LnG2OFOWfTq1ue+otyrfEP2kelI8b1LcU1P/RlcHxLmMFliRY0ONMmsFzDp2oDlCGGi0np2e
	ssH5x7txRKGYUPCHNK9fGvNh2RZtS3iAcYd4B6PYxJmci6v8fX9OadfLsnK4mm3F6Km+OitRXJYsI
	MgqauZWiBM3WvgaVz1BVkubmlDKZ/hPvjMaMEFcQIFBhdfl6yXrp6nu9oPjqfMtlhHbD7LRouiKQG
	tcwicNGulAPQOEw/xXRn2MuhtHx4ycZt64oM5wKTdsmn6nH+Z7zj8DqzXoQvTzr2yUYtWbp12iHip
	qWykYFjw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUl1-000000037Ls-2LFx;
	Thu, 16 Apr 2026 22:00:19 +0000
Message-ID: <887ef415-4aba-47c5-9a8f-cf7a0f69deb8@infradead.org>
Date: Thu, 16 Apr 2026 15:00:19 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: vx: use correct function name in kernel-doc comment
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260216060010.2784438-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260216060010.2784438-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ping.

On 2/15/26 10:00 PM, Randy Dunlap wrote:
> Use the correct function name to avoid a kernel-doc warning (when
> W=1 is used):
> 
> vx_cmd.h:210: warning: expecting prototype for vx_send_pipe_cmd_params().
>  Prototype was for vx_set_pipe_cmd_params() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> 
>  sound/drivers/vx/vx_cmd.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20251210.orig/sound/drivers/vx/vx_cmd.h
> +++ linux-next-20251210/sound/drivers/vx/vx_cmd.h
> @@ -199,7 +199,7 @@ struct vx_cmd_info {
>  void vx_init_rmh(struct vx_rmh *rmh, unsigned int cmd);
>  
>  /**
> - * vx_send_pipe_cmd_params - fill first command word for pipe commands
> + * vx_set_pipe_cmd_params - fill first command word for pipe commands
>   * @rmh: the rmh to be modified
>   * @is_capture: 0 = playback, 1 = capture operation
>   * @param1: first pipe-parameter

-- 
~Randy

