Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E32EDD6C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781237148; cv=pass; b=Gz4PYLyuErQ+3nTBSEwnK6g9jsCiA1W0io6oP5AU4x5KeZWS19ga6IWOTZmbGzPauUFP8T6xeY8Pfc5dN8fE+l2DFiHTYM575QlLzsQl0VhKgj0upYIgJ73x0mOWViQ3zG4MCfSCQmhnKLnQTf6fl574qhcqBamDjEg2A0VNljc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781237148; c=relaxed/simple;
	bh=hHCMClJE1V7+IcDcvIXb7fuctExF9qYAOZtBsCRPa0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuA8skJAW4hmztU4mrQGkLBxdil9MhdbnMe/bbEd65rgtY9YPQrwqdX5eQ4pAMpDzv6KCIOEJ//HNcqD7C7AI+E7a0oGfDK1CwbetOD/wxIVD7PXgNXgwW7PaaWZcE4doogjTQRH4DkYjQMhNORRjlDwslp7jn211qTB0UjqlA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksdtZCx1; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksdtZCx1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf237e1433so5943815ad.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 21:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781237146; cv=none;
        d=google.com; s=arc-20240605;
        b=Pm4ahRLui+6WoOkc/x+YS/ghKgzOkpN8GA1xTgGnTkqZ+PXx0doJInL0yGn+6JG1Np
         urx5FOXtNOiZNyWcT2wXcTyBjqLGtTCE2KMJz2neX981TgumlZRc++MqRuduuAX4zA1X
         PCkC2uieMY4Verd9OvzXcNzz6tzwJ4bpfYhy74roWiR22aldHx08ptZ4WlBMyq2aHR59
         /5blSllguok6+7MbHqkxzm/VLf2smWC9RDMRUu6QhOslXNxut3ze+DiyIWAT9VkOEEDI
         EANnSSVF91ihyE2e3sgHmGjm3g9f/ehp31jsZ8FCQctmvUjaEYmmAf4oqqW9Y3kFJSfW
         nr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DAEnNlTvLhXF031tsaXvyIQRur8b3/BNKqsE+ygiQRo=;
        fh=HdRNbGDYMn1ssznXODOg+QueBmy3I0/XJgFvlS9qTYg=;
        b=U2w8caRQSza4M8er8tIeEYgTzlVnrWktPKe2mN9mOBLvH/a4jVu6K3uViCfrt07qEK
         +DwykEy7aC9t0Jm/Q7otPlzOruGGx9N+K009nTx7/w9oNDm/HvZkrOim7lrLAkQpzh0i
         +5blrI7LhVoF0T/3p8iIVjHo6+DHhGaE/4jgQctrfi8V9lbI9lclZTzEBQkfe10yLez3
         sp15pBIbdUiXKjcMFo1E9PkHuH4GuH7y+M3/Z9Bk4KRsXeRSLFJQxqcxNkV347BQI4ln
         LKDAqOjFew2OlsIt4i/vbaPKhPcIndkRNi0e7bSGGuuBaVOvOPS/raosGN7QSD71d7L5
         eIwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781237146; x=1781841946; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DAEnNlTvLhXF031tsaXvyIQRur8b3/BNKqsE+ygiQRo=;
        b=ksdtZCx1Au1dR7aq8KjylT30O3965X/FVMzaKxpBcHuYRj0AjqqgfGnknbG+hBt4Hk
         UkhzbgX0070t04DpoHnmEfXQCH/wRCGpHtRCD1jhmJKkxfJLGBw8ZX8/xoPrHxZrzlRo
         3GGjKcylXLbW65q7J4uky9kMRu71fwL7gIOz2d6KkmMPCEWEf4rWj/jrJwn3NHL43sRI
         MbK55vxQvQpaNMUjh8EBV1+A3VkosKK8PaOd6UfFCH1jaNBtNwSAiA7PYUwfvObN72bw
         vuCTJ+60JPfhMCKtFm/zZ+VOvcYepnVnPpvdnEIOc5JODNr1iIpBGiT0T9i6FsU+XrIB
         qIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781237146; x=1781841946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAEnNlTvLhXF031tsaXvyIQRur8b3/BNKqsE+ygiQRo=;
        b=AmqHbFuTqFfQwtkRQ41NzSgQQRulJI7nD9L0CQqz6QoSEx+xyzrHQn9yYfBx5aEGqG
         hD277Irl4ITu9hJp3/NKf/k4iIUNwEiXsIexViJIxC98NxCVTJI8B2chNYKaaH5ZNft8
         6C0Mn67g6yDs/WFScsJWvfSk72hLWB7p8l3FUnbVyXyGbZ+g4mqVxSx3CWDva3bd+KNe
         x+XN2oMXLuss+68WKRw1t4YILpL4EC6rNDomrgy3HX9Kgji2QA2XkWqeKryxNBh0tYao
         sbWz/xb/KrX4yJv/Qf0l/g7/F//HX0ixZy+KEVHJVbqhxSbs1Q5bhuASp5ijCvOx3dbn
         e7Pw==
X-Forwarded-Encrypted: i=1; AFNElJ9yRPAUmI1tscUzlAQZaa2W+aZ/2xEwuV1ir4zk/YfbBvaCwJmj9KDPJP7r4cPpiqqFJrY/P9+3634v7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9y9dFMUdW4JMAhH8fEc2gSTQN3DePrJKPqKn7IhukLQWg8YSO
	8DuJOIK6eQ6CJvyTmzv6H3IkdCF9N+NpT+Z7IkqKahLqsR2cp6d7HnbZhGyzdNTWyiOeAED3s4k
	5NpdKNQWqOyNInTttVZfsk6DNQddlJuc=
X-Gm-Gg: Acq92OFPfn38/VFqmQazoRIVWMMNmvm9peJotWK/p4uaL0oVH815vSb4Bgno/wxCGUQ
	ik+LNs4r7FWBO3/3zo6GZIc+rAuiTNR3fkxW2YhQ2yYlKjFHqiBY9h1qA5b7RqQCw+jG0g5WwFY
	vsPxxez0Iiz4VvAX8xV6UjCVtXGkBumut5ejGrVhRs0M/sl8bd5cWdLmrcsGs/U/DMx6owI0ILL
	ETTaNndQaqe+r+ZMAn21ireh7IBMg7sqjjQBwFu9FxCTHsr0yFrzuKuD9UO6M6IX39sfAZu6BIV
	acAP9zTWTHy8nJE3Q3gl+mx5iVFUWGNlCTgUig==
X-Received: by 2002:a17:903:2b0f:b0:2c0:e5ee:f554 with SMTP id
 d9443c01a7336-2c41050b1e1mr17000215ad.8.1781237145796; Thu, 11 Jun 2026
 21:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611115901.80438-1-phucduc.bui@gmail.com> <20260611115901.80438-2-phucduc.bui@gmail.com>
 <ff85c2cb-1c7f-4c71-9c82-63a10aa6d9e2@intel.com>
In-Reply-To: <ff85c2cb-1c7f-4c71-9c82-63a10aa6d9e2@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 11:05:34 +0700
X-Gm-Features: AVVi8CelJdZVLh-hS-nizdPxLGs_h8Duulo-abmZVfGEosPaXwoWkAxx0qyOOiI
Message-ID: <CAABR9nHm6tnj-B=wy=V6Svi=gNQ4tsppxAkeYT6335NtpuorLw@mail.gmail.com>
Subject: Re: [PATCH 01/20] ASoC: Intel: catpt: ipc: Use guard() for mutex &
 spin locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

> The catpt_dsp_send_msg_timeout is already part of Mark's tree [1].  At
> the same time I'm against using scoped_guard() for
> catpt_dsp_do_send_msg().  The existing code is small and transparent,
> there is no need to tabify it.
>

> > @@ -97,10 +96,10 @@ static int catpt_dsp_do_send_msg(struct catpt_dev *cdev,
> >           (reply && reply->size > ipc->config.outbox_size))
> >               return -EINVAL;
> >
> > -     spin_lock_irqsave(&ipc->lock, flags);
> > -     catpt_ipc_msg_init(ipc, reply);
> > -     catpt_dsp_send_tx(cdev, &request);
> > -     spin_unlock_irqrestore(&ipc->lock, flags);
> > +     scoped_guard(spinlock_irqsave, &ipc->lock) {
> > +             catpt_ipc_msg_init(ipc, reply);
> > +             catpt_dsp_send_tx(cdev, &request);
> > +     }
> >
> >       ret = catpt_wait_msg_completion(cdev, timeout);

So I understand that, for this conversion effort, you would prefer a
case-by-case approach rather than converting everything to
guard()/scoped_guard() purely for consistency. Is that correct?

Best regards,
Phuc
