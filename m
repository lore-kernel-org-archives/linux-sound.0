Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693260;
	b=VEikRkIZWtmNJ4zGXhhcMi9N6cAxAAn0xkk65Az21MhzKxpEnZu5M+bOXS6OBPdJyXel
	 N5vqAEXQ3ZXRm4W4PCvE/uyOi6PBMyfLBA6bOl/MpyKyI/Vkv1gJKhTbiu9LieXxxQjkT
	 KBqIq5oxFYR8lWGDW/HetwGZ7bCT73qiSYncjbPgRxD+PsjuyMFJPt7Cf8ulu4u+S6ZOn
	 H4kDSi2pbUONGvtksipYaR0DVjw7mIaVHaq+RIiiz2xcPTllixlPJdVfHLhcKCe3meTEQ
	 6FuMwi99PK9YCIJCrE5UOMN8Ub0yt0arG323s+9qGhcWB83MOuMopmvyR6ydbi/jqvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693260;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=Ly8yrFBVa2P9olk+BKa0vu+hyswyvclZd/LftFXVWeI=;
	b=siLS3YRXZEUmfhJRAa0mlS0XiNxO/tPWAU5cxWv1ZostnH91naxSUhsxd5Ic7Omb9rp2
	 4SkQjWOiMWPZtTJd8YLKFQbu5pdozILc1WHitlgJ0Kv1WOawXgh/prNFU25M34JOsalLf
	 //Ncb6MQiCZpckHgsDm9B8FH+YN0gFEXMr33640beXVCVVnEQid/h7zptWsbpISR0Fs/k
	 3xgTZUlHpXfabuz8yURmZjW17PmbLftTvPqe3n5iY+oMyvarO7gHp3q6V9iAjhkjZ45GY
	 SCTqmA+O92Terp/Zl3LHfUFPBw0pMCEgeR3R9jEVO2aff5s/nJb1LPKWZskbafOg39w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DK8jR8d4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/R5vCsX0";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DK8jR8d4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/R5vCsX0";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527C8606A31E;
	Thu, 26 Nov 2026 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DK8jR8d4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/R5vCsX0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DK8jR8d4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/R5vCsX0
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6489F22553;
	Thu, 26 Nov 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795693257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly8yrFBVa2P9olk+BKa0vu+hyswyvclZd/LftFXVWeI=;
	b=DK8jR8d4gsb7RFhImjSZHJINArUsqizBIYuSyq5qJ8p38kt/FtBm+0FFrUxBeElePZyysB
	1FYAlODt+1xuZsnVFfntRb12uo5E/hU8HkQf9U0/Xgn45x++/3HFmaSp9iRSjL36c0X3KV
	B3jlZeR7IEluu68W/2t1dWnzgx9sWGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795693257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly8yrFBVa2P9olk+BKa0vu+hyswyvclZd/LftFXVWeI=;
	b=/R5vCsX090rDt4UTs620bgrla6z1uw0FbQ/y4HkZvpSAKdXtY1jINJTnGlzfikdYmMbhiA
	t3WiJPgXuHveLqDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795693257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly8yrFBVa2P9olk+BKa0vu+hyswyvclZd/LftFXVWeI=;
	b=DK8jR8d4gsb7RFhImjSZHJINArUsqizBIYuSyq5qJ8p38kt/FtBm+0FFrUxBeElePZyysB
	1FYAlODt+1xuZsnVFfntRb12uo5E/hU8HkQf9U0/Xgn45x++/3HFmaSp9iRSjL36c0X3KV
	B3jlZeR7IEluu68W/2t1dWnzgx9sWGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795693257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly8yrFBVa2P9olk+BKa0vu+hyswyvclZd/LftFXVWeI=;
	b=/R5vCsX090rDt4UTs620bgrla6z1uw0FbQ/y4HkZvpSAKdXtY1jINJTnGlzfikdYmMbhiA
	t3WiJPgXuHveLqDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D770134C3;
	Thu, 26 Nov 2026 11:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QHyROcgaCGujcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Nov 2026 11:40:57 +0000
Date: Thu, 26 Nov 2026 12:40:56 +0100
Message-ID: <87cxrr6cs7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: "Takashi Iwai" <tiwai@suse.com>,
	"Jaroslav Kysela" <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ctxfi: Fix UAF when freeing a running system timer
In-Reply-To: <2e224b35.12c4.1a21795e092.Coremail.xuhx@hust.edu.cn>
References: <2e224b35.12c4.1a21795e092.Coremail.xuhx@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,hust.edu.cn:email]
X-Spam-Score: -12.30

On Thu, 26 Nov 2026 12:20:28 +0100,
ÐìêÏÏè wrote:
> 
> Currently, ct_systimer_free is aliased to ct_systimer_prepare, which
> calls timer_delete_sync_try(). While ct_systimer_prepare() must remain
> non-sleeping because it can run under the PCM stream lock, using
> timer_delete_sync_try() in the free path is unsafe: if the timer
> callback is concurrently running on another CPU, timer_delete_sync_try()
> returns -1 without waiting for completion. The caller then proceeds to
> free the ct_timer_instance object, resulting in a use-after-free in the
> still-running timer callback.
> 
> Replace the ct_systimer_free macro with a dedicated function that calls
> timer_shutdown_sync(), which waits for any running callback to finish
> and prevents the timer from being rearmed before the instance is freed.
> 
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hanxiang Xu <xuhx@hust.edu.cn>

Now better, but not quite yet.  You've put two blank lines in the
above, and it can be a single blank line.
Also, it'd be helpful if you use the same From: tag as Signed-off-by:
tag.

But, the biggest problem is ...

> ---
> sound/pci/ctxfi/cttimer.c |  8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -111,11 +111,17 @@
> 
> static void ct_systimer_prepare(struct ct_timer_instance *ti)
> {
> + /* non-sleeping: also runs under the PCM stream lock */
> ct_systimer_stop(ti);
> timer_delete_sync_try(&ti->timer);
> }
> 
> -#define ct_systimer_free ct_systimer_prepare
> +static void ct_systimer_free(struct ct_timer_instance *ti)
> +{
> + /* may sleep: wait for a callback running on another CPU */
> + ct_systimer_stop(ti);
> + timer_shutdown_sync(&ti->timer);
> +}
> 
> static const struct ct_timer_ops ct_systimer_ops = {
> .init = ct_systimer_init,

... your mailer broke the spaces and tabs completely, hence the patch
can't be applied cleanly at all.  Please try to fix your mailer setup
and resubmit.  Or, at best, use git send-email for submission.

It's better if you can test submission and verify in your side at
first; i.e. try to submit to yourself, and test whether your can apply
it via "git am".

Last but not least, at the next submission, use either "v2" or
"RESEND" prefix to indicate it's a resending to the subject, e.g.
  Subject: [PATCH RESEND] ALSA ctxfi: ....


thanks,

Takashi
