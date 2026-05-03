Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80F319847
	for <linux-sound@vger.kernel.org>; Sun,  3 May 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777807758; cv=none; b=m+GK3t3aVyNLNDy7XXXatm/zU/OS0Txk7I5HRHurEhcZ5WVeCuOWmFv99wQ04LU51xLSwRsBXi0IizWqnG+bFjfyjyOcjWBqEYLkMEaAb7HmSs3XLEzgsMhZ9XOmOABvuRs4ZYyk5HcFlGNjF+v9PrRA9LdCih12BxrqlDo5F2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777807758; c=relaxed/simple;
	bh=YcsAkNKz74SwpeVsc645ti01QURPymkt0xt62/xPjg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRPJ3xmO1RuMKU8cBR/jXq/voNwZA8TyOPLMTqLIRhaC/0p3dCtX2mjb2Q3rdbo+g7PCVM8Yvm+4+qmQLQE/95+I55sto82nn5T7c7RpmhxnUeBaGUk+XF+bq0QYi8P3NzlV6wprKJj1Abm6NFhY+NUFHJwS78cLtVL2+4ckgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MGwo5+dR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I+2WL9EE; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MGwo5+dR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I+2WL9EE"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 418EB1D000F9;
	Sun,  3 May 2026 07:29:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 03 May 2026 07:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1777807755; x=1777894155; bh=ZEgUEI7GaXXui4h/2LPAuOmyB1HgXzLf
	/MbLMYURgK8=; b=MGwo5+dRIipJzX+w4KhYbis2XkKcFg4o7gvnd2ic5Q1Wd4wD
	qFgHo802306GrJNdyrhhPSGz6OnqsFv2tNjER47cxFHuENzh85rVdb+E/sB0FyW5
	40Py/Y2irgyVyZwXm15xQJHMAX33OXWx8wlkeddIN/HBuNdeHsRr+8rdxUabIb4b
	97RrPVGxUiSXOyVgxgIWweF75uTZ6Q8mwcBgi96itqzYMDJqV/1dCV7Ibpr9roxA
	y8qRVjUvg5CWhzu2e9i10JQE92/HPCO1ixtZ2+TF6fqRkguCwQ5fCgP+vchr/bn5
	aE8htDQgn/8U5H9hhpyHlgJFBXzmNxb3lLRKhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777807755; x=
	1777894155; bh=ZEgUEI7GaXXui4h/2LPAuOmyB1HgXzLf/MbLMYURgK8=; b=I
	+2WL9EEzcHs0+Jc4XTeq7NsR09edtfB+m2pZKivBXXXRbulXoqkMOaQJDWa6CLcK
	OSyaGn7nkImQAIlEQXcGvJMhIglbiO4/tY4gL53aJSzCY/FaR1f8E0LII7FENp6q
	s9lSpuelyYKgVXRXKKafRVy6UrCdYWHZN8/zPMQEILlQ3DgDIQYDC9FTJnYG+4qU
	1CyPdjS/EVZBdtSB2eSe0hPT4b1T9Vn8+StqIKfvy6oqm5kP6uwM1ARLihf67qUx
	1yNzqvhXXDiETKdwivUCzTgs5SgyOEqIyNPnlXH3xugJPj0NniH9VBJXkr/JwZNv
	hGye6uiWKhkuL3WnNHZMg==
X-ME-Sender: <xms:ijH3aa38scZrz4lnmId63AZCTmzmCinJ-zMSKASIG94KtlAFALjDkA>
    <xme:ijH3aTGj21AmdPHsEZ8bgv1tBb5nSigTKl2G4f7JeKNiRIxhTj0VbFZqalbQ3mHT2
    1XGkCb1s4IQTckyNukIsR4DnWRaYq2gP4lP3j7ikf8TdQs3JephM-k>
X-ME-Received: <xmr:ijH3aQh4l-Ua2k4FZhyHpe8CjXllZHeaAMDhOXpiaQg5QWezsi1XF3xeGCV4UQz2WekLXWUzK_nn4B59EhhMeTYcMADY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelheekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertd
    dttddunecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedutdfhjefhfe
    ekteekhfdufefgteeutefgvdffjedtheethfduudefgefhgfdttdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghsshhiohhgrggsrhhivghltghonhhtrghtohesghhmrghilh
    drtghomhdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:ijH3aW-Uj5bYrZiBX1cTtF9wrmwCgcwN0HTsD8d11DQ_fcnSOcapfA>
    <xmx:ijH3afpqmBw89ddCZjijtEgZIW0TN98iZgQDCmJSroVsO0aTCRJo6w>
    <xmx:ijH3ad8TEiX328aEpDceZgUqwef81WklcgJdNvnMfPh9gMyy0L3eEg>
    <xmx:ijH3abWCtZVC4ys-BPwjn47HnomKykjTRut2FqVTB4DGh07e1tZkLg>
    <xmx:izH3aXk6rGfMPS60KvlDNL-vcckEo8Cc0_Nt5PkGFpZfSUl96jQCPoxG>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 07:29:13 -0400 (EDT)
Date: Sun, 3 May 2026 20:29:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-tascam: Do not drop unread control events
Message-ID: <20260503112911.GA351328@sakamocchi.jp>
References: <20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com>

Hi,

On Fri, May 01, 2026 at 03:22:58PM -0300, Cássio Gabriel wrote:
> tscm_hwdep_read_queue() copies as many queued control events as fit in
> the userspace buffer. When the buffer is smaller than the current
> contiguous queue segment, length is rounded down to the number of bytes
> that can be copied.
> 
> However, after copying that shortened length, the code advances pull_pos
> to tail_pos, marking the whole contiguous segment as consumed. Any events
> between the copied portion and tail_pos are lost.
> 
> Advance pull_pos by the number of entries actually copied instead. When
> the whole segment fits, this is equivalent to the old tail_pos update;
> when the buffer is smaller, the remaining events stay queued for the next
> read.
> 
> Fixes: a8c0d13267a4 ("ALSA: firewire-tascam: notify events of change of state for userspace applications")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/firewire/tascam/tascam-hwdep.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thank you for catching the issue.

I agree that this is indeed a bug. While your approach makes sense, I
wonder if it could be simplified by updating tail_pos instead.

Would you mind trying the following change?

======== 8< --------
diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 867b4ea1096e..6270263e7bf4 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -73,6 +73,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
                        length = rounddown(remained, sizeof(*entries));
                if (length == 0)
                        break;
+               tail_pos = head_pos + length / sizeof(*entries);

                spin_unlock_irq(&tscm->lock);
                if (copy_to_user(pos, &entries[head_pos], length))
======== 8< --------


Thanks

Takashi Sakamoto
