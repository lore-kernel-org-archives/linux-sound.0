Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D086322B6F
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772111850; cv=none; b=TGzBPrGsx9YSs7OSFkj2qda1o1AsSmcfgwkcE05qDB59D0uoKp20lZ/1Y5DH7ROo82CSYWVNwMsnvm8P+2bOKZL3hMQIK3Ef0qZZHgqC9dki4jqyHDTsnKSsKwDltwszId0yFy03pXS6C1XYcNwaD1LCx1OpipUogTf31BHJhUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772111850; c=relaxed/simple;
	bh=QCcLhuHzex+I7n2AbRtWy8UYUaDhI+84yC3zmqYnWMo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qdfo2UTdJ4TGCBnKpvVxTujjuJjkn9EHESFjiwM5rSzRFKPBTA10VypGjyl/7Lmfd8Ott22fQ6A2AQ+p/EMv+/DRXWRTzNhothOh2fqHIi7p7z4otykaV0kpaO/4UU6MF7u2kV2qPQPfSnD2WAdss8iC8uPhxA7kqRfvLvrVydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iJpaC/Iz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tu5Fr1Vv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=12BXgZn9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e1zDS/mN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iJpaC/Iz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tu5Fr1Vv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="12BXgZn9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e1zDS/mN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D27B51FA9C;
	Thu, 26 Feb 2026 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772111847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQLKZwtgh3jMBhT4OW/AVLU0IvrKueo6VAmbdq4pXLk=;
	b=iJpaC/IzZifHvLL7quaC7ucQnGTp184wsNCLMprboLmR4wK7BhavcA6dpigqWrd5ntk0Ik
	QTQgXUmxCEKKun1SJnrGWQvA1lUWARtyJNQ/ZPOh4dymOi7DuwIjZj1FCO2dtZW9LXpP9u
	u9vqa7Nm0R8Oi5Vw6taNwylIp9fq65A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772111847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQLKZwtgh3jMBhT4OW/AVLU0IvrKueo6VAmbdq4pXLk=;
	b=tu5Fr1VvcNojgT+oRKb/HephsjUjX8u/dJDhCCui+GTYGxb3PbVs12js6XRGFSJBUsEiLp
	zLmvrHWRgo1vSnBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772111845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQLKZwtgh3jMBhT4OW/AVLU0IvrKueo6VAmbdq4pXLk=;
	b=12BXgZn9Npv6VFa5X9AsnR5SIoh9ccKvwKLtxl2flNWq3nM0B9JnqWv//f/pom+FyNXIGk
	Br2FcC8lrtiGZmuWeM7w1T/QVEUKuufJdELUrm1dRJ6rjxjvJlBK5zUmTPiWPvk86WBvLB
	n5NLqIXHOUiTt8K/VdVKUHY498BfhUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772111845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQLKZwtgh3jMBhT4OW/AVLU0IvrKueo6VAmbdq4pXLk=;
	b=e1zDS/mNkjla3agl/IOFBX1KW7oTJmetmducBe/9FQ4VWzBLxX7eVbYifkG1B2aCxYxSmG
	VCVA6L8tQ6DDQMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9C553EA62;
	Thu, 26 Feb 2026 13:17:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O+gTKOVHoGmxTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 13:17:25 +0000
Date: Thu, 26 Feb 2026 14:17:25 +0100
Message-ID: <87jyvzbq56.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Remove unnecessary struct cs_dsp_client_ops
In-Reply-To: <20260226124115.1811187-1-rf@opensource.cirrus.com>
References: <20260226124115.1811187-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,cirrus.com:email,suse.de:mid]
X-Spam-Flag: NO

On Thu, 26 Feb 2026 13:41:15 +0100,
Richard Fitzgerald wrote:
> 
> Since commit af37511305c0 ("firmware: cs_dsp: Don't require client to
> provide a struct cs_dsp_client_ops") the client doesn't have to provide
> a struct cs_dsp_client_ops. So remove the dummy cs_dsp_client_ops.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
